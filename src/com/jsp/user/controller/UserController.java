package com.jsp.user.controller;

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
import com.jsp.user.service.UserService;
import com.tool.CryptTool;
import com.tool.MD5Utils;
import com.vo.Dynamic;
import com.vo.Logrecord;
import com.vo.Payment;
import com.vo.Person;

/**
 * 用户资料
 * @author Administrator
 *
 */
@Before(LoginInterceptor.class)
public class UserController extends Controller {
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
			renderJsp("/WEB-INF/jsp/user1.jsp");
		} catch (Exception e) {
			// TODO: handle exceptionh
			e.printStackTrace();
		}
	}
	
	public void getannouncement(){
		int pageNum = getParaToInt("pageNum");
		Page<Dynamic> dynamicPage = DynamicService.service.getDynamicPage(pageNum, 10);
		setAttr("pageNum", dynamicPage.getPageNumber());
		setAttr("totalpage", dynamicPage.getTotalPage());
		setAttr("dynamiclist", dynamicPage.getList());
		renderJsp("/WEB-INF/jsp/announcement.jsp");
	}
	
	public void getHelp(){
		renderJsp("/WEB-INF/jsp/help.jsp");
	}
	
	public void getAbout(){
		renderJsp("/WEB-INF/jsp/about.jsp");
	}

	/**
	 * 获取短信
	 */
	@Before(SmsInterceptor.class)
	public void getSms() {
		Person person = getSessionAttr("session");
		String phone = person.getStr("phone");
		String key = CryptTool.getPasswordOfNumber(6);
		String content = "您的验证码是：【"+key+"】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
		try {
			String res = Yunsms.sms(phone, content);
			if (res.equals("100")) {
				setSessionAttr("sms", key);
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
	public void getNewSms(){
		String newphone = getPara("newphone");
		String key = CryptTool.getPasswordOfNumber(6);
		String content = "您的验证码是：【"+key+"】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
		try {
			String res = Yunsms.sms(newphone, content);
			if (res.equals("100")) {
				setSessionAttr("newsms", key);
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
	public void newPhoneSms(){
		String keys = getPara("param");
		String key = getSessionAttr("newsms");
		if(keys.equals(key)){
			renderText("y");
		}else {
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
				Person.dao.findById(person.getInt("id")).set("password", password).update();
				renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
			}else if(passwtype.equals("2")){
				String payment = getPara("payment");
				payment = MD5Utils.createMD5(MD5Utils.createMD5(payment));
				Payment.dao.find("UPDATE payment SET payment = '"+payment+"' WHERE id="+person.getInt("id"));
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
	public void upPhone(){
		try {
			String newphone = getPara("newphone");
			Person person = getSessionAttr("session");
			Person.dao.findById(person.get("id")).set("phone", newphone).update();
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
	public void upKey(){
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
