<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.pay.ysspay.server.*"%>
<%@page import="java.net.URLDecoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String keyvalue = (String) request.getAttribute("keyvalue");
	String platformID = (String) request.getAttribute("platformID");
	String merchNo = (String) request.getAttribute("merchNo");
	String amt = (String) request.getAttribute("amt");
	String orderNo = (String) request.getAttribute("orderNo");
	String tradeDate = (String) request.getAttribute("tradeDate");
	String merchUrl = (String) request.getAttribute("merchUrl");
	String tradeSummary = (String) request.getAttribute("tradeSummary");
	String bankCode = (String) request.getAttribute("bankCode");
	String apiName = (String) request.getAttribute("apiName");
	String choosePayType = (String) request.getAttribute("choosePayType");
	String merchParam = (String) request.getAttribute("merchParam");
	String customerIP = (String) request.getAttribute("customerIP");
	String apiVersion = "1.0.0.0";
	// 组织请求数据
	Map<String, String> paramsMap = new HashMap<String, String>();
	request.setCharacterEncoding("UTF-8");
	paramsMap.put("apiName", apiName);
	paramsMap.put("apiVersion", apiVersion);
	paramsMap.put("platformID", platformID);
	paramsMap.put("merchNo", merchNo);
	paramsMap.put("orderNo",orderNo);
	paramsMap.put("tradeDate", tradeDate);
	paramsMap.put("amt", amt);
	paramsMap.put("merchUrl", merchUrl);
	paramsMap.put("merchParam", merchParam);
	paramsMap.put("tradeSummary", tradeSummary);
	paramsMap.put("bankCode", bankCode);
	paramsMap.put("choosePayType", choosePayType);
	paramsMap.put("customerIP", customerIP);
	String paramsStr = MoboMerchant.generatePayRequest(paramsMap);	// 签名源数据
	String signMsg = SignUtil.signByMD5(paramsStr,keyvalue);	// 签名数据
	System.out.println("paramsStr>>>>>"+paramsStr);
	System.out.println("signMsg>>>>>>>"+signMsg);
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
	<form name="hundredForm" action="http://pay.ysspay.cn/cgi-bin/netpayment/pay_gate.cgi"
		method="post">
		<input type="hidden" name="apiName" value="<%=apiName%>" /> <input
			type="hidden" name="apiVersion" value="<%=apiVersion %>" /> <input
			type="hidden" name="platformID" value="<%=platformID%>" /><input
			type="hidden" name="merchNo" value="<%=merchNo%>"> <input
			type="hidden" name="orderNo" value="<%=orderNo%>" /> <input
			type="hidden" name="tradeDate" value="<%=tradeDate%>" /> <input
			type="hidden" name="amt" value="<%=amt%>" /> <input
			type="hidden" name="merchUrl" value="<%=merchUrl%>" /> <input
			type="hidden" name="merchParam" value="<%=merchParam%>" /> <input
			type="hidden" name="tradeSummary" value="<%=tradeSummary%>" /> <input
			type="hidden" name="bankCode" value="<%=bankCode%>" /> <input
			type="hidden" name="choosePayType" value="<%=choosePayType%>" /><input
			type="hidden" name="customerIP" value="<%=customerIP%>" /> <input
			type="hidden" name="signMsg" value="<%=signMsg%>" />
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