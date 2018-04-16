package com.pay.cardyee.client.controller;

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
import com.pay.seventy.client.service.SeventyService;
import com.tool.CryptTool;
import com.vo.Balance;
import com.vo.CardOrder;
import com.vo.Circlip;
import com.vo.Employee_Person;
import com.vo.Employees;
import com.vo.Gateway;
import com.vo.Payment;
import com.vo.Person;
import com.vo.PersonGateway;
import com.vo.SingleCard;
import com.vo.System_interface;
import com.yeepay.DigestUtil;

public class Cardyee extends Controller {
	public void node() {
		try {
			getRequest().setCharacterEncoding("gbk");
			String p0_Cmd = getPara("p0_Cmd");
			String p1_MerId = "";
			if (getPara("p1_MerId") != null) {
				p1_MerId = getPara("p1_MerId");
			}
			String p2_Order = getPara("p2_Order");
			String p3_Amt = getPara("p3_Amt");
			String pa4_cardAmt = getPara("pa4_cardAmt");
			String pa5_cardNo = "";
			if (getPara("pa5_cardNo") != null) {
				pa5_cardNo = getPara("pa5_cardNo");
			}
			String pa6_cardPwd = "";
			if (getPara("pa6_cardPwd") != null) {
				pa6_cardPwd = getPara("pa6_cardPwd");
			}
			String p7_Url = getPara("p7_Url");
			String pa_MP = "";
			if (getPara("pa_MP") != null) {
				pa_MP = getPara("pa_MP");
			}
			String pd_FrpId = getPara("pd_FrpId");
			String pr_NeedResponse = getPara("pr_NeedResponse");
			String pz_userId = "";
			if (getPara("pz_userId") != null) {
				pz_userId = getPara("pz_userId");
			}
			String hmac = getPara("hmac");
			String r1_Code = "";
			String rq_ReturnMsg = "";
			Person per = null;
			if (!p1_MerId.equals("")) {
				per = Person.dao.findById(Integer.parseInt(p1_MerId));
			}
			if (StringUtil.isBlank(p0_Cmd)) {
				renderText("抱歉，参数业务类型[p0_Cmd]不能为空！");
			} else if (!StringUtil.equals(p0_Cmd.toLowerCase(), "Buy".toLowerCase())) {
				renderText("抱歉，参数业务类型[p0_Cmd]错误，请对照接口文档！");
			} else if (StringUtil.isBlank(p1_MerId)) {
				renderText("抱歉，参数商户编号[p1_MerId]不能为空！");
			} else if (StringUtil.isBlank(p2_Order)) {
				renderText("抱歉，参数商户订单号[p2_Order]不能为空！");
			} else if (p2_Order.length() > 50) {
				renderText("抱歉，参数商户订单号[p2_Order]错误，长度不能大于50个字符串！");
			} else if (StringUtil.isBlank(p3_Amt)) {
				renderText("抱歉，参数交易金额[p3_Amt]不能为空！");
			} else if (StringUtil.isBlank(pa4_cardAmt)) {
				renderText("抱歉，参数订单金额[pa4_cardAmt]不能为空！");
			} else if (StringUtil.isBlank(pa5_cardNo)) {
				renderText("抱歉，参数卡号[pa5_cardNo]不能为空！");
			} else if (StringUtil.isBlank(pa6_cardPwd)) {
				renderText("抱歉，参数卡密[pa6_cardPwd]不能为空！");
			} else if (StringUtil.isBlank(p7_Url)) {
				renderText("抱歉，参数商户接收支付成功数据的地址[p7_Url]不能为空！");
			} else if (StringUtil.isBlank(pd_FrpId)) {
				renderText("抱歉，参数支付通道[pd_FrpId]不能为空！");
			} else if (StringUtil.isBlank(hmac)) {
				renderText("抱歉，参数[hmac]不能为空！");
			} else if (per == null) {
				renderHtml("抱歉，无该用户！");
			} else {
				boolean boo = CardyeeService.service.equCard(p0_Cmd, p1_MerId,
						p2_Order, p3_Amt, pa4_cardAmt, pa5_cardNo, pa6_cardPwd,
						p7_Url, pa_MP, pd_FrpId, pr_NeedResponse, pz_userId,
						hmac);
				if (boo) {
					CardOrder card = new CardOrder();
					card.set("ip", CryptTool.getIpAddr(getRequest()));
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyyMMDDHHMMSSmmm");
					String orderid = "CA" + sdf.format(new Date())
							+ CryptTool.getPasswordOfNumber(4) + p1_MerId;
					card.set("orderid", orderid);
					card.set("p0_Cmd", p0_Cmd);
					card.set("p1_MerId", p1_MerId);
					card.set("p2_Order", p2_Order);
					card.set("p3_Amt", p3_Amt);
					card.set("pa_MP", pa_MP);
					card.set("pa7_cardAmt", pa4_cardAmt);
					card.set("pa8_cardNo", pa5_cardNo);
					card.set("pa9_cardPwd", pa6_cardPwd);
					card.set("p8_Url", p7_Url);
					card.set("pd_FrpId", pd_FrpId);
					card.set("pr_NeedResponse", pr_NeedResponse);
					card.set("pz_userId", pz_userId);
					card.set("lock", 1);
					card.set("success", 2);
					card.set("hmac", hmac);
					card.set("CreateTime", new Date());
					String path = getRequest().getContextPath();
					String basePath = getRequest().getScheme() + "://"
							+ getRequest().getServerName() + ":"
							+ getRequest().getServerPort() + path;
					PersonGateway pergetGateway = PersonGateway.dao
							.findById(per.getInt("id"));
					Gateway gateway = Gateway.dao.findById(pergetGateway
							.getInt("card_id"));

					String memberId = gateway.getStr("gateway_merid");
					String keyValue = gateway.getStr("gateway_key"); // 商家密钥
					int function = gateway.getInt("gateway_function");
					if (function == 11) {
						card = CardyeeService.service.HandCard(card, memberId,
								keyValue, basePath);
					} else if (function == 16) {
						card = SeventyService.service.HandCard(card, memberId,
								keyValue, basePath);
					} else {
						card.set("r1_Code", -1);
						card.set("rq_ReturnMsg", "您好，您暂时未开通此通道，请联系客服！");
					}
					r1_Code = card.getInt("r1_Code").toString();
					rq_ReturnMsg = card.getStr("rq_ReturnMsg");
				} else {
					r1_Code = "-1";
					rq_ReturnMsg = "签名较验失败或未知错误";
				}
				Payment pay = Payment.dao.findById(Integer.parseInt(p1_MerId));
				String newHmac = "";
				newHmac = DigestUtil.getHmac(new String[] { p0_Cmd, r1_Code,
						p2_Order, rq_ReturnMsg }, pay.getStr("key"));
				renderText("r0_Cmd=" + p0_Cmd + "&r1_Code=" + r1_Code
						+ "&r6_Order=" + p2_Order + "&rq_ReturnMsg="
						+ rq_ReturnMsg + "&hmac=" + newHmac);
			}
		} catch (UnsupportedEncodingException e) {
			renderText("提交错误！");
			e.printStackTrace();
		}
	}

	public void cardReturn() {
		try {
			getRequest().setCharacterEncoding("gbk");

			String usercode = getPara("usercode");
			String mode = getPara("mode");
			String version = getPara("version");
			String orderno = getPara("orderno");
			String billid = getPara("billid");
			String result = getPara("result");
			String info = getPara("info");
			String value = getPara("value");
			String accountvalue = getPara("accountvalue");
			String datetime = getPara("datetime");
			String sign = getPara("sign");
			String md5src = usercode + mode + version + orderno + billid
					+ result + info + value + accountvalue + datetime;
			System_interface systeminterface = System_interface.dao.findById(1);
			String md5key = systeminterface.getStr("system_interface_md5key");
			if (!sign.equals(EncodeUtils.testDigest(md5src + md5key))) {
				info += "加密验证失败";
			}
			SingleCard singcard = SingleCard.dao.findById(orderno);
			String orderid = singcard.getStr("orderid");
			if (!singcard.get("result").equals("2000")) {
				CardOrder cardorder = CardOrder.dao.findById(orderid);
				int id = cardorder.getInt("p1_MerId");
				Balance balance = Balance.dao.findById(id);
				String cardcode = singcard.get("cardcode");
				cardcode = cardcode.substring(0, 6);
				BigDecimal big = PaymentService.service.getRate(cardcode, id);
				BigDecimal amount = new BigDecimal(value).multiply(big);
				BigDecimal deducted = new BigDecimal(value).subtract(amount);
				singcard.set("value", value);
				singcard.set("actual", amount);
				singcard.set("deducted", deducted);
				cardorder.set("amount",
						cardorder.getBigDecimal("amount").add(amount));
				cardorder.set("deducted", cardorder.getBigDecimal("deducted")
						.add(deducted));
				cardorder.update();
				balance.set("amount",
						balance.getBigDecimal("amount").add(amount));
				balance.set("cardamount", balance.getBigDecimal("cardamount")
						.add(amount));
				balance.set("deductedcard",
						balance.getBigDecimal("deductedcard").add(deducted));
				int settlementauthority = balance.getInt("settlementauthority");
				if (settlementauthority == 1) {
					balance.set("settlement",
							balance.getBigDecimal("settlement").add(amount));
				} else if (settlementauthority == 2) {
					balance.set("newamount", balance.getBigDecimal("newamount")
							.add(amount));
				}
				singcard.set("datetime", datetime);
				singcard.set("accountvalue", accountvalue);
				singcard.set("result", result);
				singcard.set("info", info);
				singcard.update();
				balance.update();
				Employee_Person employee_Person = Employee_Person.dao
						.findById(id);
				if (employee_Person != null) {
					int employeeid = employee_Person.getInt("employeeid");
					Employees emp = Employees.dao.findById(employeeid);
					emp.set("haveroyalty",
							emp.getBigDecimal("haveroyalty").add(
									amount.multiply(emp
											.getBigDecimal("commission"))));
					emp.update();
				}
			}
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void querCirclip() {
		try {
			getRequest().setCharacterEncoding("gbk");

			String result = getPara("result");
			String orderno = getPara("orderno");
			String info = getPara("info");
			String value = getPara("value");
			String accountvalue = getPara("accountvalue");
			Circlip cir = Circlip.dao.findById(orderno);
			if (!cir.getStr("result").equals("2000")) {
				if (result.equals("2000")) {
					Person per = Person.dao.findById(cir.getInt("id"));
					Balance balance = Balance.dao.findById(per.getInt("id"));
					String cardcode = cir.get("cardcode");
					BigDecimal big = PaymentService.service.getRate(cardcode,
							per.getInt("id"));
					BigDecimal amount = new BigDecimal(value).multiply(big);
					BigDecimal deducted = new BigDecimal(value)
							.subtract(amount);
					cir.set("actual", amount);
					cir.set("accountvalue", accountvalue);
					cir.set("deducted", deducted);
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
					balance.update();
					int employeeid = Employee_Person.dao.findById(
							per.getInt("id")).getInt("employeeid");
					Employees emp = Employees.dao.findById(employeeid);
					emp.set("haveroyalty",
							emp.getBigDecimal("haveroyalty").add(
									amount.multiply(emp
											.getBigDecimal("commission"))));
					emp.update();
				}
				cir.set("result", result);
				cir.set("info", info);
				cir.update();
			}
			renderText("OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void cardret() {
		String orderid = getPara("orderid");
		try {
			CardyeeService.service.asynchronous(orderid);
			renderText("通知成功！");
		} catch (Exception e) {
			renderText("通知失败！");
			e.printStackTrace();
		}
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
}
