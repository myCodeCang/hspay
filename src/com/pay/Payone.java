package com.pay;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Controller;
import com.pay.hundred.server.DigestUtil;
import com.pay.yeepay.server.Configuration;

public class Payone extends Controller {

	public void index() throws UnsupportedEncodingException {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://" + getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		String bankCardType=getPara("bankCardType", "00");
		String PostUrl = basePath + Configuration.getInstance().getValue("neturl")+"/node";
		String p1_MerId = "22"; // 商户编号 是 Max(11)
		String key = "35de170fc7836ea645e1a7d7b307ff6e"; // 商户密钥
		String p0_Cmd = "Buy"; // 业务类型 是 Max(20) 固定值“Buy” . 1

		String p2_Order = System.currentTimeMillis() + ""; // 商户订单号 否
															// Max(50)
															// 若不为””，提交的订单号必须在自身账户交易中唯一;为
															// ””
		String p3_Amt = getPara("testAmt", "2.00"); // 支付金额 否 Max(20)
								// 单位:元，精确到分.此参数为空则无法直连(如直连会报错：抱歉，交易金额太小。),必须到易宝网关让消费者输入金额
								// 4
		String p4_Cur = "CNY"; // 交易币种 是 Max(10) 固定值 ”CNY”. 5
		String p5_Pid = new String("test".getBytes(),"UTF-8"); // 商品名称 否 Max(20) 用于支付时显示在易宝支付网关左侧的订单产品信息.
		String p6_Pcat = "123"; // 商品种类 否 Max(20) 商品种类.
		String p7_Pdesc = "test001"; // 商品描述 否 Max(20) 商品描述.
		String p8_Url = basePath + "/payone/callback/"; // 商户接收支付成功数据的地址 否
														// Max(200)
														// 支付成功后易宝支付会向该地址发送两次成功通知
							// 不需要，默认为 ”0”. 10
		String pa_MP = "test"; // 商户扩展信息 否 Max(200) 返回时原样返回，此参数如用到中文，请注意转码. 11
		String pd_FrpId = getPara("pd_FrpId", "weixin"); // 支付通道编码 否
															// Max(50)
															// 默认为 ””
															// ，到易宝支付网关，易宝支付网关默认显示已开通的全部支付通道.
		String pr_NeedResponse = "1"; // 应答机制 否 Max(1) 固定值为“1”: 需要应答机制;
										// 收到易宝支付服务器点对点支付成功通知，必须回写以”success”（无关大小写）开头的字符串，即使您收到成功通知时发现该订单已经处理过，也要正确回写”success”，否则易宝支付将认为您的系统没有收到通知，启动重发机制，直到收到”success”为止。
		String hmac = ""; // 签名数据 Max(32) 产生hmac需要两个参数，并调用相关API.

		if(bankCardType.equals("01")){
			p3_Amt=getPara("facevalue", "1");
			String pa4_cardAmt=getPara("facevalue", "1");
			String pa5_cardNo=getPara("cardNo");
			String pa6_cardPwd=getPara("cardPwd");
			String pz_userId="";
			p8_Url=basePath + "/payone/callbackCrad/";
			pd_FrpId=getPara("Channel");
			String sbOld = "";
			sbOld += p0_Cmd;
			sbOld += p1_MerId;
			sbOld += p2_Order;
			sbOld += p3_Amt;
			sbOld += pa4_cardAmt;
			sbOld += pa5_cardNo;
			sbOld += pa6_cardPwd;
			sbOld += p8_Url;
			sbOld += pa_MP;
			sbOld += pd_FrpId;
			sbOld += pr_NeedResponse;
			sbOld += pz_userId;

			hmac = DigestUtil.hmacSign(sbOld, key); // 数据签名

			String result = "";
			result += basePath+Configuration.getInstance().getValue("cardurl")+"/node";
			result += "?p0_Cmd=" + p0_Cmd;
			result += "&p1_MerId=" + p1_MerId;
			result += "&p2_Order=" + p2_Order;
			result += "&p3_Amt=" + p3_Amt;
			result += "&pa4_cardAmt=" + pa4_cardAmt;
			result += "&pa5_cardNo=" + pa5_cardNo;
			result += "&pa6_cardPwd=" + pa6_cardPwd;
			result += "&p7_Url=" + p8_Url;
			result += "&pa_MP=" + pa_MP;
			result += "&pd_FrpId=" + pd_FrpId;
			result += "&pr_NeedResponse=" + pr_NeedResponse;
			result += "&pz_userId=" +pz_userId;
			result += "&hmac=" + hmac;

			redirect(result);
			return;
		}else{
		String sbOld = "";
		sbOld += p0_Cmd;
		sbOld += p1_MerId;
		sbOld += p2_Order;
		sbOld += p3_Amt;
		sbOld += p4_Cur;
		sbOld += p5_Pid;
		sbOld += p6_Pcat;
		sbOld += p7_Pdesc;
		sbOld += p8_Url;
		sbOld += pa_MP;
		sbOld += pd_FrpId;
		sbOld += pr_NeedResponse;

		hmac = DigestUtil.hmacSign(sbOld, key); // 数据签名

		String result = "";
		result += PostUrl;
		result += "?p0_Cmd=" + p0_Cmd;
		result += "&p1_MerId=" + p1_MerId;
		result += "&p2_Order=" + p2_Order;
		result += "&p3_Amt=" + p3_Amt;
		result += "&p4_Cur=" + p4_Cur;
		result += "&p5_Pid=" + p5_Pid;
		result += "&p6_Pcat=" + p6_Pcat;
		result += "&p7_Pdesc=" + p7_Pdesc;
		result += "&p8_Url=" + p8_Url;
		result += "&pa_MP=" + pa_MP;
		result += "&pd_FrpId=" + pd_FrpId;
		result += "&pr_NeedResponse=" + pr_NeedResponse;
		result += "&hmac=" + hmac;

		redirect(result);
		}
	}

	public void callback() throws IOException {
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + path;
		getResponse().setContentType("text/html"); 
		PrintWriter out = getResponse().getWriter();
		String p1_MerId = "22"; // 商户编号 是 Max(11)
		String key = "35de170fc7836ea645e1a7d7b307ff6e"; // 商户密钥
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId"); // 平台流水号
		String r3_Amt = request.getParameter("r3_Amt"); // 支付金额
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order"); // 商户订单号
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType"); // 通知类型 1同步通知 2异步通知
		String rp_PayDate = request.getParameter("rp_PayDate");
		String hmac = request.getParameter("hmac"); // 数据签名

		String sbOld = "";
		sbOld += p1_MerId;
		sbOld += r0_Cmd;
		sbOld += r1_Code;
		sbOld += r2_TrxId;
		sbOld += r3_Amt;
		sbOld += r4_Cur;
		sbOld += r5_Pid;
		sbOld += r6_Order;
		sbOld += r7_Uid;
		sbOld += r8_MP;
		sbOld += r9_BType;

		System.out.println("sbOld==="+sbOld);
		String nhmac = DigestUtil.hmacSign(sbOld, key); // 数据签名
		System.out.println("nhmac==="+nhmac);
		String reulst="<span>\u5546\u54C1ID:[" + r5_Pid + "]</span><span>\u5546\u6237\u8BA2\u5355\u53F7:[" + r6_Order + "]</span><span>\u652F\u4ED8\u91D1\u989D[" + r3_Amt
							+ "]</span><span>\u652F\u4ED8\u4EA4\u6613\u6D41\u6C34\u53F7:[" + r2_TrxId + "]</span><span>\u652F\u4ED8\u72B6\u6001:[";
		if (nhmac.equals(hmac)) {
			if ("1".equals(r1_Code)) {
				// 支付成功,请处理自己的逻辑 请注意通知可能会多次 请避免重复到帐
				out.println("success");
				if ("1".equals(r9_BType)) { // 同步通知 两者逻辑可同时处理
					reulst+="支付成功!";
				} else if ("2".equals(r9_BType)) { // 异步通知
					reulst+="异步通知，支付成功！";
				}else{
					reulst += "支付异常，联系技术人员！";
				}
			} else {
				out.println("success,error");
				reulst+="支付失败!";
			}
		} else {
			reulst+="签名失败";
		}
		reulst+="]</span>";
		out.print("<!doctype html>");
		out.print("<html lang=\"en\">");
		out.print(" <head>");
		out.print("  <meta charset=\"UTF-8\">");
		out.print("  <title>Document</title>");
		out.print(" </head>");
		out.print(" <body>");
		out.print("<script type=\"text/javascript\">");
		out.print("setTimeout(function(){window.location.href='"+basePath+"/2017/shanghu/test_callback.jsp?reulst="+URLEncoder.encode(reulst, "utf-8")+"';},500);");
		out.print("</script>");
		out.print(" </body>");
		out.print("</html>");
		out.flush();
		out.close();
	}
	
	public void callbackCrad() throws IOException {
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + path;
		getResponse().setContentType("text/html"); 
		PrintWriter out = getResponse().getWriter();
		String key = "35de170fc7836ea645e1a7d7b307ff6e"; // 商户密钥
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String p1_MerId = request.getParameter("p1_MerId");
		String r2_TrxId = request.getParameter("p2_Order"); // 平台流水号
		String r3_Amt = request.getParameter("p3_Amt"); // 支付金额
		String p4_FrpId = request.getParameter("p4_FrpId");
		String p5_CardNo = request.getParameter("p5_CardNo");
		String p6_confirmAmount = request.getParameter("p6_confirmAmount"); // 商户订单号
		String p7_realAmount = request.getParameter("p7_realAmount");
		String p8_cardStatus = request.getParameter("p8_cardStatus");
		String p9_MP = request.getParameter("p9_MP"); // 通知类型 1同步通知 2异步通知
		String pb_BalanceAmt = request.getParameter("pb_BalanceAmt");
		String pc_BalanceAct = request.getParameter("pc_BalanceAct");
		String hmac = request.getParameter("hmac"); // 数据签名

		String sbOld = "";
		sbOld += r0_Cmd;
		sbOld += r1_Code;
		sbOld += p1_MerId;
		sbOld += r2_TrxId;
		sbOld += r3_Amt;
		sbOld += p4_FrpId;
		sbOld += p5_CardNo;
		sbOld += p6_confirmAmount;
		sbOld += p7_realAmount;
		sbOld += p8_cardStatus;
		sbOld += p9_MP;
		sbOld += pb_BalanceAmt;
		sbOld += pc_BalanceAct;
		System.out.println("sbOld==="+sbOld);
		String nhmac = DigestUtil.hmacSign(sbOld, key); // 数据签名
		System.out.println("nhmac==="+nhmac);
		if (nhmac.equals(hmac)) {
			if ("1".equals(r1_Code)) {
				// 支付成功,请处理自己的逻辑 请注意通知可能会多次 请避免重复到帐
				renderText("success");
			} else {
				renderText("success,error");
			}
		} else {
			renderText("error");
		}
	}
}
