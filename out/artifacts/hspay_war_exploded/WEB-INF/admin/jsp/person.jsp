<%@page import="com.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Employees emp = (Employees)request.getSession().getAttribute("adminsession");
	int employeeid = emp.getInt("employeeid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
$("#iflock option[value='${iflock}']").attr("selected", true);
$("#iflogin option[value='${iflogin}']").attr("selected", true);
$("#ifnet option[value='${ifnet}']").attr("selected", true);
</script>
</head>
<body>
	<form id="pagerForm" method="post" action="<%=adminbasePath%>/person/">
		<input type="hidden" name="pageNum" value="1" /> 
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<input type="hidden" name="starttime" value="${starttime}" />
		<input type="hidden" name="endtime" value="${endtime }" />
		<input type="hidden" name="iflock" value="${iflock}" />
		<input type="hidden" name="iflogin" value="${iflogin}" />
		<input type="hidden" name="ifnet" value="${ifnet}" />
	</form>

	<div class="pageHeader">
		<form rel="pagerForm" action="<%=adminbasePath%>/person/"
			onsubmit="return navTabSearch(this)" method="post">
			<input type="hidden" name="pageNum" value="1" />
			<input type="hidden" name="numPerPage" value="20" />
			<div class="searchBar">
				<ul class="searchContent">
					<li>
						<label>商户编号：</label>
						<input type="text" name="id" value="${id }"/>
					</li>
					<li style="width: 400px"><label>日期：</label><input value="${starttime }" type="text" name="starttime" class="date" dateFmt="yyyy-MM-dd"/>
					--<input value="${endtime }" type="text" name="endtime" class="date" dateFmt="yyyy-MM-dd"/>
					</li>
					<li style="width: 160px"><label>锁定状态：</label>
						<select class="combox" name="iflock" id="iflock" style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">正常</option>
							<option value="2">锁定</option>
						</select>
					</li>
					<li style="width: 160px"><label>登陆状态：</label>
						<select class="combox" name="iflogin" id="iflogin" style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">登陆</option>
							<option value="2">未登录</option>
						</select>
					</li>
					<li style="width: 160px"><label>网银状态：</label>
						<select class="combox" name="ifnet" id="ifnet" style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">开通</option>
							<option value="2">未开通</option>
						</select>
					</li>
				</ul>
				<div class="subBar">
					<ul>
						<li><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">检索</button>
								</div>
							</div></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<div class="pageContent">
		
		<div class="panelBar">
			<ul class="toolBar">
			<%
			if(employeeid==1){
			%>
				<li><a class="edit"
					href="<%=adminbasePath%>/person/showEmp?pageNum=1&numPerPage=20&id={id}&empname=" rel="empadd"
					target="dialog" width="900" height="440" mask=true><span>客户归属</span></a></li>
				<li class="line">line</li>
					<%
					}
				%>
			<li><a class="add"
					href="<%=adminbasePath%>/person/showAddPerson" rel="empadd"
					target=dialog width="900" height="600" mask=true><span>添加客户</span></a></li>
			</ul>
		</div>
		
		<table class="table" width="100%" layoutH="138">
			<thead>
				<tr>
					<th>商户id</th>
					<th>邮箱</th>
					<th>商户类型</th>
					<th>名称</th>
					<th>联系人名称</th>
					<th>手机号码</th>
					<th>QQ号码</th>
					<th>管理员工</th>
					<th>注册时间</th>
					<th>登陆状态</th>
					<th>锁定状态</th>
					<th>网银状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${perlist}" var="per">
					<tr target="id" rel="${per.id }">
						<td><c:out value="${per.id}"></c:out></td>
						<td><c:out value="${per.email}"></c:out></td>
						<td>
						<c:choose>
							<c:when test="${per.huge==1}">
								企业
							</c:when>
							<c:otherwise>
								个人
							</c:otherwise>
						</c:choose></td>
						<td>
							<c:choose>
								<c:when test="${per.name==''}">
									未选择
								</c:when>
								<c:otherwise>
									<c:out value="${per.name}"></c:out>
								</c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${per.contacts}"></c:out></td>
						<td><c:out value="${per.phone}"></c:out></td>
						<td><c:out value="${per.qq}"></c:out></td>
						<td><c:out value="${per.empname}"></c:out></td>
						<td><c:out value="${per.time}"></c:out></td>
						<td>
						<c:choose>
							<c:when test="${per.iflogin==1}">
								登陆
							</c:when>
							<c:otherwise>
								未登录
							</c:otherwise>
						</c:choose></td>
						<td>
						<c:choose>
							<c:when test="${per.iflock==1}">
								正常
							</c:when>
							<c:otherwise>
								锁定
							</c:otherwise>
						</c:choose></td>
						<td>
						<c:choose>
							<c:when test="${per.ifnet==1}">
								开通
							</c:when>
							<c:otherwise>
								未开通
							</c:otherwise>
						</c:choose></td>
						<td>
						 <a title="查看" target="dialog" rel="person${per.id}" href="<%=adminbasePath %>/person/showPerson?id=${per.id}" class="btnView"  width="1178" height="721">查看</a>
						<%
							if(employeeid==1){
						%>						 
						 <a class="btnEdit" title="修改状态" href="<%=adminbasePath%>/person/showPersonState?id=${per.id}" target="dialog" rel="perstate${per.id}" width="410" height="200"><span>编辑</span></a>
						 <%
							}
						 %>
						 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="panelBar">
			<div class="pages">
				<span>显示</span> <select class="combox" name="numPerPage"
					onchange="navTabPageBreak({numPerPage:this.value})">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</select> <span>条，共${totalCount}条</span>
			</div>

			<div class="pagination" targetType="navTab" pageNumShown="10"
				totalCount="${totalCount}" numPerPage="${numPerPage}"
				pageNumShown="${pageNumShown}" currentPage="${pageNum}"></div>
		</div>
	</div>
</body>
</html>