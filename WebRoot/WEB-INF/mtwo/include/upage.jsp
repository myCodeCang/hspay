<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=systemss.getStr("system_webName")%></title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="<%=systemss.getStr("system_keyword")%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="<%=basePath%>/static/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="<%=systemss.getStr("system_webName")%>" />
<script src="<%=basePath%>/static/assets/js/echarts.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/assets/css/app.css">
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<script src="<%=basePath%>/static/assets/js/jquery.min.js"></script>