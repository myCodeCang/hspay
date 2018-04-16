package com.admin.person.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.admin.gateway.service.AdGatewayService;
import com.admin.person.service.AdPersonService;
import com.interceptor.AdLoginSeInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jsp.exchange.service.ExchangeService;
import com.jsp.register.service.RegisterService;
import com.jsp.settlement.service.SettlementService;
import com.tool.CryptTool;
import com.tool.MD5Utils;
import com.vo.Addedamount;
import com.vo.Balance;
import com.vo.Caifutong;
import com.vo.CardOrder;
import com.vo.Employee_Person;
import com.vo.Employees;
import com.vo.Order;
import com.vo.Payment;
import com.vo.Person;
import com.vo.PersonGateway;
import com.vo.Rate;
import com.vo.SettlementAccount;

@Before(AdLoginSeInterceptor.class)
public class AdPersonController extends Controller {
	public void index() {
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String starttime = "";
		String endtime = "";
		String id = "";
		String iflock = "";
		String iflogin = "";
		String ifnet = "";
		if (!getPara("starttime").equals("")) {
			starttime = getPara("starttime");
		}
		if (!getPara("endtime").equals("")) {
			endtime = getPara("endtime");
		}
		if (!getPara("id").equals("")) {
			id = getPara("id");
		}
		if (!getPara("iflock").equals("0")) {
			iflock = getPara("iflock");
		}
		if (!getPara("iflogin").equals("0")) {
			iflogin = getPara("iflogin");
		}
		if (!getPara("ifnet").equals("0")) {
			ifnet = getPara("ifnet");
		}
		Employees emp = getSessionAttr("adminsession");
		setAttr("starttime", starttime);
		setAttr("endtime", endtime);
		setAttr("id", id);
		setAttr("iflock", iflock);
		setAttr("iflogin", iflogin);
		setAttr("ifnet", ifnet);
		Page<Person> orderpage = AdPersonService.service.getPerson(pageNum,
				numPerPage, starttime, endtime, id, iflock, iflogin, ifnet, emp.getInt("employeeid"));
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("perlist", orderpage.getList());
		renderJsp("/WEB-INF/admin/jsp/person.jsp");
	}

	public void showPerson() {
		SettlementAccount bank = null;
		SettlementAccount network = null;
		List<SettlementAccount> settlaccountlist = AdPersonService.service
				.getSettlAccount(getParaToInt("id"));
		if (settlaccountlist.size() > 0) {
			for (SettlementAccount re : settlaccountlist) {
				if (re.getInt("account_types") == 1) {
					bank = re;
				} else if (re.getInt("account_types") == 2) {
					network = re;
				}
			}
		}
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		setAttr("bank", bank);
		setAttr("network", network);
		setAttr("person", Person.dao.findById(getParaToInt("id")));
		setAttr("payment", Payment.dao.findById(getParaToInt("id")));
		setAttr("balance", Balance.dao.findById(getParaToInt("id")));
		setAttr("rate", Rate.dao.findById(getParaToInt("id")));
		setAttr("gatewaylist", AdGatewayService.service.getGateway());
		setAttr("gateway", PersonGateway.dao.findById(getParaToInt("id")));
		setAttr("caifutong", Caifutong.dao.findById(getParaToInt("id")));
		createToken("uppersonmoney", 30*60);
		renderJsp("/WEB-INF/admin/jsp/person/showPerson.jsp");
	}

	public void showPersonState() {
		setAttr("person", Person.dao.findById(getParaToInt("id")));
		renderJsp("/WEB-INF/admin/jsp/person/perState.jsp");
	}

	public void upPersonState() {
		int id = getParaToInt("id");
		int iflock = getParaToInt("iflock");
		int ifnet = getParaToInt("ifnet");
		try {
			Person.dao.findById(id).set("iflock", iflock).set("ifnet", ifnet)
					.update();
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav12\", \"forwardUrl\":\"\", \"rel\":\"nav12\", \"callbackType\":\"closeCurrent\"}");
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
			e.printStackTrace();
		}
	}

	public void showNet() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String netstarttime = "";
		String netendtime = "";
		String netparticipate = "";
		String netstate = "";
		if (!getPara("netstarttime").equals("")) {
			netstarttime = getPara("netstarttime");
		}
		if (!getPara("netendtime").equals("")) {
			netendtime = getPara("netendtime");
		}
		if (!getPara("netparticipate").equals("0")) {
			netparticipate = getPara("netparticipate");
		}
		if (!getPara("netstate").equals("0")) {
			netstate = getPara("netstate");
		}
		setAttr("netstarttime", netstarttime);
		setAttr("netendtime", netendtime);
		setAttr("netparticipate", netparticipate);
		setAttr("netstate", netstate);
		setAttr("id", id);
		Page<Order> orderpage = AdPersonService.service.getNetPage(pageNum,
				numPerPage, netstarttime, netendtime, netparticipate, netstate,
				id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		renderJsp("/WEB-INF/admin/jsp/person/perNet.jsp");
	}

	public void showCard() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String cardstarttime = "";
		String cardendtime = "";
		String cardparticipate = "";
		String cardstate = "";
		if (!getPara("cardstarttime").equals("")) {
			cardstarttime = getPara("cardstarttime");
		}
		if (!getPara("cardendtime").equals("")) {
			cardendtime = getPara("cardendtime");
		}
		if (!getPara("cardparticipate").equals("0")) {
			cardparticipate = getPara("cardparticipate");
		}
		if (!getPara("cardstate").equals("0")) {
			cardstate = getPara("cardstate");
		}
		setAttr("cardstarttime", cardstarttime);
		setAttr("cardendtime", cardendtime);
		setAttr("cardparticipate", cardparticipate);
		setAttr("cardstate", cardstate);
		setAttr("id", id);
		Page<CardOrder> orderpage = AdPersonService.service.getCardPage(
				pageNum, numPerPage, cardstarttime, cardendtime,
				cardparticipate, cardstate, id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		renderJsp("/WEB-INF/admin/jsp/person/perCard.jsp");
	}

	public void showRecharge() {
		try {
			
		
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String rechstarttime = "";
		String rechendtime = "";
		String rechparticipate = "";
		String rechstate = "";
		if (!getPara("rechstarttime").equals("")) {
			rechstarttime = getPara("rechstarttime");
		}
		if (!getPara("rechendtime").equals("")) {
			rechendtime = getPara("rechendtime");
		}
		if (!getPara("rechparticipate").equals("0")) {
			rechparticipate = getPara("rechparticipate");
		}
		if (!getPara("rechstate").equals("0")) {
			rechstate = getPara("rechstate");
		}
		setAttr("rechstarttime", rechstarttime);
		setAttr("rechendtime", rechendtime);
		setAttr("rechparticipate", rechparticipate);
		setAttr("rechstate", rechstate);
		setAttr("id", id);
		Page<Record> orderpage = AdPersonService.service.getRechargePage(
				pageNum, numPerPage, rechstarttime, rechendtime,
				rechparticipate, rechstate, id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		renderJsp("/WEB-INF/admin/jsp/person/perRecharge.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void showCirclip() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String circstarttime = "";
		String circendtime = "";
		String circparticipate = "";
		String circstate = "";
		if (!getPara("circstarttime").equals("")) {
			circstarttime = getPara("circstarttime");
		}
		if (!getPara("circendtime").equals("")) {
			circendtime = getPara("circendtime");
		}
		if (!getPara("circparticipate").equals("0")) {
			circparticipate = getPara("circparticipate");
		}
		if (!getPara("circstate").equals("0")) {
			circstate = getPara("circstate");
		}
		setAttr("circstarttime", circstarttime);
		setAttr("circendtime", circendtime);
		setAttr("circparticipate", circparticipate);
		setAttr("circstate", circstate);
		setAttr("id", id);
		Page<Record> orderpage = null;
		try {
			orderpage = AdPersonService.service.getCirclipPage(pageNum,
					numPerPage, circstarttime, circendtime, circparticipate,
					circstate, id);
			setAttr("pageNum", orderpage.getPageNumber());
		} catch (Exception e) {
			e.printStackTrace();
		}
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		renderJsp("/WEB-INF/admin/jsp/person/perCirclip.jsp");
	}

	public void showRefund() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String refustarttime = "";
		String refuendtime = "";
		String refustate = "";
		if (!getPara("refustarttime").equals("")) {
			refustarttime = getPara("refustarttime");
		}
		if (!getPara("refuendtime").equals("")) {
			refuendtime = getPara("refuendtime");
		}
		if (!getPara("refustate").equals("0")) {
			refustate = getPara("refustate");
		}
		setAttr("refustarttime", refustarttime);
		setAttr("refuendtime", refuendtime);
		setAttr("refustate", refustate);
		setAttr("id", id);
		Page<Record> orderpage = AdPersonService.service.getRefundPage(pageNum,
				numPerPage, refustarttime, refuendtime, refustate, id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		renderJsp("/WEB-INF/admin/jsp/person/perRefund.jsp");
	}

	public void showLog() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String logstarttime = "";
		String logendtime = "";
		if (!getPara("logstarttime").equals("")) {
			logstarttime = getPara("logstarttime");
		}
		if (!getPara("logendtime").equals("")) {
			logendtime = getPara("logendtime");
		}
		setAttr("logstarttime", logstarttime);
		setAttr("logendtime", logendtime);
		setAttr("id", id);
		Page<Record> orderpage = AdPersonService.service.getLogPage(pageNum,
				numPerPage, logstarttime, logendtime, id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		renderJsp("/WEB-INF/admin/jsp/person/perLog.jsp");
	}
	
	public void showAddedamount() {
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String addestarttime = "";
		String addeendtime = "";
		if (!getPara("addestarttime").equals("")) {
			addestarttime = getPara("addestarttime");
		}
		if (!getPara("addeendtime").equals("")) {
			addeendtime = getPara("addeendtime");
		}
		setAttr("addestarttime", addestarttime);
		setAttr("addeendtime", addeendtime);
		setAttr("id", id);
		Page<Record> orderpage = AdPersonService.service.getAddePage(pageNum,numPerPage, addestarttime, addeendtime, id);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		renderJsp("/WEB-INF/admin/jsp/person/perAddedamount.jsp");
	}
	
	public void showEmp(){
		int id = getParaToInt("id");
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String empname = getPara("empname");
		setAttr("id", id);
		setAttr("empname", empname);
		Page<Record> orderpage = AdPersonService.service.getEmpPage(pageNum,numPerPage,empname);
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		renderJsp("/WEB-INF/admin/jsp/person/showEmpPerson.jsp");
	}

	public void getkey() {
		String key = CryptTool.getPassword(32);
		renderText(key);
	}

	public void upPerPass() {
		int id = getParaToInt("id");
		String password = getPara("password");
		String payment = getPara("payment");
		String key = getPara("key");
		if (password.equals("") && payment.equals("")) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"密码或者支付密码没有填写\"}");
		} else {
			try {
				Person.dao.findById(id)
						.set("password", MD5Utils.createMD5(password)).update();
				Payment.dao
						.findById(id)
						.set("payment",
								MD5Utils.createMD5(MD5Utils.createMD5(payment)))
						.set("key", key).update();
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
						+ id
						+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
						+ id
						+ "\"}");
			} catch (Exception e) {
				renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
				e.printStackTrace();
			}
		}
	}

	public void upPersonMoney() {
	    boolean booToken = validateToken("uppersonmoney");
		int id = getParaToInt("id");
		String money = getPara("money");
		if(booToken){
    		try {
    			Balance balance = Balance.dao.findById(id);
    			balance.set("amount",
    					balance.getBigDecimal("amount").add(new BigDecimal(money)));
    			balance.set(
    					"settlement",
    					balance.getBigDecimal("settlement").add(
    							new BigDecimal(money)));
    			balance.update();
    			Addedamount addedamount = new Addedamount();
    			addedamount.set("addedamount_amount", new BigDecimal(money));
    			addedamount.set("addedamount_time", new Date());
    			addedamount.set("id", id);
    			addedamount.save();
    			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
    					+ id
    					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
    					+ id
    					+ "\"}");
    		} catch (Exception e) {
    			renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
    			e.printStackTrace();
    		}
		}else{
		    renderJson("{\"statusCode\":\"301\", \"message\":\"请不要重复提交\"}");
		}
	}

	public void upSettAuthor() {
		int id = getParaToInt("id");
		int settlementauthority = getParaToInt("settlementauthority");
		String cashleast = getPara("cashleast");
		try {
			Balance balance = Balance.dao.findById(id);
			if (settlementauthority == 1) {
				BigDecimal newamount = balance.getBigDecimal("newamount");
				BigDecimal settlement = balance.getBigDecimal("settlement");
				balance.set("settlement", settlement.add(newamount));
				balance.set("newamount", 0);
			}
			balance.set("cashleast", cashleast);
			balance.set("settlementauthority", settlementauthority);
			balance.update();
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
			e.printStackTrace();
		}
	}

	public void upPerPerson() {
		int id = getParaToInt("id");
		String email = getPara("email");
		String webName = getPara("webName");
		String website = getPara("website");
		int herolist = getParaToInt("herolist");
		int huge = getParaToInt("huge");
		String name = getPara("name");
		String contacts = getPara("contacts");
		String idcard = getPara("idcard");
		String address = getPara("address");
		String phone = getPara("phone");
		String qq = getPara("qq");
		int iflock = getParaToInt("iflock");
		int ifnet = getParaToInt("ifnet");
		if (email.equals("") && webName.equals("") && website.equals("")
				&& name.equals("") && contacts.equals("") && idcard.equals("")
				&& address.equals("") && phone.equals("") && qq.equals("")) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"信息没有填写完整!\"}");
		} else {
			try {
				Person person = Person.dao.findById(id);
				person.set("email", email);
				person.set("webName", webName);
				person.set("website", website);
				person.set("herolist", herolist);
				person.set("huge", huge);
				person.set("name", name);
				person.set("contacts", contacts);
				person.set("idcard", idcard);
				person.set("address", address);
				person.set("phone", phone);
				person.set("qq", qq);
				person.set("iflock", iflock);
				person.set("ifnet", ifnet);
				person.update();
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
						+ id
						+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
						+ id
						+ "\"}");
			} catch (Exception e) {
				renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
				e.printStackTrace();
			}
		}
	}

	public void upRate() {
		int id = getParaToInt("id");
		String banking = getPara("banking");
		String weixin = getPara("weixin");
		String wxwap = getPara("wxwap");
		String alipay = getPara("alipay");
		String alipaywap = getPara("alipaywap");
		String tenpay = getPara("tenpay");
		String tenpaywap = getPara("tenpaywap");
		String qqcode = getPara("qqcode");
		String qqwap = getPara("qqwap");
		String netease = getPara("netease");
		String travel = getPara("travel");
		String qqcoins = getPara("qqcoins");
		String journey = getPara("journey");
		String grand = getPara("grand");
		String theworld = getPara("theworld");
		String perfect = getPara("perfect");
		String chinaunicom = getPara("chinaunicom");
		String tianhong = getPara("tianhong");
		String sohu = getPara("sohu");
		String junwang = getPara("junwang");
		String shenzhouxing = getPara("shenzhouxing");
		String telecom = getPara("telecom");
		String longitudinal = getPara("longitudinal");
		String thirtytwo = getPara("thirtytwo");
		String refund = getPara("refund");
		String dfrefund = getPara("dfrefund");
		if (banking.equals("") && weixin.equals("") && wxwap.equals("") && alipay.equals("")
				&& alipaywap.equals("") && tenpay.equals("") && tenpaywap.equals("") 
				&& qqcode.equals("")&& qqwap.equals("") && netease.equals("") && travel.equals("")
				&& qqcoins.equals("") && journey.equals("") && grand.equals("")
				&& theworld.equals("") && perfect.equals("")
				&& chinaunicom.equals("") && tianhong.equals("")
				&& sohu.equals("") && junwang.equals("")
				&& shenzhouxing.equals("") && telecom.equals("")
				&& longitudinal.equals("")&& thirtytwo.equals("")) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"信息没有填写完整!\"}");
		} else {
			try {
				Rate rate = Rate.dao.findById(id);
				rate.set("banking", banking);
				rate.set("weixin", weixin);
				rate.set("wxwap", wxwap);
				rate.set("alipay", alipay);
				rate.set("alipaywap", alipaywap);
				rate.set("tenpay", tenpay);
				rate.set("tenpaywap", tenpaywap);
				rate.set("qqcode", qqcode);
				rate.set("qqwap", qqwap);
				rate.set("netease", netease);
				rate.set("travel", travel);
				rate.set("qqcoins", qqcoins);
				rate.set("journey", journey);
				rate.set("grand", grand);
				rate.set("theworld", theworld);
				rate.set("perfect", perfect);
				rate.set("chinaunicom", chinaunicom);
				rate.set("tianhong", tianhong);
				rate.set("sohu", sohu);
				rate.set("junwang", junwang);
				rate.set("shenzhouxing", shenzhouxing);
				rate.set("telecom", telecom);
				rate.set("longitudinal", longitudinal);
				rate.set("thirtytwo", thirtytwo);
				rate.set("refund", refund);
				rate.set("dfrefund", dfrefund);
				rate.update();
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
						+ id
						+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
						+ id
						+ "\"}");
			} catch (Exception e) {
				renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
				e.printStackTrace();
			}
		}
	}

	public void upBankAccount() {
		try {
			int id = getParaToInt("id");
			int account_types = 1;
			String account_name = getPara("account_name");
			String branch = getPara("branch");
			String account = getPara("account");
			String branchsheng = getPara("branchsheng");
			String branchshi = getPara("branchshi");
			int codeid = getParaToInt("codeid");
			boolean too = false;
			boolean boo = false;

			boo = SettlementService.service.ifSettleAcount(id, account_types);

			if (boo) {
				too = SettlementService.service.upSettleAcount(id,
						account_types, account_name, branch, account, codeid, branchsheng, branchshi);
			} else {
				too = SettlementService.service.inserSettleAcount(id,
						account_types, account_name, branch, account, codeid, branchsheng, branchshi);
			}
			if (too) {
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
						+ id
						+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
						+ id
						+ "\"}");
			} else {
				renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			}
		} catch (Exception e) {
			// TODO: handle exception
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}

	public void upNetwork() {
		boolean too = false;
		boolean boo = false;
		int account_types = 2;
		int id = getParaToInt("id");
		String branch = getPara("branch");
		String account_name = getPara("account_name");
		String account = getPara("account");
		boo = SettlementService.service.ifSettleAcount(id, account_types);
		if (boo) {
			too = SettlementService.service.upSettleAcount(id, account_types,
					account_name, branch, account, 0,branch,branch);
		} else {
			too = SettlementService.service.inserSettleAcount(id,
					account_types, account_name, branch, account, 0,branch,branch);
		}
		if (too) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("gateway_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("gateway_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("gateway_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway1(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("paygete_id1");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("paygete_id1", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("paygete_id1", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway2(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("paygete_id2");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("paygete_id2", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("paygete_id2", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway3(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("paygete_id3");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("paygete_id3", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("paygete_id3", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway4(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("paygete_id4");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("paygete_id4", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("paygete_id4", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upGateway5(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("paygete_id5");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("paygete_id5", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("paygete_id5", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upWeixin(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("weixin_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("weixin_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("weixin_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upWxwap(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("wxwap_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("wxwap_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("wxwap_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upAlipay(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("alipay_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("alipay_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("alipay_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upAlipaywap(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("alipaywap_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("alipaywap_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("alipaywap_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upTenpay(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("tenpay_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("tenpay_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("tenpay_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upTenpaywap(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("tenpaywap_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("tenpaywap_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("tenpaywap_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}

	public void upQqwallet(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("qqwap_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("qqwap_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("qqwap_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	public void upQqcode(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("qqcode_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("qqcode_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("qqcode_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	public void upCard(){
		int id = getParaToInt("id");
		int gateway_id = getParaToInt("card_id");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("card_id", gateway_id);
			boo = pergate.save();
		}else{
			pergate.set("card_id", gateway_id);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	public void upGatewayTitle(){
		int id = getParaToInt("id");
		String title = getPara("title");
		String titletime = getPara("titletime");
		boolean boo = false;
		PersonGateway pergate = PersonGateway.dao.findById(id);
		if(pergate==null){
			pergate = new PersonGateway();
			pergate.set("id", id);
			pergate.set("title", title);
			pergate.set("titletime", titletime);
			boo = pergate.save();
		}else{
			pergate.set("title", title);
			pergate.set("titletime", titletime);
			boo = pergate.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upEmpPerson(){
		int id = getParaToInt("id");
		int empid = getParaToInt("empid");
		boolean boo = false;
		Employee_Person empper = Employee_Person.dao.findById(id);
		if(empper==null){
			empper = new Employee_Person();
			empper.set("id", id);
			empper.set("employeeid", empid);
			boo = empper.save();
		}else{
			empper.set("employeeid", empid);
			boo = empper.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav12\", \"forwardUrl\":\"\", \"rel\":\"nav12\", \"callbackType\":\"closeCurrent\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void upCaifutong(){
		int id = getParaToInt("id");
		String caifu_account = getPara("caifu_account");
		String caifu_rate = getPara("caifu_rate");
		boolean boo = false;
		Caifutong caifu = Caifutong.dao.findById(id);
		if(caifu==null){
			caifu = new Caifutong();
			caifu.set("id", id);
			caifu.set("caifu_account", caifu_account);
			caifu.set("caifu_rate", caifu_rate);
			boo = caifu.save();
		}else{
			caifu.set("caifu_account", caifu_account);
			caifu.set("caifu_rate", caifu_rate);
			boo = caifu.update();
		}
		if (boo) {
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"person"
					+ id
					+ "\", \"forwardUrl\":\"\", \"rel\":\"person"
					+ id
					+ "\"}");
		} else {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
		}
	}
	
	public void showAddPerson(){
	    createToken("addpersonToken", 30*60);
		renderJsp("/WEB-INF/admin/jsp/person/perAddPerson.jsp");
	}
	
	public void addPerson(){
	    boolean bootoken = validateToken("addpersonToken");
		Person person = new Person();
		Payment pay = new Payment();
		String email = getPara("email");
		String phone = getPara("phone");
		boolean emailboo = RegisterService.service.getEmail(email);
		boolean phoneboo = RegisterService.service.getPhote(phone);
		if(!bootoken){
		    renderJson("{\"statusCode\":\"300\", \"message\":\"请不要重新提交\"}");
		}else if(!emailboo){
			renderJson("{\"statusCode\":\"300\", \"message\":\"邮箱已存在\"}");
		}else if(!phoneboo){
			renderJson("{\"statusCode\":\"300\", \"message\":\"手机号已存在\"}");
		}else{
			person.set("email", getPara("email"));
			String password = getPara("password");
			try {
				person.set("password",MD5Utils.createMD5(password));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String payment = getPara("payment");
			try {
				pay.set("payment",MD5Utils.createMD5(MD5Utils.createMD5(payment)));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			person.set("webName",getPara("webName"));
			person.set("website",getPara("website"));
			person.set("herolist",getParaToInt("herolist"));
			person.set("huge",getParaToInt("huge"));
			int huge = getParaToInt("huge");
			person.set("name",getPara("name"));
			person.set("contacts",getPara("contacts"));
			String idcard = getPara("idcard");
			String licence = getPara("licence");
			if(huge==0){
				person.set("idcard",idcard);
			}else{
				person.set("idcard",licence);
			}
			person.set("address",getPara("address"));
			person.set("phone",getPara("phone"));
			person.set("qq",getPara("qq"));
			person.set("time", new Date());
			person.set("iflogin", 2);
			person.set("iflock", 1);
			person.set("ifnet", 2);
			String key = CryptTool.getPassword(32);
			pay.set("key", key);
			boolean res = RegisterService.service.enroll(person, pay);
			if(res){
				Employees employees = getSessionAttr("adminsession");
				Employee_Person employee_Person  = new Employee_Person();
				employee_Person.set("id", person.getInt("id"));
				employee_Person.set("employeeid", employees.getInt("employeeid"));
				employee_Person.save();
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav12\", \"forwardUrl\":\"\", \"rel\":\"nav12\", \"callbackType\":\"closeCurrent\"}");
			}else{
				renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			}
		}
	}
}
