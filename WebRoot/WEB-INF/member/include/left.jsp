<%@page import="com.vo.System_qq"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
	List<System_qq> systemqqlist = System_qq.dao.find("select * from system_qq");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div class="sidebar" id="sidebar">
		<script type="text/javascript">
			try {
				ace.settings.check('sidebar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="sidebar-shortcuts" id="sidebar-shortcuts">

			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span> <span class="btn btn-info"></span>

				<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
			</div>
		</div>
		<!-- #sidebar-shortcuts -->

		<ul class="nav nav-list">
			<li class="active"><a href="#"> <i
					class="icon-dashboard"></i> <span class="menu-text"> 控制台 </span>
			</a></li>
			<li><a href="#" onclick="user()"> <i class="icon-group"></i>
					<span class="menu-text"> 用户管理 </span>
			</a></li>
			<li><a href="#" onclick="exchange()"> <i class="icon-coffee"></i>
					<span class="menu-text"> 交易管理 </span>
			</a></li>
			<!-- <li><a href="#" onclick="statement()"> <i class="icon-credit-card"></i>
					<span class="menu-text"> 报表查看 </span>
			</a></li> -->
			<li><a href="#" onclick="payment()"> <i class="icon-bar-chart"></i>
					<span class="menu-text"> 在线充值 </span>
			</a></li>
			<li><a href="#" onclick="settlement()"> <i class="icon-exchange"></i>
					<span class="menu-text"> 结算管理 </span>
			</a></li>
			<li><a href="#" onclick="transfer()"> <i class="icon-external-link"></i>
					<span class="menu-text"> 转账管理 </span>
			</a></li>
			<li><a href="#" onclick="getannouncement()"> <i class="icon-comments"></i>
					<span class="menu-text"> 公告列表 </span>
			</a></li>
			<li><a href="#" onclick="getHelp()"> <i class="icon-info-sign"></i>
					<span class="menu-text"> 开发文档下载 </span>
			</a></li>
			<li><a href="#" onclick="getAbout()"> <i class="icon-hdd"></i>
					<span class="menu-text"> 联系我们 </span>
			</a></li>
		</ul>
		<!-- /.nav-list -->

		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
				data-icon2="icon-double-angle-right"></i>
		</div>

		<script type="text/javascript">
			try {
				ace.settings.check('sidebar', 'collapsed');
			} catch (e) {
			}
		</script>
	</div>
</body>
</html>