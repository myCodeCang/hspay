package com.jsp.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;

import com.function.Yunsms;
import com.interceptor.LoginInterceptor;
import com.interceptor.SmsInterceptor;
import com.interceptor.UpdateInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jsp.dynamic.service.DynamicService;
import com.jsp.exchange.service.ExchangeService;
import com.jsp.settlement.service.SettlementService;
import com.jsp.statement.service.StatementService;
import com.jsp.user.service.UserService;
import com.tool.CryptTool;
import com.tool.MD5Utils;
import com.vo.Balance;
import com.vo.Dynamic;
import com.vo.Logrecord;
import com.vo.Payment;
import com.vo.Person;
import com.vo.Refund;
import com.vo.SettlementAccount;

@Before(LoginInterceptor.class)
public class MemberTwoController extends Controller {
	/**
	 * 初始化
	 */
	public void index() {
		try {
			Person per = getSessionAttr("session");
			int personId = per.getInt("id");
			List<Logrecord> logs = UserService.userService.getLogrecords(personId);
			setAttr("logs", logs);
			setAttr("balance", UserService.userService.getBalance(personId).get(0));
			setAttr("rate", UserService.userService.getRate(personId).get(0));
			setAttr("payment", UserService.userService.getPaymList(personId).get(0));
			setAttr("ordertotal", UserService.userService.getOrdersTotal(personId));
			setAttr("orderStatistics", UserService.userService.getOrdersStatistics(personId));
			setAttr("ordercount", UserService.userService.getOrdersCount(personId));
			setAttr("ordernum", UserService.userService.getOrdersNum(personId));
			renderJsp("/WEB-INF/mtwo/index.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void indexPayment() {
		Person per = getSessionAttr("session");
		int personId = per.getInt("id");
		setAttr("rate", UserService.userService.getRate(personId).get(0));
		setAttr("payment", UserService.userService.getPaymList(personId).get(0));
		renderJsp("/WEB-INF/mtwo/index_payment.jsp");
	}
	public void indexMember() {
		renderJsp("/WEB-INF/mtwo/index_member.jsp");
	}
	public void indexPassword() {
		renderJsp("/WEB-INF/mtwo/index_password.jsp");
	}
	public void indexPhone() {
		renderJsp("/WEB-INF/mtwo/index_phone.jsp");
	}
	public void indexLog() {
		Person per = getSessionAttr("session");
		int personId = per.getInt("id");
		List<Logrecord> logs = UserService.userService.getLogrecords(personId);
		setAttr("logs", logs);
		renderJsp("/WEB-INF/mtwo/index_log.jsp");
	}
	public void exchange(){
		Person person = getSessionAttr("session");
		setAttr("participate", getPara("participate"));
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("ordertotal", ExchangeService.exchangeService.getOrdertotal(person.getInt("id")));
		renderJsp("/WEB-INF/mtwo/exchange.jsp");
	}
	public void exchangeCard(){
		Person person = getSessionAttr("session");
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("cardordertotal", ExchangeService.exchangeService.getCardOrdertotal(person.getInt("id")));
		renderJsp("/WEB-INF/mtwo/exchangecard.jsp");
	}
	public void statement(){
		Person per = getSessionAttr("session");
		List<Balance> balist = StatementService.service.getBalance(per.getInt("id"));
		setAttr("netamount", balist.get(0).get("netamount"));
		setAttr("cardamount", balist.get(0).get("cardamount"));
		renderJsp("/WEB-INF/mtwo/statement.jsp");
	}

	public void payment() {
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		renderJsp("/WEB-INF/mtwo/payment.jsp");
	}

	public void paymentlog() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id")));
		renderJsp("/WEB-INF/mtwo/paymentlog.jsp");
	}

	public void card() {
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		renderJsp("/WEB-INF/mtwo/card.jsp");
	}

	public void cardlog() {
		Person person = getSessionAttr("session");
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id")));
		renderJsp("/WEB-INF/mtwo/cardlog.jsp");
	}
	public void settlement() {
		Person per = getSessionAttr("session");
		List<SettlementAccount> settlaccountlist = SettlementService.service
				.getSettlAccount(per.getInt("id"));
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
        createToken("withdrawalToken", 30*60);
		renderJsp("/WEB-INF/mtwo/settlement.jsp");
	}
	public void settlementlog() {
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		renderJsp("/WEB-INF/mtwo/settlement_log.jsp");
	}
	public void settlementNum() {
		Person per = getSessionAttr("session");
		List<SettlementAccount> settlaccountlist = SettlementService.service
				.getSettlAccount(per.getInt("id"));
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
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("balance", Balance.dao.findById(per.getInt("id")));
		setAttr("per", per);
		setAttr("bank", bank);
		setAttr("network", network);
        createToken("withdrawalToken", 30*60);
		renderJsp("/WEB-INF/mtwo/settlement_num.jsp");
	}
	public void anotherpay() {
		Person per = getSessionAttr("session");
		int personId = per.getInt("id");
		setAttr("balance", UserService.userService.getBalance(personId).get(0));
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		renderJsp("/WEB-INF/mtwo/another_pay.jsp");
	}
	public void anotherlog() {
		renderJsp("/WEB-INF/mtwo/another_log.jsp");
	}
	public void transfer(){
		Person per = getSessionAttr("session");
		setAttr("balance", Balance.dao.findById(per.getInt("id")));
		renderJsp("/WEB-INF/mtwo/transfer.jsp");
	}
	public void transferlog(){
		renderJsp("/WEB-INF/mtwo/transferlog.jsp");
	}
	public void getannouncement() {
		int pageNum = getParaToInt("pageNum");
		Page<Dynamic> dynamicPage = DynamicService.service.getDynamicPage(
				pageNum, 10);
		setAttr("pageNum", dynamicPage.getPageNumber());
		setAttr("totalpage", dynamicPage.getTotalPage());
		setAttr("dynamiclist", dynamicPage.getList());
		renderJsp("/WEB-INF/mtwo/announcement.jsp");
	}
	public void getannouncementinfo() {
		int dynamicid = getParaToInt("dynamicid");
		setAttr("dynamic", DynamicService.service.getDynamic(dynamicid));
		renderJsp("/WEB-INF/mtwo/announcementinfo.jsp");
	}

	public void getHelp() {
		renderJsp("/WEB-INF/mtwo/help.jsp");
	}

	public void getAbout() {
		renderJsp("/WEB-INF/mtwo/about.jsp");
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
		Page<Refund> orderPage = SettlementService.service.getRefund(
				per.getInt("id"), page, refundstarttime, refundendtime,
				refundstate, refundid,2);
		List<Refund> orderList = orderPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(orderPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}
	/**
	 * 获取短信
	 */
	@Before(SmsInterceptor.class)
	public void getSms() {
		Person person = getSessionAttr("session");
		String phone = person.getStr("phone");
		String key = CryptTool.getPasswordOfNumber(6);
		String content = "您的验证码是：【" + key + "】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
		try {
			String res = Yunsms.sms(phone, content);
			if (res.equals("100")) {
				setSessionAttr("sms", key);
				System.out.println(phone+"===="+key);
				renderText(res);
			} else {
				renderText(Yunsms.result(NumberUtils.toInt(res)));
			}
		} catch (Exception e) {
			renderText("短信获取失败，请联系工作人眼");
			e.printStackTrace();
		}
	}

	/**
	 * 更改新手机时，获取新短信
	 */
	@Before(SmsInterceptor.class)
	public void getNewSms() {
		String newphone = getPara("newphone");
		String key = CryptTool.getPasswordOfNumber(6);
		String content = "您的验证码是：【" + key + "】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
		try {
			String res = Yunsms.sms(newphone, content);
			if (res.equals("100")) {
				setSessionAttr("newsms", key);
				System.out.println(newphone+"====="+key);
				renderText(res);
			} else {
				renderText(Yunsms.result(NumberUtils.toInt(res)));
			}
		} catch (Exception e) {
			renderText("短信获取失败，请联系工作人眼");
			e.printStackTrace();
		}
	}

	/**
	 * 验证新手机短信
	 */
	public void newPhoneSms() {
		String keys = getPara("param");
		String key = getSessionAttr("newsms");
		if (keys.equals(key)) {
			renderText("y");
		} else {
			renderText("验证码错误");
		}
	}

	/**
	 * 判断原支付密码是否正确
	 */
	public void getPaymentboo() {
		String paypassw = getPara("param");
		Person person = getSessionAttr("session");
		String payment = "";
		try {
			payment = MD5Utils.createMD5(MD5Utils.createMD5(paypassw));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean boo = UserService.userService.getPaymentboo(
				person.getInt("id"), payment);
		if (boo) {
			renderText("y");
		} else {
			renderText("原支付密码错误!");
		}
	}

	/**
	 * 判断原密码是否正确
	 */
	public void getPasswordboo() {
		String paword = getPara("param");
		Person person = getSessionAttr("session");
		String password = "";
		try {
			password = MD5Utils.createMD5(paword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean boo = UserService.userService.getPasswordboo(
				person.getInt("id"), password);
		if (boo) {
			renderText("y");
		} else {
			renderText("原密码错误!");
		}
	}

	/**
	 * 更换支付和登陆密码
	 */
	@Before(UpdateInterceptor.class)
	public void upPassword() {
		String passwtype = getPara("passwtype");
		Person person = getSessionAttr("session");
		try {
			if (passwtype.equals("1")) {
				String password = getPara("password");
				password = MD5Utils.createMD5(password);
				Person.dao.findById(person.getInt("id"))
						.set("password", password).update();
				renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
			} else if (passwtype.equals("2")) {
				String payment = getPara("payment");
				payment = MD5Utils.createMD5(MD5Utils.createMD5(payment));
				Payment.dao.findById(person.getInt("id")).set("payment", payment).update();
				renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}

	/**
	 * 更换手机号
	 */
	@Before(UpdateInterceptor.class)
	public void upPhone() {
		try {
			String newphone = getPara("newphone");
			Person person = getSessionAttr("session");
			Person.dao.findById(person.get("id")).set("phone", newphone)
					.update();
			renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
		} catch (Exception e) {
			// TODO: handle exception
			renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}

	/**
	 * 更换key值
	 */
	@Before(UpdateInterceptor.class)
	public void upKey() {
		try {
			String yzm=getPara("yzm");
			String sms = getSessionAttr("sms");
			if(yzm.equals(sms)){
				String key = CryptTool.getPassword(32);
				Person person = getSessionAttr("session");
				Payment pay = Payment.dao.findById(person.getInt("id"));
				pay.set("key", key);
				pay.update();
				renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
			}else {
				renderJson("{\"info\":\"验证码错误！\",\"status\":\"n\"}");
			}
		} catch (Exception e) {
			// TODO: handle exception
			renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}
}
