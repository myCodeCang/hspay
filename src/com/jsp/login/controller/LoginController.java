package com.jsp.login.controller;

import java.util.Date;

import com.jfinal.core.Controller;
import com.jsp.login.service.LoginService;
import com.tool.CryptTool;
import com.tool.MD5Utils;
import com.tool.NumVeryCode;
import com.vo.Logrecord;
import com.vo.Person;

public class LoginController extends Controller {
	public void login() {
		Person person = null;
		String email = getPara("email");
		String password = getPara("password");
		try {
			person = LoginService.loginService.login(email,
					MD5Utils.createMD5(password));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			renderJson("{\"info\":\"登陆失败,用户名或密码错误！\",\"status\":\"n\"}");
		}
		if (person != null) {
			if (person.getInt("iflock") == 1) {
				setSessionAttr("session", person);
				Logrecord log = new Logrecord().set("id", person.get("id"));
				log.set("landingip", CryptTool.getIpAddr(getRequest()));
				log.set("landingtime", new Date());
				log.set("exittime", new Date());
				log.save();
				person.set("iflogin", 1);
				person.update();
				setSessionAttr("logrecord", log);
				renderJson("{\"info\":\"登陆成功！\",\"status\":\"y\"}");
			} else {
				renderJson("{\"info\":\"登陆账号暂时未开通，请联系客服！\",\"status\":\"n\"}");
			}
		} else {
			renderJson("{\"info\":\"登陆失败,用户名或密码错误！\",\"status\":\"n\"}");
		}
	}

	public void quit() {
		Logrecord log = getSessionAttr("logrecord");
		if (log != null) {
			log.set("exittime", new Date());
			log.update();
			removeSessionAttr("logrecord");
		}
		Person per = getSessionAttr("session");
		if (per != null) {
			per.set("iflogin", 2);
			per.update();
			removeSessionAttr("session");
		}
		redirect("/");
	}

	public void random_number() {
		render(new NumVeryCode("validateCode"));
	}
}
