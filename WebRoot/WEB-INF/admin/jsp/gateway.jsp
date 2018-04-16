<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<h2 class="contentTitle">通道列表</h2>
	<div class="pageFormContent" layoutH="42">

		<c:forEach items="${gatewaylist}" var="gateway">
			<div style="border: 1px solid #B8D0D6; padding: 5px; margin: 5px">
				<form action="<%=adminbasePath%>/gateway/upGateway" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
					<input type="hidden" name="gateway_id"
						value="${gateway.gateway_id }" />
					<fieldset>
						<legend>通道编号：${gateway.gateway_id }</legend>
						<dl style="width: 300px">
							<dt style="width: 50px">名称：</dt>
							<dd>${gateway.gateway_name }</dd>
						</dl>
						<dl style="width: 300px">
							<dt style="width: 80px">商户编号：</dt>
							<dd>
								<input type="text" name="gateway_merid"
									value="${gateway.gateway_merid }" />
							</dd>
						</dl>
						<dl>
							<dt style="width: 80px">商户密钥：</dt>
							<dd>
								<input type="text" style="width: 300px" name="gateway_key"
									value="${gateway.gateway_key }" />
							</dd>
						</dl>
						<c:if test="${gateway.gateway_function == 19 }">
						<dl>
							<dt style="width: 80px">通道号：</dt>
							<dd>
								<input type="text" style="width: 100px" name="gateway_channelid"
									value="${gateway.gateway_channelid }" />
							</dd>
						</dl>
						</c:if>
						<c:if test="${gateway.gateway_function == 21 }">
						<dl>
							<dt style="width: 80px">国付宝账号：</dt>
							<dd>
								<input type="text" style="width: 100px" name="gateway_channelid"
									value="${gateway.gateway_channelid }" />
							</dd>
						</dl>
						</c:if>
						<dl>
							<dd>
								<div class="button">
									<div class="buttonContent">
										<button type="submit">修改</button>
									</div>
								</div>
							</dd>
						</dl>
					</fieldset>
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>