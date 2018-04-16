<%@page import="com.pay.hundred.server.DigestUtil"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String p1_MerId = (String) request.getAttribute("MerNo");
	String p0_Cmd = "Buy";
	String key = (String) request.getAttribute("keyValue");

	//PaymentType = 银行代码:(空值为跳转到银联)
	//工行		"ICBC"
	//农行		"ABC"
	//中行		"BOCSH"
	//建行		"CCB"
	//招行		"CMB"
	//浦发		"SPDB"
	//广发		"GDB"
	//交行		"BOCOM"
	//邮储		"PSBC"
	//中信		"CNCB"
	//民生		"CMBC"
	//光大		"CEB"
	//华夏		"HXB"
	//兴业		"CIB"

	String PayType = "CSPAY";//CSPAY:网银支付 ; NCPAY:无卡支付;UNION:银联无卡网银合并


    String p2_Order = (String) request.getAttribute("BillNo");	//  商户订单号 否  Max(50) 若不为””，提交的订单号必须在自身账户交易中唯一;为 ””
    String p3_Amt = (String) request.getAttribute("Amount");	//支付金额 否  Max(20)  单位:元，精确到分.此参数为空则无法直连(如直连会报错：抱歉，交易金额太小。),必须到易宝网关让消费者输入金额 4 
    String p4_Cur = "CNY";									//  交易币种 是  Max(10)  固定值 ”CNY”. 5 
    String p5_Pid = "";									// 商品名称 否  Max(20) 用于支付时显示在易宝支付网关左侧的订单产品信息.
    String p6_Pcat = "";									// 商品种类 否  Max(20)  商品种类.
    String p7_Pdesc = ""; 									//商品描述 否  Max(20)  商品描述.
    String p8_Url = (String) request.getAttribute("ReturnURL");;	    // 商户接收支付成功数据的地址 否  Max(200) 支付成功后易宝支付会向该地址发送两次成功通知
    String p9_SAF = ""; 									// 送货地址 否  Max(1) 为“1”: 需要用户将送货地址留在易宝支付系统;为“0”: 不需要，默认为 ”0”. 10 
    String pa_MP = "";										// 商户扩展信息 否  Max(200)  返回时原样返回，此参数如用到中文，请注意转码. 11 
    String pd_FrpId =(String) request.getAttribute("PaymentType");  //支付通道编码 否  Max(50) 默认为 ”” ，到易宝支付网关，易宝支付网关默认显示已开通的全部支付通道.
    String pr_NeedResponse = "1"; 							// 应答机制 否  Max(1) 固定值为“1”: 需要应答机制; 收到易宝支付服务器点对点支付成功通知，必须回写以”success”（无关大小写）开头的字符串，即使您收到成功通知时发现该订单已经处理过，也要正确回写”success”，否则易宝支付将认为您的系统没有收到通知，启动重发机制，直到收到”success”为止。 
    String hmac = "";										// 签名数据    Max(32) 产生hmac需要两个参数，并调用相关API.
    
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
    sbOld += p9_SAF;
    sbOld += pa_MP;
    sbOld += pd_FrpId;
    sbOld += pr_NeedResponse;
    
    hmac = DigestUtil.hmacSign(sbOld, key); //数据签名
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
	<form name="hundredForm" action="http://api.101ka.com/GateWay/Bank/Default.aspx"
		method="post">

		<input type="hidden" name="p0_Cmd" value="<%=p0_Cmd%>" /> <input
			type="hidden" name="p1_MerId" value="<%=p1_MerId%>" /> <input
			type="hidden" name="p2_Order" value="<%=p2_Order%>" /> <input
			type="hidden" name="p3_Amt" value="<%=p3_Amt%>" /> <input
			type="hidden" name="p4_Cur" value="<%=p4_Cur%>"> <input
			type="hidden" name="p5_Pid" value="<%=p5_Pid%>" /> <input
			type="hidden" name="p6_Pcat" value="<%=p6_Pcat%>" /> <input
			type="hidden" name="p7_Pdesc" value="<%=p7_Pdesc%>" /> <input
			type="hidden" name="p8_Url" value="<%=p8_Url%>" /> <input
			type="hidden" name="p9_SAF" value="<%=p9_SAF%>" /> <input
			type="hidden" name="pa_MP" value="<%=pa_MP%>" /> <input
			type="hidden" name="pd_FrpId" value="<%=pd_FrpId%>" /> <input
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