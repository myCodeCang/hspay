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
				<dd class="icon current2">
					<a href="paymethod_wireless1.jsp">手机客户端支付</a>
				</dd>
				<dd class="icon">
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
		<div class="payclass_r right height1100">
			<div class="warpbox_center">
				<div id="pro_l" class="left">
					<h1>手机客户端支付</h1>
					<p>秒付宝手机客户端是秒付宝针对iPhone、Android、Symbian、 WindowsMobile、黑莓、Java等平台推出的客户端软件。</p>
					<p class="pro_l_line"></p>
					<h4>特点：</h4>
					<ul class="pro_l_ul">
						<li>丰富多彩的生活娱乐支付应用</li>
						<li>随时随地支付转账</li>
						<li>了解最新秒付宝产品动态</li>
					</ul>
					<p class="pro_l_line" style="margin-top: 95px;"></p>
					<h4>优点：</h4>
					<p>支持多家主流银行，用户使用无需开通网上银行支付等业务，只要手机有信号，就能通过手机进行商品购买及实时支付，覆盖达亿级的用户群，提供优质、安全、高效的手机支付服务，带来全新支付体验。</p>
					<p class="pro_l_line"></p>
					<h4>支付功能介绍：</h4>
					<ul class="iconul">
						<li class="icon_kuaijie_min">快捷支付</li>
						<li class="icon_zhenshu_min">证书支付</li>
						<li class="icon_accout_min">账户支付</li>
					</ul>
					<p class="pro_l_line" style="margin-top: 55px;"></p>
				</div>
				<div class="left marginl50 inline">
					<img src="pic/mobile_l.jpg" />
				</div>

			</div>
			<!--内页盒子内容-->
			<div class="warpbox3 left">
				<div class="warpbox_center3_0">
					<div class="left">
						<h4 class="proh4">功能演示：</h4>
						<div class="ui-round-mar">
							<div class="tutorial fn-clear pt_20">
								<div class="ui-tclayout-left">
									<div class="gallery">
										<div class="gallery-box">
											<ul class="fn-clear" id="slider1" style="position: relative; width: 1692px; left: 0px;">
												<li class=""><img alt="" src="pic/oder1.jpg" /></li>
												<li class=""><img alt="" src="pic/2pay.jpg" /></li>
												<li class=""><img alt="" src="pic/kuaijie2.jpg" /></li>
												<li class=""><img alt="" src="pic/zhengshu2.jpg" /></li>
												<li class=""><img alt="" src="pic/kuaijie4.jpg" /></li>
												<li class=""><img alt="" src="pic/zhengshu3.jpg" /></li>
												<li class=""><img alt="" src="pic/kuaijie3.jpg" /></li>
												<li class=""><img alt="" src="pic/pay_success.jpg" /></li>
												<li class=""><img alt="" src="pic/pay_success.jpg" /></li>
											</ul>
										</div>
									</div>
									<a class="uili-arrow uili-arrow-prev" id="slider1-l"></a> <a class="uili-arrow uili-arrow-next" id="slider1-r"></a>
								</div>
								<div class="ui-tclayout-right">
									<div id="slider1-triggers">
										<p class="uili-step current">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">手机购物并下单</span></a>
										</p>
										<p class="uili-step" style="margin-top: 30px; _margin-top: 25px; *margin-top: 25px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">支付</span></a>
										</p>
										<p class="uili-step2" style="float: left; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">快捷支付</span></a>
										</p>
										<p class="uili-step2" style="float: right; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">证书支付</span></a>
										</p>
										<p class="uili-step2" style="float: left; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">输入银行卡信息</span></a>
										</p>
										<p class="uili-step2" style="float: right; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">输入证书密码</span></a>
										</p>
										<p class="uili-step2" style="float: left; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">短信验证</span></a>
										</p>
										<p class="uili-step2" style="float: right; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">支付成功</span></a>
										</p>
										<p class="uili-step2" style="float: left; margin-top: 30px;">
											<a class="uili-btn uili-stepbtn"><span class="uili-intext">支付成功</span></a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--内页盒子内容-->
				<div class="clear"></div>
			</div>
		</div>

	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>