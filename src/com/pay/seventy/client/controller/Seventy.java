/** 
 * Project Name:hspay 
 * File Name:Seventy.java 
 * Package Name:com.pay.seventy.client.controller 
 * Date:2017年3月21日上午10:20:43 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.pay.seventy.client.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.alibaba.common.lang.StringUtil;
import com.jfinal.core.Controller;
import com.jsp.payment.service.PaymentService;
import com.pay.cardyee.client.service.CardyeeService;
import com.pay.cardyee.server.util.EncodeUtils;
import com.vo.Balance;
import com.vo.CardCode;
import com.vo.CardOrder;
import com.vo.Circlip;
import com.vo.Employee_Person;
import com.vo.Employees;
import com.vo.Gateway;
import com.vo.Person;
import com.vo.SingleCard;

/**
 * @author Administrator
 * 
 */
public class Seventy extends Controller {

	public void callbackOrder()  {
		try {
			getRequest().setCharacterEncoding("UTF-8");
			String returncode = getPara("returncode");
			String yzchorderno = getPara("yzchorderno");
			String userid = getPara("userid");
			String orderno = getPara("orderno");
			String money = getPara("money");
			String realmoney = getPara("realmoney");
			String usermoney = getPara("usermoney");
			String sign = getPara("sign");
			String ext = getPara("ext");
			String errtype = getPara("errtype");
			String message = new String(getPara("message").toString().getBytes("ISO-8859-1"),"utf-8");
			Gateway gateway = Gateway.dao.findById(16);
			String md5src = "returncode=" + returncode + "&yzchorderno="
					+ yzchorderno + "&userid=" + userid + "&orderno=" + orderno
					+ "&money=" + money + "&realmoney=" + realmoney + "&keyvalue="
					+ gateway.getStr("gateway_key");
			String sign2 = EncodeUtils.testDigest(md5src);
			System.out.println("接收70卡：callbackOrder=" + md5src + "|sign=" + sign
					+ "|sign2=" + sign2);
			if (sign.toUpperCase().equals(sign2.toUpperCase())) {
				SingleCard singcard = SingleCard.dao.findById(orderno);
				String orderid = singcard.getStr("orderid");
				CardOrder cardOrder = CardOrder.dao.findById(orderid);
				if (StringUtil.equals(returncode, "1")) {
					if (!StringUtil.equals(singcard.getStr("result"), "2000")) {
						Person per = Person.dao.findById(cardOrder
								.getInt("p1_MerId"));
						Balance balance = Balance.dao.findById(per.getInt("id"));
						String cardcode = cardOrder.get("pd_FrpId");
						BigDecimal big = PaymentService.service.getRate(cardcode,
								per.getInt("id"));
						BigDecimal amount = new BigDecimal(realmoney).multiply(big);
						BigDecimal deducted = new BigDecimal(realmoney)
								.subtract(amount);
						cardOrder.set("deducted", deducted);
						balance.set("amount",
								balance.getBigDecimal("amount").add(amount));
						balance.set("cardamount",
								balance.getBigDecimal("cardamount").add(amount));
						balance.set("deductedcard",
								balance.getBigDecimal("deductedcard").add(deducted));
						int settlementauthority = balance
								.getInt("settlementauthority");
						if (settlementauthority == 2) {
							balance.set("newamount",
									balance.getBigDecimal("newamount").add(amount));
						} else {
							balance.set("settlement",
									balance.getBigDecimal("settlement").add(amount));
						}
						SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date date = new Date();
						singcard.set("datetime",ft.format(date));
						singcard.set("deducted", deducted);
						singcard.set("actual", amount);
						singcard.set("accountvalue", usermoney);
						singcard.set("result", StringUtil.equals(returncode, "1")?"2000":errtype);
						if(StringUtil.isNotBlank(message))
						singcard.set("info", message);
						singcard.update();
						balance.update();
						Employee_Person employee_Person = Employee_Person.dao.findById(per.getInt("id"));
			            if(employee_Person!=null){
			                int employeeid = employee_Person.getInt("employeeid");
			                Employees emp = Employees.dao.findById(employeeid);
			                emp.set("haveroyalty", emp.getBigDecimal("haveroyalty").add(amount.multiply(emp.getBigDecimal("commission"))));
			                emp.update();
			            }
						cardOrder.set("amount", amount);
						cardOrder.set("r1_Code", "1");
					}
				} else {
					singcard.set("result", errtype);
					singcard.update();
					cardOrder.set("r1_Code", errtype+"00");
					cardOrder.set("rq_ReturnMsg", message);
				}
				cardOrder.update();
				List<String> resultList = CardyeeService.service
						.getSingResult(orderid);
				boolean bo = true;
				for (String resu : resultList) {
					if (resu.equals("2001")) {
						bo = false;
						break;
					}
				}
				if (bo) {
					CardyeeService.service.asynchronous(orderid);
				}
				renderText("OK");
			} else {
				renderText("sign参数错误");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public void querCirclip() {
		try {
			getRequest().setCharacterEncoding("UTF-8");

			String returncode = getPara("returncode");
			String yzchorderno = getPara("yzchorderno");
			String userid = getPara("userid");
			String orderno = getPara("orderno");
			String money = getPara("money");
			String realmoney = getPara("realmoney");
			String usermoney = getPara("usermoney");
			String sign = getPara("sign");
			String ext = getPara("ext");
			String errtype = getPara("errtype");
			String message = getPara("message");
			Gateway gateway = Gateway.dao.findById(16);
			String md5src = "returncode=" + returncode + "&yzchorderno="
					+ yzchorderno + "&userid=" + userid + "&orderno=" + orderno
					+ "&money=" + money + "&realmoney=" + realmoney
					+ "&keyvalue=" + gateway.getStr("gateway_key");
			String sign2 = EncodeUtils.testDigest(md5src);
			if (sign.toUpperCase().equals(sign2.toUpperCase())) {
				Circlip cir = Circlip.dao.findById(orderno);
				if (StringUtil.equals(returncode, "1")) {
					if (StringUtil.equals(cir.getStr("result"), "2001")) {
						Person per = Person.dao.findById(cir.getInt("id"));
						Balance balance = Balance.dao
								.findById(per.getInt("id"));
						CardCode cardcode = CardCode.dao.getCardSeventy(cir
								.getStr("cardcode"));
						BigDecimal big = PaymentService.service.getRate(
								cardcode.getStr("participate"),
								per.getInt("id"));
						BigDecimal amount = new BigDecimal(money).multiply(big);
						BigDecimal deducted = new BigDecimal(realmoney)
								.subtract(amount);
						cir.set("actual", amount);
						cir.set("accountvalue", realmoney);
						cir.set("deducted", deducted);
						balance.set("amount", balance.getBigDecimal("amount")
								.add(amount));
						balance.set("cardamount",
								balance.getBigDecimal("cardamount").add(amount));
						balance.set(
								"deductedcard",
								balance.getBigDecimal("deductedcard").add(
										deducted));
						int settlementauthority = balance
								.getInt("settlementauthority");
						if (settlementauthority == 2) {
							balance.set(
									"newamount",
									balance.getBigDecimal("newamount").add(
											amount));
						} else {
							balance.set(
									"settlement",
									balance.getBigDecimal("settlement").add(
											amount));
						}
						balance.update();
						Employee_Person ep = Employee_Person.dao.findById(per
								.getInt("id"));
						if (ep != null) {
							int employeeid = ep.getInt("employeeid");
							Employees emp = Employees.dao.findById(employeeid);
							if (emp != null) {
								emp.set("haveroyalty",
										emp.getBigDecimal("haveroyalty")
												.add(amount.multiply(emp
														.getBigDecimal("commission"))));
								emp.update();
							}
						}
						cir.set("result", "2000");
						cir.set("superiorid", yzchorderno);
						cir.set("usermoney", usermoney);
					}
				} else {
					cir.set("result", errtype);
					cir.set("info", message);
				}
				cir.update();
			}
			renderText("OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void payresult() {
		renderJsp("/WEB-INF/pay/seventypay/payresult.jsp");
	}

	public void paymentpayresult() {
		renderJsp("/WEB-INF/pay/seventypay/paymentpayresult.jsp");
	}

}
