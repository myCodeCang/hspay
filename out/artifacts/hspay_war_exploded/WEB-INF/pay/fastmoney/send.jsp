<%@page import="com.pay.fastmoney.server.Pkipair"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>



<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	//人民币网关账号，该账号为11位人民币网关商户编号+01,该参数必填。
	String merchantAcctId = (String)request.getAttribute("merchantAcctId");
	//编码方式，1代表 UTF-8; 2 代表 GBK; 3代表 GB2312 默认为1,该参数必填。
	String inputCharset = "1";
	//接收支付结果的页面地址，该参数一般置为空即可。
	String pageUrl = "";
	//服务器接收支付结果的后台地址，该参数务必填写，不能为空。
	String bgUrl = (String)request.getAttribute("bgUrl");
	//网关版本，固定值：v2.0,该参数必填。
	String version =  "v2.0";
	//语言种类，1代表中文显示，2代表英文显示。默认为1,该参数必填。
	String language =  "1";
	//签名类型,该值为4，代表PKI加密方式,该参数必填。
	String signType =  "4";
	//支付人姓名,可以为空。
	String payerName= ""; 
	//支付人联系类型，1 代表电子邮件方式；2 代表手机联系方式。可以为空。
	String payerContactType =  "";
	//支付人联系方式，与payerContactType设置对应，payerContactType为1，则填写邮箱地址；payerContactType为2，则填写手机号码。可以为空。
	String payerContact =  "";
	//商户订单号，以下采用时间来定义订单号，商户可以根据自己订单号的定义规则来定义该值，不能为空。
	String orderId = (String)request.getAttribute("orderId");
	//订单金额，金额以“分”为单位，商户测试以1分测试即可，切勿以大金额测试。该参数必填。
	String orderAmount = (String)request.getAttribute("orderAmount");
	//订单提交时间，格式：yyyyMMddHHmmss，如：20071117020101，不能为空。
	String orderTime = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	//商品名称，可以为空。
	String productName= formatString((String)request.getAttribute("productName")); 
	//商品数量，可以为空。
	String productNum = "";
	//商品代码，可以为空。
	String productId = "";
	//商品描述，可以为空。
	String productDesc = formatString((String)request.getAttribute("productDesc"));
	//扩展字段1，商户可以传递自己需要的参数，支付完快钱会原值返回，可以为空。
	String ext1 = "";
	//扩展自段2，商户可以传递自己需要的参数，支付完快钱会原值返回，可以为空。
	String ext2 = "";
	//支付方式，一般为00，代表所有的支付方式。如果是银行直连商户，该值为10，必填。
	String payType = "10";
	//银行代码，如果payType为00，该值可以为空；如果payType为10，该值必须填写，具体请参考银行列表。
	String bankId = (String)request.getAttribute("bankId");
	//同一订单禁止重复提交标志，实物购物车填1，虚拟产品用0。1代表只能提交一次，0代表在支付不成功情况下可以再提交。可为空。
	String redoFlag = "";
	//快钱合作伙伴的帐户号，即商户编号，可为空。
	String pid = "";
	// signMsg 签名字符串 不可空，生成加密签名串
	String signMsgVal = "";
	signMsgVal = appendParam(signMsgVal, "inputCharset", inputCharset);
	signMsgVal = appendParam(signMsgVal, "pageUrl", pageUrl);
	signMsgVal = appendParam(signMsgVal, "bgUrl", bgUrl);
	signMsgVal = appendParam(signMsgVal, "version", version);
	signMsgVal = appendParam(signMsgVal, "language", language);
	signMsgVal = appendParam(signMsgVal, "signType", signType);
	signMsgVal = appendParam(signMsgVal, "merchantAcctId",merchantAcctId);
	signMsgVal = appendParam(signMsgVal, "payerName", payerName);
	signMsgVal = appendParam(signMsgVal, "payerContactType",payerContactType);
	signMsgVal = appendParam(signMsgVal, "payerContact", payerContact);
	signMsgVal = appendParam(signMsgVal, "orderId", orderId);
	signMsgVal = appendParam(signMsgVal, "orderAmount", orderAmount);
	signMsgVal = appendParam(signMsgVal, "orderTime", orderTime);
	signMsgVal = appendParam(signMsgVal, "productName", productName);
	signMsgVal = appendParam(signMsgVal, "productNum", productNum);
	signMsgVal = appendParam(signMsgVal, "productId", productId);
	signMsgVal = appendParam(signMsgVal, "productDesc", productDesc);
	signMsgVal = appendParam(signMsgVal, "ext1", ext1);
	signMsgVal = appendParam(signMsgVal, "ext2", ext2);
	signMsgVal = appendParam(signMsgVal, "payType", payType);
	signMsgVal = appendParam(signMsgVal, "bankId", bankId);
	signMsgVal = appendParam(signMsgVal, "redoFlag", redoFlag);
	signMsgVal = appendParam(signMsgVal, "pid", pid);
	Pkipair pki = new Pkipair();
	System.out.println(signMsgVal);
	String signMsg = pki.signMsg(signMsgVal);
	//System.out.println(signMsg);
%>

<%!public String appendParam(String returns, String paramId, String paramValue) {
		if (returns != "") {
			if (paramValue != "") {

				returns += "&" + paramId + "=" + paramValue;
			}

		} else {

			if (paramValue != "") {
				returns = paramId + "=" + paramValue;
			}
		}

		return returns;
	}
String formatString(String text){ 
	if(text == null) {
		return ""; 
	}
	return text;
}
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
	<body>
	<div style="margin-top: 250px" align="center" >
		<p class="pzs">${title }</p>
		<img src="<%=basePath %>/img/ajax-loaders/ajax-loader-7.gif" />
	</div>
		<form name="kqPay" action="https://www.99bill.com/gateway/recvMerchantInfoAction.htm" method="post">
			<input type="hidden" name="inputCharset" value="<%=inputCharset%>" />
			<input type="hidden" name="pageUrl" value="<%=pageUrl%>" />
			<input type="hidden" name="bgUrl" value="<%=bgUrl%>" />
			<input type="hidden" name="version" value="<%=version%>" />
			<input type="hidden" name="language" value="<%=language%>" />
			<input type="hidden" name="signType" value="<%=signType%>" />
			<input type="hidden" name="signMsg" value="<%=signMsg%>" />
			<input type="hidden" name="merchantAcctId" value="<%=merchantAcctId%>" />
			<input type="hidden" name="payerName" value="<%=payerName%>" />
			<input type="hidden" name="payerContactType" value="<%=payerContactType%>" />
			<input type="hidden" name="payerContact" value="<%=payerContact%>" />
			<input type="hidden" name="orderId" value="<%=orderId%>" />
			<input type="hidden" name="orderAmount" value="<%=orderAmount%>" />
			<input type="hidden" name="orderTime" value="<%=orderTime%>" />
			<input type="hidden" name="productName" value="<%=productName%>" />
			<input type="hidden" name="productNum" value="<%=productNum%>" />
			<input type="hidden" name="productId" value="<%=productId%>" />
			<input type="hidden" name="productDesc" value="<%=productDesc%>" />
			<input type="hidden" name="ext1" value="<%=ext1%>" />
			<input type="hidden" name="ext2" value="<%=ext2%>" />
			<input type="hidden" name="payType" value="<%=payType%>" />
			<input type="hidden" name="bankId" value="<%=bankId%>" />
			<input type="hidden" name="redoFlag" value="<%=redoFlag%>" />
			<input type="hidden" name="pid" value="<%=pid%>" />
		</form>
	</body>
	<script type="text/javascript">
		function sub(){
			document.kqPay.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub,titletime);
	</script>
</html>