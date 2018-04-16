/** 
 * Project Name:hspay 
 * File Name:Hundred.java 
 * Package Name:com.pay.hundred.client.controller 
 * Date:2017年4月9日下午3:49:13 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.pay.hundred.client.controller;

import com.jfinal.core.Controller;
import com.pay.yeepay.client.service.YeepayService;

/**
 * @author Administrator
 * 
 */
public class Hundred extends Controller {

	public void payresult() {
		renderJsp("/WEB-INF/pay/hundred/payresult.jsp");
	}

	public void paymentpayresult() {
		renderJsp("/WEB-INF/pay/hundred/paymentpayresult.jsp");
	}

	public void hundredreturn() {
		try {
			String orderId = getPara("orderId");
			String path = getRequest().getContextPath();
			String basePath = getRequest().getScheme() + "://" + getRequest().getServerName() + ":"
					+ getRequest().getServerPort() + path;
			for (int i = 0; i < 2; i++) {
				if (i == 0) {
					YeepayService.service.asynchronous(orderId);
				} else if (i == 1) {
					redirect(basePath + "/yeepay/yeeReturn?r6_Order=" + orderId);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
