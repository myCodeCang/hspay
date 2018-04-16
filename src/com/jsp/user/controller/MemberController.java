package com.jsp.user.controller;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;

import com.function.Yunsms;
import com.interceptor.LoginInterceptor;
import com.interceptor.SmsInterceptor;
import com.interceptor.UpdateInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
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
import com.vo.SettlementAccount;

@Before(LoginInterceptor.class)
public class MemberController extends Controller {
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
			setAttr("ordercount", UserService.userService.getOrdersCount(personId));
			setAttr("cardordercount", UserService.userService.getCardOrdersCount(personId));
			setAttr("circlipcount", UserService.userService.getCirclipCount(personId));
			setAttr("rechargecount", UserService.userService.getRechargeCount(personId));
			renderJsp("/WEB-INF/member/index.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void exchange(){
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("ordertotal", ExchangeService.exchangeService.getOrdertotal(person.getInt("id"), new Date()));
		setAttr("cardordertotal", ExchangeService.exchangeService.getCardOrdertotal(person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/member/exchange.jsp");
	}
	public void statement(){
		Person per = getSessionAttr("session");
		List<Balance> balist = StatementService.service.getBalance(per.getInt("id"));
		setAttr("netamount", balist.get(0).get("netamount"));
		setAttr("cardamount", balist.get(0).get("cardamount"));
		renderJsp("/WEB-INF/member/statement.jsp");
	}

	public void payment() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/member/payment.jsp");
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
		setAttr("partici", ExchangeService.exchangeService.getPartici());
        createToken("withdrawalToken", 30*60);
		renderJsp("/WEB-INF/member/settlement.jsp");
	}
	public void transfer(){
		Person per = getSessionAttr("session");
		setAttr("balance", Balance.dao.findById(per.getInt("id")));
		renderJsp("/WEB-INF/member/transfer.jsp");
	}
	public void getannouncement() {
		int pageNum = getParaToInt("pageNum");
		Page<Dynamic> dynamicPage = DynamicService.service.getDynamicPage(
				pageNum, 10);
		setAttr("pageNum", dynamicPage.getPageNumber());
		setAttr("totalpage", dynamicPage.getTotalPage());
		setAttr("dynamiclist", dynamicPage.getList());
		renderJsp("/WEB-INF/member/announcement.jsp");
	}

	public void getHelp() {
		renderJsp("/WEB-INF/member/help.jsp");
	}

	public void getAbout() {
		renderJsp("/WEB-INF/member/about.jsp");
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
				System.out.println(key);
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
				System.out.println(key);
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
			String key = CryptTool.getPassword(32);
			Person person = getSessionAttr("session");
			Payment pay = Payment.dao.findById(person.getInt("id"));
			pay.set("key", key);
			pay.update();
			renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
		} catch (Exception e) {
			// TODO: handle exception
			renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}
}
