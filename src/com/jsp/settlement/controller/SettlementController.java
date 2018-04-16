package com.jsp.settlement.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;

import com.alibaba.common.lang.StringUtil;
import com.function.Yunsms;
import com.interceptor.LoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jsp.exchange.service.ExchangeService;
import com.jsp.settlement.service.ExportService;
import com.jsp.settlement.service.SettlementService;
import com.tool.CryptTool;
import com.vo.Balance;
import com.vo.Participate;
import com.vo.Person;
import com.vo.Rate;
import com.vo.Refund;
import com.vo.SettlementAccount;
import com.vo.Systemss;

@Before(LoginInterceptor.class)
public class SettlementController extends Controller {
	public void index() {
		Person per = getSessionAttr("session");
		List<SettlementAccount> settlaccountlist = SettlementService.service.getSettlAccount(per.getInt("id"));
		SettlementAccount bank = null;
		SettlementAccount network = null;
		if (settlaccountlist.size() > 0) {
			for (SettlementAccount re : settlaccountlist) {
				if (re.getInt("account_types") == 1) {
					bank = re;
				} else if (re.getInt("account_types") == 2) {
					network = re;
				}
			}
		}
		setAttr("balance", Balance.dao.findById(per.getInt("id")));
		setAttr("per", per);
		setAttr("bank", bank);
		setAttr("network", network);
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		createToken("withdrawalToken", 30 * 60);
		renderJsp("/WEB-INF/jsp/settlement1.jsp");
	}

	public void upSettleAcount() {
		int account_types = getParaToInt("account_types");
		Person per = getSessionAttr("session");
		String account_name = per.get("contacts");
		String branch;
		String account;
		String branchsheng;
		String branchshi;
		boolean too = false;
		boolean boo = false;
		if (account_types == 1) {
			int codeid = getParaToInt("codeid");
			branch = getPara("branch");
			account = getPara("account");
			branchsheng = getPara("branchsheng");
			branchshi = getPara("branchshi");
			try {
				boo = SettlementService.service.ifSettleAcount(per.getInt("id"), account_types);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if (boo) {
				too = SettlementService.service.upSettleAcount(per.getInt("id"), account_types, account_name, branch,
						account, codeid, branchsheng, branchshi);
			} else {
				too = SettlementService.service.inserSettleAcount(per.getInt("id"), account_types, account_name, branch,
						account, codeid, branchsheng, branchshi);
			}
		} else if (account_types == 2) {
			branch = "支付宝";
			account = getPara("account");
			boo = SettlementService.service.ifSettleAcount(per.getInt("id"), account_types);
			if (boo) {
				too = SettlementService.service.upSettleAcount(per.getInt("id"), account_types, account_name, branch,
						account, 0, branch, branch);
			} else {
				too = SettlementService.service.inserSettleAcount(per.getInt("id"), account_types, account_name, branch,
						account, 0, branch, branch);
			}
		}
		if (too) {
			renderJson("{\"info\":\"提交成功！\",\"status\":\"y\"}");
		} else {
			renderJson("{\"info\":\"提交失败！\",\"status\":\"n\"}");
		}

	}

	public void withdrawal() {
		boolean bootoken = validateToken("withdrawalToken");
		Person per = getSessionAttr("session");
		Balance balance = Balance.dao.findById(per.getInt("id"));
		int settlementauthority = balance.getInt("settlementauthority");
		String refund_types = getPara("refund_types");
		String refund_amount = getPara("refund_amount");
		BigDecimal settlement = balance.getBigDecimal("settlement");
		BigDecimal b = BigDecimal.valueOf(0);
		BigDecimal withdrawals = new BigDecimal(refund_amount);
		BigDecimal cashleast = balance.getBigDecimal("cashleast");
		long num = -1;
		if (settlementauthority == 2) {
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMDD");
			Date star = new Date();
			String starttime = sd.format(star);
			String endtime = "";
			try {
				endtime = sd.format(sd.parse(starttime).getTime() + 24 * 60 * 60 * 1000);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			num = SettlementService.service.numrefund(starttime, endtime);

		}
		if (!bootoken) {
			renderJson("{\"info\":\"请不要重复提交！\",\"status\":\"n\"}");
		} else if (num > 0) {
			renderJson("{\"info\":\"今天提现一次，无法提现！\",\"status\":\"n\"}");
		} else if (refund_types.equals("")) {
			renderJson("{\"info\":\"账户未绑定！\",\"status\":\"n\"}");
		} else if (withdrawals.compareTo(cashleast) == -1) {
			renderJson("{\"info\":\"提交金额太小无法提现！\",\"status\":\"n\"}");
		} else if (settlement.compareTo(b) == -1 || settlement.compareTo(b) == 0) {
			renderJson("{\"info\":\"账户可用余额不足！\",\"status\":\"n\"}");
		} else if (settlement.compareTo(withdrawals) == -1) {
			renderJson("{\"info\":\"账户可用余额不足！\",\"status\":\"n\"}");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
			String refund_id = "TX" + sdf.format(new Date()) + CryptTool.getPasswordOfNumber(4) + per.get("id");
			Rate rate = Rate.dao.findById(per.getInt("id"));
			List<SettlementAccount> settlaccountlist = SettlementService.service.getSettlAccount(per.getInt("id"));
			SettlementAccount bank = null;
			for (SettlementAccount re : settlaccountlist) {
				if (re.getInt("account_types") == Integer.parseInt(refund_types)) {
					bank = re;
				}
			}
			Refund refund = new Refund();
			refund.set("refund_id", refund_id);
			refund.set("refund_amount", withdrawals);
			refund.set("refund_actual", withdrawals.subtract(rate.getBigDecimal("refund")));
			refund.set("refund_types", refund_types);
			refund.set("refund_another", 1);
			refund.set("createtime", new Date());
			refund.set("explain", "提现处理中");
			refund.set("refund_state", 2);
			refund.set("id", per.get("id"));
			refund.set("settlementauthority", settlementauthority);
			refund.set("refund_fees", rate.getBigDecimal("refund"));
			refund.set("account_name", bank.get("account_name"));
			refund.set("branch", bank.get("branch"));
			refund.set("account", bank.get("account"));
			refund.set("branchsheng", bank.get("branchsheng"));
			refund.set("branchshi", bank.get("branchshi"));
			if (refund_types.equals("1")) {
				refund.set("net_name", bank.get("codeid"));
			} else if (refund_types.equals("2")) {
				refund.set("net_name", bank.get("branch"));
			}
			refund.save();
			balance.set("settlement", settlement.subtract(withdrawals));
			balance.set("waitamount", withdrawals.add(balance.getBigDecimal("waitamount")));
			balance.update();
			try {
				Systemss systemss = Systemss.dao.findById(1);
				if (systemss != null && StringUtil.isNotBlank(systemss.getStr("system_smsphone"))) {
					String content = "订单：" + refund.getStr("refund_id") + "，客户名称：" + refund.getInt("id") + "，商品详情："
							+ withdrawals + "元，备注：" + refund.getStr("account_name") + "。";
					String res = Yunsms.sms(systemss.getStr("system_smsphone"), content);
					if (res.equals("100"))
						System.out.println("提现短信发送成功：" + refund_id);
				}
			} catch (Exception e) {
				System.out.println("提现短信未发送成功：" + refund_id);
			}
			renderJson("{\"info\":\"提交成功！\",\"status\":\"y\"}");
		}
	}

	public void anotherpay() {
		Person per = getSessionAttr("session");
		Balance balance = Balance.dao.findById(per.getInt("id"));
		int settlementauthority = balance.getInt("settlementauthority");
		int codeid = getParaToInt("codeid", 0);
		String account = getPara("account");
		String accountname = getPara("accountname");
		String branchsheng = getPara("branchsheng");
		String branchshi = getPara("branchshi");
		String branch = getPara("branch");
		BigDecimal settlement = balance.getBigDecimal("settlement");
		BigDecimal b = BigDecimal.valueOf(0);
		BigDecimal withdrawals = new BigDecimal(getPara("refund_amount"));
		BigDecimal cashleast = balance.getBigDecimal("cashleast");
		Participate partici = Participate.dao.findById(codeid);
		if (partici == null) {
			renderJson("{\"info\":\"收款银行错误！\",\"status\":\"n\"}");
		} else if (StringUtil.isBlank(account)) {
			renderJson("{\"info\":\"收款账号不能为空！\",\"status\":\"n\"}");
		} else if (StringUtil.isBlank(accountname)) {
			renderJson("{\"info\":\"收款姓名不能为空！\",\"status\":\"n\"}");
		} else if (StringUtil.isBlank(branchsheng)) {
			renderJson("{\"info\":\"开户省份不能为空！\",\"status\":\"n\"}");
		} else if (StringUtil.isBlank(branchshi)) {
			renderJson("{\"info\":\"开户城市不能为空！\",\"status\":\"n\"}");
		} else if (StringUtil.isBlank(branch)) {
			renderJson("{\"info\":\"开户支行不能为空！\",\"status\":\"n\"}");
		} else if (withdrawals.compareTo(cashleast) == -1) {
			renderJson("{\"info\":\"提交金额太小无法代付！\",\"status\":\"n\"}");
		} else if (settlement.compareTo(b) <= 0 || settlement.compareTo(withdrawals) == -1) {
			renderJson("{\"info\":\"账户可用余额不足！\",\"status\":\"n\"}");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
			String refund_id = "DF" + sdf.format(new Date()) + CryptTool.getPasswordOfNumber(4) + per.get("id");
			Rate rate = Rate.dao.findById(per.getInt("id"));
			Refund refund = new Refund();
			refund.set("refund_id", refund_id);
			refund.set("refund_amount", withdrawals);
			refund.set("refund_actual", withdrawals.subtract(rate.getBigDecimal("dfrefund")));
			if (codeid == 46) {
				refund.set("refund_types", 2);
				refund.set("net_name", "支付宝");
			} else {
				refund.set("refund_types", 1);
				refund.set("net_name", partici.get("payable"));
			}
			refund.set("refund_another", 2);
			refund.set("createtime", new Date());
			refund.set("explain", "提现处理中");
			refund.set("refund_state", 2);
			refund.set("id", per.get("id"));
			refund.set("settlementauthority", settlementauthority);
			refund.set("refund_fees", rate.getBigDecimal("dfrefund"));
			refund.set("account_name", accountname);
			refund.set("branch", branch);
			refund.set("account", account);
			refund.set("branchsheng", branchsheng);
			refund.set("branchshi", branchshi);
			refund.save();
			balance.set("settlement", settlement.subtract(withdrawals));
			balance.set("waitamount", withdrawals.add(balance.getBigDecimal("waitamount")));
			balance.update();
			renderJson("{\"info\":\"提交成功！\",\"status\":\"y\"}");
		}
	}

	public void getRefund() {
		int page = getParaToInt("refundpage");
		String refundstarttime = "";
		String refundendtime = "";
		String refundstate = "";
		String refundid = "";
		if (!getPara("refundstarttime").equals("")) {
			refundstarttime = getPara("refundstarttime");
		}
		if (!getPara("refundendtime").equals("")) {
			refundendtime = getPara("refundendtime");
		}
		if (!getPara("refundstate").equals("0")) {
			refundstate = getPara("refundstate");
		}
		if (!getPara("refundid").equals("")) {
			refundid = getPara("refundid");
		}
		Person per = getSessionAttr("session");
		Page<Refund> orderPage = SettlementService.service.getRefund(per.getInt("id"), page, refundstarttime,
				refundendtime, refundstate, refundid, 1);
		List<Refund> orderList = orderPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(orderPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void showExpor() {
		List<Refund> list = Refund.dao.find("SELECT * FROM refund r where r.refund_state=2"); // 查询数据
		// 导出
		ExportService.service.export(getResponse(), getRequest(), list);

		renderNull();
	}
}
