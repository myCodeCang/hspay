<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.vo.Person"%>
<%@ include file="../../page/page.jsp"%>
<%
Person map = (Person) request.getSession().getAttribute("session");
%>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器。 请 <a
  href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<header>
    <div class="am-fl tpl-header-logo">
        <a href="javascript:;"><img src="<%=basePath %>/static/assets/img/logo.png"/></a>
    </div>
    <div class="tpl-header-fluid">
        <div class="am-fl tpl-header-switch-button am-icon-list" style="height: 55px; padding-top: 17px;">
            <span>
        </span>
        </div>
        <div class="am-fl" style="padding-top: 13px;font-weight: 700;">
            <span id="titleSpan" class="titleSpan">用户信息</span>
        </div>
        <div class="am-fr tpl-header-navbar">
            <ul>
                <li class="am-text-sm tpl-header-navbar-welcome">
                    <a href="javascript:;">欢迎您, <span><%=map.getStr("name") %></span> </a>
                </li>
                <li class="am-text-sm">
                    <a href="<%=basePath%>/login/quit">
                        <span class="am-icon-sign-out"></span> 退出
                    </a>
                </li>
            </ul>
        </div>
    </div>
</header>
<div class="tpl-skiner" style="display: none;">
    <div class="tpl-skiner-toggle am-icon-cog">
    </div>
    <div class="tpl-skiner-content">
        <div class="tpl-skiner-content-title">选择主题</div>
        <div class="tpl-skiner-content-bar">
            <span class="skiner-color skiner-white" data-color="theme-white"></span>
            <span class="skiner-color skiner-black" data-color="theme-black"></span>
        </div>
    </div>
</div>