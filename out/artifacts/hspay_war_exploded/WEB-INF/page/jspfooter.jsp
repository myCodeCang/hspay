<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<footer>
		<p class="pull-left">Copyright &copy; 2014-2019 
			<%=systemss.getStr("system_company") %>版权所有</p>
		<p class="pull-right">网站备案号：<%=systemss.getStr("system_filings") %></p>
	</footer>
</body>
</html>