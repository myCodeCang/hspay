package com.pay.mzfpay.client.controller;

import com.jfinal.core.Controller;
import com.pay.yeepay.client.service.YeepayService;

public class Mzfpay extends Controller {

	public void payresult(){
		renderJsp("/WEB-INF/pay/mzfpay/payresult.jsp");
	}
	
	public void paymentpayresult(){
		renderJsp("/WEB-INF/pay/mzfpay/paymentpayresult.jsp");
	}
	
	public void mzfpayreturn() {
		try {
			String orderId = getPara("orderId");
			String path = getRequest().getContextPath();
			String basePath = getRequest().getScheme() + "://"
					+ getRequest().getServerName() + ":"
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
