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
	String keyValue = formatString("35de170fc7836ea645e1a7d7b307ff6e"); // �̼���Կ
	String nodeAuthorizationURL = formatString("http://localhost:8080/pay/hspay/node"); // ���������ַ
	// �̼������û�������Ʒ��֧����Ϣ
	String memberid = formatString(request.getParameter("memberid")); // ����֧�����󣬹̶�ֵ ��Buy��
	String cardid = formatString(request.getParameter("cardid")); // �̻����
	String orderno = formatString(request.getParameter("orderno")); // �̻�������
	String money = formatString(request.getParameter("money")); // ֧�����
	String cardno = formatString(request.getParameter("cardno")); // ��Ʒ����
	String cardpwd = formatString(request.getParameter("cardpwd")); // ��Ʒ����
	String url = formatString(request.getParameter("url")); // ��Ʒ����
	String hmac = formatString(""); // ����ǩ����

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
