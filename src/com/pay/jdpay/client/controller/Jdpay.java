package com.pay.jdpay.client.controller;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jsp.payment.service.PaymentService;
import com.pay.jdpay.service.DigestUtil;
import com.pay.jdpay.service.QrcodeUtil;
import com.pay.yeepay.client.service.YeepayService;
import com.vo.CardOrder;
import com.vo.Gateway;
import com.vo.Order;

import net.sf.json.JSONObject;

public class Jdpay extends Controller {
	public void payresult() {
		renderJsp("/WEB-INF/pay/jdpay/payresult.jsp");
	}

	public void paymentpayresult() {
		try {
			Gateway gateway = Gateway.dao.findById(19);
			String Key = gateway.getStr("gateway_key"); // 商户密钥
			Map<String, String> paramMap = new HashMap<String, String>();
			JSONObject obj = new JSONObject();
			obj = JSONObject.fromObject(DigestUtil.parseParam2(getRequest()));
			paramMap = (Map<String, String>) obj;
			String msg = DigestUtil.getSignMsg(paramMap, null);
			System.out.println("msg:" + msg);
			String respMsgSign = paramMap.get("sign").toString();
			paramMap.remove("sign");
			String respSign = DigestUtil.setSign(paramMap, Key);
			String BillNo = paramMap.get("orderId").toString();
			String respCode = paramMap.get("respCode").toString();
			setAttr("respMsgSign", respMsgSign);
			setAttr("respSign", respSign);
			setAttr("BillNo", BillNo);
			setAttr("respCode", respCode);
			renderJsp("/WEB-INF/pay/jdpay/paymentpayresult.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sweeppayment() {
		String wxurl = getPara("wxurl");
		String billNo = getPara("BillNo");
		setAttr("wxurl", QrcodeUtil.createQrcode(wxurl, billNo, 300, 300));
		setAttr("BillNo", getPara("BillNo"));
		setAttr("BillType", getPara("BillType"));
		setAttr("transAmt", getPara("transAmt"));
		setAttr("goodsTitle", getPara("goodsTitle"));
		renderJsp("/WEB-INF/pay/jdpay/sweeppayment.jsp");
	}

	public void order() {
		String BillNo = getPara("BillNo", "");
		boolean r = false;
		if (!"".equals(BillNo)) {
			String billnostr = BillNo.substring(0, 1);
			String billnos = BillNo.substring(0, 2);
			if (billnostr.equals("O")) {
				Order order = YeepayService.service.getOrderInfo(BillNo);
				r = (order != null && order.getInt("r1_Code") == 1);
			} else if (billnos.equals("RE")) {
				CardOrder order = PaymentService.service.getCardInfo(BillNo);
				r = (order != null && order.getInt("r1_Code") == 1);
			}
		}
		renderJson(r ? "1" : "0");
	}

	public void shpayreturn() {
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
