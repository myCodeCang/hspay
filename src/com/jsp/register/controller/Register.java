package com.jsp.register.controller;

import java.util.Date;

import org.apache.commons.lang.math.NumberUtils;

import com.function.Yunsms;
import com.interceptor.SmsRegisterInterceptor;
import com.interceptor.UpdateInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jsp.register.service.RegisterService;
import com.tool.CryptTool;
import com.tool.MD5Utils;
import com.vo.Payment;
import com.vo.Person;
import com.vo.System_interface;

public class Register extends Controller {
	public void index(){
		renderJsp("/WEB-INF/register.jsp");
	}
	
	/**
	 * 注册
	 */
	//@Before(UpdateInterceptor.class)
	public void enroll(){
		Person person = new Person();
		Payment pay = new Payment();
		System_interface system=System_interface.dao.findById(1);
		int personId=system.getInt("system_interface_person");
		while(true) {
			Person p1=person.findById(personId);
			if(p1!=null||personId==0) {
				personId+=1;
			}else
				break;
		}
		system.set("system_interface_person", personId);
		person.set("id", personId);
		person.set("email", getPara("email"));
		String password = getPara("password");
		try {
			person.set("password",MD5Utils.createMD5(password));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			renderJson("{\"info\":\"注册失败,登陆密码错误！\",\"status\":\"n\"}");
			return;
		}
		String payment = getPara("payment");
		try {
			pay.set("payment",MD5Utils.createMD5(MD5Utils.createMD5(payment)));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			renderJson("{\"info\":\"注册失败,支付密码错误！\",\"status\":\"n\"}");
			return;
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
		person.set("iflock", 2);
		person.set("ifnet", 2);
		String key = CryptTool.getPassword(32);
		pay.set("key", key);
		system.update();
		boolean res = RegisterService.service.enroll(person, pay);
		if(res){
			renderJson("{\"info\":\"注册成功，请联系客服开通！\",\"status\":\"y\"}");
		}else{
			renderJson("{\"info\":\"注册失败！\",\"status\":\"n\"}");
		}
	}
	
	public void getEmail(){
		String email = getPara("param");
		boolean boo = RegisterService.service.getEmail(email);
		if(boo){
			renderText("y");
		}else{
			renderText("email已存在！");
		}
	}
	
	public void getPhote(){
		String phote = getPara("param");
		boolean boo = RegisterService.service.getPhote(phote);
		if(boo){
			renderText("y");
		}else{
			renderText("手机号已存在");
		}
	}
	
	public void getphotepass(){
		String phote = getPara("param");
		boolean boo = RegisterService.service.getPhotepass(phote);
		if(boo){
			renderText("y");
		}else{
			renderText("手机号不存在");
		}
	}
	
	@Before(UpdateInterceptor.class)
	public void upPassword(){
		try {
			String phone = getPara("phone");
			int id = RegisterService.service.getPerId(phone);
			Person person = Person.dao.findById(id);
			String password = getPara("password");
			person.set("password",MD5Utils.createMD5(password));
			boolean boo = person.update();
			if(boo){
				renderJson("{\"info\":\"更改成功！\",\"status\":\"y\"}");
			}else{
				renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			}
		} catch (Exception e) {
			renderJson("{\"info\":\"更改失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}
	
	@Before(SmsRegisterInterceptor.class)
	public void getSms(){
		String phone = getPara("phone");
		String key = CryptTool.getPasswordOfNumber(6);
		String content = "您的验证码是：【"+key+"】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
		try {
			String res = Yunsms.sms(phone, content);
			if(res.equals("100")){
				setSessionAttr("sms", key);
				System.out.println(key);
				renderText(res);
			}else{
				renderText(Yunsms.result(NumberUtils.toInt(res)));
			}
		} catch (Exception e) {
			renderText("短信获取失败，请联系工作人眼");
			e.printStackTrace();
		}
	}
	
	public void valiSms(){
		String keys = getPara("param");
		String key = getSessionAttr("sms");
		if(keys.equals(key)){
			renderText("y");
		}else {
			renderText("验证码错误");
		}
	}
}
