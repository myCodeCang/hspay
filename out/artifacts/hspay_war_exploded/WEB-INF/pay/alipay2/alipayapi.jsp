<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@page import="com.pay.alipay.server.config.AlipayConfig"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		body{text-align:center;margin:0 atuto;}
		.pzs{
			margin: 0;font-family: 'Karla', sans-serif;
		  font-weight: bold;
		  color: #317eac;
		  text-rendering: optimizelegibility;
		}
		</style>
	</head>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

		//必填，不能修改
		//服务器异步通知页面路径
		String notify_url = (String)request.getAttribute("notify_url");
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		//页面跳转同步通知页面路径
		String return_url = (String)request.getAttribute("return_url");
		
		String defaultbank = (String)request.getAttribute("defaultbank"); 
		
		//卖家支付宝帐户
		String seller_email = (String)request.getAttribute("seller_email");
		//必填
		//商户订单号
		String out_trade_no = (String)request.getAttribute("out_trade_no");
		//商户网站订单系统中唯一订单号，必填
		//订单名称
		String subject = "在线支付";
		//必填
		//付款金额
		String total_fee = (String)request.getAttribute("total_fee");
		//必填
		//订单描述		String body = (String)request.getAttribute("body");

		//防钓鱼时间戳
		String anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数
		//客户端的IP地址
		String exter_invoke_ip = (String)request.getAttribute("exter_invoke_ip");
		//非局域网的外网IP地址，如：221.0.0.1
		
		String title = (String)request.getAttribute("title");
		String titletime = (String)request.getAttribute("titletime");
		String partner=(String)request.getAttribute("partner");
		String RSA_PRIVATE_KEY=(String)request.getAttribute("private_key");
		String ALIPAY_PUBLIC_KEY=(String)request.getAttribute("public_key");

		//////////////////////////////////////////////////////////////////////////////////

	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.WAP_URL, partner, RSA_PRIVATE_KEY, "json", AlipayConfig.WAP_CHARSET,ALIPAY_PUBLIC_KEY, AlipayConfig.WAP_SIGNTYPE);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(return_url);
	alipayRequest.setNotifyUrl(notify_url);
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_fee +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//输出
	out.println(result);
	%>
	<body>
<%-- 	<div style="margin-top: 250px" align="center" >
		<p class="pzs">${title }</p>
		<img src="<%=basePath %>/img/ajax-loaders/ajax-loader-7.gif" />
	</div> --%>
	</body>
<!-- 	<script type="text/javascript">
		function sub(){
			document.alipaysubmit.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub,titletime);
	</script> -->
</html>
