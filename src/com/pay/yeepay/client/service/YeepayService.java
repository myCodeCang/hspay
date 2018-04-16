package com.pay.yeepay.client.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.httpclient.params.HttpMethodParams;

import com.pay.yeepay.client.dao.YeepayDao;
import com.vo.Asynchronous;
import com.vo.Balance;
import com.vo.Employee_Person;
import com.vo.Employees;
import com.vo.Order;
import com.vo.Payment;
import com.vo.Rate;
import com.yeepay.DigestUtil;

public class YeepayService extends YeepayDao {
	public static YeepayService service = new YeepayService();

	public boolean order(Order order, int pd) {
		boolean boo = true;
		List<Payment> paylist = eqPayment(order.getInt("p1_MerId").toString());
		Payment pay = paylist.get(0);
		String key = pay.getStr("key");
		String pd_FrpId = (pd == 1) ? "" : order.getStr("pd_FrpId");
		try {
			String hmacs = getReqMd5HmacForOnlinePayment(formatString(order.getStr("p0_Cmd")),
					formatString(order.getInt("p1_MerId").toString()), formatString(order.getStr("p2_Order")),
					formatString(order.getStr("p3_Amt")), formatString(order.getStr("p4_Cur")),
					formatString(order.getStr("p5_Pid")), formatString(order.getStr("p6_Pcat")),
					formatString(order.getStr("p7_Pdesc")), formatString(order.getStr("p8_Url")),
					formatString(order.getStr("p9_SAF")), formatString(order.getStr("pa_MP")), formatString(pd_FrpId),
					formatString(order.getStr("pr_NeedResponse")), formatString(key));
			if (hmacs.equals(order.getStr("hmac"))) {
				order.set("CreateTime", new Date());
				order.set("success", 2);
				order.set("r1_Code", 2);
				order.set("lock", 1);
				order.save();
			} else {
				boo = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}

	public void netcallback(String r2_TrxId, String r6_Order, String ro_BankOrderId, String rp_PayDate,
			String ru_Trxtime) {
		try {
			Order order = Order.dao.findById(r6_Order);
			int r1_Code = order.getInt("r1_Code");
			if (r1_Code != 1) {
				BigDecimal p3_Amt = order.getBigDecimal("p3_Amt");
				int p1_MerId = order.getInt("p1_MerId");
				String pd_FrpId=order.getStr("pd_FrpId");
				String rateStr="";
				if("weixin".equals(pd_FrpId)){
					rateStr="weixin";
				}else if("wxwap".equals(pd_FrpId)||"wxh5".equals(pd_FrpId)){
					rateStr="wxwap";
				}else if("alipay".equals(pd_FrpId)){
					rateStr="alipay";
				}else if("alipaywap".equals(pd_FrpId)||"alipayh5".equals(pd_FrpId)){
					rateStr="alipaywap";
				}else if("tenpay".equals(pd_FrpId)){
					rateStr="tenpay";
				}else if("tenpaywap".equals(pd_FrpId)||"tenpayh5".equals(pd_FrpId)){
					rateStr="tenpaywap";
				}else if("qqcode".equals(pd_FrpId)){
					rateStr="qqcode";
				}else if("qqwap".equals(pd_FrpId)||"qqh5".equals(pd_FrpId)){
					rateStr="qqwap";
				}else{
					rateStr="banking";
				}
				BigDecimal banking = Rate.dao.findById(p1_MerId).getBigDecimal(rateStr);
				BigDecimal amount = p3_Amt.multiply(banking);
				BigDecimal deducted = p3_Amt.subtract(amount);
				order.set("r1_Code", 1);
				order.set("r2_TrxId", r2_TrxId);
				order.set("ro_BankOrderId", ro_BankOrderId);
				order.set("rp_PayDate", rp_PayDate);
				order.set("ru_Trxtime", ru_Trxtime);
				order.set("amount", amount);
				order.set("deducted", deducted);
				order.update();
				Balance balance = Balance.dao.findById(p1_MerId);
				int settlementauthority = balance.getInt("settlementauthority");
				balance.set("amount", balance.getBigDecimal("amount").add(amount));
				balance.set("netamount", balance.getBigDecimal("netamount").add(amount));
				balance.set("deductednet", balance.getBigDecimal("deductednet").add(deducted));
				if (settlementauthority == 1 || settlementauthority == 3) {
					balance.set("settlement", balance.getBigDecimal("settlement").add(amount));
				} else if (settlementauthority == 2) {
					balance.set("newamount", balance.getBigDecimal("newamount").add(amount));
				}
				balance.update();
				Employee_Person empper = Employee_Person.dao.findById(p1_MerId);
				if (empper != null) {
					int employeeid = empper.getInt("employeeid");
					Employees emp = Employees.dao.findById(employeeid);
					emp.set("haveroyalty",
							emp.getBigDecimal("haveroyalty").add(amount.multiply(emp.getBigDecimal("commission"))));
					emp.update();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Order getOrderInfo(String r6_Order){
		return Order.dao.findById(r6_Order);
	}

	public boolean asynchronous(String r6_Order) {
		boolean boo = false;
		try {
			for (int i = 0; i < 5; i++) {
				Order order = Order.dao.findById(r6_Order);
				Payment payment = Payment.dao.findById(order.getInt("p1_MerId"));
				StringBuffer sValue = new StringBuffer();
				// 商户编号
				sValue.append(order.getInt("p1_MerId").toString());
				// 业务类型
				sValue.append(order.getStr("p0_Cmd"));
				// 支付结果
				sValue.append(order.getInt("r1_Code").toString());
				// 易宝支付交易流水号
				sValue.append(order.getStr("orderid"));
				// 支付金额
				sValue.append(order.getBigDecimal("p3_Amt").toString());
				// 交易币种
				sValue.append(order.getStr("p4_Cur"));
				// 商品名称
				sValue.append(formatString(order.getStr("p5_Pid")));
				// 商户订单号
				sValue.append(order.getStr("p2_Order"));
				// 易宝支付会员ID
				sValue.append("");
				// 商户扩展信息
				sValue.append(formatString(order.getStr("pa_MP")));
				// 交易结果返回类型
				sValue.append("2");
				String sNewString = DigestUtil.hmacSign(sValue.toString(), payment.getStr("key"));
				HttpClient hClient = new HttpClient();
				// hClient.getParams().setContentCharset( "GBK ");
				HttpConnectionManagerParams managerParams = hClient.getHttpConnectionManager().getParams();
				// 设置连接超时时间(单位毫秒)
				managerParams.setConnectionTimeout(1110000);
				// 设置读数据超时时间(单位毫秒)
				managerParams.setSoTimeout(3011000);

				String r5_Pid = formatString(order.getStr("p5_Pid"));

				r5_Pid = java.net.URLEncoder.encode(r5_Pid, "gbk");

				String r8_MP = formatString(order.getStr("pa_MP"));

				r8_MP = java.net.URLEncoder.encode(r8_MP, "gbk");
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String url = "?p1_MerId=" + order.getInt("p1_MerId").toString();
				url += "&r0_Cmd=" + order.getStr("p0_Cmd");
				url += "&r1_Code=" + order.getInt("r1_Code").toString();
				url += "&r2_TrxId=" + order.getStr("orderid");
				url += "&r3_Amt=" + order.getBigDecimal("p3_Amt").toString();
				url += "&r4_Cur=" + order.getStr("p4_Cur");
				url += "&r5_Pid=" + r5_Pid;
				url += "&r6_Order=" + order.getStr("p2_Order");
				url += "&r7_Uid=";
				url += "&r8_MP=" + r8_MP;
				url += "&r9_BType=2";
				url += "&rb_BankId=" + order.getStr("pd_FrpId");
				url += "&ro_BankOrderId=" + order.getStr("ro_BankOrderId");
				url += "&rp_PayDate=" + format.format(order.getTimestamp("rp_PayDate"));
				url += "&rq_CardNo=";
				url += "&ru_Trxtime=" + format.format(order.getTimestamp("ru_Trxtime"));
				url += "&hmac=" + sNewString;
				System.out.println(r6_Order + "=========异步通知开始==========" + order.getStr("p8_Url") + url);
				Asynchronous asynchronous = Asynchronous.dao.findById(r6_Order);
				if (asynchronous == null) {
					asynchronous = new Asynchronous();
					asynchronous.set("orderid", r6_Order);
					asynchronous.set("url", order.getStr("p8_Url") + url);
					asynchronous.save();
				} else {
					asynchronous.set("url", order.getStr("p8_Url") + url);
					asynchronous.update();
				}
				PostMethod post = new PostMethod(order.getStr("p8_Url") + url);
				post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "GBK");
				post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=GBK");
				String returnStr = "";
				hClient.executeMethod(post);
				returnStr =post.getResponseBodyAsString();
				if(!returnStr.equals("")&&returnStr!=null){
					String st1=new String(returnStr.getBytes("ISO-8859-1"),"UTF-8");
					String st2=new String(returnStr.getBytes("GBK"),"UTF-8");
					String st3=new String(returnStr.getBytes("UTF-8"),"UTF-8");
					String st4=new String(returnStr.getBytes("GB2312"),"UTF-8");
				    String st = returnStr.trim();
				    if (st.length() > 7) {
				    	    	st = st.substring(0, 7);
				   	}
					if (st.toUpperCase().equals("SUCCESS")) {
						order.set("success", 1);
						boo = true;
						System.out.println(r6_Order + "===================异步通知成功");
					}
					String sst="[st1="+(st1.length() > 100?st1.substring(0, 100):st1)+"][st2="+(st2.length() > 100?st2.substring(0, 100):st2)+"][st3="+(st3.length() > 100?st3.substring(0, 100):st3)+"][st4="+(st4.length() > 100?st4.substring(0, 100):st4)+"]";
					order.set("remark", sst);
				}
				if(!boo){
					String[] re = returnStr.split("\n");
					for (String st : re) {
						st = st.trim();
						if (st.length() > 7) {
							st = st.substring(0, 7);
						}
						if (st.toUpperCase().equals("SUCCESS")) {
							order.set("success", 1);
							boo = true;
							System.out.println(r6_Order + "===================异步通知成功");
							break;
						}
					}
				}
				order.update();
				if (boo) {
					System.out.println(r6_Order + "===================异步通知成功");
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}

	public void failure(String r6_Order, String ru_Trxtime) {
		Order order = Order.dao.findById(r6_Order);
		order.set("r1_Code", 3);
		order.set("ru_Trxtime", ru_Trxtime);
		order.update();
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
	public String getReqMd5HmacForOnlinePayment(String p0_Cmd, String p1_MerId, String p2_Order, String p3_Amt,
			String p4_Cur, String p5_Pid, String p6_Pcat, String p7_Pdesc, String p8_Url, String p9_SAF, String pa_MP,
			String pd_FrpId, String pr_NeedResponse, String keyValue) {
		StringBuffer sValue = new StringBuffer();
		// 业务类型
		sValue.append(p0_Cmd);
		// 商户编号
		sValue.append(p1_MerId);
		// 商户订单号
		sValue.append(p2_Order);
		// 支付金额
		sValue.append(p3_Amt);
		// 交易币种
		sValue.append(p4_Cur);
		// 商品名称
		sValue.append(p5_Pid);
		// 商品种类
		sValue.append(p6_Pcat);
		// 商品描述
		sValue.append(p7_Pdesc);
		// 商户接收支付成功数据的地址
		sValue.append(p8_Url);
		// 送货地址
		sValue.append(p9_SAF);
		// 商户扩展信息
		sValue.append(pa_MP);
		// 银行编码
		sValue.append(pd_FrpId);
		// 应答机制
		sValue.append(pr_NeedResponse);

		String sNewString = null;

		sNewString = DigestUtil.hmacSign(sValue.toString(), keyValue);
		return (sNewString);
	}
}
