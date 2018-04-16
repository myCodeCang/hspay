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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/getAbout").text("联系我们");
});
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">联系我们</a></h2>
		<ul id="nav">
			<li class="selected"><a href="javascript:;">关于我们</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
    	<h1 class="welcom_tm">关于我们</h1>
		<div class="dao_hang" style="height: 1px;background: #eaeaea;">
		</div>
    <!--一条开始-->
    	<div class="public_m1">
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
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>