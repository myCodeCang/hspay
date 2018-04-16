<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
	request.setCharacterEncoding("utf-8");
	String r=new String(((String)request.getParameter("reulst")).getBytes("ISO-8859-1"),"UTF-8");
	String reulst=URLDecoder.decode(r,"UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang=en>
<head>
<meta charset=UTF-8>
<title>联系我们_赛富特</title>
<link href="css/common.css?2a41eea31d84eb72bbce" rel="stylesheet">

<style type="text/css">
.banner{ width:100%; border-top:1px solid #c6c4c9; border-bottom:1px solid #fff;position:relative;}
.pay{ width:1210px; margin:100px auto 30px auto; display:table}
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
.pay .bank .tab_box .btn a{ width:144px; height:44px; color:#FFF; line-height:44px;background:url(/pay/static/new/images/next.png) no-repeat;  display:block; text-indent:30px; font-size:16px}
img{display: contents;}
</style>
</head>
<body>
<div class="header">
  <div class="header-main clearfix">
    <h1 id="logo"><a href="index.html">首页</a></h1>
    <div class="nav-box">
      <ul class="nav" id="nav">
        <li class="more"> <a href="#nogo">产品与服务</a>
          <div class="nav-line"></div>
          <div class="sub-nav product-list">
            <ul>
              <li> <a href="polyPay.html">聚合支付</a> </li>
              <li> <a href="scancode.html" onClick="sa.track(&quot;activityClicks&quot;,{name:&quot;扫码支付&quot;,platformType:&quot;pc&quot;})">扫码支付</a> </li>
              <li> <a href="cashCompass.html" onClick="sa.track(&quot;activityClicks&quot;,{name:&quot;现金罗盘&quot;,platformType:&quot;pc&quot;})">现金罗盘</a> </li>
              <li> <a href="allDirectionData.html">八方数据</a> </li>
            </ul>
          </div>
        </li>
        <li class="more"> <a href="#nogo">解决方案</a>
          <div class="nav-line"></div>
          <div class="sub-nav scheme">
            <ul>
              <li> <a href="cashFlow.html">流量变现</a> </li>
              <li> <a href="fundDeposit.html">资金存管</a> </li>
              <li> <a href="enterpriseFin.html">企业理财</a> </li>
              <li> <a href="supply.html">供应链金融</a> </li>
              <li> <a href="stagepay.html" onClick="sa.track(&quot;activityClicks&quot;,{name:&quot;分期支付&quot;,platformType:&quot;pc&quot;,position:&quot;header-nav&quot;})">分期支付</a> </li>
            </ul>
          </div>
        </li>
        <li class="more"> <a href="#nogo">开发者中心</a>
          <div class="nav-line"></div>
          <div class="sub-nav developer-center">
            <ul>
              <li> <a href="quickStart.html">开发指南</a> </li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
    <div class="login-box">
      <div style="float: left;margin-top: 22px;margin-bottom: 22px;padding-right: 42px;padding-left: 33px;height: 26px;font-size: 14px;line-height: 26px;color: #333;background-position: 0 0;">&nbsp;</div>
      <div class="no_login" style="display: block;"> <a class="login-btn" href="login.html">登录</a><a class="reg-btn" href="register.html" onClick="sa.track(&quot;registerBtnClicks&quot;,{platformType:&quot;pc&quot;,position:&quot;头部右上角&quot;,pageUrl:location.href})">注册</a> </div>
      
    </div>
  </div>
</div>
<div class=contactus>
  <div class="container clearfix">
 
		<div class="pay">
			<div class="title">
				<%=reulst %>
			</div>
		</div>
  </div>
</div>
<script type="text/javascript" src="js/common.js?2a41eea31d84eb72bbce"></script>
<script type="text/javascript" src="js/product.js?2a41eea31d84eb72bbce"></script>
</body>
</html>