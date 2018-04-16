<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<div class="row-content am-cf" style="font-size: 8px;text-align: center;color: #888;">
  <p>Copyright &copy; 2014-2019 网站备案号：<%=systemss.getStr("system_filings")%></p>
  <p><%=systemss.getStr("system_company") %>版权所有</p>
</div>