<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ include file="include/page.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String r=new String(((String)request.getParameter("reulst")).getBytes("ISO-8859-1"),"UTF-8");
	String reulst=URLDecoder.decode(r,"UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>轻松体验 - 秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<meta name="description" content="秒付宝，国内领先的第三方支付平台，致力于为企业和个人用户提供安全便捷的支付应用服务，完善的服 务体系，全新的产品体验，用户覆盖机票、酒店、游戏、生活服务等多个领域。" />
<meta name="keywords" content="秒付宝,电子支付/网上支付/安全支付/手机支付,安全购物/网络购物付款/付款/收款,水电煤缴费/信用卡 还款/AA收款/手机充值,网上付款/机票预订,秒付宝网站" />
<jsp:include page="include/script.jsp"></jsp:include>
<script src="<%=basePath %>/static/js/jquery.tabs.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("li#top1").addClass("active");
		$('.demo1').Tabs({
			event : 'click',
			callback : tabcallback
		});ss
	});

	function tabcallback() {
		var index = $(".current").index();
		if (index == 0) {
			$("#ccbnetb2c").attr("checked", true);
		} else if (index == 1) {
			$("#weixinId").attr("checked", true);
		} else if (index == 2) {
			$("#wxwap").attr("checked", true);
		} 

		if (index == 5) {
			$("#bankCardType").val("01");
			$("#Channel1").attr("checked", true);
		} else {
			$("#bankCardType").val("00");
		}
	}

    function sub() {
        $("#payfrom").submit();
    }
</script>
<style type="text/css">
.banner{ width:100%; border-top:1px solid #c6c4c9; border-bottom:1px solid #fff;position:relative;}
.pay{ width:1210px; margin:50px auto 30px auto; display:table}
.pay .title{ background:#F4F0E9; border-radius:10px; padding:20px 30px; border-bottom:5px #6C0460 solid; font-size:14px}
.pay .title span{ margin-right:60px}
.pay .title span em{ font-size:20px; font-weight:700; color:#FF7200}

.pay .bank{ width:100%; display:table;padding: 40px 0 0 0; }
.pay .bank .tab_menu{width:1213px;height:38px; position:relative;border-bottom:1px #6C9BC7 solid;border-left:1px #6C9BC7 solid;}
.pay .bank .tab_menu ul{ height:38px; width:100%; position:absolute; left:0px; bottom:0px}
.pay .bank .tab_menu li{width:120px;float:left;height:38px;line-height:38px;color:#555555;text-align:center;cursor:pointer; background:url(../images/t01.png)/*tpa=http://pay.qitianpay.com/static/demo/images/t01.png*/ no-repeat left bottom; font-size:14px; font-weight:700;border-right:1px #6C9BC7 solid;border-top:1px #6C9BC7 solid;}
.pay .bank .tab_menu li.current{color:#FFF;background:#6C9BC7 url(<%=basePath %>/static/new/images/d.jpg)/*tpa=http://pay.qitianpay.com/static/demo/images/d.jpg*/ no-repeat center bottom}
.pay .bank .tab_box{ border:1px #6C9BC7 solid;border-top:0px; padding:20px 0px 20px 20px; width:1192px; display:table}
.pay .bank .tab_box .hide{display:none;}
.pay .bank .tab_box .zhifu{ display:table; width:100%}
.pay .bank .tab_box .zhifu label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box .fastpay{ display:table; width:100%}
.pay .bank .tab_box .fastpay label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box img{vertical-align:middle; margin-left:10px}
.pay .bank .tab_box .qita{ padding-left:30px; width:100%; display:table; margin:20px 0px}
.pay .bank .tab_box .qita .tit{ color:#0066FF; font-size:12px;}
.pay .bank .tab_box .qita .tit em{ display:block; background:url(<%=basePath %>/static/new/images/d1.jpg)/*tpa=http://pay.qitianpay.com/static/demo/images/d1.jpg*/ no-repeat 50px center}
.pay .bank .tab_box .car{ line-height:30px; font-size:14px; color:#545454; padding-left:20px}
.pay .bank .tab_box .car label{ margin-right:20px}
.pay .bank .tab_box .btn{ padding-left:20px;margin:30px 0px 30px 0px}
.pay .bank .tab_box .btn a{ width:144px; height:44px; color:#FFF; line-height:44px; background:url(<%=basePath %>/static/new/images/next.png)/*tpa=http://pay.qitianpay.com/static/demo/images/next.png*/ no-repeat; display:block; text-indent:30px; font-size:16px}
img{display: contents;}
</style>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
    <form id="payfrom" action="<%=basePath%>/paydo" method="post" target="_blank">
        <input type="hidden" name="bankCardType" id="bankCardType" value="00"/>
        <input type="hidden" name="testAmt" value="1"/>
	<div class="banner">
		<div class="pay">
			<div class="title">
				<%=reulst %>
			</div>
		</div>
	</div>
	</form>
	<div class="cls"></div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>