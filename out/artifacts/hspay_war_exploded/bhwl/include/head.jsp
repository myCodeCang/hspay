<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="page.jsp"%>
<header class="header" style="border-bottom: 1px solid #e4e4e4;">
	<div class="header_top">
		<div class="special-header_bottom clearfix">
			<ul class="menu-list fn-left" style="float: left;">
				<li>
					<a href="sessionInvalid.jsp" title="个登录">登录</a>
				</li>
				<li style="margin-left: 35px;">
					<a href="toRegister.jsp" title="注册">注册</a>
				</li>
			</ul>
			<ul class="menu-list fn-right">
				<li>
					<a href="companyContact.jsp" title="联系我们">联系我们</a></li>
			</ul>
		</div>
	</div>
	<div class="special-header clearfix">
		<a href="<%=basePath %>/" title="银生宝" class="alipay-logo"></a>
		<a href="<%=basePath %>/" title="银生宝" class="alipay-logo2"></a>
		<ul class="menu-list fn-right nav navbar-nav">
			<li>
				<a class="index" href="<%=basePath %>" title="首页">首页</a>
			</li>
			<li>
				<a class="transfer" href="personalUnspay.jsp">转账付款</a>
			</li>
			<li>
				<a class="safe1" href="platsafe.jsp">平台安全</a>
			</li>
			<li>
				<a class="safe2" href="company.jsp">公司简介</a>
			</li>
			<li>
				<a class="safe3" href="companyLaw.jsp">法律声明</a>
			</li>
			<li>
				<a class="safe4" href="companyContact.jsp">联系我们</a>
			</li>
		</ul>
	</div>
</header>