<%@page import="com.pay.gopay.server.GopayUtils"%>
<%@page import="java.net.URLDecoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String version  = GopayUtils.isEmpty((String)request.getAttribute("version"));
	String charset  = GopayUtils.isEmpty((String)request.getAttribute("charset"));
	String language = GopayUtils.isEmpty((String)request.getAttribute("language"));
	String signType = GopayUtils.isEmpty((String)request.getAttribute("signType"));
	String tranCode = GopayUtils.isEmpty((String)request.getAttribute("tranCode"));
	String merchantID = GopayUtils.isEmpty((String)request.getAttribute("merchantID"));
	String merOrderNum = GopayUtils.isEmpty((String)request.getAttribute("merOrderNum"));
	String tranAmt = GopayUtils.isEmpty((String)request.getAttribute("tranAmt"));
	String feeAmt = GopayUtils.isEmpty((String)request.getAttribute("feeAmt"));
	String currencyType = GopayUtils.isEmpty((String)request.getAttribute("currencyType"));
	String frontMerUrl = GopayUtils.isEmpty((String)request.getAttribute("frontMerUrl"));
	String backgroundMerUrl = GopayUtils.isEmpty((String)request.getAttribute("backgroundMerUrl"));
	String tranDateTime = GopayUtils.isEmpty((String)request.getAttribute("tranDateTime"));
	String virCardNoIn = GopayUtils.isEmpty((String)request.getAttribute("virCardNoIn"));
	String tranIP = "116.12.80.10";//GopayUtils.isEmpty((String)request.getAttribute("tranIP"));
	String isRepeatSubmit = GopayUtils.isEmpty((String)request.getAttribute("isRepeatSubmit"));
	String goodsName = GopayUtils.isEmpty((String)request.getAttribute("goodsName"));
	String goodsDetail =  GopayUtils.isEmpty((String)request.getAttribute("goodsDetail"));
	String buyerName =   GopayUtils.isEmpty((String)request.getAttribute("buyerName"));
	String buyerContact = GopayUtils.isEmpty((String)request.getAttribute("buyerContact"));
	String merRemark1 = GopayUtils.isEmpty((String)request.getAttribute("merRemark1"));
	String merRemark2 = GopayUtils.isEmpty((String)request.getAttribute("merRemark2"));
	String bankCode = "";//GopayUtils.isEmpty((String)request.getAttribute("bankCode"));
	String userType = "";//GopayUtils.isEmpty((String)request.getAttribute("userType"));
	String VerficationCode = GopayUtils.isEmpty((String)request.getAttribute("VerficationCode"));
    String gopayServerTime = GopayUtils.getGopayServerTime();
	// 组织加密明文
	String plain = "version=[" + version + "]tranCode=[" + tranCode + "]merchantID=[" + merchantID + "]merOrderNum=[" + merOrderNum + "]tranAmt=[" + tranAmt + "]feeAmt=[" + feeAmt+ "]tranDateTime=[" + tranDateTime + "]frontMerUrl=[" + frontMerUrl + "]backgroundMerUrl=[" + backgroundMerUrl + "]orderId=[]gopayOutOrderId=[]tranIP=[" + tranIP + "]respCode=[]gopayServerTime=[" + gopayServerTime + "]VerficationCode=[" + VerficationCode + "]";

	String signValue = GopayUtils.md5(plain);
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
	<form name="hundredForm" action="<%=GopayUtils.gopay_gateway %>"
		method="post">
		<input type="hidden" name="version" value="<%=version%>" /> <input
			type="hidden" name="charset" value="<%=charset %>" /><input
			type="hidden" name="language" value="<%=language %>" /> <input
			type="hidden" name="signType" value="<%=signType%>" /><input
			type="hidden" name="tranCode" value="<%=tranCode%>"> <input
			type="hidden" name="merchantID" value="<%=merchantID%>" />  <input
			type="hidden" name="merOrderNum" value="<%=merOrderNum%>" /> <input
			type="hidden" name="tranAmt" value="<%=tranAmt%>" /> <input
			type="hidden" name="feeAmt" value="<%=feeAmt%>" /> <input
			type="hidden" name="currencyType" value="<%=currencyType%>" /> <input
			type="hidden" name="frontMerUrl" value="<%=frontMerUrl%>" /> <input
			type="hidden" name="backgroundMerUrl" value="<%=backgroundMerUrl %>" /> <input
			type="hidden" name="tranDateTime" value="<%=tranDateTime%>" /> <input
			type="hidden" name="virCardNoIn" value="<%=virCardNoIn%>" /> <input
			type="hidden" name="tranIP" value="<%=tranIP%>" /> <input
			type="hidden" name="isRepeatSubmit" value="<%=isRepeatSubmit %>" />  <input
			type="hidden" name="goodsName" value="<%=goodsName %>" /> <input
			type="hidden" name="goodsDetail" value="<%=goodsDetail %>" /> <input
			type="hidden" name="buyerName" value="<%=buyerName %>" /> <input
			type="hidden" name="buyerContact" value="<%=buyerContact %>" /> <input
			type="hidden" name="merRemark1" value="<%=merRemark1 %>" /> <input
			type="hidden" name="merRemark2" value="<%=merRemark2 %>" /> <input
			type="hidden" name="bankCode" value="<%=bankCode %>" /> <input
			type="hidden" name="userType" value="<%=userType %>" /> <input
			type="hidden" name="VerficationCode" value="<%=VerficationCode %>" /> <input
			type="hidden" name="gopayServerTime" value="<%=gopayServerTime %>" /> <input
			type="hidden" name="signValue" value="<%=signValue %>" />
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