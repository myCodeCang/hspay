<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pay.yeepay.server.Configuration"%>    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	String adminurl = Configuration.getInstance().getValue("adminurl");
	String adminbasePath = basePath+adminurl;
%>