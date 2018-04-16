<%@page import="com.vo.System_qq"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
	List<System_qq> systemqqlist = System_qq.dao.find("select * from system_qq");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="include/upage.jsp"></jsp:include>
</head>
<body data-type="about">
<script src="<%=basePath%>/static/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
<jsp:include page="include/top.jsp"></jsp:include>
        <!-- 侧边导航栏 -->
<jsp:include page="include/left.jsp"></jsp:include>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf" style="text-align: center;">
                                <h1>联系我们</h1>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
			<p><%=systemss.getStr("system_telephone") %> </p>
			<%
             	System_qq  systemqq = null;
             	for(int i=0; i<systemqqlist.size(); i++){
             		if(i==4){
             			break;
             		}
             		systemqq = systemqqlist.get(i);
             %>
			<p>
				<%=systemqq.getStr("qq_name") %>：<a target="_blank"
					href="http://wpa.qq.com/msgrd?v=3&uin=<%=systemqq.getStr("qq_number") %>&site=qq&menu=yes"><img
					border="0" src="http://wpa.qq.com/pa?p=2:<%=systemqq.getStr("qq_number") %>:41"
					alt="商务合作咨询－恭候您咨询" title="<%=systemss.getStr("system_firm") %>客服－恭候您咨询"></a>
			</p>
			<%
             	}
			%> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="include/script.jsp"></jsp:include>
</body>
</html>