<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<div class="ye_foot">
	<p class="wahaha">
		Copyright &copy; 2014-2019 网站备案号：<%=systemss.getStr("system_filings")%>
		<%=systemss.getStr("system_company")%>版权所有
	</p>
</div>
