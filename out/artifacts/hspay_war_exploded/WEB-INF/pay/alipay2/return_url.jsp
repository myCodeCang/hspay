<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.alipay.server.config.AlipayConfig"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	//获取支付宝GET过来反馈信息
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
	
		//付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String billnostr = BillNo.substring(0, 1);
		String billnos = BillNo.substring(0, 2);
		if (billnostr.equals("O")) {
			System.out.println("1接口订单进行时");
			YeepayService.service.netcallback(trade_no, BillNo, "",  sdf.format(new Date()),
					 sdf.format(new Date()));
			response.sendRedirect(basePath + "/shpay/shpayreturn?orderId=" + BillNo);
		} else if (billnos.equals("RE")) {
			System.out.println("1充值订单进行时");
			PaymentService.service.netcallback(trade_no, BillNo, "",  sdf.format(new Date()),
					 sdf.format(new Date()));
			response.sendRedirect(basePath+"/payment/showPayOk");
			System.out.println("1充值订单结束");
		}
	}else{
		//该页面可做页面美工编辑
		out.println("交易签名被穿改");
	}
%>
  </body>
</html>