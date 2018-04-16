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
				<dd class="icon">
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
				<dd class="icon current2">
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
			<div id="pro_wap" class="left">
				<h2 class="icon_pro_other3">行业卡支付</h2>
				<p>
					什么是行业卡支付？<br /> 行业卡支付即为特定的机构发行的一种储值卡，持卡人可在特约商户处凭卡消费，可以用来抵用现金进行支付。<br /> 秒付宝现有的行业卡为：腾邦礼品卡。<br />
					腾邦礼品卡为腾邦集团发行的礼品卡，一般为客户直接购买或用于公司赠送。礼品卡仅限在腾邦国际飞人网预订机票产品时消费使用，（特别说明航线除外），等同现金，直接输入卡号和密码即可完成支付。
				</p>
				<h4>特点：</h4>
				<ul class="pro_l_ul">
					<li>不记名不挂失卡片</li>
					<li>凭卡号、密码消费</li>
					<li>携带方便，随时支付</li>
				</ul>
				<h4 style="margin-top: 100px;">付款流程：</h4>
				<p class="pro_bz_bg">
					<span>1.提交付款订单</span><span> 2.输入礼品卡卡号和密码</span><span>3.完成付款</span>
				</p>
				<h4>注意事项：</h4>
				<ul class="pro_l_ul" style="margin-bottom: 20px;">
					<li>腾邦礼品卡为不记名不挂失卡片；腾邦礼品卡可凭卡号、密码消费，密码刮开后，请妥善保存，避免卡内资金遗失。</li>
					<li>如用户卡内金额不足，可支持添加多张礼品卡完成支付。<br /> 一旦发生退款，款项将原路返回到支付的礼品上账户。如是多张卡联合支付，退款规则为：后台自动查找支付金额最大的礼品<br />卡，优先满足返还小额卡，最后再返还最大礼品卡。
					</li>
					<li>每张卡上都注明有效使用期，请在有效期内使用，过期无效。</li>
				</ul>

			</div>
		</div>
	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>