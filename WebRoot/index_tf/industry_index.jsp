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
		document.getElementById('ins2').className = 'on';
	</script>
	<div id="m_banner"></div>
	<div id="m_header2"></div>
	<div class="m_main margint10">
		<a href="industry_flight.jsp">
			<div class="m_main1 left marginr6 m_main_a">
				<h2 class="icon_industry1">机票旅游</h2>
				<p class="margint15">针对商旅行业，腾付通为航空公司和机票代理分别提供全面电子支付解决方案，帮助航空机票企业扩大销售规模，提高财务管理效率。</p>
			</div>
		</a> <a href="industry_shopping.jsp">
			<div class="m_main2 left marginr6 m_main_a">
				<h2 class="icon_industry2">网络购物</h2>
				<p class="margint15">网络购物平台即实物类B2C商城，为商家解决电商核心环节——支付，为商家提供安全、便捷的支付环境和集成系统，节约成本。</p>
			</div>
		</a> <a href="industry_paychange.jsp">
			<div class="m_main3 left m_main_a">
				<h2 class="icon_industry3">代收代付</h2>
				<p class="margint15">腾付通代收代付，简单快捷，一站式解决交易资金的划转需求，无论是企业间转账还是个人间转账都可轻松实现。</p>
			</div>
		</a>
		<!--主结束-->
	</div>

	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>