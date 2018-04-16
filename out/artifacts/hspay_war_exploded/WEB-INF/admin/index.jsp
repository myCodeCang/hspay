<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="page/jcpage.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
	DWZ.init("<%=basePath%>/admin/dwz.frag.xml", {
//		loginUrl:"login.jsp", loginTitle:"登录",	// 弹出登录对话框
		loginUrl:"<%=adminbasePath%>",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"<%=basePath%>/admin/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
	$("#divTime").jclock({withDate:true, withWeek:true});
	 getData(); //首次立即加载  
     window.setInterval(getData, 1000*60*3); //循环执行！！  
});
function getData(){
	$.ajax({
		url :  "<%=adminbasePath %>/getRefundcount",
		type : 'post',
		dataType : 'json',
		error : function() {
			alert('数据获取失败');
		},
		success : function(datas) {
			layer.msg('您有新的提现信息共'+datas+'条', 5, {
			    rate: 'top',
			    type: 9,
			    shade: false
			});
		}
	})
}
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="#"><%=systemss.getStr("system_company") %></a>
				<ul class="nav">
					<li><a>${employee.name }</a></li>
					<li><a><div id="divTime"></div></a></li>
					<li><a href="<%=adminbasePath%>/login/exit">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->

		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<c:forEach items="${navlist}" varStatus="l" var="nav">
								<c:if test="${nav.node==1}">  
								  	<li><a><c:out value="${nav.name}"></c:out></a>
								  		<ul>
											<c:forEach items="${navlist}" var="navl">
												<c:if test="${nav.navid==navl.ownership}">
												  	<li><a href="<%=adminbasePath %>${navl.url}" target="navTab" rel="nav${navl.navid}" reloadFlag=1><c:out value="${navl.name}"></c:out></a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<table width="100%" style="height: 60px;">
								<tr>
									<td>网银交易：</td>
									<td>${netstatis.p3_Amt }（元）</td>
									<td>点卡交易：</td>
									<td>${carstatis.p3_Amt }（元）</td>
									<td>充值交易：</td>
									<td>${rechargestatis.p3_Amt }（元）</td>
									<td>销卡交易：</td>
									<td>${circlipstatis.actual }（元）</td>
									<td>点卡实际到账：</td>
									<td>${carstatis.amount }（元）</td>
									<td>网银实际交易：</td>
									<td>${netstatis.amount }（元）</td>
								</tr>
								<tr>
									<td>网银收益：</td>
									<td>${netstatis.deducted }（元）</td>
									<td>点卡收益：</td>
									<td>${carstatis.deducted }（元）</td>
									<td>充值扣除：</td>
									<td>${rechargestatis.deducted }（元）</td>
									<td>销卡扣除：</td>
									<td>${circlipstatis.deducted }（元）</td>
									<td>提现交易：</td>
									<td>${refundstatis.refund_amount }（元）</td>
									<td>销卡实际交易：</td>
									<td>${circlipstatis.accountvalue }（元）</td>
								</tr>
							</table>
						</div>
						<div layoutH="65">
							<iframe src="<%=adminbasePath%>/getStatistics" width="100%" height="100%" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0"></iframe> 
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="footer">
		Copyright &copy; 2014-2019 <%=systemss.getStr("system_company") %>版权所有 网站备案号：<%=systemss.getStr("system_filings") %>
	</div>
</body>
</html>