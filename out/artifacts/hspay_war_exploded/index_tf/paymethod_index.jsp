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
	<div class="m_main margint10 height350 border bgwit">
		<div class="pro marginl30 inline">
			<div class="left  pro_tit">无线支付</div>
			<div class="right pro_tit_more">
				<a href="paymethod_wireless1.jsp" class="blue2_a">了解更多&lt;&lt;</a>
			</div>
		</div>
		<div class="pro2 marginl30 inline">
			<div class="pro_index_l">
				<p style="width: 365px; text-align: center;">
					<a href="paymethod_wireless1.jsp"><img src="pic/pro_icon_1.jpg" border="0" /></a>
				</p>
				<h4>手机客户端支付</h4>
				<p style="margin-top: 10px;">支持多家主流银行，用户使用无需开通网上银行支付业务也可享受优质、安全、高效的手机支付服务；支持iPhone、Android、Symbian、WindowsMobile、黑莓、Java等平台。</p>
			</div>
			<div class="left marginl60 inline">
				<img src="pic/pro_line.gif" />
			</div>
			<div class="pro_index_l marginl80">
				<p style="width: 365px; text-align: center;">
					<a href="paymethod_wireless2.jsp"><img src="pic/pro_icon_2.jpg" border="0" /></a>
				</p>
				<h4>WAP支付</h4>
				<p style="margin-top: 10px;">手机秒付宝网站是针对当前移动互联网发展推出的手机网页，方便用户通过手机浏览器随时随地使用秒付宝服务。</p>
			</div>
		</div>
	</div>
	<div class="m_main margint10 height450 border bgwit">
		<div class="pro marginl30 inline">
			<div class="left  pro_tit">其他支付方式</div>
			<div class="right pro_tit_more">
				<a href="paymethod_quickpay.jsp" class="blue2_a">了解更多&lt;&lt;</a>
			</div>
		</div>
		<div class="pro_other">
			<ul class="pro_otherul">
				<a href="paymethod_quickpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul1.png" />
						</div>
						<div class="left width280 inline">
							<h4>快捷支付</h4>
							<p>无需网银，只需关联您的银行卡，每次付款时只需输入秒付宝支付密码即可完成付款。</p>
						</div>
				</li></a>
				<a href="paymethod_bankpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul2.png" />
						</div>
						<div class="left width280 inline">
							<h4>网银支付</h4>
							<p>拥有银行卡，您只需开通网上银行功能即可完成网上付款。</p>
						</div>
				</li></a>
				<a href="paymethod_cardpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul3.png" />
						</div>
						<div class="left width280 inline">
							<h4>行业卡支付</h4>
							<p>行业卡支付即为特定的机构发行的一种储值卡，持卡人可在特约商户处凭卡消费，可以用来抵用现金进行支付。</p>
						</div>
				</li></a>
				<a href="paymethod_directpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul4.png" />
						</div>
						<div class="left width280 inline">
							<h4>直联支付</h4>
							<p>无需网银，只需在支付页面输入您的银行卡信息即可完成付款。</p>
						</div>
				</li></a>
				<a href="paymethod_confirmpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul5.png" />
						</div>
						<div class="left width280 inline">
							<h4>认证支付</h4>
							<p>区别于网银支付，无需跳转到银行官网页面，只需在秒付宝支付页面输入目标银行所需的支付信息，即可完成支付。</p>
						</div>
				</li></a>
				<a href="paymethod_accountpay.jsp"><li class="payclass_a">
						<div class="left width118 inline">
							<img src="pic/icon_pro_otherul6.png" />
						</div>
						<div class="left width280 inline">
							<h4>账户支付</h4>
							<p>账户支付也叫余额支付，即您注册的秒付宝账户，您只需输入支付密码即可完成支付。</p>
						</div>
				</li></a>
			</ul>
		</div>
		<div class="clear"></div>
		<!--主结束-->
	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>