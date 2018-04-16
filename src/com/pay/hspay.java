package com.pay;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

import org.apache.commons.lang.math.NumberUtils;

import com.alibaba.common.lang.StringUtil;
import com.jfinal.core.Controller;
import com.pay.alipay.client.service.AlipayService;
import com.pay.alipay.server.config.AlipayConfig;
import com.pay.allinpay.client.service.AllinpayService;
import com.pay.baopay.client.service.BaopayService;
import com.pay.caifutong.client.service.CaiFuTongService;
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
import com.pay.yeepay.client.service.YeepayThread;
import com.pay.yeepay.client.service.yeepayTimer;
import com.pay.yeepay.server.Configuration;
import com.pay.ysspay.client.service.YsspayService;
import com.pay.ysspay.server.MoboConfig;
import com.pay.zhipay.client.service.ZhipayService;
import com.tool.CryptTool;
import com.vo.Caifutong;
import com.vo.Gateway;
import com.vo.Order;
import com.vo.Person;
import com.vo.PersonGateway;
import com.vo.System_interface;

public class hspay extends Controller {

	public void node() {
		try {
			getRequest().setCharacterEncoding("GBK");
			int pd = NumberUtils.toInt(getPara("pd"), 0);
			String p0_Cmd = getPara("p0_Cmd");
			int p1_MerId = NumberUtils.toInt(getPara("p1_MerId"), 0);
			String p2_Order = getPara("p2_Order");
			String p3_Amt = getPara("p3_Amt");
			String p4_Cur = getPara("p4_Cur");
			String p5_Pid = getPara("p5_Pid");
			String p6_Pcat = getPara("p6_Pcat");
			String p7_Pdesc = getPara("p7_Pdesc");
			String p8_Url = getPara("p8_Url");
			String pa_MP = getPara("pa_MP");
			String pd_FrpId = getPara("pd_FrpId");
			String pr_NeedResponse = getPara("pr_NeedResponse");
			String open_id = getPara("open_id");
			String hmac = getPara("hmac");
			Person per = null;
			if (p1_MerId > 0) {
				per = Person.dao.findById(p1_MerId);
			}
			if (p3_Amt == null || p3_Amt.equals("")) {
				renderText("抱歉，交易金额太小。");
			} else if (per == null) {
				renderText("抱歉，无该用户！");
			} else if (per.getInt("ifnet") != 1) {
				renderText("抱歉，您的网银接口未开通请联系客服进行开通!");
			} else if (StringUtil.isBlank(p0_Cmd)) {
				renderText("抱歉，参数业务类型[p0_Cmd]不能为空！");
			} else if (!StringUtil.equals(p0_Cmd.toLowerCase(), "Buy".toLowerCase())) {
				renderText("抱歉，参数业务类型[p0_Cmd]错误，请对照接口文档！");
			} else if (StringUtil.isBlank(p2_Order)) {
				renderText("抱歉，参数商户订单号[p2_Order]不能为空！");
			} else if (p2_Order.length() > 50) {
				renderText("抱歉，参数商户订单号[p2_Order]错误，长度不能大于50个字符串！");
			} else if (StringUtil.isBlank(p4_Cur)) {
				renderText("抱歉，参数交易币种[p4_Cur]不能为空！");
			} else if (!StringUtil.equals(p4_Cur.toUpperCase(), "CNY".toUpperCase())) {
				renderText("抱歉，参数交易币种[p4_Cur]错误，请对照接口文档！");
			} else if (StringUtil.isBlank(p5_Pid)) {
				renderText("抱歉，参数商品名称[p5_Pid]不能为空！");
			} else if (p5_Pid.length() > 20) {
				renderText("抱歉，参数商品名称[p5_Pid]错误，长度不能大于20个字符串！");
			} else if (StringUtil.isBlank(p6_Pcat)) {
				renderText("抱歉，参数商品种类[p6_Pcat]不能为空！");
			} else if (p6_Pcat.length() > 20) {
				renderText("抱歉，参数商品种类[p6_Pcat]错误，长度不能大于20个字符串！");
			} else if (StringUtil.isBlank(p7_Pdesc)) {
				renderText("抱歉，参数商品描述[p7_Pdesc]不能为空！");
			} else if (p7_Pdesc.length()>200) {
				renderText("抱歉，参数商品描述[p7_Pdesc]错误，长度不能大于200个字符串！");
			} else if (StringUtil.isBlank(p8_Url)) {
				renderText("抱歉，参数商户接收支付成功数据的地址[p8_Url]不能为空！");
			} else if (StringUtil.isBlank(pa_MP)) {
				renderText("抱歉，参数商户扩展信息[pa_MP]不能为空！");
			} else if (pa_MP.length()>200) {
				renderText("抱歉，参数商户扩展信息[pa_MP]错误，长度不能大于200个字符串！");
			} else if (NumberUtils.toInt(pr_NeedResponse,0)!=1) {
				renderText("抱歉，参数应答机制[pr_NeedResponse]错误，请对照接口文档！");
			} else if (StringUtil.isBlank(hmac)) {
				renderText("抱歉，参数[hmac]不能为空！");
			} else if (hmac.length()!=32) {
				renderText("抱歉，参数[hmac]错误，字符串长度不正确！");
			} else if (pd_FrpId == null || pd_FrpId.equals("")) {
				Person person = Person.dao.findById(p1_MerId);
				setAttr("name", person.get("name"));
				setAttr("time", new Date());
				setAttr("p0_Cmd", p0_Cmd);
				setAttr("p1_MerId", p1_MerId);
				setAttr("p2_Order", p2_Order);
				setAttr("p3_Amt", p3_Amt);
				setAttr("p4_Cur", p4_Cur);
				setAttr("p5_Pid", p5_Pid);
				setAttr("p6_Pcat", p6_Pcat);
				setAttr("p7_Pdesc", p7_Pdesc);
				setAttr("p8_Url", p8_Url);
				setAttr("pa_MP", pa_MP);
				setAttr("pr_NeedResponse", pr_NeedResponse);
				setAttr("hmac", hmac);
				renderJsp("/WEB-INF/pay/yeepay/banksMight.jsp");
			} else {
				Order order = new Order();
				order.set("ip", CryptTool.getIpAddr(getRequest()));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSmmm");
				String orderid = "O" + sdf.format(new Date())
						+ CryptTool.getPasswordOfNumber(2) + p1_MerId;
				order.set("orderid", orderid);
				order.set("p0_Cmd", p0_Cmd);
				order.set("p1_MerId", p1_MerId);
				if (StringUtil.isNotBlank(p2_Order)) {
					order.set("p2_Order", p2_Order);
				}
				if (StringUtil.isNotBlank(p3_Amt)) {
					order.set("p3_Amt", p3_Amt);
				}
				order.set("p4_Cur", p4_Cur);
				if (StringUtil.isNotBlank(p5_Pid)) {
					order.set("p5_Pid", p5_Pid);
				}
				if (StringUtil.isNotBlank(p6_Pcat)) {
					order.set("p6_Pcat", p6_Pcat);
				}
				if (StringUtil.isNotBlank(p7_Pdesc)) {
					order.set("p7_Pdesc", p7_Pdesc);
				}
				if (StringUtil.isNotBlank(p8_Url)) {
					order.set("p8_Url", p8_Url);
				}
				if (StringUtil.isNotBlank(pa_MP)) {
					order.set("pa_MP", pa_MP);
				}
				if (StringUtil.isNotBlank(pd_FrpId)) {
					order.set("pd_FrpId", pd_FrpId);
				}
				if (StringUtil.isNotBlank(pr_NeedResponse)) {
					order.set("pr_NeedResponse", pr_NeedResponse);
				}
				if (StringUtil.isNotBlank(open_id)) {
					order.set("open_id", open_id);
				}
				order.set("hmac", hmac);
				boolean boo = YeepayService.service.order(order, pd);
				if (boo) {
					PersonGateway pergetGateway = PersonGateway.dao
							.findById(per.getInt("id"));
					int gatewayId = 0;
					if ("weixin".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("weixin_id");
					} else if ("wxwap".equals(pd_FrpId)||"wxh5".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("wxwap_id");
					} else if ("alipay".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("alipay_id");
					} else if ("alipaywap".equals(pd_FrpId)||"alipayh5".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("alipaywap_id");
					} else if ("tenpay".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("tenpay_id");
					} else if ("tenpaywap".equals(pd_FrpId)||"tenpayh5".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("tenpaywap_id");
					} else if ("qqwap".equals(pd_FrpId)||"qqh5".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("qqwap_id");
					} else if ("qqcode".equals(pd_FrpId)) {
						gatewayId = pergetGateway.getInt("qqcode_id");
					} else {
						gatewayId = pergetGateway.getInt("gateway_id");
					}
					Gateway gateway = Gateway.dao.findById(gatewayId);

					String memberId = gateway.getStr("gateway_merid");
					String keyValue = gateway.getStr("gateway_key"); // 商家密钥
					String channelId = gateway.getStr("gateway_channelid");
					int function = gateway.getInt("gateway_function");
					// --------------------------------------------------------
					if (function == 1) {
						yibao(memberId, keyValue, order);
					} else if (function == 2) {
						kuaiqian(memberId, keyValue, order);
					} else if (function == 3) {
						baopay(memberId, keyValue, order);
					} else if (function == 4) {
						caifutong(memberId, keyValue, order);
					} else if (function == 5) {
						ailpay(memberId, keyValue,channelId, order);
					} else if (function == 6) {
						dinpay(memberId, keyValue, order);
					} else if (function == 7) {
						haofu(memberId, keyValue, order);
					} else if (function == 8) {
						allinpay(memberId, keyValue, order);
					} else if (function == 9) {
						ease(memberId, keyValue, order);
					} else if (function == 10) {
						wapalipay(memberId, keyValue, order);
					} else if (function == 12) {
						ecpss(memberId, keyValue, order);
					} else if (function == 13) {
						baopaykuaijie(memberId, keyValue, order);
					} else if (function == 14) {
						ips(memberId, keyValue, order);
					} else if (function == 15) {
						w95epay(memberId, keyValue, order);
					} else if (function == 16) {
						seventypay(memberId, keyValue, order);
					} else if (function == 17) {
						hundred(memberId, keyValue, order);
					} else if (function == 18) {
						shpay(memberId, keyValue, order);
					} else if (function == 19) {
						jdpay(memberId, channelId, keyValue, order);
					} else if (function == 20) {
						mzfpay(memberId, keyValue, order);
					} else if (function == 21) {
						gopay(memberId, channelId, keyValue, order);
					} else if (function == 22) {
						ddpay(memberId, keyValue, order);
					} else if (function == 23) {
						zhipay(memberId, keyValue, order);
					} else if (function == 24) {
						ysspay(memberId, keyValue, order);
					} else if (function == 25) {
						ailpay2(memberId, keyValue,channelId, order);
					} else {
						renderText("系统错误！");
					}
					// --------------------------------------------------------
				} else {
					renderText("抱歉,交易签名无效");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			renderText("抱歉,参数传入错误[" + e.getMessage() + "]");
		}
	}

	/**
	 * 支付宝新接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ailpay2(String p1_MerId, String keyValue,String alipayemail, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("notify_url", basePath + "/alipay2/notify_url");
		setAttr("return_url", basePath + "/alipay2/return_url");
		setAttr("partner", p1_MerId);
		setAttr("private_key", keyValue);
		setAttr("public_key", alipayemail);
		setAttr("out_trade_no", order.get("orderid"));
		setAttr("subject", formatString(order.getStr("p5_Pid")));
		String pd_FrpId = order.getStr("pd_FrpId");
		String defaultbank = AlipayService.service.getAlipayParticipate(pd_FrpId);
		setAttr("defaultbank", defaultbank);
		setAttr("total_fee", order.get("p3_Amt"));
		setAttr("exter_invoke_ip", order.get("ip"));
		setAttr("body", formatString(order.getStr("p7_Pdesc")));
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		if(defaultbank!=null && defaultbank.equals("alipaywap")) {
			renderJsp("/WEB-INF/pay/alipay2/alipaywap.jsp");
		}else
			renderJsp("/WEB-INF/pay/alipay2/alipayapi.jsp");
	}
	/**
	 * 亿汇付接口
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ysspay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("platformID", p1_MerId);
		setAttr("merchNo", p1_MerId);
		String p3_Amt = order.get("p3_Amt");
		BigDecimal value = new BigDecimal(p3_Amt);
		// 小数点两位，四舍五入
		value = value.setScale(2, BigDecimal.ROUND_HALF_UP);
		setAttr("amt", value.toString());
		setAttr("orderNo", order.get("orderid"));
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		setAttr("tradeDate", sdf.format(createtime));
		setAttr("merchUrl", basePath + "/ysspay/payresult");
		setAttr("tradeSummary", order.get("p7_Pdesc"));
		setAttr("merchParam", order.get("p5_Pid"));
		setAttr("customerIP", order.get("ip"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bank_code = YsspayService.service.getYsspayParticipate(pd_FrpId);
		if (bank_code == null || "".equals(bank_code)) {
			order.set("r1_Code", 4);
			order.update();
			renderHtml("抱歉，通道正在维护中！");
			return;
		}
		setAttr("bankCode", bank_code);
		setAttr("key", keyValue);
		String id = order.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = "提交中。。。";
		String titletime = "1000";
		if (pergate != null) {
			if (StringUtil.isNotBlank(pergate.getStr("title"))) {
				title = pergate.get("title");
			}
			if (StringUtil.isNotBlank(pergate.getStr("titletime"))) {
				titletime = pergate.get("titletime");
			}
		}
		setAttr("title", title);
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		if (bank_code.equals("alipay_scan")) {
			setAttr("apiName", MoboConfig.MOBAOPAY_ALI_PAY);
			setAttr("choosePayType", "4");
			renderJsp("/WEB-INF/pay/ysspay/payscan.jsp");
		}else if (bank_code.equals("wxpay_scan")) {
			setAttr("apiName", MoboConfig.MOBAOPAY_WEIXIN_PAY);
			setAttr("choosePayType", "5");
			renderJsp("/WEB-INF/pay/ysspay/payscan.jsp");
		}else if (bank_code.equals("qqpay_scan")) {
			setAttr("apiName", MoboConfig.MOBAOPAY_WEIXIN_PAY);
			setAttr("choosePayType", "6");
			renderJsp("/WEB-INF/pay/ysspay/payscan.jsp");
		} else {
			setAttr("apiName", MoboConfig.MOBAOPAY_APINAME_PAY);
			setAttr("choosePayType", "1");
			renderJsp("/WEB-INF/pay/ysspay/paysubmit.jsp");
		}
	}
	/**
	 * 智付接口
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void zhipay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("merchant_code", p1_MerId);
		setAttr("notify_url", basePath + "/zhipay/zhipayToMer");
		String p3_Amt = order.get("p3_Amt");
		BigDecimal value = new BigDecimal(p3_Amt);
		// 小数点两位，四舍五入
		// value = value.setScale(2, BigDecimal.ROUND_HALF_UP);
		setAttr("order_amount", value.toString());
		setAttr("order_no", order.get("orderid"));
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		setAttr("order_time", sdf.format(createtime));
		setAttr("product_name", order.get("p5_Pid"));
		setAttr("return_url", basePath + "/zhipay/paymentZhipayToMer");
		setAttr("client_ip", order.get("ip"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bank_code = ZhipayService.service.getZhipayParticipate(pd_FrpId);
		if (bank_code == null || "".equals(bank_code)) {
			order.set("r1_Code", 4);
			order.update();
			renderHtml("抱歉，通道正在维护中！");
			return;
		}
		setAttr("bank_code", bank_code);
		setAttr("key", keyValue);
		String id = order.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = "提交中。。。";
		String titletime = "1000";
		if (pergate != null) {
			if (StringUtil.isNotBlank(pergate.getStr("title"))) {
				title = pergate.get("title");
			}
			if (StringUtil.isNotBlank(pergate.getStr("titletime"))) {
				titletime = pergate.get("titletime");
			}
		}
		setAttr("title", title);
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		if (bank_code.equals("alipay_h5")) {
			renderJsp("/WEB-INF/pay/zhipay/Alipay.jsp");
		}else if (bank_code.equals("wxpub_pay")) {
			setAttr("open_id", order.get("open_id"));
			renderJsp("/WEB-INF/pay/zhipay/WechatPay.jsp");
		} else
			renderJsp("/WEB-INF/pay/zhipay/MerDinpayUTF-8.jsp");
	}
	/**
	 * 多得宝
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ddpay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("merchant_code", p1_MerId);
		setAttr("notify_url", basePath + "/ddpay/dinpayToMer");
		String p3_Amt = order.get("p3_Amt");
		BigDecimal value = new BigDecimal(p3_Amt);
		// 小数点两位，四舍五入
		//value = value.setScale(2, BigDecimal.ROUND_HALF_UP);
		setAttr("order_amount", value.toString());
		setAttr("order_no", order.get("orderid"));
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		setAttr("order_time", sdf.format(createtime));
		setAttr("product_name", order.get("p5_Pid"));
		setAttr("return_url", basePath + "/ddpay/paymentDinpayToMer");
		setAttr("client_ip", order.get("ip"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bank_code = DinpayService.service.getDinpayParticipate(pd_FrpId);
		if (bank_code == null || "".equals(bank_code)) {
			renderHtml("抱歉，22["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("bank_code", bank_code);
		setAttr("key", keyValue);
		String id = order.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = "提交中。。。";
		String titletime = "1000";
		if (pergate != null) {
			if (StringUtil.isNotBlank(pergate.getStr("title"))) {
				title = pergate.get("title");
			}
			if (StringUtil.isNotBlank(pergate.getStr("titletime"))) {
				titletime = pergate.get("titletime");
			}
		}
		setAttr("title", title);
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	 * @param order
	 */
	public void gopay(String p1_MerId, String channelId, String keyValue,
			Order order) {
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
		setAttr("merOrderNum", order.get("orderid"));
		setAttr("tranAmt", order.get("p3_Amt"));
		setAttr("feeAmt", "1.00");
		setAttr("currencyType", "156");
		setAttr("frontMerUrl", basePath + "/gopay/payresult/");
		setAttr("backgroundMerUrl", basePath + "/gopay/paymentpayresult/");
		setAttr("tranDateTime", nowTime);
		setAttr("virCardNoIn", channelId);
		setAttr("tranIP", order.get("ip"));
		setAttr("isRepeatSubmit", "1");
		setAttr("goodsName", order.get("p5_Pid"));
		setAttr("goodsDetail", order.get("p7_Pdesc"));
		setAttr("merRemark1", order.get("pa_MP"));
		setAttr("merRemark2", "");
		String pd_FrpId = GopayService.service.getGopayParticipate(order
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，21["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("bankCode", pd_FrpId);
		setAttr("userType", "1");
		setAttr("gopayServerTime", GopayUtils.getGopayServerTime());
		setAttr("VerficationCode", keyValue);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	 * @param order
	 */
	public void mzfpay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		String nowTime = df.format(new Date());
		setAttr("keyValue", keyValue);
		setAttr("sendTime", nowTime);
		setAttr("p0_Cmd", order.get("p0_Cmd"));
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", order.get("orderid"));
		setAttr("p3_Amt", order.get("p3_Amt"));
		setAttr("p4_Cur", order.get("p4_Cur"));
		setAttr("p5_Pid", order.get("p5_Pid"));
		setAttr("p6_Pcat", order.get("p6_Pcat"));
		setAttr("p7_Pdesc", order.get("p7_Pdesc"));
		setAttr("p8_Url", basePath + "/mzfpay/paymentpayresult/");
		setAttr("pa_MP", order.get("pa_MP"));
		setAttr("pd_FrpId", order.get("pd_FrpId"));
		setAttr("pr_NeedResponse", order.get("pr_NeedResponse"));
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	 * @param order
	 */
	public void jdpay(String p1_MerId, String channelId, String keyValue,
			Order order) {
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
		setAttr("orderId", order.get("orderid"));
		setAttr("goodsTitle", order.get("p5_Pid"));
		setAttr("goodsDesc", order.get("p7_Pdesc"));
		setAttr("transAmt", order.get("p3_Amt"));
		String pd_FrpId = JdpayService.service.getJdpayParticipate(order
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，19["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		String[] str = pd_FrpId.split("_");
		setAttr("busType", str[0]);
		setAttr("txnSubType", str[1]);
		setAttr("payType", str[2]);
		setAttr("currency", "156");// 币种：CNY人民币
		setAttr("backUrl", basePath + "/jdpay/paymentpayresult/");
		setAttr("sendIp", order.get("ip"));
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	public void shpay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("customerid", p1_MerId);
		setAttr("keyValue", keyValue);
		setAttr("superid", "100000");
		setAttr("sdcustomno", order.get("orderid"));
		setAttr("ordermoney", order.get("p3_Amt"));
		String pd_FrpId = ShpayService.service.getShpayParticipate(order
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，18["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("faceno", pd_FrpId);
		setAttr("noticeurl", basePath + "/shpay/payresult");
		setAttr("backurl", basePath + "/shpay/paymentpayresult");
		setAttr("endip", order.get("ip"));
		setAttr("remarks", order.get("p5_Pid"));
		setAttr("mark", order.get("p7_Pdesc"));
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/51pay/paysubmit.jsp");
	}

	/**
	 * 101卡网银接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void hundred(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("MerNo", p1_MerId);
		setAttr("keyValue", keyValue);
		setAttr("BillNo", order.get("orderid"));
		setAttr("Amount", order.get("p3_Amt"));
		String pd_FrpId = HundredService.service.getHundredParticipate(order
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，17["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("PaymentType", pd_FrpId);
		String ReturnURL = basePath + "/hundredy/payresult";
		setAttr("ReturnURL", ReturnURL);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/hundred/paysubmit.jsp");
	}

	/**
	 * 70卡支付接口
	 * 
	 * @param p1_MerId
	 *            商户号
	 * @param keyValue
	 *            密钥
	 * @param order
	 */
	public void seventypay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("keyvalue", keyValue);
		setAttr("userid", p1_MerId);
		setAttr("orderid", order.get("orderid"));
		setAttr("money", order.get("p3_Amt"));
		setAttr("ext", order.get("p5_Pid"));
		setAttr("url", basePath + "/seventypay/paymentpayresult/");
		String pd_FrpId = SeventyService.service.getSeventyParticipate(order
				.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，16["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("bankid", pd_FrpId);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/seventypay/paysubmit.jsp");
	}
	/**
	 * 双乾接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void w95epay(String p1_MerId, String keyValue, Order order) {
		setAttr("MerNo", p1_MerId);
		setAttr("MD5key", keyValue);
		setAttr("BillNo", order.get("orderid"));
		setAttr("Amount", order.get("p3_Amt"));
		String pd_FrpId = W95epayService.service.getW95epayParticipate(order.getStr("pd_FrpId"));
		if (pd_FrpId == null || "".equals(pd_FrpId)) {
			renderHtml("抱歉，15["+pd_FrpId+"]通道正在维护中！");
			return;
		}
		setAttr("PaymentType", pd_FrpId);
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String ReturnURL = httpurl + "/w95epay/payresult";
		setAttr("ReturnURL", ReturnURL);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/95epay/paysubmit.jsp");
	}

	/**
	 * 环迅接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ips(String p1_MerId, String keyValue, Order order) {
		setAttr("Mer_code", p1_MerId);
		setAttr("Mer_key", keyValue);
		setAttr("Billno", order.get("orderid"));
		setAttr("Amount", order.get("p3_Amt"));
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		setAttr("Date", format.format(new Date()));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String Merchanturl = httpurl + "/ips/Merchanturl";
		setAttr("Merchanturl", Merchanturl);
		setAttr("FailUrl", Merchanturl);
		String ServerUrl = httpurl + "/ips/ServerUrl";
		setAttr("ServerUrl", ServerUrl);
		String pd_FrpId = IpsService.service.getIpsParticipate(order
				.getStr("pd_FrpId"));
		String Bankco = IpsService.service.getbankebh(p1_MerId, keyValue,
				pd_FrpId);
		setAttr("Bankco", Bankco);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/ips/redirect.jsp");
	}

	/**
	 * 汇潮支付接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ecpss(String p1_MerId, String keyValue, Order order) {
		setAttr("MerNo", p1_MerId);
		setAttr("BillNo", order.get("orderid"));
		setAttr("Amount", order.get("p3_Amt"));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		String ReturnURL = httpurl + "/ecpss/ReturnURL";
		setAttr("ReturnURL", ReturnURL);
		setAttr("AdviceURL", httpurl + "/ecpss/AdviceURL");
		String md5Str = p1_MerId + "&" + order.get("orderid") + "&"
				+ order.get("p3_Amt") + "&" + ReturnURL + "&" + keyValue;
		MD5 md5 = new MD5();
		setAttr("SignInfo", md5.getMD5ofStr(md5Str).toUpperCase());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		setAttr("orderTime", format.format(new Date()));
		String pd_FrpId = EcpssService.service.getEcpssParticipate(order
				.getStr("pd_FrpId"));
		setAttr("defaultBankNumber", pd_FrpId);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	public void wapalipay(String p1_MerId, String keyValue, Order order) {
		setAttr("out_trade_no", order.get("orderid"));
		System_interface systemInterface = System_interface.dao.findById(1);
		String httpurl = systemInterface.getStr("system_interface_httpurl");
		setAttr("notify_url", httpurl + "/wapalipay/notify_url");
		setAttr("call_back_url", httpurl + "/wapalipay/call_back_url");
		String alipayemail = Configuration.getInstance()
				.getValue("alipayemail");
		setAttr("seller_email", alipayemail);
		setAttr("total_fee", order.get("p3_Amt"));
		com.pay.wapalipay.server.config.AlipayConfig.partner = p1_MerId;
		com.pay.wapalipay.server.config.AlipayConfig.key = keyValue;
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	public void ease(String p1_MerId, String keyValue, Order order) {
		setAttr("v_mid", p1_MerId);
		setAttr("v_oid", order.get("orderid"));
		setAttr("v_amount", order.get("p3_Amt"));
		System_interface systemInterface = System_interface.dao.findById(1);
		String httpurl = systemInterface.getStr("system_interface_httpurl");
		setAttr("v_url", httpurl + "/ease/received1");
		setAttr("MD5Key", keyValue);
		String pd_FrpId = order.getStr("pd_FrpId");
		String v_pmode = EaseService.service.getEaseParticipate(pd_FrpId);
		setAttr("v_pmode", v_pmode);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	public void allinpay(String p1_MerId, String keyValue, Order order) {
		setAttr("key", keyValue);
		setAttr("merchantId", p1_MerId);
		System_interface systemInterface = System_interface.dao.findById(1);
		String httpurl = systemInterface.getStr("system_interface_httpurl");
		setAttr("pickupUrl", httpurl + "/allinpay/pickupUrl");
		setAttr("receiveUrl", httpurl + "/allinpay/receiveUrl");
		setAttr("orderNo", order.get("orderid"));
		String orderAmount = (new BigDecimal((String) order.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (orderAmount.indexOf(".") > 0) {
			orderAmount = orderAmount.replaceAll("0+?$", "");// 去掉多余的0
			orderAmount = orderAmount.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		setAttr("orderAmount", orderAmount);
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDhhmmss");
		setAttr("orderDatetime", sdf.format(createtime));
		String pd_FrpId = order.getStr("pd_FrpId");
		String issuerId = AllinpayService.service
				.getAllinpayParticipate(pd_FrpId);
		setAttr("issuerId", issuerId);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/allinpay/post.jsp");
	}

	/**
	 * 浩付提交
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void haofu(String p1_MerId, String keyValue, Order order) {
		String nodeAuthorizationURL = "http://www.haofpay.com/hspay/node"; // 交易请求地址
		setAttr("p0_Cmd", order.get("p0_Cmd"));
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", order.get("orderid"));
		setAttr("p3_Amt", order.get("p3_Amt"));
		setAttr("p4_Cur", order.get("p4_Cur"));
		setAttr("p5_Pid", order.get("p5_Pid"));
		setAttr("p6_Pcat", order.get("p6_Pcat"));
		setAttr("p7_Pdesc", order.get("p7_Pdesc"));
		System_interface systemInterface = System_interface.dao.findById(1);
		String httpurl = systemInterface.getStr("system_interface_httpurl");
		setAttr("p8_Url", httpurl + "/yeepay/haofucallbank");
		setAttr("p9_SAF", order.get("p9_SAF"));
		setAttr("pa_MP", order.get("pa_MP"));
		setAttr("pd_FrpId", order.get("pd_FrpId"));
		setAttr("pr_NeedResponse", order.get("pr_NeedResponse"));
		setAttr("nodeAuthorizationURL", nodeAuthorizationURL);
		String hmac1 = YeepayService.service.getReqMd5HmacForOnlinePayment(
				formatString(order.getStr("p0_Cmd")), formatString(p1_MerId),
				formatString(order.getStr("orderid")),
				formatString(order.getStr("p3_Amt")),
				formatString(order.getStr("p4_Cur")),
				formatString(order.getStr("p5_Pid")),
				formatString(order.getStr("p6_Pcat")),
				formatString(order.getStr("p7_Pdesc")), formatString(httpurl
						+ "/yeepay/haofucallbank"),
				formatString(order.getStr("p9_SAF")),
				formatString(order.getStr("pa_MP")),
				formatString(order.getStr("pd_FrpId")),
				formatString(order.getStr("pr_NeedResponse")), keyValue);
		setAttr("hmac", hmac1);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
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
	public void dinpay(String p1_MerId, String keyValue, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("merchant_code", p1_MerId);
		setAttr("notify_url", basePath + "/dinpay/dinpayToMer");
		String p3_Amt = order.get("p3_Amt");
		BigDecimal value = new BigDecimal(p3_Amt);
		// 小数点两位，四舍五入
		// value = value.setScale(2, BigDecimal.ROUND_HALF_UP);
		setAttr("order_amount", value.toString());
		setAttr("order_no", order.get("orderid"));
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		setAttr("order_time", sdf.format(createtime));
		setAttr("product_name", order.get("p5_Pid"));
		setAttr("return_url", basePath + "/dinpay/paymentDinpayToMer");
		setAttr("client_ip", order.get("ip"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bank_code = DinpayService.service.getDinpayParticipate(pd_FrpId);
		if (bank_code == null || "".equals(bank_code)) {
			renderHtml("抱歉，通道正在维护中！");
			return;
		}
		setAttr("bank_code", bank_code);
		setAttr("key", keyValue);
		String id = order.getInt("p1_MerId").toString();
		PersonGateway pergate = PersonGateway.dao.findById(id);
		String title = "提交中。。。";
		String titletime = "1000";
		if (pergate != null) {
			if (StringUtil.isNotBlank(pergate.getStr("title"))) {
				title = pergate.get("title");
			}
			if (StringUtil.isNotBlank(pergate.getStr("titletime"))) {
				titletime = pergate.get("titletime");
			}
		}
		setAttr("title", title);
		setAttr("titletime", titletime);
		Timer timer = new Timer();
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		if (bank_code.equals("weixin_scan") || bank_code.equals("alipay_scan")
				|| bank_code.equals("tenpay_scan")) {
			renderJsp("/WEB-INF/pay/dinpay/qrcode.jsp");
		} else
			renderJsp("/WEB-INF/pay/dinpay/MerDinpayUTF-8.jsp");
	}

	/**
	 * 支付宝接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void ailpay(String p1_MerId, String keyValue,String alipayemail, Order order) {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://"
				+ getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		setAttr("notify_url", basePath + "/alipay/notify_url");
		setAttr("return_url", basePath + "/alipay/return_url");
		AlipayConfig.partner = p1_MerId;
		AlipayConfig.key = keyValue;
		setAttr("seller_email", alipayemail);
		setAttr("out_trade_no", order.get("orderid"));
		setAttr("subject", formatString(order.getStr("p5_Pid")));
		String pd_FrpId = order.getStr("pd_FrpId");
		String defaultbank = AlipayService.service.getAlipayParticipate(pd_FrpId);
		setAttr("defaultbank", defaultbank);
		setAttr("total_fee", order.get("p3_Amt"));
		setAttr("body", formatString(order.getStr("p7_Pdesc")));
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/alipay/alipayapi.jsp");
	}

	/**
	 * 财付通接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void caifutong(String p1_MerId, String keyValue, Order order) {
		StringBuffer url = new StringBuffer();
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		url.append(httpurl + "/caifutong/splitPayRequest?");
		url.append("&key=" + keyValue);
		url.append("&bargainor_id=" + p1_MerId);
		url.append("&return_url=" + httpurl + "/caifutong/splitPayResponse");
		url.append("&sp_billno=" + order.getStr("orderid"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bank_type = CaiFuTongService.service
				.getCaiFuParticipate(pd_FrpId);
		url.append("&bank_type=" + bank_type);
		url.append("&desc=" + order.get("p5_Pid"));
		String id = order.getInt("p1_MerId").toString();
		Caifutong caifutong = Caifutong.dao.findById(id);
		BigDecimal caifu_rate = caifutong.getBigDecimal("caifu_rate");
		BigDecimal total_fee = new BigDecimal((String) order.get("p3_Amt"));
		BigDecimal amt1 = total_fee.multiply(caifu_rate);
		BigDecimal amt2 = total_fee.subtract(amt1);
		String total_fees = total_fee.multiply(BigDecimal.valueOf(100))
				.toString();
		if (total_fees.indexOf(".") > 0) {
			total_fees = total_fees.replaceAll("0+?$", "");// 去掉多余的0
			total_fees = total_fees.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&total_fee=" + total_fees);
		String amts1 = amt1.multiply(BigDecimal.valueOf(100)).toString();
		if (amts1.indexOf(".") > 0) {
			amts1 = amts1.replaceAll("0+?$", "");// 去掉多余的0
			amts1 = amts1.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&amts1=" + amts1);
		String amts2 = amt2.multiply(BigDecimal.valueOf(100)).toString();
		if (amts2.indexOf(".") > 0) {
			amts2 = amts2.replaceAll("0+?$", "");// 去掉多余的0
			amts2 = amts2.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		url.append("&amts2=" + amts2);
		String caifutongemial = systeminterface
				.getStr("system_interface_caifutongemial");
		url.append("&caifutongemial=" + caifutongemial);
		url.append("&caifu_account=" + caifutong.getStr("caifu_account"));
		url.append("&ip=" + order.getStr("ip"));
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		Thread caifutongThred = new Thread(new YeepayThread(
				order.getStr("orderid")));
		caifutongThred.start();
		redirect(url.toString());
	}

	/**
	 * 易宝提交
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void yibao(String p1_MerId, String keyValue, Order order) {
		String nodeAuthorizationURL = "https://www.yeepay.com/app-merchant-proxy/node"; // 交易请求地址
		setAttr("p0_Cmd", order.get("p0_Cmd"));
		setAttr("p1_MerId", p1_MerId);
		setAttr("p2_Order", order.get("orderid"));
		setAttr("p3_Amt", order.get("p3_Amt"));
		setAttr("p4_Cur", order.get("p4_Cur"));
		setAttr("p5_Pid", order.get("p5_Pid"));
		setAttr("p6_Pcat", order.get("p6_Pcat"));
		setAttr("p7_Pdesc", order.get("p7_Pdesc"));
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("p8_Url", httpurl + "/yeepay/callback");
		setAttr("p9_SAF", order.get("p9_SAF"));
		setAttr("pa_MP", order.get("pa_MP"));
		setAttr("pd_FrpId", order.get("pd_FrpId"));
		setAttr("pr_NeedResponse", order.get("pr_NeedResponse"));
		setAttr("nodeAuthorizationURL", nodeAuthorizationURL);
		String hmac1 = YeepayService.service.getReqMd5HmacForOnlinePayment(
				formatString(order.getStr("p0_Cmd")), formatString(p1_MerId),
				formatString(order.getStr("orderid")),
				formatString(order.getStr("p3_Amt")),
				formatString(order.getStr("p4_Cur")),
				formatString(order.getStr("p5_Pid")),
				formatString(order.getStr("p6_Pcat")),
				formatString(order.getStr("p7_Pdesc")), formatString(httpurl
						+ "/yeepay/callback"),
				formatString(order.getStr("p9_SAF")),
				formatString(order.getStr("pa_MP")),
				formatString(order.getStr("pd_FrpId")),
				formatString(order.getStr("pr_NeedResponse")), keyValue);
		setAttr("hmac", hmac1);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/yeepay/reqpay.jsp");

	}

	/**
	 * 块钱接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void kuaiqian(String merchantAcctId, String keyValue, Order order) {
		setAttr("merchantAcctId", merchantAcctId);
		System_interface systeminterface = System_interface.dao.findById(1);
		String httpurl = systeminterface.getStr("system_interface_httpurl");
		setAttr("bgUrl", httpurl + "/fastmoney/callback");
		setAttr("orderId", order.get("orderid"));
		String orderamount = (new BigDecimal((String) order.get("p3_Amt"))
				.multiply(new BigDecimal("100"))).toString();
		if (orderamount.indexOf(".") > 0) {
			orderamount = orderamount.replaceAll("0+?$", "");// 去掉多余的0
			orderamount = orderamount.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		setAttr("orderAmount", orderamount);
		setAttr("productName", order.get("p5_Pid"));
		setAttr("productDesc", order.get("p7_Pdesc"));
		String pd_FrpId = order.getStr("pd_FrpId");
		String bankId = FastMoneyService.service.getFastParticipate(pd_FrpId);
		setAttr("bankId", bankId);
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		renderJsp("/WEB-INF/pay/fastmoney/send.jsp");
	}

	/**
	 * 宝付接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void baopay(String p1_MerId, String keyValue, Order order) {
		String PayID = BaopayService.service.getBaopayParticipate(order
				.getStr("pd_FrpId"));
		String OrderMoney = (new BigDecimal((String) order.get("p3_Amt"))
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
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		url.append("TradeDate=" + sdf.format(createtime) + "&");
		url.append("TransID=" + order.get("orderid") + "&");
		url.append("OrderMoney=" + OrderMoney + "&");
		url.append("ProductName=" + formatString(order.getStr("p5_Pid")) + "&");
		url.append("AdditionalInfo=" + formatString(order.getStr("pa_MP"))
				+ "&");
		url.append("Merchant_url=" + httpurl + "/baopay/Merchant_url&");
		url.append("Return_url=" + httpurl + "/baopay/Return_url&");
		url.append("Md5key=" + keyValue + "&");
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		System.out.println(url.toString());
		redirect(url.toString());
	}

	/**
	 * 连连支付快捷接口
	 * 
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void llpaykuaijie(String p1_MerId, String keyValue, Order order) {
		renderJsp("/WEB-INF/pay/llpay/index.jsp");
	}

	/**
	 * 宝付快捷接口
	 *
	 * @param p1_MerId
	 * @param keyValue
	 * @param order
	 */
	public void baopaykuaijie(String p1_MerId, String keyValue, Order order) {
		String PayID = "1080";
		String OrderMoney = (new BigDecimal((String) order.get("p3_Amt"))
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
		Date createtime = order.get("CreateTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		url.append("TradeDate=" + sdf.format(createtime) + "&");
		url.append("TransID=" + order.get("orderid") + "&");
		url.append("OrderMoney=" + OrderMoney + "&");
		url.append("ProductName=" + formatString(order.getStr("p5_Pid")) + "&");
		url.append("AdditionalInfo=" + formatString(order.getStr("pa_MP"))
				+ "&");
		url.append("Merchant_url=" + httpurl + "/baopay/Merchant_url&");
		url.append("Return_url=" + httpurl + "/baopay/Return_url&");
		url.append("Md5key=" + keyValue + "&");
		String id = order.getInt("p1_MerId").toString();
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
		timer.schedule(new yeepayTimer(order.getStr("orderid"), timer),
				15 * 60 * 1000);
		System.out.println(url.toString());
		redirect(url.toString());
	}

	public String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
}
