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

<body data-type="index-member">
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
                                <div class="widget-title am-fl" style="color: red;"><em>提示：</em>如果需要修改相关信息 请联系客服 谢谢合作！</div>
                            </div>
                            <div class="widget-body am-fr">
                                 <table class="am-table am-table-bordered am-table-hover am-table-striped">
	                                 <tr>
		                                 <td><%if (map.getInt("huge") == 0) {%>个人姓名：<%} else {%>企业名称：<%}%></td>
		                                 <td><%=map.get("name")%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>联 系 人：</td>
		                                 <td><%=map.get("contacts")%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>联系地址：</td>
		                                 <td><%=map.get("address")%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>手机号码：</td>
		                                 <td><%=CryptTool.getphone(map.getStr("phone"))%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>QQ号码：</td>
		                                 <td><%=map.get("qq")%></td>
	                                 </tr>
	                                 <tr>
		                                 <td><%if (map.getInt("huge") == 0) {%>身 份 证：<%} else {%>营业执照：<%}%></td>
		                                 <td><%=CryptTool.getphone(map.getStr("idcard"))%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>网站名称：</td>
		                                 <td><%=map.get("webName")%></td>
	                                 </tr>
	                                 <tr>
		                                 <td>网站网址：</td>
		                                 <td><%=map.get("website")%></td>
	                                 </tr>
                                 </table>
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