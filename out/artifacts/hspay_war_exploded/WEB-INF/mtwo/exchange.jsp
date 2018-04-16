<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>

</head>

<body data-type="exchange-${participate }">
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
                                <div class="widget-title am-fl">
	                                <div class="am-g">
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group tpl-table-list-select">
								            <select name="netparticipate" id="netparticipate" data-am-selected="{maxHeight:200}">
												<option value="0">请选择支付方式</option>
												<c:forEach items="${partici}" varStatus="l" var="par">
													<option value="${par.codeid}" ${par.codeid==participate?"selected='selected'":"" }>${par.payable}</option>
												</c:forEach>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group tpl-table-list-select">
								            <select name="netstate" id="netstate" data-am-selected>
												<option value="0">请选择</option>
												<option value="1" selected="selected">成功</option>
												<option value="2">处理中</option>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="netstarttime" id="netstarttime" Placeholder="开始日期"　type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="netendtime" id="netendtime" Placeholder="结束日期"type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								    </div>
	                                <div class="am-g">
								        <div class="am-u-sm-12 am-u-md-6">
								          <div class="am-input-group">
								            <input type="text" class="am-form-field" name="netid" id="netid" Placeholder="订单号或商户订单号">
								          <span class="am-input-group-btn">
								          <a href="javascript:net(1);" class="am-btn am-btn-primary tpl-btn-bg-color-success">搜索</a>
								          </span>
								          </div>
								        </div>
							        </div>
						        </div>
                                <div class="widget-title am-fl"><em>订单总数：</em><i>${ordertotal.tote }</i>
	                <em>条 交易金额：</em><i>${ordertotal.amttote }</i>
	                <em>（元）  实际金额：</em><i>${ordertotal.amounttote}</i>
	                <em>（元）</em></div>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
                                <div class="am-scrollable-horizontal">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
									<tbody>
										<tr>
											<th>订单号</th>
											<th>商户订单号</th>
											<th>订单日期</th>
											<th>交易方式</th>
											<th>来源</th>
											<th>金额(元)</th>
											<th>状态</th>
											<th>同步</th>
											<th>通知</th>
										</tr>
									</tbody>
									<tbody id="net">
									</tbody>
                                 </table>
                                </div>
                                <ul class="am-pagination tpl-pagination">
								  <li><a href="javascript:;" onclick="net(0)" id="netprev">&laquo;上一页</a></li>
								  <li class="am-active"><a href="javascript:;" id="netnum">1</a></li>
								  <li><a href="javascript:;" onclick="net(2)" id="netnext">下一页&raquo;</a></li>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<jsp:include page="include/script.jsp"></jsp:include>
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script type="text/javascript">
	var page = 1;
	var basePath="<%=basePath %>";
	$(document).ready(function() {
		net(page);
	});
	function net(pages) {
		var netstarttime = $("#netstarttime").val();
		var netendtime = $("#netendtime").val();
		var netparticipate = $("#netparticipate").val();
		var netstate = $("#netstate").val();
		var netid = $("#netid").val();
		wangyin(basePath, pages, netstarttime, netendtime, netparticipate,
				netstate, netid);
	}
</script>
</body>
</html>