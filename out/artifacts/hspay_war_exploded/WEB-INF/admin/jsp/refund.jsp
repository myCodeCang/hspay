<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	$("#refustate option[value='${refustate}']").attr("selected", true);
	$("#settlementauthority option[value='${settlementauthority}']").attr(
			"selected", true);
</script>
</head>
<body>
	<form id="pagerForm" method="post" action="<%=adminbasePath%>/refund">
		<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
			name="numPerPage" value="${numPerPage}" /> <input type="hidden"
			name="refustarttime" value="${refustarttime}" /> <input
			type="hidden" name="refuendtime" value="${refuendtime }" /> <input
			type="hidden" name="refustate" value="${refustate}" /> <input
			type="hidden" name="refuid" value="${refuid}" /> <input
			type="hidden" name="refuname" value="${refuname}" /> <input
			type="hidden" name="settlementauthority"
			value="${settlementauthority}" /><input
				type="hidden" name="refundanother" value="${refundanother}" />
	</form>

	<div class="pageHeader">
		<form rel="pagerForm" action="<%=adminbasePath%>/refund"
			onsubmit="return navTabSearch(this)" method="post">
			<input type="hidden" name="pageNum" value="1" /> <input
				type="hidden" name="numPerPage" value="${numPerPage}" /><input
				type="hidden" name="refundanother" value="${refundanother}" />
			<div class="searchBar">
				<ul class="searchContent">
					<li style="width: 210px"><label style="width: 40px">订单：</label><input
						type="text" value="${refuid}" name="refuid" /></li>
					<li style="width: 210px"><label style="width: 40px">用户：</label><input
						type="text" value="${refuname}" name="refuname"></li>
					<li style="width: 380px"><label>日期：</label><input
						value="${refustarttime}" type="text" name="refustarttime"
						class="date" dateFmt="yyyy-MM-dd" /> --<input
						value="${refuendtime }" type="text" name="refuendtime"
						class="date" dateFmt="yyyy-MM-dd" /></li>
					<li style="width: 200px"><label>提现权限：</label> <select
						class="combox" name="settlementauthority" id="settlementauthority"
						style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">T+0</option>
							<option value="2">T+1</option>
							<option value="3">D+0</option>
					</select></li>
					<li style="width: 200px"><label>订单状态：</label> <select
						class="combox" name="refustate" id="refustate"
						style="width: 100px">
							<option value="0">请选择</option>
							<option value="1">成功</option>
							<option value="2">处理中</option>
							<option value="3">失败</option>
					</select></li>
				</ul>
				<div class="subBar">
					<ul>
						<li>
							<a class="button" href="<%=basePath %>/settlement/showExpor" target="_blank"><span>下载记录</span></a>
						</li>
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
				<!-- <li><a title="确实要删除这些记录吗?" target="ajaxTodo"
					href="demo/common/ajaxDone.html" class="delete"><span>删除</span></a></li>
				<li class="line">line</li> -->
				<li><a class="edit" title="操作"
					href="<%=adminbasePath%>/refund/showRefund?refuid={refund_id}"
					width="850" height="480" mask=true target="dialog"
					rel="uprefund"><span>操作</span></a></li>
				<!-- <li class="line">line</li>
				<li><a class="icon" href="demo_page4.html?uid={orderid}"
					target="navTab"><span>查看</span></a></li> -->
			</ul>
		</div>
		<table class="table" width="100%" layoutH="138">
			<thead>
				<tr>
					<th>订单编号</th>
					<th>用户</th>
					<th>提现金额</th>
					<th>提现账户类型</th>
					<th>提现权限</th>
					<th>提现说明</th>
					<th>提现状态</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderlist}" var="order">
					<tr target="refund_id" rel="${order.refund_id }">
						<td><c:out value="${order.refund_id}"></c:out></td>
						<td><c:out value="${order.name}"></c:out></td>
						<td><c:out value="${order.refund_amount}"></c:out></td>
						<td><c:choose>
								<c:when test="${empty order.payable}">
							支付宝
						</c:when>
								<c:otherwise>
									<c:out value="${order.payable}"></c:out>
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${order.settlementauthority==1}">
							T+0
						</c:when>
								<c:when test="${order.settlementauthority==2}">
							T+1
						</c:when>
						<c:otherwise>D+0</c:otherwise>
							</c:choose></td>
						<td><c:out value="${order.explain}"></c:out></td>
						<td><c:if test="${order.refund_state==1}">
							成功
						</c:if> <c:if test="${order.refund_state==2}">
							处理中
						</c:if> <c:if test="${order.refund_state==3}">
							失败
						</c:if></td>
						<td><c:out value="${order.createtime}"></c:out></td>
						<td>
							<!-- <a title="删除" target="ajaxTodo" href="#" class="btnDel">删除</a> -->
							<a class="btnEdit" title="编辑" href="<%=adminbasePath%>/refund/showRefund?refuid=${order.refund_id }" width="850" height="480" mask=true target="dialog" rel="refu${order.refund_id }"><span>编辑</span></a> <!-- <a title="查看" target="navTab" href="#" class="btnView">查看</a> -->
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