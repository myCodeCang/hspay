<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.pay.shpay.service.DigestUtil"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String customerid = (String) request.getAttribute("customerid");
	String keyValue = (String) request.getAttribute("keyValue");
	String superid = (String) request.getAttribute("superid");
    String sdcustomno = (String) request.getAttribute("sdcustomno");	//  商户订单号 否  Max(50) 若不为””，提交的订单号必须在自身账户交易中唯一;为 ””
    String ordermoney = (String)request.getAttribute("ordermoney");	//支付金额 否  Max(20)  单位:元，精确到分.此参数为空则无法直连(如直连会报错：抱歉，交易金额太小。),必须到易宝网关让消费者输入金额 4 
    String noticeurl = (String) request.getAttribute("noticeurl");	    // 商户接收支付成功数据的地址 否  Max(200) 支付成功后易宝支付会向该地址发送两次成功通知
    String backurl = (String) request.getAttribute("backurl");
    String endcustomer = (String) request.getAttribute("endcustomer");
    String endip = (String) request.getAttribute("endip");
    String remarks =(String) request.getAttribute("remarks");
    if(remarks==null)
    	remarks="123";
    String mark = (String) request.getAttribute("mark");
    if(mark==null)
    	mark="hspay";
    String faceno =(String) request.getAttribute("faceno");  //支付通道编码 否  Max(50) 默认为 ”” ，到易宝支付网关，易宝支付网关默认显示已开通的全部支付通道.
    String hmac = "";										// 签名数据    Max(32) 产生hmac需要两个参数，并调用相关API.
    
    String urlform="";
    String cardno="";
    String sbOld = "";
    String stype="1";
    String zftype="1";
    String payDes=new String("投诉举报QQ8747930".getBytes(),"GBK");
    System.out.println("--->>>>ordermoney="+ordermoney);
    if(faceno.equals("weixin")){
    	urlform="http://www.51card.cn/gateway/weixin/weixinpay.asp";
    	cardno="32";
    	BigDecimal money=new BigDecimal(NumberUtils.toDouble(ordermoney));
    	ordermoney=""+money.multiply(new BigDecimal(100)).intValue();
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&orderAmount="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&noticeurl="+noticeurl;
    	sbOld+="&backurl="+backurl;
        sbOld+=keyValue;
    }else if(faceno.equals("wxwap")){
       	urlform="http://www.51card.cn/gateway/weixinpay/wap-weixinpay.asp";
       	cardno="51";
    	BigDecimal money=new BigDecimal(NumberUtils.toDouble(ordermoney));
    	ordermoney=""+money.multiply(new BigDecimal(100)).intValue();
       	sbOld+="customerid="+customerid;
       	sbOld+="&sdcustomno="+sdcustomno;
       	sbOld+="&orderAmount="+ordermoney;
       	sbOld+="&cardno="+cardno;
       	sbOld+="&noticeurl="+noticeurl;
       	sbOld+="&backurl="+backurl;
        sbOld+=keyValue;
    }else if(faceno.equals("qqmobile")){
    	urlform="http://www.51card.cn/gateway/qqpay/qqpay.asp";
    	cardno="36";
    	BigDecimal money=new BigDecimal(NumberUtils.toDouble(ordermoney));
    	ordermoney=""+money.multiply(new BigDecimal(100)).intValue();
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&orderAmount="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&noticeurl="+noticeurl;
    	sbOld+="&backurl="+backurl;
        sbOld+=keyValue;
    }else if(faceno.equals("cft")){
    	urlform="http://www.51card.cn/gateway/tenpay/tenpay.asp";
    	cardno="35";
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&ordermoney="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&faceno="+faceno;
    	sbOld+="&noticeurl="+noticeurl;
    	sbOld+="&endcustomer="+endcustomer;
    	sbOld+="&endip="+endip;
    	sbOld+="&remarks="+remarks;
    	sbOld+="&mark="+mark;
        sbOld+="&key="+keyValue;
    }else if(faceno.equals("zfb34")){
    	urlform="http://www.51card.cn/gateway/alipay/alipay.asp";
    	faceno="zfb";
    	cardno="34";
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&ordermoney="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&faceno="+faceno;
    	sbOld+="&noticeurl="+noticeurl;
        sbOld+="&key="+keyValue;
    }else if(faceno.equals("zfb52")){
    	urlform="http://www.51card.cn/gateway/alipay/wap-alipay.asp";
    	faceno="zfb";
    	cardno="52";
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&ordermoney="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&faceno="+faceno;
    	sbOld+="&noticeurl="+noticeurl;
        sbOld+="&key="+keyValue;
    }else{
    	urlform="http://www.51card.cn/gateway/hfbcardpay.asp";
    	cardno="33";
    	sbOld+="customerid="+customerid;
    	sbOld+="&sdcustomno="+sdcustomno;
    	sbOld+="&ordermoney="+ordermoney;
    	sbOld+="&cardno="+cardno;
    	sbOld+="&faceno="+faceno;
    	sbOld+="&noticeurl="+noticeurl;
    	sbOld+="&endcustomer="+endcustomer;
    	sbOld+="&endip="+endip;
    	sbOld+="&remarks="+remarks;
    	sbOld+="&mark="+mark;
        sbOld+="&key="+keyValue;
    }
    hmac = DigestUtil.GetMD5(sbOld, true); //数据签名
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
	<form name="hundredForm" action="<%=urlform%>"
		method="post">
		<input type="hidden" name="customerid" value="<%=customerid%>" /> <input
			type="hidden" name="superid" value="100000" /><input
			type="hidden" name="sdcustomno" value="<%=sdcustomno %>" /> <input
			type="hidden" name="ordermoney" value="<%=ordermoney%>" /><input
			type="hidden" name="orderAmount" value="<%=ordermoney%>"> <input
			type="hidden" name="cardno" value="<%=cardno%>" />  <input
			type="hidden" name="faceno" value="<%=faceno%>" /> <input
			type="hidden" name="noticeurl" value="<%=noticeurl%>" /> <input
			type="hidden" name="backurl" value="<%=backurl%>" /> <input
			type="hidden" name="endcustomer" value="<%=endcustomer%>" /> <input
			type="hidden" name="endip" value="<%=endip%>" /> <input
			type="hidden" name="remarks" value="<%=remarks %>" /> <input
			type="hidden" name="mark" value="<%=mark%>" /> <input
			type="hidden" name="stype" value="<%=stype%>" /> <input
			type="hidden" name="zftype" value="<%=zftype%>" /> <input
			type="hidden" name="payDes" value="QQ8747930" />  <input
			type="hidden" name="sign" value="<%=hmac%>" />
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