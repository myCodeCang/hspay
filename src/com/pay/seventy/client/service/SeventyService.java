package com.pay.seventy.client.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.lang.math.NumberUtils;

import com.alibaba.common.lang.StringUtil;
import com.pay.cardyee.server.util.EncodeUtils;
import com.pay.seventy.client.dao.SeventyDao;
import com.pay.yeepay.server.DigestUtil;
import com.tool.CryptTool;
import com.vo.CardCode;
import com.vo.CardOrder;
import com.vo.Gateway;
import com.vo.Payment;
import com.vo.PersonGateway;
import com.vo.SingleCard;

/**
 * Java版加密 //IV=YzchCard //public static String encrypt(String password, String
 * key,String iv) throws Exception{ //byte[] sourcebyte
 * =password.getBytes("US-ASCII"); //byte[] keybyte = key.getBytes("US-ASCII");
 * //DESKeySpec dks = new DESKeySpec(keybyte); //SecretKeyFactory keyFactory =
 * SecretKeyFactory.getInstance(DES); //SecretKey securekey =
 * keyFactory.generateSecret(dks); //Cipher cipher =
 * Cipher.getInstance("DES/CBC/PKCS5Padding"); //IvParameterSpec ivs = new
 * IvParameterSpec(iv.getBytes("US-ASCII")); //cipher.init(Cipher.ENCRYPT_MODE,
 * securekey, ivs); //return new
 * String(Base64.encode(cipher.doFinal(sourcebyte))); //}
 * 如果encpwd=0，字符串不用加密，如果encpwd=1，加密串必须加入cardpwdenc=503c2a33
 * 
 * @author Administrator
 * 
 */
public class SeventyService extends SeventyDao {

	public static SeventyService service = new SeventyService();

	public boolean equCard(int userid, String orderno, String typeid, String cardno, String cardpwd, String url,
			String money, String mdkey, String encpwd, String signs) {
		String cardpwdenc = "";
		if (StringUtil.equals(encpwd, "1")){
			PersonGateway pergetGateway = PersonGateway.dao.findById(userid);
			Gateway gateway = Gateway.dao.findById(pergetGateway.getInt("card_id"));
			String channelid = gateway.getStr("gateway_channelid"); 
			cardpwdenc = String.valueOf(channelid);
		}
		String md5src = "userid=" + userid + "&orderno=" + orderno + "&typeid=" + typeid + "&cardno=" + cardno
				+ "&encpwd=" + encpwd + "&cardpwd=" + cardpwd + "&cardpwdenc=" + cardpwdenc + "&money=" + money
				+ "&url=" + url + "&keyvalue=" + mdkey;
		String sign = EncodeUtils.testDigest(md5src);
		return StringUtil.equals(sign.toUpperCase(), signs.toUpperCase());
	}

	public CardOrder HandCard(CardOrder cardOrder,String usercode, String keyValue, String basePath) {
		int r1_Code = 0;
		String cardcode = cardOrder.getStr("pd_FrpId");
		String cardAmt = cardOrder.getStr("pa7_cardAmt");
		String cardno = cardOrder.getStr("pa8_cardNo");
		String cardpass = cardOrder.getStr("pa9_cardPwd");
		String amount = cardOrder.getStr("p3_Amt");
		if (StringUtil.isNotBlank(cardcode) && StringUtil.isNotBlank(cardAmt) && StringUtil.isNotBlank(cardno)
				&& StringUtil.isNotBlank(cardpass)) {
			SingleCard singcard = new SingleCard();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
			String orderid = "C" + sdf.format(new Date()) + CryptTool.getPasswordOfNumber(3)
					+ cardOrder.getStr("p1_MerId");
			CardCode ccode=CardCode.dao.getParticipate(cardcode);
			Map<String, String> map = SeventyCard(usercode, keyValue,orderid, ccode.getStr("seventy_participate"), cardno, cardpass, basePath
					+ "/seventypay/callbackOrder/", cardAmt);
			singcard.set("orderid", cardOrder.get("orderid"));
			singcard.set("orderno", orderid);
			singcard.set("cardcode", cardcode);
			singcard.set("cardno", cardno);
			singcard.set("cardpass", cardpass);
			singcard.set("sign", map.get("sign"));
			singcard.set("billid", orderid);
			singcard.set("result", StringUtil.equals(map.get("returncode"), "1")?"2001":map.get("errtype"));
			singcard.set("info", map.get("message"));
			singcard.set("value", cardAmt);
			singcard.set("xml", map.get("result"));
			singcard.save();
			r1_Code=NumberUtils.toInt(map.get("returncode"),0);
			cardOrder.set("rq_ReturnMsg", map.get("message"));
		} else {
			cardOrder.set("rq_ReturnMsg", "卡号、密码等参数错误");
			r1_Code = 8002;
		}
		cardOrder.set("r1_Code", r1_Code);
		cardOrder.set("amount", 0);
		cardOrder.set("p3_Amt", amount);
		cardOrder.set("p4_verifyAmt", 0);
		cardOrder.set("deducted", 0);
		cardOrder.save();
		return cardOrder;
	}

	public void asynchronous(String r6_Order) {
		try {
			for (int i = 0; i < 5; i++) {
				String p6_confirmAmount = "";
				String p7_realAmount = "";
				String p8_cardStatus = "";
				String pb_BalanceAmt = "";
				String pc_BalanceAct = "";
				String r1_Code = "2";
				CardOrder order = CardOrder.dao.findById(r6_Order);
				List<SingleCard> singlist = SingleCard.dao.find("select * from singlecard s where orderid='" + r6_Order
						+ "'");
				for (SingleCard sing : singlist) {
					p7_realAmount += sing.getBigDecimal("value") + ",";
					String result = sing.get("result");
					if (result.equals("2000")) {
						// 支付成功
						p8_cardStatus += 0 + ",";
					} else if (result.equals("2001")) {
						// 数据接收成功
						p8_cardStatus += 1 + ",";
					} else if (result.equals("2002")) {
						// 不支持该类卡或者该面值的卡
						p8_cardStatus += 1003 + ",";
					} else if (result.equals("2004")) {
						// 订单内容重复
						p8_cardStatus += 7 + ",";
					} else if (result.equals("2005")) {
						// 该卡密已经有被使用的记录
						p8_cardStatus += 2005 + ",";
					} else if (result.equals("2009")) {
						// 暂时停止该类卡或者该面值的卡交易
						p8_cardStatus += 1003 + ",";
					} else if (result.equals("2010")) {
						// 充值卡无效
						p8_cardStatus += 1006 + ",";
					} else if (result.equals("2011")) {
						// 支付成功,实际面值{0}元
						p8_cardStatus += 1 + ",";
					} else if (result.equals("2016")) {
						// 密码错误
						p8_cardStatus += 1004 + ",";
					} else if (result.equals("2018")) {
						// 余额不足
						p8_cardStatus += 1007 + ",";
					} else if (result.equals("2020")) {
						// 提交次数过多
						p8_cardStatus += 1002 + ",";
					} else {
						p8_cardStatus += 10000 + ",";
					}
					if (sing.get("result").equals("2000")) {
						p6_confirmAmount += sing.getBigDecimal("value") + ",";
					} else {
						pb_BalanceAmt += sing.getBigDecimal("value") + ",";
						pc_BalanceAct += sing.getStr("cardno") + ",";
					}
				}
				String[] p8_cardStatusarr = p8_cardStatus.split(",");
				for (String cardstat : p8_cardStatusarr) {
					if (cardstat.equals("0")) {
						r1_Code = "1";
					}
				}
				Payment pay = Payment.dao.findById(order.getInt("p1_MerId"));
				String newHmac = DigestUtil
						.getHmac(
								new String[] { order.getStr("p0_Cmd"), r1_Code, order.getInt("p1_MerId").toString(),
										order.getStr("p2_Order"), order.getBigDecimal("p3_Amt").toString(),
										order.getStr("pd_FrpId"), order.getStr("pa8_cardNo"), p6_confirmAmount,
										p7_realAmount, p8_cardStatus, order.getStr("pa_MP"), pb_BalanceAmt,
										pc_BalanceAct }, pay.getStr("key"));
				HttpClient hClient = new HttpClient();
				HttpConnectionManagerParams managerParams = hClient.getHttpConnectionManager().getParams();
				// 设置连接超时时间(单位毫秒)
				managerParams.setConnectionTimeout(1110000);
				// 设置读数据超时时间(单位毫秒)
				managerParams.setSoTimeout(3011000);
				PostMethod post = null;
				post = new PostMethod(order.getStr("p8_Url"));
				NameValuePair[] nvp = { new NameValuePair("r0_Cmd", order.getStr("p0_Cmd")),
						new NameValuePair("r1_Code", r1_Code),
						new NameValuePair("p1_MerId", order.getInt("p1_MerId").toString()),
						new NameValuePair("p2_Order", order.getStr("p2_Order")),
						new NameValuePair("p3_Amt", order.getBigDecimal("p3_Amt").toString()),
						new NameValuePair("p4_FrpId", order.getStr("pd_FrpId")),
						new NameValuePair("p5_CardNo", order.getStr("pa8_cardNo")),

						new NameValuePair("p6_confirmAmount", p6_confirmAmount),// 确认金额组
						new NameValuePair("p7_realAmount", p7_realAmount),// 实际金额组

						new NameValuePair("p8_cardStatus", p8_cardStatus),// 卡状态组

						new NameValuePair("p9_MP", order.getStr("pa_MP")),

						new NameValuePair("pb_BalanceAmt", pb_BalanceAmt),// 支付余额
						new NameValuePair("pc_BalanceAct", pc_BalanceAct),// 余额卡号

						new NameValuePair("hmac", newHmac) };
				post.setRequestBody(nvp);
				post.setRequestHeader("Connection", "close");
				String returnStr = "";
				hClient.executeMethod(post);
				returnStr = post.getResponseBodyAsString();
				String[] re = returnStr.split("\n");
				boolean boo = false;
				for (String st : re) {
					st = st.trim();
					if (st.toUpperCase().equals("SUCCESS")) {
						order.set("success", 1);
						order.update();
						boo = true;
						break;
					}
				}
				if (boo) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 提交售卡请求
	 * http://tong.yzch.net/sale.ashx?userid={}&orderno={}&typeid={}&cardno={}&
	 * encpwd
	 * ={}&cardpwd={}&cardpwdenc={}&money={}&url={}&sign={}&ext={}&appname=
	 * {}&ip={}
	 * 
	 * @param orderno
	 * @param typeid
	 * @param cardno
	 * @param cardpass
	 * @param cardcode
	 * @return
	 */
	public Map<String, String> SeventyCard(String usercode, String keyValue,String orderno, String typeid, String cardno, String cardpwd, String url,
			String money) {
		Map<String, String> map = null;
		try {
			String mode = "r";
			String version = "1.0";
			String sign = "";
			String encpwd = "0";
			String cardpwdenc = "";

			String md5src = "userid=" + usercode + "&orderno=" + orderno + "&typeid=" + typeid + "&cardno=" + cardno
					+ "&encpwd=" + encpwd + "&cardpwd=" + cardpwd + "&cardpwdenc=" + cardpwdenc + "&money=" + money
					+ "&url=" + url + "&keyvalue=" + keyValue;
			sign = EncodeUtils.testDigest(md5src);
			HttpClient hClient = new HttpClient();
			HttpConnectionManagerParams managerParams = hClient.getHttpConnectionManager().getParams();
			// 设置连接超时时间(单位毫秒)
			managerParams.setConnectionTimeout(1110000);
			// 设置读数据超时时间(单位毫秒)
			managerParams.setSoTimeout(3011000);
			PostMethod post = null;
			String rcvard = "http://tong.yzch.net/sale.ashx";
			post = new PostMethod(rcvard);
			NameValuePair[] nvp = { new NameValuePair("mode", mode), new NameValuePair("version", version),
					new NameValuePair("userid", usercode), new NameValuePair("orderno", orderno),
					new NameValuePair("typeid", typeid), new NameValuePair("cardno", cardno),
					new NameValuePair("encpwd", encpwd), new NameValuePair("cardpwd", cardpwd),
					new NameValuePair("cardpwdenc", cardpwdenc), new NameValuePair("money", money),
					new NameValuePair("url", url), new NameValuePair("sign", sign), new NameValuePair("ext", ""),
					new NameValuePair("appname", ""), new NameValuePair("ip", "") };
			post.setRequestBody(nvp);
			post.setRequestHeader("Connection", "close");
			String returnStr = "";
			hClient.executeMethod(post);
			returnStr = post.getResponseBodyAsString();
			System.out.println("提交收卡支付返回:" + returnStr);
			String[] str = returnStr.split("&");
			map = new HashMap<String, String>();
			map.put("result", returnStr);
			map.put("sign", sign);
			for (String s : str) {
				String[] s1 = s.split("=");
				map.put(s1[0], s1[1]);
			}
			post.releaseConnection();
			post = null;
			hClient = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
}
