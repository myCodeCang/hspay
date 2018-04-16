<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<jsp:include page="include/script1.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<script type="text/javascript" language="javascript">
		document.getElementById('ins4').className = 'on';
	</script>

	<div id="m_banner_pay"></div>
	<div id="m_header2"></div>
	<div class="m2_main height1100">
		<div class="m2_main_l">
			<div class="m2_main_l_tit">支付方式</div>
			<dl class="payclass_left height450">
				<dt>无线支付</dt>
				<dd class="icon ">
					<a href="paymethod_wireless1.jsp">手机客户端支付</a>
				</dd>
				<dd class="icon current2">
					<a href="paymethod_wireless2.jsp">WAP支付</a>
				</dd>
				<dt>其他支付方式</dt>
				<dd class="icon">
					<a href="paymethod_quickpay.jsp">快捷支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_bankpay.jsp">网银支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_cardpay.jsp">行业卡支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_directpay.jsp">直连支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_confirmpay.jsp">认证支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_accountpay.jsp">账户支付</a>
				</dd>
			</dl>
			<div class="safety_left_tit left">客服咨询</div>
			<div class="left safety_left">
				<p class="marginl15">
					<img src="pic/tel400.gif" />
				</p>
				<div class="left marginl15 inline margint15 width210">
					<div class="line-h32 left">在线咨询：</div>
					<!-- <div class="left margint2"><img  style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=8747930&o=秒付宝官网&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" SRC=/newweb/pic/btn_qq.gif alt="拥有秒付宝，生活更轻松！"></div> -->
					<div class="left margint2">
						<img border="0" src="pic/btn_qq.gif" alt="拥有秒付宝，生活更轻松！" />
					</div>
				</div>
				<div class="gray marginl74 left width150 inline">(周一至周五 8:30-18:00)</div>
				<div class="left marginl15 inline margint5 width210">
					<p>签约专线：0830-3153101</p>
					<p>客服专线：0830-3153101</p>
					<p class="gray marginl60">(7x24小时服务)</p>
				</div>
			</div>
			<!--内容 结束-->
		</div>
		<!--左边结束-->
		<div class="payclass_r right height900">
			<div id="pro_wap" class="left">
				<h1>WAP支付</h1>
				<p>手机秒付宝网站是针对当前移动互联网发展推出的手机网页，方便用户通过手机浏览器随时随地使用秒付宝服务。</p>
				<h4>手机秒付宝网站:</h4>
				<p>
					在您的手机浏览器中访问以下网址：<font class="pro_wapgreen14_b"> m.tftpay.com </font> 或<font class="pro_wapgreen14_b">
						wap.tftpay.com</font>
				</p>
				<h4>优点：</h4>
				<p>支持多家主流银行，用户使用无需开通网上银行支付等业务，只要手机有信号，就能通过手机进行商品购买及实时支付，覆盖达亿级的用户群，提供优质、安全、高效的手机支付服务，带来全新支付体验。</p>
				<h4>产品展示：</h4>
				<div class="left">
					<img src="pic/pro_wap_mobile.jpg" />
				</div>
				<div class="left" style="margin-left: 40px; margin-top: 40px;">
					<h4>特点：</h4>
					<ul class="pro_l_ul">
						<li>丰富多彩的生活娱乐支付应用</li>
						<li>随时随地支付转账</li>
						<li>了解最新秒付宝产品动态</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>