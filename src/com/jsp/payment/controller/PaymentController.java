package com.jsp.payment.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import com.alibaba.common.lang.StringUtil;
import com.interceptor.LoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jsp.exchange.service.ExchangeService;
import com.jsp.payment.service.PaymentService;
import com.jsp.payment.service.PaymentTimer;
import com.pay.alipay.client.service.AlipayService;
import com.pay.alipay.server.config.AlipayConfig;
import com.pay.allinpay.client.service.AllinpayService;
import com.pay.baopay.client.service.BaopayService;
import com.pay.caifutong.client.service.CaiFuTongService;
import com.pay.cardyee.client.service.CardyeeService;
import com.pay.cardyee.server.XmlStringParse;
import com.pay.dinpay.client.serivce.DinpayService;
import com.pay.ease.client.service.EaseService;
import com.pay.ecpss.client.service.EcpssService;
import com.pay.ecpss.server.MD5;
import com.pay.fastmoney.client.service.FastMoneyService;
import com.pay.gopay.client.service.GopayService;
import com.pay.gopay.server.GopayUtils;
import com.pay.hundred.client.service.HundredService;
import com.pay.ips.client.service.IpsService;
import com.pay.jdpay.client.service.JdpayService;
import com.pay.seventy.client.service.SeventyService;
import com.pay.shpay.client.service.ShpayService;
import com.pay.w95epay.client.service.W95epayService;
import com.pay.yeepay.client.service.YeepayService;
import com.pay.yeepay.client.service.yeepayTimer;
import com.pay.yeepay.server.Configuration;
import com.tool.CryptTool;
import com.vo.Caifutong;
import com.vo.CardCode;
import com.vo.Circlip;
import com.vo.Gateway;
import com.vo.Person;
import com.vo.PersonGateway;
import com.vo.Recharge;
import com.vo.SeventyCard;
import com.vo.SeventyCode;
import com.vo.System_interface;

@Before(LoginInterceptor.class)
public class PaymentController extends Controller {
	public void index() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment1.jsp");
	}

	public void payment2() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment2.jsp");
	}

	public void payment3() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment3.jsp");
	}

	public void payment4() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment4.jsp");
	}

	public void payment5() {
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getPartici());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("rechordertotal",
				ExchangeService.exchangeService.getRechOrdertotal(
						person.getInt("id"), new Date()));
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment5.jsp");
	}

	public void payment6() {
		Person person = getSessionAttr("session");
		setAttr("seventycode", ExchangeService.exchangeService.getSeventyCode());
		setAttr("circordertotal",
				ExchangeService.exchangeService.getCircOrdertotal(
						person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/payment6.jsp");
	}

	public void reqpay() throws UnsupportedEncodingException {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		Person person = getSessionAttr("session");
		String p3_Amt = getPara("p3_Amt");
		String pd_FrpId = getPara("pd_FrpId");
		if (p3_Amt.equals("") && pd_FrpId.equals("")) {
			renderText("参数错误请重新充值");
		} else {
			PersonGateway pergetGateway = PersonGateway.dao.findById(person
					.getInt("id"));
			int gatewayId = 0;
			if ("weixin".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("weixin_id");
			} else if ("wxwap".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("wxwap_id");
			} else if ("alipay".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("alipay_id");
			} else if ("alipaywap".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("alipaywap_id");
			} else if ("tenpay".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("tenpay_id");
			} else if ("tenpaywap".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("tenpaywap_id");
			} else if ("qqwallet".equals(pd_FrpId)) {
				gatewayId = pergetGateway.getInt("qqwallet_id");
			} else {
				gatewayId = pergetGateway.getInt("gateway_id");
			}
			Gateway gateway = Gateway.dao.findById(gatewayId);
			String p1_MerId = gateway.getStr("gateway_merid");

			String channelId = gateway.getStr("gateway_channelid");
			String keyValue = gateway.getStr("gateway_key"); // 商家密钥
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
			String p2_Order = "RE" + sdf.format(new Date())
					+ CryptTool.getPasswordOfNumber(4) + person.get("id");
			String p5_Pid = "Recharge";
			String p6_Pcat = new String("充值".getBytes("GB2312"),"GBK");
			String p7_Pdesc = new String("充值".getBytes("GB2312"),"GBK");
			String p8_Url = basePath + "/payment/paymentReturn";
			String p9_SAF = "0";
			String pa_MP = new String("充值".getBytes("GB2312"),"GBK");
			int function = gateway.getInt("gateway_function");
			String hmac = "";
			if (function == 1) {
				hmac = YeepayService.service.getReqMd5HmacForOnlinePayment(
						"Buy", p1_MerId, p2_Order, p3_Amt, "CNY", p5_Pid,
						p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId,
						"1", keyValue);
			}
			Recharge recharge = new Recharge();
			recharge.set("rechargeid", p2_Order);
			recharge.set("ip", CryptTool.getIpAddr(getRequest()));
			recharge.set("p0_Cmd", "Buy");
			recharge.set("p1_MerId", person.getInt("id"));
			recharge.set("p2_Order", p2_Order);
			recharge.set("p3_Amt", p3_Amt);
			recharge.set("p4_Cur", "CNY");
			recharge.set("p5_Pid", p5_Pid);
			recharge.set("p6_Pcat", p6_Pcat);
			recharge.set("p7_Pdesc", p7_Pdesc);
			recharge.set("p8_Url", p8_Url);
			recharge.set("p9_SAF", p9_SAF);
			recharge.set("pa_MP", pa_MP);
			recharge.set("pd_FrpId", pd_FrpId);
			recharge.set("pr_NeedResponse", "1");
			recharge.set("hmac", hmac);
			recharge.set("CreateTime", new Date());
			recharge.set("success", 2);
			recharge.set("r1_Code", 2);
			recharge.set("lock", 1);
			recharge.save();

			// --------------------------------------------------------
			if (function == 1) {
				yibao(p1_MerId, keyValue, recharge);
			} else if (function == 2) {
				kuaiqian(p1_MerId, keyValue, recharge);
			} else if (function == 3) {
				baopay(p1_MerId, keyValue, recharge);
			} else if (function == 4) {
				caifutong(p1_MerId, keyValue, recharge);
			} else if (function == 5) {
				ailpay(p1_MerId, keyValue, recharge);
			} else if (function == 6) {
				dinpay(p1_MerId, keyValue, recharge);
			} else if (function == 7) {
				haofu(p1_MerId, keyValue, recharge);
			} else if (function == 8) {
				allinpay(p1_MerId, keyValue, recharge);
			} else if (function == 9) {
				ease(p1_MerId, keyValue, recharge);
			} else if (function == 10) {
				wapalipay(p1_MerId, keyValue, recharge);
			} else if (function == 12) {
				ecpss(p1_MerId, keyValue, recharge);
			} else if (function == 13) {
				baopaykuaijie(p1_MerId, keyValue, recharge);
			} else if (function == 14) {
				ips(p1_MerId, keyValue, recharge);
			} else if (function == 15) {
				w95epay(p1_MerId, keyValue, recharge);
			} else if (function == 16) {
				seventypay(p1_MerId, keyValue, recharge);
			} else if (function == 17) {
				hundred(p1_MerId, keyValue, recharge);
			} else if (function == 18) {
				shpay(p1_MerId, keyValue, recharge);
			} else if (function == 19) {
				jdpay(p1_MerId, channelId, keyValue, recharge);
			} else if (function == 20) {
				mzfpay(p1_MerId, keyValue, recharge);
			} else if (function == 21) {
				gopay(p1_MerId, channelId, keyValue, recharge);
			} else if (function == 22) {
				ddpay(p1_MerId, keyValue, recharge);
			} else if (function == 25) {
				ailpay2(p1_MerId, keyValue,channelId, recharge);
			} else {
				renderText("系统错误！");
			}
			// --------------------------------------------------------

		}
	}

	/**
	 * 支付宝新接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ailpay2(String p1_MerId, String keyValue,String alipayemail, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("notify_url", basePath + "/alipay2/notify_url");
		setAttr("return_url", basePath + "/alipay2/return_url");
		setAttr("partner", p1_MerId);
		setAttr("private_key", keyValue);
		setAttr("public_key", alipayemail);
		setAttr("out_trade_no", recharge.get("rechargeid"));
		setAttr("subject", formatString(recharge.getStr("p5_Pid")));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String defaultbank = AlipayService.service.getAlipayParticipate(pd_FrpId);
		setAttr("defaultbank", defaultbank);
		setAttr("total_fee", recharge.get("p3_Amt"));
		setAttr("exter_invoke_ip", recharge.get("ip"));
		setAttr("body", formatString(recharge.getStr("p7_Pdesc")));
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		if(defaultbank!=null && defaultbank.equals("alipaywap")) {
			renderJsp("/WEB-INF/pay/alipay2/alipaywap.jsp");
		}else
			renderJsp("/WEB-INF/pay/alipay2/alipayapi.jsp");
	}
	/**
	 * 多得宝接口
	 * @param p1_MerId
	 * @param keyValue
	 * @param recharge
	 */
	public void ddpay(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("merchant_code", p1_MerId);
		setAttr("notify_url", basePath + "/ddpay/paymentDinpayToMer");
		setAttr("order_amount", recharge.get("p3_Amt"));
		setAttr("order_no", recharge.get("rechargeid"));
		Date createtime = recharge.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		setAttr("order_time", sdf.format(createtime));
		setAttr("product_name", formatString(recharge.getStr("p5_Pid")));
		setAttr("return_url", basePath + "/ddpay/paymentDinpayToMer");
		setAttr("client_ip", recharge.get("ip"));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String bank_code = DinpayService.service.getDinpayParticipate(pd_FrpId);
		setAttr("bank_code", bank_code);
		setAttr("key", keyValue);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		if (bank_code.equals("weixin_scan") || bank_code.equals("alipay_scan")
				|| bank_code.equals("tenpay_scan")) {
			renderJsp("/WEB-INF/pay/ddpay/qrcode.jsp");
		} else
			renderJsp("/WEB-INF/pay/ddpay/MerDinpayUTF-8.jsp");
	}
	/**
	 * 国付宝接口
	 * 
	 * @param p1_MerId
	 *            商户ID
	 * @param channelId
	 *            国付宝转入账户
	 * @param keyValue
	 *            商户校验码
	 * @param recharge
	 */
	public void gopay(String p1_MerId, String channelId, String keyValue,
			Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		String nowTime = df.format(new Date());
		setAttr("version", "2.2");
		setAttr("charset", "2");
		setAttr("language", "1");
		setAttr("signType", "1");
		setAttr("tranCode", "8888");
		setAttr("merchantID", p1_MerId);
		setAttr("merOrderNum", recharge.get("rechargeid"));
		setAttr("tranAmt", recharge.get("p3_Amt"));
		setAttr("feeAmt", "1.00");
		setAttr("currencyType", "156");
		setAttr("frontMerUrl", basePath + "/gopay/payresult/");
		setAttr("backgroundMerUrl", basePath + "/gopay/paymentpayresult/");
		setAttr("tranDateTime", nowTime);
		setAttr("virCardNoIn", channelId);
		setAttr("tranIP", recharge.get("ip"));
		setAttr("isRepeatSubmit", "1");
		setAttr("goodsName", recharge.get("p5_Pid"));
		setAttr("goodsDetail", recharge.get("p7_Pdesc"));
		setAttr("merRemark1", recharge.get("pa_MP"));
		setAttr("merRemark2", "");
		String pd_FrpId = GopayService.service.getGopayParticipate(recharge
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，通道正在维护中！");
			return;
		}
		setAttr("bankCode", pd_FrpId);
		setAttr("userType", "1");
		setAttr("gopayServerTime", GopayUtils.getGopayServerTime());
		setAttr("VerficationCode", keyValue);
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "2000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/gopay/paysubmit.jsp");
	}

	/**
	 * 秒支付接口
	 * 
	 * @param p1_MerId
	 *            商户号
	 * @param keyValue
	 *            密钥
	 * @param recharge
	 */
	public void mzfpay(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		String nowTime = df.format(new Date());
		setAttr("keyValue", keyValue);
		setAttr("sendTime", nowTime);
		setAttr("p0_Cmd", recharge.get("p0_Cmd"));
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", recharge.get("rechargeid"));
		setAttr("p3_Amt", recharge.get("p3_Amt"));
		setAttr("p4_Cur", recharge.get("p4_Cur"));
		setAttr("p5_Pid", recharge.get("p5_Pid"));
		setAttr("p6_Pcat", recharge.get("p6_Pcat"));
		setAttr("p7_Pdesc", recharge.get("p7_Pdesc"));
		setAttr("p8_Url", basePath + "/mzfpay/paymentpayresult/");
		setAttr("pa_MP", recharge.get("pa_MP"));
		setAttr("pd_FrpId", recharge.get("pd_FrpId"));
		setAttr("pr_NeedResponse", recharge.get("pr_NeedResponse"));
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "2000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/mzfpay/paysubmit.jsp");
	}

	/**
	 * 吉店接口
	 * 
	 * @param p1_MerId
	 *            商户号
	 * @param channelId
	 *            通道号
	 * @param keyValue
	 *            密钥
	 * @param recharge
	 */
	public void jdpay(String p1_MerId, String channelId, String keyValue,
			Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		String nowTime = df.format(new Date());
		setAttr("merchantId", p1_MerId);
		setAttr("keyValue", keyValue);
		setAttr("channelId", channelId);
		setAttr("sendTime", nowTime);
		setAttr("terminalOs", "03");// 终端类型03：平台
		setAttr("orderId", recharge.get("rechargeid"));
		setAttr("goodsTitle", recharge.get("p5_Pid"));
		setAttr("goodsDesc", recharge.get("p7_Pdesc"));
		setAttr("transAmt", recharge.get("p3_Amt"));
		String pd_FrpId = JdpayService.service.getJdpayParticipate(recharge
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，通道暂时未开通！");
			return;
		}
		String[] str = pd_FrpId.split("_");
		setAttr("busType", str[0]);
		setAttr("txnSubType", str[1]);
		setAttr("payType", str[2]);
		setAttr("currency", "156");// 币种：CNY人民币
		setAttr("backUrl", basePath + "/jdpay/paymentpayresult/");
		setAttr("sendIp", recharge.get("ip"));
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "2000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/jdpay/paysubmit.jsp");
	}

	/**
	 * 山海接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void shpay(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("customerid", p1_MerId);
		setAttr("keyValue", keyValue);
		setAttr("superid", "100000");
		setAttr("sdcustomno", recharge.get("rechargeid"));
		setAttr("ordermoney", recharge.get("p3_Amt"));
		String pd_FrpId = ShpayService.service.getShpayParticipate(recharge
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，通道暂时未开通！");
			return;
		}
		setAttr("faceno", pd_FrpId);
		setAttr("noticeurl", basePath + "/shpay/payresult");
		setAttr("backurl", basePath + "/shpay/paymentpayresult");
		setAttr("endip", recharge.get("ip"));
		setAttr("remarks", recharge.get("p5_Pid"));
		setAttr("mark", recharge.get("p7_Pdesc"));
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		setAttr("endcustomer", pergate.get("id").toString());
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/51pay/paysubmit.jsp");
	}

	/**
	 * 101卡网银接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param recharge
	 */
	public void hundred(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("MerNo", p1_MerId);
		setAttr("keyValue", keyValue);
		setAttr("BillNo", recharge.get("rechargeid"));
		setAttr("Amount", recharge.get("p3_Amt"));
		String pd_FrpId = HundredService.service.getHundredParticipate(recharge
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，通道暂时未开通！");
			return;
		}
		setAttr("PaymentType", pd_FrpId);
		String ReturnURL = basePath + "/hundredy/payresult";
		setAttr("ReturnURL", ReturnURL);
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/hundred/paysubmit.jsp");
	}

	/**
	 * 双乾接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void w95epay(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("MerNo", p1_MerId);
		setAttr("MD5key", keyValue);
		setAttr("BillNo", recharge.get("rechargeid"));
		setAttr("Amount", recharge.get("p3_Amt"));
		String pd_FrpId = W95epayService.service.getW95epayParticipate(recharge
				.getStr("pd_FrpId"));
		setAttr("PaymentType", pd_FrpId);
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String ReturnURL = httpurl + "/w95epay/payresult";
		setAttr("ReturnURL", ReturnURL);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/95epay/paysubmit.jsp");
	}

	/**
	 * 环迅接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param recharge
	 */
	public void ips(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("Mer_code", p1_MerId);
		setAttr("Mer_key", keyValue);
		setAttr("Billno", recharge.get("rechargeid"));
		setAttr("Amount", recharge.get("p3_Amt"));
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		setAttr("Date", format.format(new Date()));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String Merchanturl = httpurl + "/ips/paymentMerchanturl";
		setAttr("Merchanturl", Merchanturl);
		setAttr("FailUrl", Merchanturl);
		String ServerUrl = httpurl + "/ips/paymentServerUrl";
		setAttr("ServerUrl", ServerUrl);
		String pd_FrpId = IpsService.service.getIpsParticipate(recharge
				.getStr("pd_FrpId"));
		String Bankco = IpsService.service.getbankebh(p1_MerId, keyValue,
				pd_FrpId);
		setAttr("Bankco", Bankco);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/ips/redirect.jsp");
	}

	/**
	 * 70卡支付接口
	 * 
	 * @param p1_MerId
	 *            商户号
	 * @param keyValue
	 *            密钥
	 * @param recharge
	 */
	public void seventypay(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("keyvalue", keyValue);
		setAttr("userid", p1_MerId);
		setAttr("orderid", recharge.get("rechargeid"));
		setAttr("money", recharge.get("p3_Amt"));
		setAttr("ext", recharge.get("p5_Pid"));
		setAttr("url", basePath + "/seventypay/paymentpayresult/");
		String pd_FrpId = SeventyService.service.getSeventyParticipate(recharge
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，70卡["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("bankid", pd_FrpId);
		String id = recharge.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "2000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/seventypay/paysubmit.jsp");
	}
	/**
	 * 汇潮支付接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ecpss(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("MerNo", p1_MerId);
		setAttr("BillNo", recharge.get("rechargeid"));
		setAttr("Amount", recharge.get("p3_Amt"));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String ReturnURL = httpurl + "/ecpss/paymentReturnURL";
		setAttr("ReturnURL", ReturnURL);
		setAttr("AdviceURL", httpurl + "/ecpss/paymentAdviceURL");
		String md5Str = p1_MerId + "&" + recharge.get("rechargeid") + "&"
				+ recharge.get("p3_Amt") + "&" + ReturnURL + "&" + keyValue;
		MD5 md5 = new MD5();
		setAttr("SignInfo", md5.getMD5ofStr(md5Str).toUpperCase());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		setAttr("orderTime", format.format(new Date()));
		String pd_FrpId = EcpssService.service.getEcpssParticipate(recharge
				.getStr("pd_FrpId"));
		setAttr("defaultBankNumber", pd_FrpId);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/ecpss/send.jsp");
	}

	/**
	 * 支付宝手机接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void wapalipay(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("out_trade_no", recharge.get("rechargeid"));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("notify_url", httpurl + "/wapalipay/paymentnotify_url");
		setAttr("call_back_url", httpurl + "/wapalipay/paymentcall_back_url");
		String alipayemail = Configuration.getInstance()
				.getValue("alipayemail");
		setAttr("seller_email", alipayemail);
		setAttr("total_fee", recharge.get("p3_Amt"));
		com.pay.wapalipay.server.config.AlipayConfig.partner = p1_MerId;
		com.pay.wapalipay.server.config.AlipayConfig.key = keyValue;
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/wapalipay/alipayapi.jsp");
	}

	/**
	 * 首信易接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param recharge
	 */
	public void ease(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("v_mid", p1_MerId);
		setAttr("v_oid", recharge.get("rechargeid"));
		setAttr("v_amount", recharge.get("p3_Amt"));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("v_url", httpurl + "/ease/paymentreceived1");
		setAttr("MD5Key", keyValue);
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String v_pmode = EaseService.service.getEaseParticipate(pd_FrpId);
		setAttr("v_pmode", v_pmode);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/ease/send.jsp");
	}

	/**
	 * 通联接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void allinpay(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("key", keyValue);
		setAttr("merchantId", p1_MerId);
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("pickupUrl", httpurl + "/allinpay/paymentpickupUrl");
		setAttr("receiveUrl", httpurl + "/allinpay/paymentreceiveUrl");
		setAttr("orderNo", recharge.get("rechargeid"));
		String orderAmount = (new BigDecimal((String) recharge.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (orderAmount.indexOf(".") > 0) {
			orderAmount = orderAmount.replaceAll("0+?$", "");// 去掉多余的0
			orderAmount = orderAmount.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		setAttr("orderAmount", orderAmount);
		Date createtime = recharge.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		setAttr("orderDatetime", sdf.format(createtime));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String issuerId = AllinpayService.service
				.getAllinpayParticipate(pd_FrpId);
		setAttr("issuerId", issuerId);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/allinpay/post.jsp");
	}

	public void haofu(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("p0_Cmd", "Buy");
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", recharge.get("rechargeid"));
		setAttr("p3_Amt", recharge.get("p3_Amt"));
		setAttr("pd_FrpId", recharge.get("pd_FrpId"));
		setAttr("p4_Cur", "CNY");
		setAttr("p5_Pid", recharge.get("p5_Pid"));
		setAttr("p6_Pcat", recharge.get("p6_Pcat"));
		setAttr("p7_Pdesc", recharge.get("p7_Pdesc"));
		setAttr("p8_Url", basePath + "/payment/haofupaymentReturn");
		setAttr("p9_SAF", recharge.get("p9_SAF"));
		setAttr("pa_MP", recharge.get("pa_MP"));
		setAttr("pr_NeedResponse", "1");
		setAttr("nodeAuthorizationURL", "http://www.haofpay.com/hspay/node");
		String hmac = YeepayService.service.getReqMd5HmacForOnlinePayment(
				"Buy", p1_MerId, recharge.getStr("rechargeid"),
				recharge.getStr("p3_Amt"), "CNY", recharge.getStr("p5_Pid"),
				recharge.getStr("p6_Pcat"), recharge.getStr("p7_Pdesc"),
				basePath + "/payment/haofupaymentReturn",
				recharge.getStr("p9_SAF"), recharge.getStr("pa_MP"),
				recharge.getStr("pd_FrpId"), "1", keyValue);
		setAttr("hmac", hmac);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/yeepay/reqpay.jsp");
	}

	/**
	 * 智付接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void dinpay(String p1_MerId, String keyValue, Recharge recharge) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("merchant_code", p1_MerId);
		setAttr("notify_url", basePath + "/dinpay/paymentDinpayToMer");
		setAttr("order_amount", recharge.get("p3_Amt"));
		setAttr("order_no", recharge.get("rechargeid"));
		Date createtime = recharge.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		setAttr("order_time", sdf.format(createtime));
		setAttr("product_name", formatString(recharge.getStr("p5_Pid")));
		setAttr("return_url", basePath + "/dinpay/paymentDinpayToMer");
		setAttr("client_ip", recharge.get("ip"));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String bank_code = DinpayService.service.getDinpayParticipate(pd_FrpId);
		setAttr("bank_code", bank_code);
		setAttr("key", keyValue);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		if (bank_code.equals("weixin_scan") || bank_code.equals("alipay_scan")
				|| bank_code.equals("tenpay_scan")) {
			renderJsp("/WEB-INF/pay/dinpay/qrcode.jsp");
		} else
			renderJsp("/WEB-INF/pay/dinpay/MerDinpayUTF-8.jsp");
	}

	public void caifutong(String p1_MerId, String keyValue, Recharge recharge) {
		StringBuffer url = new StringBuffer();
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		url.append(httpurl + "/caifutong/splitPayRequest?");
		url.append("&key=" + keyValue);
		url.append("&bargainor_id=" + p1_MerId);
		url.append("&return_url=" + httpurl
				+ "/caifutong/paymentsplitPayResponse");
		url.append("&sp_billno=" + recharge.getStr("rechargeid"));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String bank_type = CaiFuTongService.service
				.getCaiFuParticipate(pd_FrpId);
		url.append("&bank_type=" + bank_type);
		url.append("&desc=" + recharge.get("p5_Pid"));
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		Caifutong caifutong = Caifutong.dao.findById(id);
		BigDecimal caifu_rate = caifutong.getBigDecimal("caifu_rate");
		BigDecimal total_fee = new BigDecimal((String) recharge.get("p3_Amt"));
		BigDecimal amt1 = total_fee.multiply(caifu_rate);
		BigDecimal amt2 = total_fee.subtract(amt1);
		String total_fees = total_fee.toString();
		if (total_fees.indexOf(".") > 0) {
			total_fees = total_fees.replaceAll("0+?$", "");// 去掉多余的0
			total_fees = total_fees.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&total_fee=" + total_fee);
		String amts1 = amt1.toString();
		if (amts1.indexOf(".") > 0) {
			amts1 = amts1.replaceAll("0+?$", "");// 去掉多余的0
			amts1 = amts1.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&amts1=" + amts1);
		String amts2 = amt2.toString();
		if (amts2.indexOf(".") > 0) {
			amts2 = amts2.replaceAll("0+?$", "");// 去掉多余的0
			amts2 = amts2.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&amts2=" + amts2);
		String caifutongemial = systeminterface
				.getStr("system_interface_caifutongemial");
		url.append("&caifutongemial=" + caifutongemial);
		url.append("&caifu_account=" + caifutong.getStr("caifu_account"));
		url.append("&ip=" + recharge.getStr("ip"));
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		url.append("&title=" + title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		url.append("&titletime=" + titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		redirect(url.toString());
	}

	public void ailpay(String p1_MerId, String keyValue, Recharge recharge) {
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("notify_url", httpurl + "/alipay/paymentnotify_url");
		setAttr("return_url", httpurl + "/alipay/paymentreturn_url");
		AlipayConfig.partner = p1_MerId;
		AlipayConfig.key = keyValue;
		String seller_email = systeminterface
				.getStr("system_interface_alipayemail");
		setAttr("seller_email", seller_email);
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String defaultbank = AlipayService.service
				.getAlipayParticipate(pd_FrpId);
		setAttr("defaultbank", defaultbank);
		setAttr("out_trade_no", recharge.get("rechargeid"));
		setAttr("subject", formatString(recharge.getStr("p5_Pid")));
		setAttr("total_fee", recharge.get("p3_Amt"));
		setAttr("body", formatString(recharge.getStr("p7_Pdesc")));
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/alipay/alipayapi.jsp");
	}

	public void yibao(String p1_MerId, String keyValue, Recharge recharge) {
		setAttr("p0_Cmd", "Buy");
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", recharge.get("rechargeid"));
		setAttr("p3_Amt", recharge.get("p3_Amt"));
		setAttr("pd_FrpId", recharge.get("pd_FrpId"));
		setAttr("p4_Cur", "CNY");
		setAttr("p5_Pid", recharge.get("p5_Pid"));
		setAttr("p6_Pcat", recharge.get("p6_Pcat"));
		setAttr("p7_Pdesc", recharge.get("p7_Pdesc"));
		setAttr("p8_Url", recharge.get("p8_Url"));
		setAttr("p9_SAF", recharge.get("p9_SAF"));
		setAttr("pa_MP", recharge.get("pa_MP"));
		setAttr("pr_NeedResponse", "1");
		setAttr("nodeAuthorizationURL",
				"https://www.yeepay.com/app-merchant-proxy/node");
		setAttr("hmac", recharge.get("hmac"));
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/yeepay/reqpay.jsp");
	}

	public void kuaiqian(String merchantAcctId, String keyValue,
			Recharge recharge) {
		setAttr("merchantAcctId", merchantAcctId);
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("bgUrl", httpurl + "/payment/fastcallback");
		setAttr("orderId", recharge.get("rechargeid"));
		String orderamount = (new BigDecimal((String) recharge.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (orderamount.indexOf(".") > 0) {
			orderamount = orderamount.replaceAll("0+?$", "");// 去掉多余的0
			orderamount = orderamount.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		setAttr("orderAmount", orderamount);
		setAttr("productName", recharge.get("p5_Pid"));
		setAttr("productDesc", recharge.get("p7_Pdesc"));
		String pd_FrpId = recharge.getStr("pd_FrpId");
		String bankId = FastMoneyService.service.getFastParticipate(pd_FrpId);
		setAttr("bankId", bankId);
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		setAttr("title", title);
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/fastmoney/send.jsp");
	}

	public void baopay(String p1_MerId, String keyValue, Recharge recharge) {
		String PayID = BaopayService.service.getBaopayParticipate(recharge
				.getStr("pd_FrpId"));
		String OrderMoney = (new BigDecimal((String) recharge.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (OrderMoney.indexOf(".") > 0) {
			OrderMoney = OrderMoney.replaceAll("0+?$", "");// 去掉多余的0
			OrderMoney = OrderMoney.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		StringBuffer url = new StringBuffer();
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		url.append(httpurl + "/baopay/post");
		url.append("?MerchantID=" + p1_MerId + "&");
		url.append("PayID=" + PayID + "&");
		Date createtime = recharge.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		url.append("TradeDate=" + sdf.format(createtime) + "&");
		url.append("TransID=" + recharge.get("rechargeid") + "&");
		url.append("OrderMoney=" + OrderMoney + "&");
		url.append("ProductName=" + formatString(recharge.getStr("p5_Pid"))
				+ "&");
		url.append("AdditionalInfo=" + recharge.get("pa_MP") + "&");
		url.append("Merchant_url=" + httpurl + "/baopay/paymentbaomerchant&");
		url.append("Return_url=" + httpurl + "/baopay/paymentbaoreturn&");
		url.append("Md5key=" + keyValue + "&");
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		try {
			title = java.net.URLEncoder.encode(title, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url.append("title=" + title + "&");
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		url.append("titletime=" + titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		System.out.println(url.toString());
		redirect(url.toString());
	}

	public void baopaykuaijie(String p1_MerId, String keyValue,
			Recharge recharge) {
		String PayID = "1080";
		String OrderMoney = (new BigDecimal((String) recharge.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (OrderMoney.indexOf(".") > 0) {
			OrderMoney = OrderMoney.replaceAll("0+?$", "");// 去掉多余的0
			OrderMoney = OrderMoney.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		StringBuffer url = new StringBuffer();
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		url.append(httpurl + "/baopay/post");
		url.append("?MerchantID=" + p1_MerId + "&");
		url.append("PayID=" + PayID + "&");
		Date createtime = recharge.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		url.append("TradeDate=" + sdf.format(createtime) + "&");
		url.append("TransID=" + recharge.get("rechargeid") + "&");
		url.append("OrderMoney=" + OrderMoney + "&");
		url.append("ProductName=" + formatString(recharge.getStr("p5_Pid"))
				+ "&");
		url.append("AdditionalInfo=" + recharge.get("pa_MP") + "&");
		url.append("Merchant_url=" + httpurl + "/baopay/paymentbaomerchant&");
		url.append("Return_url=" + httpurl + "/baopay/paymentbaoreturn&");
		url.append("Md5key=" + keyValue + "&");
		Person person = getSessionAttr("session");
		int id = person.getInt("id");
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = pergate.get("title");
		if (title == null || title.equals("")) {
			title = "提交中。。。";
		}
		try {
			title = java.net.URLEncoder.encode(title, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url.append("title=" + title + "&");
		String titletime = pergate.get("titletime");
		if (titletime == null || titletime.equals("")) {
			titletime = "1000";
		}
		url.append("titletime=" + titletime);
		Timer timer = new Timer();
		timer.schedule(new PaymentTimer(recharge.getStr("rechargeid"), timer),
				15 * 60 * 1000);
		System.out.println(url.toString());
		redirect(url.toString());
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void paymentReturn() {
		renderJsp("/WEB-INF/pay/yeepay/paymentCallback.jsp");
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void haofupaymentReturn() {
		renderJsp("/WEB-INF/pay/haofu/paymentCallback.jsp");
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void showPayOk() {
		renderJsp("/WEB-INF/pay/yeepay/payok.jsp");
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void showPayNo() {
		renderJsp("/WEB-INF/pay/yeepay/payno.jsp");
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void fastcallback() {
		renderJsp("/WEB-INF/pay/fastmoney/paymentreceive.jsp");
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}

	public void getre() {
		String p3_Amt = getPara("p3_Amt");
		String pd_FrpId = getPara("pd_FrpId");
		String num = getPara("num");
		setAttr("num", num);
		setAttr("p3_Amt", p3_Amt);
		setAttr("pd_FrpId", pd_FrpId);
		renderJsp("/WEB-INF/pay/yeepay/recharge.jsp");
	}

	public void getRech() {
		int page = getParaToInt("rechpage");
		String rechstarttime = "";
		String rechendtime = "";
		String rechparticipate = "";
		String rechstate = "";
		String rechid = "";
		if (!getPara("rechstarttime").equals("")) {
			rechstarttime = getPara("rechstarttime");
		}
		if (!getPara("rechendtime").equals("")) {
			rechendtime = getPara("rechendtime");
		}
		if (!getPara("rechparticipate").equals("0")) {
			rechparticipate = getPara("rechparticipate");
		}
		if (!getPara("rechstate").equals("0")) {
			rechstate = getPara("rechstate");
		}
		if (!getPara("rechid").equals("")) {
			rechid = getPara("rechid");
		}
		Person per = getSessionAttr("session");
		Page<Recharge> orderPage = PaymentService.service.getRechOrder(
				per.getInt("id"), page, rechstarttime, rechendtime,
				rechparticipate, rechstate, rechid);
		List<Recharge> orderList = orderPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(orderPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}

	public void getCirc() {
		int page = getParaToInt("circpage");
		String circstarttime = "";
		String circendtime = "";
		String circparticipate = "";
		String circstate = "";
		String circid = "";
		if (!getPara("circstarttime").equals("")) {
			circstarttime = getPara("circstarttime");
		}
		if (!getPara("circendtime").equals("")) {
			circendtime = getPara("circendtime");
		}
		if (!getPara("circparticipate").equals("0")) {
			circparticipate = getPara("circparticipate");
		}
		if (!getPara("circstate").equals("0")) {
			circstate = getPara("circstate");
		}
		if (!getPara("circid").equals("")) {
			circid = getPara("circid");
		}
		Person per = getSessionAttr("session");
		Page<Circlip> orderPage = PaymentService.service.getCircOrder(
				per.getInt("id"), page, circstarttime, circendtime,
				circparticipate, circstate, circid);
		List<Circlip> orderList = orderPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(orderPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}

	public void circlip() {
		try {
			int cardid = getParaToInt("cardid");
			String amount = getPara("amount");
			if (amount != null) {
				String cardno = getPara("cardno");
				String cardpass = getPara("cardpass");
				if(StringUtil.isNotBlank(cardno)&& StringUtil.isNotBlank(cardpass)){
					String path = getRequest().getContextPath();
					String basePath = getRequest().getScheme() + "://"
							+ getRequest().getServerName() + ":"
							+ getRequest().getServerPort() + path;
					Person per = getSessionAttr("session");
					PersonGateway pergetGateway = PersonGateway.dao.findById(per.getInt("id"));
					Gateway gateway = Gateway.dao.findById(pergetGateway.getInt("card_id"));
	
					String memberId = gateway.getStr("gateway_merid");
					String keyValue = gateway.getStr("gateway_key");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
					String orderid = "CI" + sdf.format(new Date())
							+ CryptTool.getPasswordOfNumber(3) + per.get("id");
					Circlip circlip = new Circlip();
					int function = gateway.getInt("gateway_function");
					CardCode ccode = CardCode.dao.findById(cardid);
					if(function==11){
						String cardcode = ccode.getStr("participate");
						String cardcodes = cardcode + amount;
						String url=basePath + "/hscard/querCirclip";
						XmlStringParse xml = CardyeeService.service.HanCard(memberId, keyValue,orderid,
								url, cardno, cardpass, cardcodes);
						String result = xml.getParameter("result");
						circlip.set("result", result);
						circlip.set("info", xml.getParameter("info"));
						circlip.set("sign", xml.getParameter("sign"));
						circlip.set("billid", xml.getParameter("billid"));
						circlip.set("result", xml.getParameter("result"));
						circlip.set("xml", xml.getSrc());
					}else if (function==16){
						String url=basePath + "/seventypay/querCirclip";
						String cardcode = ccode.getStr("seventy_participate");
						Map<String, String> map = SeventyService.service.SeventyCard(memberId, keyValue,
								orderid, cardcode, cardno, cardpass, url, amount);
						circlip.set("cardcode", cardcode);
						circlip.set("result", StringUtil.equals(map.get("returncode"), "1")?"2001":map.get("errtype"));
						circlip.set("xml", map.get("result"));
						circlip.set("info", map.get("message"));
						circlip.set("sign", map.get("sign"));
					}
					circlip.set("circlipid", orderid);
					circlip.set("cardid", cardid);
					circlip.set("cardno", cardno);
					circlip.set("cardpass", cardpass);
					circlip.set("datetime", new Date());
					circlip.set("id", per.get("id"));
					circlip.set("amount", amount);
					circlip.save();
					renderJson("{\"info\":\"提交成功！\",\"status\":\"y\"}");
				}else{
					renderJson("{\"info\":\"提交失败，卡号与卡密不能为空！\",\"status\":\"n\"}");
				}
			} else {
				renderJson("{\"info\":\"提交失败，未选择金额！\",\"status\":\"n\"}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			renderJson("{\"info\":\"提交失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}

	public void seventyCard() {
		try {
			Person person = getSessionAttr("session");
			String url = getPara("url");
			int cardid = getParaToInt("cardid");
			String amount = getPara("amount");
			if (amount != null) {
				String cardno = getPara("cardno");
				String cardpass = getPara("cardpass");
				Person per = getSessionAttr("session");
				PersonGateway pergetGateway = PersonGateway.dao
						.findById(per.getInt("id"));
				Gateway gateway = Gateway.dao.findById(pergetGateway.getInt("card_id"));

				String memberId = gateway.getStr("gateway_merid");
				String keyValue = gateway.getStr("gateway_key");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMSSmmm");
				String orderid = "CI" + sdf.format(new Date())
						+ CryptTool.getPasswordOfNumber(3) + per.get("id");
				String cardcode = SeventyCode.dao.findById(cardid).getStr(
						"participate");
				SeventyCard circlip = new SeventyCard();
				Map<String, String> map = SeventyService.service.SeventyCard(memberId, keyValue,
						orderid, cardcode, cardno, cardpass, url, amount);
				if (map != null) {
					if (map.get("returncode").equals("1")) {
						circlip.set("id", orderid);
						circlip.set("cardid", cardid);
						circlip.set("cardcode", cardcode);
						circlip.set("cardno", cardno);
						circlip.set("cardpass", cardpass);
						circlip.set("datetime", new Date());
						circlip.set("xml", map.get("result"));
						circlip.set("result", map.get("errtype"));
						circlip.set("info", map.get("message"));
						circlip.set("amount", amount);
						circlip.set("sign", map.get("sign"));
						circlip.set("memberid", person.getId());
						circlip.save();
						renderJson("{\"info\":\"提交成功！\",\"status\":\"y\"}");
					} else {
						renderJson("{\"info\":\"" + map.get("message")
								+ "\",\"status\":\"n\"}");
					}
				} else {
					renderJson("{\"info\":\"提交到服务器，未返回值！\",\"status\":\"n\"}");
				}
			} else {
				renderJson("{\"info\":\"提交失败，未选择金额！\",\"status\":\"n\"}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			renderJson("{\"info\":\"提交失败！\",\"status\":\"n\"}");
			e.printStackTrace();
		}
	}

}