<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ include file="../../../index_tf/include/page.jsp"%>
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
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/shanghu.css">
<style type="text/css">
.banner{ width:100%; border-top:1px solid #c6c4c9; border-bottom:1px solid #fff;position:relative;}
.pay{ width:1210px; margin:50px auto 30px auto; display:table}
.pay .title{ background:#F4F0E9; border-radius:10px; padding:20px 30px; border-bottom:5px #ABA1AA solid; font-size:14px}
.pay .title span{ margin-right:60px}
.pay .title span em{ font-size:20px; font-weight:700; color:#FF7200}

.pay .bank{ width:100%; display:table;padding: 40px 0 0 0; }
.pay .bank .tab_menu{width:1213px;height:38px; position:relative;border-bottom:1px #6C9BC7 solid;border-left:1px #6C9BC7 solid;}
.pay .bank .tab_menu ul{ height:38px; width:100%; position:absolute; left:0px; bottom:0px}
.pay .bank .tab_menu li{width:120px;float:left;height:38px;line-height:38px;color:#555555;text-align:center;cursor:pointer; font-size:14px; font-weight:700;border-right:1px #6C9BC7 solid;border-top:1px #6C9BC7 solid;}
.pay .bank .tab_menu li.current{color:#FFF;background:#6C9BC7;}
.pay .bank .tab_box{ border:1px #6C9BC7 solid;border-top:0px; padding:20px 0px 20px 20px; width:1192px; display:table}
.pay .bank .tab_box .hide{display:none;}
.pay .bank .tab_box .zhifu{ display:table; width:100%}
.pay .bank .tab_box .zhifu label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box .fastpay{ display:table; width:100%}
.pay .bank .tab_box .fastpay label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box img{vertical-align:middle; margin-left:10px}
.pay .bank .tab_box .qita{ padding-left:30px; width:100%; display:table; margin:20px 0px}
.pay .bank .tab_box .qita .tit{ color:#0066FF; font-size:12px;}
.pay .bank .tab_box .qita .tit em{ display:block; }
.pay .bank .tab_box .car{ line-height:30px; font-size:14px; color:#545454; padding-left:20px}
.pay .bank .tab_box .car label{ margin-right:20px}
.pay .bank .tab_box .btn{ padding-left:20px;margin:30px 0px 30px 0px;width: 100px;}
.pay .bank .tab_box .btn a{ width:144px; height:44px; color:#FFF; line-height:44px; display:block; text-indent:30px; font-size:16px}
img{display: contents;}
</style>
</head>
<body>

<!-- header -->

<div class="head clearfix">

	<div class="wrap">

    	<div class="head-nav">

        	<a href="index.html">首页</a>

        	<a href="index.html#id1">收款</a>

        	<a href="index.html#id2">付款</a>

        	<a href="zhanghu.html">账户体系</a>
        	<a href="test.html" class="cur">轻松体验</a>

        </div>

        <div class="head-link">

        	<a href="../login.html" title="登录商户站" target="_blank">登录</a>

        </div>

    </div>

</div>
<div class="pay-box">
		<div class="pay">
			<div class="title">
				<%=reulst %>
			</div>
		</div>
</div>



<!-- footer -->

<div class="footer">

	<div class="footer-nav">

    	<a href="renzheng.html">认证支付</a>

        <span>|</span>

        <a href="kuaijie.html">快捷支付</a>

        <span>|</span>

        <a href="http://www.miaojiesuan.net/" target="_blank">人民币提现</a>

        <span>|</span>

        <a href="zhanghu.html">账户体系</a>

        <span>|</span>

        <a href="../zhaopin/index.html" target="_blank">诚聘英才</a>

        <span>|</span>

        <a href="../i/contact.html" target="_blank">联系我们</a>

        <span>|</span>

        <a href="../gongyi/index.html" target="_blank">秒付宝公益</a>

    </div>

    <div class="icp">版权归成都华翔通达网络科技有限公司所有 　工信部备案号：蜀ICP备17000687号</div>	

</div>

<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>
</html>