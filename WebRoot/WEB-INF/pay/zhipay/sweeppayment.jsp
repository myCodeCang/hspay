<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.pay.jdpay.service.DigestUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	String wxurl = DigestUtil.toEmpty((String) request.getAttribute("wxurl"));
	String BillNo = DigestUtil.toEmpty((String) request.getAttribute("BillNo"));
	String BillType = DigestUtil.toEmpty((String) request.getAttribute("BillType"));
	String transAmt = DigestUtil.toEmpty((String) request.getAttribute("transAmt"));
	String goodsTitle = DigestUtil.toEmpty((String) request.getAttribute("goodsTitle"));
	String titled="欢迎使用扫码支付";
	if("alipay_scan".equals(BillType)){
		titled+="，支付宝支付";
	}else if("weixin_scan".equals(BillType)){
		titled+="，微信支付";
	}else if("tenpay_scan".equals(BillType)){
		titled+="，财付通支付";
	}
	if("1".equals(BillNo)){
		out.println("暂未开放此接口！");
		return;
	}else if("1".equals(BillNo)){
		out.println("参数错误");
		return;
	}

	String billnostr = BillNo.substring(0, 1);
	String billnos = BillNo.substring(0, 2);
	String relustUrl="";
	if (billnostr.equals("O")) {
		relustUrl=basePath + "/shpay/shpayreturn?orderId=" + BillNo;
	}else {
		relustUrl=basePath+"/payment/showPayOk";
	}
%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<title>提交交易</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<style>
html,body{margin:0px auto;}

/* 清除内外边距 */
body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td { margin:0;padding:0; }
body{margin:0;padding:0; background:#ecfaff url(../images/bg.jpg) no-repeat center top; color:#444}

/* 设置默认字体 */
body,button,input,select,textarea { font:14px/1.5 \5b8b\4f53,arial,sans-serif;font-family:"微软雅黑","宋体",Arial, Helvetica, sans-serif;}
h1,h2,h3,h4,h5,h6 { font-size:100%; line-height:1.1em;}
address,cite,dfn,em,var { font-style:normal; }
code,kbd,pre,samp { font-family:Arial, Helvetica, sans-serif; }
small { font-size:12px; }
ul,ol,li{ list-style:none; }
a,a:link,a:visited,a:active {color: #333333;text-decoration: none;}
a:hover {color: #ff0000;text-decoration: none;}
.orange{color:#fa7800;}
/* 清除浮动 */
.clear {height:0;overflow:hidden;clear:both;font-size: 0px;line-height: 0px;}

.wrap{ width:994px; margin:0 auto; border:3px solid #0ca5d6; overflow:hidden; background:#fff;}
.left{ float:left; padding:150px 0 0 42px; width:528px;}
.left li{ height:36px; margin-bottom:42px; line-height:36px; font-size:18px;}
.left li img{ float:left; width:36px; height:36px; margin-right:10px;}
.left li .con{ position:relative; }
.right{ float:left; width:408px; text-align:center;}
.right h1{ height:96px; line-height:96px; font-size:24px; font-weight:normal}
.ewm{ width:328px; background:url(../images/ewm.png) no-repeat; height:390px; margin:0 auto;}
.ewm-img{ width:236px; height:236px; padding-top:38px; margin-left:20px;}
.right .text{ height:82px; line-height:82px; font-size:16px;}
.foot{ height:30px; line-height:30px; text-align:center;}
.ad{ margin:0 auto; text-align:center;}
</style>
<script>
var times=1;

function clock() {
    $.ajax({
        type: 'get',
        url: "<%=basePath %>/zhipay/order",
        data:{BillNo:'<%=BillNo %>'},
        success: function (result) {
            checkResult(result);
        }
    });
}

function checkResult(result) {
    if (result == "0") {
        //执行定时请求
		if (times<100)
		{
			 setTimeout("clock();", 2000);
			 times++;
		}

    } else if (result=="1")
	{
			$("#codem").hide();
			$("#res").show();
			setTimeout("jumpUrl();", 500);
	}
}

function jumpUrl()
{
	document.location.href="<%=relustUrl %>";
}

$(document).ready(function(){
	setTimeout("clock();", 5000);
});

</script>
</head>
<body>
<div style="text-align: center;height: 90px;font-family:'微软雅黑','宋体',Arial, Helvetica, sans-serif;"><h1 style="padding-top: 30px;font-size: 50px;"><%=titled %></h1></div>
<div class="wrap">
    <ul class="left">
        <li><img src="<%=basePath %>/static/images/icon-01.png"><div class="con">支付描述：<%=goodsTitle %></div></li>
        <li><img src="<%=basePath %>/static/images/icon-02.png"><div class="con">订单号：<%=BillNo %></div></li>
        <li><img src="<%=basePath %>/static/images/icon-03.png"><div class="con">请在提交订单后 <span class="orange">5分钟</span> 内完成支付</div></li>
        <li><img src="<%=basePath %>/static/images/icon-04.png"><div class="con">订单提交成功，请尽快完成支付！</div></li>
        <li><img src="<%=basePath %>/static/images/icon-00.png"><div class="con" style="color: red;">如提示收款账户异常，请关闭本页重新发起交易！</div></li>
    </ul>
    <div class="right">
        <h1>请扫码支付，金额：<span class="orange"><span class="orange"><%=transAmt %></span>元</span></h1>
        <div class="ewm">
           <div class="ewm-img"><img src="<%=basePath %><%=wxurl %>" width="236"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>

</body>
</html>