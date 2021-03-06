<%@page import="com.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
$("#netparticipate option[value='${netparticipate}']").attr("selected", true);
$("#netstate option[value='${netstate}']").attr("selected", true);
</script>
</head>
<body>
	<form id="pagerForm" method="post" action="<%=adminbasePath%>/person/showNet" onsubmit="return divSearch(this, 'jbsxBox');">
		<input type="hidden" name="pageNum" value="1" /> 
		<input type="hidden" name="numPerPage" value="${numPerPage}" />
		<input type="hidden" name="netstarttime" value="${netstarttime}" />
		<input type="hidden" name="netendtime" value="${netendtime }" />
		<input type="hidden" name="netparticipate" value="${netparticipate}" />
		<input type="hidden" name="netstate" value="${netstate}" />
		<input type="hidden" name="id" value="${id}" />
	</form>

	<div class="pageHeader">
		<form rel="pagerForm" action="<%=adminbasePath%>/person/showNet"
			onsubmit="return divSearch(this, 'jbsxBox');" method="post">
			<input type="hidden" name="pageNum" value="1" />
			<input type="hidden" name="numPerPage" value="${numPerPage}" />
			<input type="hidden" name="id" value="${id}" />
			<div class="searchBar">
				<ul class="searchContent">
					<li style="width: 400px"><label>日期：</label><input value="${netstarttime}" type="text" name="netstarttime" class="date" dateFmt="yyyy-MM-dd"/>
					--<input value="${netendtime }" type="text" name="netendtime" class="date" dateFmt="yyyy-MM-dd"/>
					</li>
					<li style="width: 250px"><label>支付方式：</label>
						<select class="combox" name="netparticipate" id="netparticipate">
						<option value="0">请选择</option>
						<c:forEach items="${partici}" varStatus="l" var="par">
							<option value="${par.codeid}"><c:out
									value="${par.payable}"></c:out></option>
						</c:forEach>
						</select>
					</li>
					<li style="width: 200px"><label>订单状态：</label>
						<select class="combox" name="netstate" id="netstate" style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">成功</option>
							<option value="2">处理中</option>
							<option value="3">失败</option>
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
		<table class="table" width="99%" layoutH="290" rel="jbsxBox">
			<thead>
				<tr>
					<th>订单编号</th>
					<th>用户</th>
					<th>支付金额</th>
					<th>实际金额</th>
					<th>商品名称</th>
					<th>交易方式</th>
					<th>支付结果</th>
					<th>是否反馈</th>
					<th>创建时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderlist}" var="order">
					<tr target="orderid" rel="${order.orderid }">
						<td><c:out value="${order.orderid}"></c:out></td>
						<td><c:out value="${order.p1_MerId}"></c:out></td>
						<td><c:out value="${order.p3_Amt}"></c:out></td>
						<td><c:out value="${order.amount}"></c:out></td>
						<td><c:out value="${order.p5_Pid}"></c:out></td>
						<td><c:out value="${order.pd_FrpId}"></c:out></td>
						<td><c:out value="${order.r1_Code}"></c:out></td>
						<td><c:out value="${order.success}"></c:out></td>
						<td><c:out value="${order.CreateTime}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="panelBar">
			<div class="pages">
				<span>显示</span> <select class="combox" name="numPerPage"
					onchange="dialogPageBreak({pageNum:this.value},{numPerPage:this.value},'jbsxBox')">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</select> <span>条，共${totalCount}条</span>
			</div>

			<div class="pagination" rel="jbsxBox" targetType="dialog"
				totalCount="${totalCount}" numPerPage="${numPerPage}"
				pageNumShown="${pageNumShown}" currentPage="${pageNum}"></div>
		</div>
	</div>
</body>
</html>