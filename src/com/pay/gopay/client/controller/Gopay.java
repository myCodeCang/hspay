package com.pay.gopay.client.controller;

import java.io.UnsupportedEncodingException;

import com.jfinal.core.Controller;
import com.pay.gopay.server.GopayUtils;
import com.pay.yeepay.client.service.YeepayService;

public class Gopay extends Controller {

	public void payresult()throws UnsupportedEncodingException{
		getRequest().setCharacterEncoding(GopayUtils.input_charset);
		renderJsp("/WEB-INF/pay/gopay/payresult.jsp");
	}
	
	public void paymentpayresult() throws UnsupportedEncodingException{
		getRequest().setCharacterEncoding(GopayUtils.input_charset);
		renderJsp("/WEB-INF/pay/gopay/paymentpayresult.jsp");
	}
	
	public void gopayreturn() {
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
