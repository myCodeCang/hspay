<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.pay.jdpay.service.DigestUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String merchantId = DigestUtil.toEmpty((String) request.getAttribute("merchantId"));
	String keyValue = DigestUtil.toEmpty((String) request.getAttribute("keyValue"));
	String channelId = DigestUtil.toEmpty((String) request.getAttribute("channelId"));
	String sendTime = DigestUtil.toEmpty((String) request.getAttribute("sendTime"));
    String terminalOs = DigestUtil.toEmpty((String) request.getAttribute("terminalOs"));
    String orderId = DigestUtil.toEmpty((String) request.getAttribute("orderId"));
    String goodsTitle = DigestUtil.toEmpty((String) request.getAttribute("goodsTitle"));
    String goodsDesc = DigestUtil.toEmpty((String) request.getAttribute("goodsDesc"));
    String transAmt = DigestUtil.toEmpty((String) request.getAttribute("transAmt")); 
    String busType = DigestUtil.toEmpty((String) request.getAttribute("busType")); 
    String txnSubType = DigestUtil.toEmpty((String) request.getAttribute("txnSubType")); 
    String payType = DigestUtil.toEmpty((String) request.getAttribute("payType"));
    String backUrl = DigestUtil.toEmpty((String) request.getAttribute("backUrl"));
    String currency = DigestUtil.toEmpty((String) request.getAttribute("currency"));
    String sendIp = DigestUtil.toEmpty((String) request.getAttribute("sendIp"));
    String hmac = "";
    
    Map<String, String> map=new HashMap<String, String>();
    if("0701".equals(payType)){
    	//扫码支付
		map.put("application","PayQRCode.Req");
    }else if("0702".equals(payType)){
    	//条码支付
    	map.put("application","PayBarCode.Req");
    }
	map.put("sendTime", sendTime); 
	map.put("terminalOs",terminalOs);//终端类型03：平台
	map.put("channelId", channelId); 
	map.put("merchantId", merchantId); 
	map.put("orderId",orderId); 
	map.put("goodsTitle",goodsTitle);//商品标题
	map.put("goodsDesc",goodsDesc);//商品内容
	map.put("busType",busType);//01：支付宝 02：微信
	map.put("txnSubType",txnSubType);
	map.put("payType",payType);//0701：扫码支付
	int money=Integer.parseInt(transAmt)*100;
	transAmt=""+money;
	map.put("transAmt",transAmt);
	map.put("currency","156");
	map.put("backUrl",backUrl);
	map.put("sendIp","116.106.10.1");//商户ip
	String sign = DigestUtil.setSign(map,keyValue);
	map.put("sign",sign);
    JSONObject obj = new JSONObject();
    obj=JSONObject.fromObject(map);
	String ADD_URL="https://shopfront.jlishop.com/org.ac";//测试环境
	//String ADD_URL="https://front.jlishop.com/org.ac";//正式环境
	String resMsg = DigestUtil.sendPost(ADD_URL, obj.toString());      	
	System.out.println("返回报文："+resMsg.toString());
	//验签 
	JSONObject  jasonObject = JSONObject.fromObject(resMsg);
	Map map2 = (Map)jasonObject;
	String respMsgSign = map2.get("sign").toString();
	map2.remove("sign");
	String respSign = DigestUtil.setSign(map2,keyValue);
	String wxurl="";
	String BillNo="";
	String BillType="";
	if(respSign.equals(respMsgSign)){
		if("0701".equals(payType) && "00".equals(txnSubType)){
			BillType=busType;
			wxurl=(String)map2.get("payLink");
			BillNo=(String)map2.get("orderId");
		}else{
			BillNo="1";
		}
	}else{
		BillNo="2";
	}
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
	<% if(!"".equals(BillNo) && BillNo!=null && !"".equals(BillType) && BillType!=null && !"".equals(wxurl) && wxurl!=null){ %>
	<form name="hundredForm" action="<%=basePath%>/jdpay/sweeppayment" method="post">
		<input type="hidden" name="wxurl" value="<%=wxurl%>" /> <input
			type="hidden" name="BillNo" value="<%=BillNo %>" /><input
			type="hidden" name="BillType" value="<%=BillType %>" /><input
			type="hidden" name="transAmt" value="<%=""+(money/100) %>" /><input
			type="hidden" name="goodsTitle" value="<%=goodsTitle %>" />
	</form>
	<script type="text/javascript">
		function sub() {
			document.hundredForm.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub, titletime);
	</script>
	<%}else if("2".equals(BillNo)){ %>
	<script type="text/javascript">
		alert("签名错误，请联系管理员");
		window.close();
	</script>
	<% }else{ %>
	<script type="text/javascript">
		alert("通道正在建设中...");
		window.close();
	</script>
	<% }%>
</body>
</html>