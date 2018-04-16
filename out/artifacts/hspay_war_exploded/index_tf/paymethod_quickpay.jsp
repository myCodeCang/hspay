<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="style/index.css" rel="stylesheet" type="text/css" />
<link href="style/commons.css" rel="stylesheet" type="text/css" />
<link href="style/pro.css" rel="stylesheet" type="text/css" />
<link href="style/newstyle_index.css" rel="stylesheet" type="text/css" />
<link href="style/bank-icon.css"  rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
	function MM_openBrWindow(theURL, winName, features) { //v2.0
		window.open(theURL, winName, features);
	}
//-->
</script>
<script type="text/javascript" src="script/jquery-1.8.2.min.js"></script>
<!--[if lte IE 6]>
	<script src="script/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
	<script>
	  DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt,a,a:hover');
	</script>
<![endif]-->
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<script type="text/javascript" language="javascript">
		document.getElementById('ins4').className = 'on';
	</script>
	<div id="m_banner_pay"></div>
	<div id="m_header2"></div>
	<div class="m2_main height750">
		<div class="m2_main_l">
			<div class="m2_main_l_tit">支付方式</div>
			<dl class="payclass_left height450">
				<dt>无线支付</dt>
				<dd class="icon ">
					<a href="paymethod_wireless1.jsp">手机客户端支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_wireless2.jsp">WAP支付</a>
				</dd>
				<dt>其他支付方式</dt>
				<dd class="icon current2">
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
		<div class="payclass_r right height750">
			<div class="warpbox_center2_0">
				<div id="pro_wap" class="left">
					<h2 class="icon_pro_other1">快捷支付</h2>
					<p>
						什么是快捷支付？<br /> 无需网银，只需关联您的银行卡，每次付款时只需输入秒付宝支付密码即可完成付款。
					</p>
					<h4>特点：</h4>
					<ul class="pro_l_ul">
						<li>丰富多彩的生活娱乐支付应用</li>
						<li>随时随地支付转账</li>
						<li>了解最新秒付宝产品动态</li>
					</ul>
					<h4 style="margin-top: 100px;">付款流程：</h4>
					<p class="pro_bz_bg">
						<span>1.提交付款订单</span><span>2.付款时输入秒付宝支付密码</span><span>3.完成付款</span>
					</p>
					<h4>支持银行：</h4>
					<ul class="ui-list-icons3 cashier-bank" style="margin-top: 20px;">
						<li><a class=icon-box href="http://www.cmbchina.com/" target="_blank"><span class="icon CMB" title="招商银行">招商银行</span>
						</a></li>
						<li><a class=icon-box href="http://www.spdb.com.cn/chpage/c1/" target="_blank"><span class="icon SPDB"
								title="浦发银行">浦发银行</span> </a></li>
						<li><a class=icon-box href="http://www.cib.com.cn/netbank/cn/index.html" target="_blank"><span
								class="icon CIB" title="兴业银行">兴业银行</span> </a></li>
						<li><a class=icon-box href="http://www.psbc.com/portal/zh_CN/index.html" target="_blank"><span
								class="icon HXBANKKT" title="华夏银行">华夏银行</span> </a></li>
						<li><a class=icon-box href="http://www.sdb.com.cn/" target="_blank"><span class="icon SDB" title="深圳发展银行">深圳发展银行</span>
						</a></li>
						<li><a class=icon-box href="http://www.cmbc.com.cn/"><span class="icon CMBC" title="中国民生银行">中国民生银行</span>
						</a></li>
						<li><a class=icon-box href="http://bank.ecitic.com/" target="_blank"><span class="icon CITIC"
								title="中信银行">中信银行</span> </a></li>
						<li><a class=icon-box href="http://www.cebbank.com/Site/ceb/cn" target="_blank"><span class="icon CEB"
								title="光大银行">光大银行</span> </a></li>
						<li><a class=icon-box href="http://www.czbank.com/czbank/" target="_blank"><span class="icon CZBANK"
								title="浙商银行">浙商银行</span> </a></li>
						<li><a class=icon-box href="http://www.cbhb.com.cn/bhbank/S101/index.htm" target="_blank"><span
								class="icon BOHAIBKT" title="渤海银行">渤海银行</span> </a></li>
						<li><a class=icon-box href="http://bank.pingan.com/" target="_blank"><span class="icon SPABANKKT"
								title="中国平安银行">中国平安银行</span> </a></li>
					</ul>

				</div>
			</div>
		</div>

	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>