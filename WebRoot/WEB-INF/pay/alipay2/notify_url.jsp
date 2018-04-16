<%@page import="com.jsp.payment.service.PaymentService"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.alipay.server.config.AlipayConfig"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%
/* *
 功能：支付宝服务器异步通知页面
 版本：3.3
 日期：2012-08-17
 说明：
 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
 该页面调试工具请使用写文本函数logResult，该函数在com.alipay.util文件夹的AlipayNotify.java类文件中
 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
 //********************************
 * */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	//获取支付宝POST过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	Gateway gateway = Gateway.dao.findById(25);
	boolean signVerified = AlipaySignature.rsaCheckV1(params, gateway.getStr("gateway_channelid"), AlipayConfig.WAP_CHARSET, AlipayConfig.WAP_SIGNTYPE);
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

	if(signVerified) {//验证成功
		//商户订单号
		String BillNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

		//通知到账时间
		String notify_time = new String(request.getParameter("notify_time").getBytes("ISO-8859-1"),"UTF-8");
		if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				String billnostr = BillNo.substring(0, 1);
				String billnos = BillNo.substring(0, 2);
				if (billnostr.equals("O")) {
					System.out.println("1接口订单进行时");
					YeepayService.service.netcallback(trade_no, BillNo, "", notify_time,
							notify_time);
				} else if (billnos.equals("RE")) {
					System.out.println("1充值订单进行时");
					PaymentService.service.netcallback(trade_no, BillNo, "", notify_time,
							notify_time);
					System.out.println("1充值订单结束");
				}
		}else{
			String billnostr = BillNo.substring(0, 1);
			String billnos = BillNo.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("1接口订单进行时");
				YeepayService.service.failure(BillNo, notify_time);
			} else if (billnos.equals("RE")) {
				System.out.println("1充值订单进行时");
				PaymentService.service.failure(BillNo, notify_time);
				response.sendRedirect(basePath + "/payment/showPayOk");
				System.out.println("1充值订单结束");
			}
		}
		out.println("success");	//请不要修改或删除
	}else{//验证失败
		out.println("交易签名穿改");
	}
%>
