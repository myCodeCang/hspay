<%@page import="com.tool.CryptTool"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>

</head>

<body data-type="index-log">
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
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">最近登陆日志
                                </div>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
                                <div class="am-scrollable-horizontal">
                                <table width="100%" class="am-table am-table-compact am-table-striped  tpl-pagination " id="example-r">
                                    <thead>
                                        <tr>
											<th>序号</th>
											<th>用户编号</th>
											<th>登陆IP</th>
											<th>登陆时间</th>
											<th>退出时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach items="${logs}" varStatus="l" var="log">
										<c:if test="${l.index<15 }">
										<tr>
											<td><c:out value="${l.index+1 }"></c:out></td>
											<td><c:out value="${log.id }"></c:out></td>
											<td><c:out value="${log.landingip }"></c:out></td>
											<td><c:out value="${log.landingtime }"></c:out></td>
											<td><c:out value="${log.exittime }"></c:out></td>
										</tr>
										</c:if>
									</c:forEach>
                                    </tbody>
                                 </table>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<jsp:include page="include/script.jsp"></jsp:include>
</body>
</html>