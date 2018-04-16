<%@page import="com.pay.mzfpay.service.DigestUtil"%>
<%@page import="java.net.URLDecoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String keyValue = (String) request.getAttribute("keyValue");
	String p0_Cmd = (String) request.getAttribute("p0_Cmd");
	String p1_MerId = (String) request.getAttribute("p1_MerId");
	String p2_Order = (String) request.getAttribute("p2_Order");
	String p3_Amt = (String) request.getAttribute("p3_Amt");
	String p4_Cur = (String) request.getAttribute("p4_Cur");
	String p5_Pid = (String) request.getAttribute("p5_Pid");
	if("".equals(p5_Pid) || p5_Pid==null){
		p5_Pid="Recharge";
	}else
		p5_Pid=new String(p5_Pid.getBytes(),"UTF-8");
	String p6_Pcat = (String) request.getAttribute("p6_Pcat");
	if("".equals(p6_Pcat) || p6_Pcat==null){
		p6_Pcat="Recharge";
	}else
		p6_Pcat=new String(p6_Pcat.getBytes(),"UTF-8");
	String p7_Pdesc = (String) request.getAttribute("p7_Pdesc");
	if("".equals(p7_Pdesc) || p7_Pdesc==null){
		p7_Pdesc="Recharge";
	}else
		p7_Pdesc=new String(p7_Pdesc.getBytes(),"UTF-8");
	String p8_Url = (String) request.getAttribute("p8_Url");
	String pa_MP =(String) request.getAttribute("pa_MP");
	if("".equals(pa_MP) || pa_MP==null){
		pa_MP="Recharge";
	}else
		pa_MP=new String(pa_MP.getBytes(),"UTF-8");
	String pd_FrpId = (String) request.getAttribute("pd_FrpId");
	String pr_NeedResponse = (String) request.getAttribute("pr_NeedResponse");
	String hmac = "";
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

	hmac = DigestUtil.hmacSign(sbOld, keyValue); // 数据签名
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
	<form name="hundredForm" action="http://www.8301.cn/hspay/node"
		method="post">
		<input type="hidden" name="p0_Cmd" value="<%=p0_Cmd%>" /> <input
			type="hidden" name="p1_MerId" value="<%=p1_MerId %>" /> <input
			type="hidden" name="p2_Order" value="<%=p2_Order%>" /><input
			type="hidden" name="p3_Amt" value="<%=p3_Amt%>"> <input
			type="hidden" name="p4_Cur" value="<%=p4_Cur%>" />  <input
			type="hidden" name="p5_Pid" value="<%=p5_Pid%>" /> <input
			type="hidden" name="p6_Pcat" value="<%=p6_Pcat%>" /> <input
			type="hidden" name="p7_Pdesc" value="<%=p7_Pdesc%>" /> <input
			type="hidden" name="p8_Url" value="<%=p8_Url%>" /> <input
			type="hidden" name="pa_MP" value="<%=pa_MP%>" /> <input
			type="hidden" name="pd_FrpId" value="<%=pd_FrpId %>" /> <input
			type="hidden" name="pr_NeedResponse" value="<%=pr_NeedResponse%>" /> <input
			type="hidden" name="hmac" value="<%=hmac%>" />
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