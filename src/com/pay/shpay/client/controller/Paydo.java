/** 
 * Project Name:hspay 
 * File Name:Hundred.java 
 * Package Name:com.pay.hundred.client.controller 
 * Date:2017年4月9日下午3:49:13 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.pay.shpay.client.controller;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Controller;
import com.pay.hundred.server.DigestUtil;

/**
 * @author Administrator
 * 
 */
public class Paydo extends Controller {

	public void index() {
		String path = getRequest().getContextPath();
		String basePath = getRequest().getScheme() + "://" + getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + path;
		String bankCardType=getPara("bankCardType", "00");
		String PostUrl = basePath + "/hspay/node";
		String p1_MerId = "22"; // 商户编号 是 Max(11)
		String key = "35de170fc7836ea645e1a7d7b307ff6e"; // 商户密钥
		String p0_Cmd = "Buy"; // 业务类型 是 Max(20) 固定值“Buy” . 1

		String p2_Order = System.currentTimeMillis() + ""; // 商户订单号 否
															// Max(50)
															// 若不为””，提交的订单号必须在自身账户交易中唯一;为
															// ””
		String p3_Amt = getPara("testAmt", "2"); // 支付金额 否 Max(20)
								// 单位:元，精确到分.此参数为空则无法直连(如直连会报错：抱歉，交易金额太小。),必须到易宝网关让消费者输入金额
								// 4
		String p4_Cur = "CNY"; // 交易币种 是 Max(10) 固定值 ”CNY”. 5
		String p5_Pid = ""; // 商品名称 否 Max(20) 用于支付时显示在易宝支付网关左侧的订单产品信息.
		String p6_Pcat = ""; // 商品种类 否 Max(20) 商品种类.
		String p7_Pdesc = ""; // 商品描述 否 Max(20) 商品描述.
		String p8_Url = basePath + "/paydo/callback/"; // 商户接收支付成功数据的地址 否
														// Max(200)
														// 支付成功后易宝支付会向该地址发送两次成功通知
		String p9_SAF = ""; // 送货地址 否 Max(1) 为“1”: 需要用户将送货地址留在易宝支付系统;为“0”:
							// 不需要，默认为 ”0”. 10
		String pa_MP = ""; // 商户扩展信息 否 Max(200) 返回时原样返回，此参数如用到中文，请注意转码. 11
		String pd_FrpId = getPara("pd_FrpId", "weixin"); // 支付通道编码 否
															// Max(50)
															// 默认为 ””
															// ，到易宝支付网关，易宝支付网关默认显示已开通的全部支付通道.
		String pr_NeedResponse = ""; // 应答机制 否 Max(1) 固定值为“1”: 需要应答机制;
										// 收到易宝支付服务器点对点支付成功通知，必须回写以”success”（无关大小写）开头的字符串，即使您收到成功通知时发现该订单已经处理过，也要正确回写”success”，否则易宝支付将认为您的系统没有收到通知，启动重发机制，直到收到”success”为止。
		String hmac = ""; // 签名数据 Max(32) 产生hmac需要两个参数，并调用相关API.

		if(bankCardType.equals("01")){
			renderHtml("通道维护中！");
			return;
		}
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
		sbOld += p9_SAF;
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
		result += "&p9_SAF=" + p9_SAF;
		result += "&pa_MP=" + pa_MP;
		result += "&pd_FrpId=" + pd_FrpId;
		result += "&pr_NeedResponse=" + pr_NeedResponse;
		result += "&hmac=" + hmac;

		redirect(result);
	}

	public void callback() {
		HttpServletRequest request = getRequest();
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
		String reulst="";
		if (nhmac.equals(hmac)) {
			if ("1".equals(r1_Code)) {
				// 支付成功,请处理自己的逻辑 请注意通知可能会多次 请避免重复到帐

				if ("1".equals(r9_BType)) { // 同步通知 两者逻辑可同时处理
					reulst="支付成功!<br>商品ID:" + r5_Pid + "<br>商户订单号:" + r6_Order + "<br>支付金额:" + r3_Amt
							+ "<br>支付交易流水号:" + r2_TrxId + "<BR>";
				} else if ("2".equals(r9_BType)) { // 异步通知
					reulst="SUCCESS";
				}else{
					reulst = "支付异常，联系技术人员！";
				}
			} else {
				reulst="支付失败!";
			}
		} else {
			reulst="签名失败";
		}
		renderHtml(reulst);
	}
}
