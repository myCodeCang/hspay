/** 
 * Project Name:hspay 
 * File Name:HundredService.java 
 * Package Name:com.pay.hundred.client.service 
 * Date:2017年4月9日下午3:26:45 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.pay.hundred.client.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;

import com.ofpay.rcvcard.util.RSA;
import com.pay.cardyee.client.service.CardyeeService;
import com.pay.cardyee.server.XmlStringParse;
import com.pay.cardyee.server.util.EncodeUtils;
import com.pay.hundred.client.dao.HundredDao;
import com.pay.yeepay.server.DigestUtil;
import com.tool.CryptTool;
import com.vo.CardOrder;
import com.vo.Gateway;
import com.vo.Payment;
import com.vo.PersonGateway;
import com.vo.SingleCard;
import com.vo.System_interface;

/**
 * @author Administrator
 * 
 */
public class HundredService extends HundredDao {
	public static HundredService service = new HundredService();

	public boolean equCard(String p0_Cmd, String p1_MerId, String p2_Order,
			String p3_Amt, String p4_verifyAmt, String p5_Pid, String p6_Pcat,
			String p7_Pdesc, String p8_Url, String pa_MP, String pa7_cardAmt,
			String pa8_cardNo, String pa9_cardPwd, String pd_FrpId,
			String pr_NeedResponse, String pz_userId, String pz1_userRegTime,
			String hmac) {
		boolean boo = false;
		List<Payment> paylist = eqPayment(p1_MerId);
		Payment pay = paylist.get(0);
		String key = pay.getStr("key");
		String hmacs = DigestUtil.getHmac(new String[] { formatString(p0_Cmd),
				formatString(p1_MerId), formatString(p2_Order),
				formatString(p3_Amt), formatString(p4_verifyAmt),
				formatString(p5_Pid), formatString(p6_Pcat),
				formatString(p7_Pdesc), formatString(p8_Url),
				formatString(pa_MP), formatString(pa7_cardAmt),
				formatString(pa8_cardNo), formatString(pa9_cardPwd),
				formatString(pd_FrpId), formatString(pr_NeedResponse),
				formatString(pz_userId), formatString(pz1_userRegTime) }, key);
		if (hmac.equals(hmacs)) {
			boo = true;
		}
		return boo;
	}

	public CardOrder HandCard(CardOrder cardOrder, String basePath) {
		int r1_Code = 0;
		String pa7_cardAmt = cardOrder.getStr("pa7_cardAmt");
		String pa8_cardNo = cardOrder.getStr("pa8_cardNo");
		String pa9_cardPwd = cardOrder.getStr("pa9_cardPwd");
		String[] cardAmt = pa7_cardAmt.split(",");
		String[] cardno = pa8_cardNo.split(",");
		String[] cardpass = pa9_cardPwd.split(",");
		if (cardno.length == cardpass.length && cardAmt.length == cardno.length
				&& cardAmt.length == cardpass.length) {
			if (cardno.length > 10 && cardpass.length > 10
					&& cardAmt.length > 10) {
				cardOrder.set("rq_ReturnMsg", "卡数量过多，目前最多支持10张卡");
				r1_Code = 5;
			} else {
				XmlStringParse xml = null;
				try {
					PersonGateway pergetGateway = PersonGateway.dao.findById(cardOrder.getStr("p1_MerId"));
					Gateway gateway = Gateway.dao.findById(pergetGateway.getInt("gateway_id"));

					String keyValue = gateway.getStr("gateway_key");
			        String sbOld = "";
			        sbOld += "ChargeCardDirect" + cardOrder.getStr("p1_MerId") + cardOrder.getStr("p2_Order") + cardOrder.getStr("p3_Amt") + cardOrder.getStr("p4_verifyAmt")
			        		+ cardOrder.getStr("p5_Pid") + cardOrder.getStr("p6_Pcat");
			        sbOld += cardOrder.getStr("p7_Pdesc") + cardOrder.getStr("p8_Url") + cardOrder.getStr("pa_MP") + pa7_cardAmt + pa8_cardNo + pa9_cardPwd;
			        sbOld += cardOrder.getStr("pd_FrpId") + cardOrder.getStr("pr_NeedResponse") + cardOrder.getStr("pz_userId") + cardOrder.getStr("pz1_userRegTime");
			        String hmac = DigestUtil.hmacSign(sbOld, keyValue);
					HttpClient hClient = new HttpClient();
					HttpConnectionManagerParams managerParams = hClient
							.getHttpConnectionManager().getParams();
					// 设置连接超时时间(单位毫秒)
					managerParams.setConnectionTimeout(1110000);
					// 设置读数据超时时间(单位毫秒)
					managerParams.setSoTimeout(3011000);
					PostMethod post = null;
					String rcvard = "http://www.101ka.com/GateWay/Card/Default.aspx";
					post = new PostMethod(rcvard);
					NameValuePair[] nvp = { new NameValuePair("p0_Cmd", "ChargeCardDirect"),
							new NameValuePair("p1_MerId",  cardOrder.getStr("p1_MerId")),
							new NameValuePair("p2_Order", cardOrder.getStr("p2_Order")),
							new NameValuePair("p3_Amt", cardOrder.getStr("p3_Amt")),
							new NameValuePair("p4_verifyAmt", cardOrder.getStr("p4_verifyAmt")),
							new NameValuePair("p5_Pid", cardOrder.getStr("p5_Pid")),
							new NameValuePair("p6_Pcat", cardOrder.getStr("p6_Pcat")),
							new NameValuePair("p7_Pdesc", cardOrder.getStr("p7_Pdesc")),
							new NameValuePair("p8_Url", cardOrder.getStr("p8_Url")),
							new NameValuePair("pa_MP", cardOrder.getStr("pa_MP")),
							new NameValuePair("pa7_cardAmt", cardOrder.getStr("pa7_cardAmt")),
							new NameValuePair("pa8_cardNo", cardOrder.getStr("pa8_cardNo")),
							new NameValuePair("pa9_cardPwd", cardOrder.getStr("pa9_cardPwd")),
							new NameValuePair("pd_FrpId", cardOrder.getStr("pd_FrpId")),
							new NameValuePair("pr_NeedResponse", cardOrder.getStr("pr_NeedResponse")),
							new NameValuePair("pz_userId", cardOrder.getStr("pz_userId")),
							new NameValuePair("pz1_userRegTime", cardOrder.getStr("pz1_userRegTime")),
							new NameValuePair("hmac", hmac) };
					post.setRequestBody(nvp);
					post.setRequestHeader("Connection", "close");
					String returnStr = "";
					hClient.executeMethod(post);
					returnStr = post.getResponseBodyAsString();
					System.out.println("===="+returnStr);
					xml = new XmlStringParse(returnStr);
					String  r0_Cmd= xml.getParameter("r0_Cmd");
					String  r1_Code2= xml.getParameter("r1_Code");
					String  p1_MerId= xml.getParameter("p1_MerId");
					String  p2_Order= xml.getParameter("p2_Order");
					String  p3_Amt= xml.getParameter("p3_Amt");
					String  p4_FrpId= xml.getParameter("p4_FrpId");
					String  p5_CardNo= xml.getParameter("p5_CardNo");
					String  p6_confirmAmount= xml.getParameter("p6_confirmAmount");
					String  p7_realAmount= xml.getParameter("p7_realAmount");
					String  p8_cardStatus= xml.getParameter("p8_cardStatus");
					String  p9_MP= xml.getParameter("p9_MP");
					String  pb_BalanceAmt= xml.getParameter("pb_BalanceAmt");
					String pc_BalanceAct = xml.getParameter("pc_BalanceAct");
					String  nhmac= xml.getParameter("hmac");

			        String sbOld2 = "";
			        sbOld2 += r0_Cmd + r1_Code2 + p1_MerId + p2_Order + p3_Amt + p4_FrpId + p5_CardNo;
			        sbOld2 += p6_confirmAmount + p7_realAmount + p8_cardStatus + p9_MP + pb_BalanceAmt + pc_BalanceAct;
			        String nhmac11 = DigestUtil.hmacSign(sbOld2, keyValue);
			        if(nhmac.equals(nhmac11)){
			    		cardOrder.set("r1_Code", r1_Code);
			    		cardOrder.set("amount", new BigDecimal(p6_confirmAmount));
			    		cardOrder.set("deducted", 0);
			    		cardOrder.set("rq_ReturnMsg", "提交成功!");
			        }
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (HttpException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		} else {
			cardOrder.set("rq_ReturnMsg", "卡号密码为空或者数量不相等");
			r1_Code = 8002;
		}
		cardOrder.save();
		return cardOrder;
	}
	
	public void asynchronous(String r6_Order){
		try {
			for(int i=0; i<5; i++){
				String p6_confirmAmount = "";
				String p7_realAmount = "";
				String p8_cardStatus = "";
				String pb_BalanceAmt = "";
				String pc_BalanceAct = "";
				String r1_Code = "2";
				CardOrder order = CardOrder.dao.findById(r6_Order);
				List<SingleCard> singlist = SingleCard.dao.find("select * from singlecard s where orderid='"+r6_Order+"'");
				for(SingleCard sing : singlist){
					p7_realAmount += sing.getBigDecimal("value")+",";
					String result = sing.get("result");
					if(result.equals("2000")){
						//支付成功
						p8_cardStatus += 0+",";
					}else if(result.equals("2001")){
						//数据接收成功
						p8_cardStatus += 1+",";
					}else if(result.equals("2002")){
						//不支持该类卡或者该面值的卡
						p8_cardStatus += 1003+",";
					}else if(result.equals("2004")){
						//订单内容重复
						p8_cardStatus += 7+",";
					}else if(result.equals("2005")){
						//该卡密已经有被使用的记录
						p8_cardStatus += 2005+",";
					}else if(result.equals("2009")){
						//暂时停止该类卡或者该面值的卡交易
						p8_cardStatus += 1003+",";
					}else if(result.equals("2010")){
						//充值卡无效
						p8_cardStatus += 1006+",";
					}else if(result.equals("2011")){
						//支付成功,实际面值{0}元
						p8_cardStatus += 1+",";
					}else if(result.equals("2016")){
						//密码错误
						p8_cardStatus += 1004+",";
					}else if(result.equals("2018")){
						//余额不足
						p8_cardStatus += 1007+",";
					}else if(result.equals("2020")){
						//提交次数过多
						p8_cardStatus += 1002+",";
					}else{
						p8_cardStatus += 10000+",";
					}
					if(sing.get("result").equals("2000")){
						p6_confirmAmount += sing.getBigDecimal("value")+",";
					}else{
						pb_BalanceAmt += sing.getBigDecimal("value")+",";
						pc_BalanceAct += sing.getStr("cardno")+",";
					}
				}
				String[] p8_cardStatusarr = p8_cardStatus.split(",");
				for(String cardstat : p8_cardStatusarr){
				    if(cardstat.equals("0")){
				        r1_Code = "1";
				    }
				}
				Payment pay = Payment.dao.findById(order.getInt("p1_MerId"));
				String newHmac = DigestUtil.getHmac(new String[] {  order.getStr("p0_Cmd"), 
				        r1_Code,
						order.getInt("p1_MerId").toString(),
						order.getStr("p2_Order"),
						order.getBigDecimal("p3_Amt").toString(),
						order.getStr("pd_FrpId"),
						order.getStr("pa8_cardNo"),
					   	p6_confirmAmount,
					   	p7_realAmount,
					   	p8_cardStatus,
					   	order.getStr("pa_MP"),
					   	pb_BalanceAmt,
					   	pc_BalanceAct}, pay.getStr("key"));
				HttpClient hClient = new HttpClient();
				HttpConnectionManagerParams managerParams = hClient
						.getHttpConnectionManager().getParams();
				// 设置连接超时时间(单位毫秒)
				managerParams.setConnectionTimeout(1110000);
				// 设置读数据超时时间(单位毫秒)
				managerParams.setSoTimeout(3011000);
				PostMethod post = null;
				post = new PostMethod(order.getStr("p8_Url"));
				NameValuePair[] nvp = {
						new NameValuePair("r0_Cmd", order.getStr("p0_Cmd")),
						new NameValuePair("r1_Code", r1_Code),
						new NameValuePair("p1_MerId", order.getInt("p1_MerId").toString()),
						new NameValuePair("p2_Order", order.getStr("p2_Order")),
						new NameValuePair("p3_Amt", order.getBigDecimal("p3_Amt").toString()),
						new NameValuePair("p4_FrpId", order.getStr("pd_FrpId")),
						new NameValuePair("p5_CardNo", order.getStr("pa8_cardNo")),
						
						new NameValuePair("p6_confirmAmount", p6_confirmAmount),//确认金额组
						new NameValuePair("p7_realAmount", p7_realAmount),//实际金额组
						
						new NameValuePair("p8_cardStatus", p8_cardStatus),//卡状态组
						
						new NameValuePair("p9_MP", order.getStr("pa_MP")),
						
						new NameValuePair("pb_BalanceAmt", pb_BalanceAmt),//支付余额
						new NameValuePair("pc_BalanceAct", pc_BalanceAct),//余额卡号
						
						new NameValuePair("hmac", newHmac)
				};
				post.setRequestBody(nvp);
				post.setRequestHeader("Connection", "close");
				String returnStr = "";
				hClient.executeMethod(post);
				returnStr = post.getResponseBodyAsString();
				String[] re = returnStr.split("\n");
				boolean boo = false;
				for(String st:re){
					st = st.trim();
					if(st.toUpperCase().equals("SUCCESS")){
						order.set("success", 1);
						order.update();
						boo = true;
						break;
					}
				}
				if(boo){
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public XmlStringParse HanCard(String orderno, String retaction,
			String cardno, String cardpass, String cardcode) {
		XmlStringParse xml = null;
		try {
			System_interface systeminterface = System_interface.dao.findById(1);
			String usercode = systeminterface.getStr("system_interface_usercode");
			// String orderno = request.getParameter("orderno");
			String mode = "r";
			String version = "1.0";
			// String retaction = request.getParameter("retaction");
			String sign = "";
			String format = "xml";
			String md5key = systeminterface.getStr("system_interface_md5key");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSS");
			String datetime = sdf.format(new Date());
			// String cardno = request.getParameter("cardno");
			// String cardpass = request.getParameter("cardpass");
			// String cardcode = request.getParameter("cardcode");

			String md5src = usercode + mode + version + orderno + cardcode
					+ cardno + cardpass + retaction + datetime + format
					+ md5key;
			sign = EncodeUtils.testDigest(md5src);

			usercode = RSA.encrypt(usercode, "gbk");
			cardpass = RSA.encrypt(cardpass, "gbk");
			HttpClient hClient = new HttpClient();
			HttpConnectionManagerParams managerParams = hClient
					.getHttpConnectionManager().getParams();
			// 设置连接超时时间(单位毫秒)
			managerParams.setConnectionTimeout(1110000);
			// 设置读数据超时时间(单位毫秒)
			managerParams.setSoTimeout(3011000);
			PostMethod post = null;
			String rcvard = "http://www.101ka.com/GateWay/Card/Default.aspx";
			post = new PostMethod(rcvard);
			NameValuePair[] nvp = { new NameValuePair("mode", mode),
					new NameValuePair("version", version),
					new NameValuePair("usercode", usercode),
					new NameValuePair("orderno", orderno),
					new NameValuePair("cardcode", cardcode),
					new NameValuePair("cardno", cardno),
					new NameValuePair("cardpass", cardpass),
					new NameValuePair("retaction", retaction),
					new NameValuePair("format", format),
					new NameValuePair("datetime", datetime),
					new NameValuePair("sign", sign) };
			post.setRequestBody(nvp);
			post.setRequestHeader("Connection", "close");
			String returnStr = "";
			hClient.executeMethod(post);
			returnStr = post.getResponseBodyAsString();
			System.out.println("提交收卡支付返回:" + returnStr);
			xml = new XmlStringParse(returnStr);
			String retusercode = xml.getParameter("usercode");
			String retmode = xml.getParameter("mode");
			String retversion = xml.getParameter("version");
			String retorderno = xml.getParameter("orderno");
			String retbillid = xml.getParameter("billid");
			String retcardcode = xml.getParameter("cardcode");
			String retcardno = xml.getParameter("cardno");
			String retretaction = xml.getParameter("retaction");
			String retresult = xml.getParameter("result");
			String retinfo = xml.getParameter("info");
			String retdatetime = xml.getParameter("datetime");
			String retsign = xml.getParameter("sign");
			// request.setAttribute("result",retresult);
			// request.setAttribute("usercode", retusercode);
			// request.setAttribute("orderno", retorderno);
			// request.setAttribute("billid", retbillid);
			// request.setAttribute("retaction", retretaction);
			// request.setAttribute("info", retinfo);
			// request.setAttribute("datetime", retdatetime);

			md5src = retusercode + retmode + retversion + retorderno
					+ retbillid + retcardcode + retcardno + retretaction
					+ retresult + retinfo + retdatetime;
			// MD5check
			if (!retsign.equals(EncodeUtils.testDigest(md5src + md5key))) {
				System.out.println("加密验证失败");
			}
			post.releaseConnection();
			post = null;
			hClient = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xml;
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
}
