package com.pay.alipay.client.controller;

import com.jfinal.core.Controller;

public class Alipay2 extends Controller {
	
	public void notify_url(){
		renderJsp("/WEB-INF/pay/alipay2/notify_url.jsp");
	}
	
	public void return_url(){
		renderJsp("/WEB-INF/pay/alipay2/return_url.jsp");
	}
}
