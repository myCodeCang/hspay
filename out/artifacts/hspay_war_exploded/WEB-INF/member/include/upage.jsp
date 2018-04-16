<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=systemss.getStr("system_webName")%></title>
<META name="Keywords" content="<%=systemss.getStr("system_keyword")%>" />
<link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if IE]>
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie7.css" >
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/hspay/css/jiazaitoubu.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/hspay/css/css.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/hspay/css/center.css" >
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<script src="<%=basePath%>/static/hspay/js/jquery-1.8.3.min.js" ></script>
<script src="<%=basePath%>/static/hspay/js/Popt.js" ></script>
<script src="<%=basePath %>/static/hspay/laydate/laydate.js"></script>
<script src="<%=basePath %>/static/hspay/layer/layer.js"></script>
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script src="<%=basePath%>/js/Validform_v5.3.2_min.js"></script>