<%@page language="java" contentType="text/html;charset=gbk"%>
<%@page import="com.yeepay.PaymentForOnlineService"%>
<%@page import="com.pay.cardyee.server.util.EncodeUtils" %>
<%!String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}%>
<%
	request.setCharacterEncoding("GBK");
	String keyValue = formatString("35de170fc7836ea645e1a7d7b307ff6e"); // 商家密钥
	String nodeAuthorizationURL = formatString("http://localhost:8080/pay/hspay/node"); // 交易请求地址
	// 商家设置用户购买商品的支付信息
	String memberid = formatString(request.getParameter("memberid")); // 在线支付请求，固定值 ”Buy”
	String cardid = formatString(request.getParameter("cardid")); // 商户编号
	String orderno = formatString(request.getParameter("orderno")); // 商户订单号
	String money = formatString(request.getParameter("money")); // 支付金额
	String cardno = formatString(request.getParameter("cardno")); // 商品名称
	String cardpwd = formatString(request.getParameter("cardpwd")); // 商品种类
	String url = formatString(request.getParameter("url")); // 商品描述
	String hmac = formatString(""); // 交易签名串

	String md5src = "userid=" + memberid + "&orderno=" + orderno + "&typeid="+cardid+"&cardno=" + cardno
			+ "&encpwd=0&cardpwd=" + cardpwd + "&cardpwdenc=&money=" + money
			+ "&url=" + url + "&keyvalue=" + keyValue;
	System.out.print(md5src);
	hmac = EncodeUtils.testDigest(md5src);
%>
<html>
<head>
<title>To YeePay Page</title>
</head>
<body>
	<form name="yeepay" action='http://localhost:8080/pay/seventycard/node' method='POST' target="_blank">
		<input type='hidden' name='memberid' value='<%=memberid%>'> 
		<input type='hidden' name='cardid' value='<%=cardid%>'> 
		<input type='hidden' name='orderno' value='<%=orderno%>'> 
		<input type='hidden' name='money' value='<%=money%>'> 
		<input type='hidden' name='cardno' value='<%=cardno%>'>
		<input type='hidden' name='cardpwd' value='<%=cardpwd%>'> 
		<input type='hidden' name='url' value='<%=url%>'> 
		<input type='hidden' name='signs' value='<%=hmac%>'> 
		<input type='submit' />
	</form>
</body>
</html>
