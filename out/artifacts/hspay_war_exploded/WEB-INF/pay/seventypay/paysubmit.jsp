<%@page import="com.tool.MD5Utils"%>
<%@page import="java.net.URLDecoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String keyvalue = (String) request.getAttribute("keyvalue");
	String userid = (String) request.getAttribute("userid");
	String orderid = (String) request.getAttribute("orderid");
	String money = (String) request.getAttribute("money");
	String ext = (String) request.getAttribute("ext");
	String url = (String) request.getAttribute("url");
	String bankid = (String) request.getAttribute("bankid");
	if("".equals(ext) || ext==null){
		ext="Recharge";
	}else
		ext=new String(ext.getBytes("GB2312"),"UTF-8");
	
	String hmac1 = "",hmac2 = "";
	String sbOld1 = "userid="+userid;
	sbOld1 += "&orderid="+orderid;
	sbOld1 += "&bankid="+bankid;
	sbOld1 += "&keyvalue="+keyvalue;

	hmac1 = MD5Utils.createMD5(sbOld1); // 数据签名
	String sbOld2="money="+money;
	sbOld2 += "&userid="+userid;
	sbOld2 += "&orderid="+orderid;
	sbOld2 += "&bankid="+bankid;
	sbOld2 += "&keyvalue="+keyvalue;
	hmac2 = MD5Utils.createMD5(sbOld2);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<title>提交交易</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
body {
	text-align: center;
	margin: 0 atuto;
}

.pzs {
	margin: 0;
	font-family: 'Karla', sans-serif;
	font-weight: bold;
	color: #317eac;
	text-rendering: optimizelegibility;
}
</style>
</head>
<body>
	<div style="margin-top: 250px" align="center">
		<p class="pzs">${title }</p>
		<img src="<%=basePath%>/img/ajax-loaders/ajax-loader-7.gif" />
	</div>
	<form name="hundredForm" action="http://yy.yzch.net/pay.aspx"
		method="post">
		<input type="hidden" name="userid" value="<%=userid%>" /> <input
			type="hidden" name="orderid" value="<%=orderid %>" /> <input
			type="hidden" name="money" value="<%=money%>" /><input
			type="hidden" name="bankid" value="<%=bankid%>"> <input
			type="hidden" name="url" value="<%=url%>" /> <input
			type="hidden" name="aurl" value="<%=url%>" /> <input
			type="hidden" name="ext" value="<%=ext%>" /> <input
			type="hidden" name="sign" value="<%=hmac1%>" /> <input
			type="hidden" name="sign2" value="<%=hmac2%>" />
	</form>
	<script type="text/javascript">
		function sub() {
			document.hundredForm.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub, titletime);
	</script>
</body>
</html>