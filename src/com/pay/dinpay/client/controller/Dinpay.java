package com.pay.dinpay.client.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.alibaba.common.lang.StringUtil;
import com.jfinal.core.Controller;
import com.jsp.payment.service.PaymentService;
import com.pay.dinpay.server.HttpClientUtil;
import com.pay.jdpay.service.QrcodeUtil;
import com.pay.yeepay.client.service.YeepayService;
import com.vo.CardOrder;
import com.vo.Order;

public class Dinpay extends Controller {

	public void dinpayToMer() {
		renderJsp("/WEB-INF/pay/dinpay/DinpayToMer.jsp");
	}

	public void paymentDinpayToMer() {
		renderJsp("/WEB-INF/pay/dinpay/paymentDinpayToMer.jsp");
	}

	public void sweeppayment() throws DocumentException {
		String result;
		try {
			result = URLDecoder.decode(getPara("result"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			result = "";
		}
		String BillType = getPara("service_type");
		String goodsTitle = getPara("goodsTitle");
		Document doc = DocumentHelper.parseText(result);
		Element root = doc.getRootElement();
		Element element = root.element("response");
		String resp_code = element.elementTextTrim("resp_code");
		String resp_desc = element.elementTextTrim("resp_desc");
		if (resp_code.equals("SUCCESS")) {
			String qrcode = element.elementTextTrim("qrcode");
			String order_no = element.elementTextTrim("order_no");
			String transAmt = element.elementTextTrim("order_amount");
			String sign = element.elementTextTrim("sign");
			String sign_type = element.elementTextTrim("sign_type");
			String trade_no = element.elementTextTrim("trade_no");
			String interface_version = element.elementTextTrim("interface_version");
			String merchant_code = element.elementTextTrim("merchant_code");
			String order_time = element.elementTextTrim("order_time");
			String result_code = element.elementTextTrim("result_code");
			String result_desc = element.elementTextTrim("result_desc");
			String isRedirect = element.elementTextTrim("isRedirect");
			if ("0".equals(result_code) && StringUtil.isNotBlank(qrcode)) {
				if (isRedirect != null && isRedirect.equals("Y")) {
					String qrcode2 = new HttpClientUtil().doPost(qrcode, null, "utf-8");
					setAttr("wxurl2", qrcode2);
				} else {
					setAttr("wxurl", QrcodeUtil.createQrcode(qrcode, order_no, 300, 300));
				}
				setAttr("BillNo", order_no);
				setAttr("BillType", BillType);
				setAttr("transAmt", transAmt);
				setAttr("goodsTitle", goodsTitle);
				renderJsp("/WEB-INF/pay/dinpay/sweeppayment.jsp");
			} else {
				renderText(resp_desc + "," + result_desc);
			}
		} else {
			if (StringUtil.isBlank(resp_desc))
				resp_desc = "抱歉，参数提交失败！";
			renderText(resp_desc);
		}
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
}
