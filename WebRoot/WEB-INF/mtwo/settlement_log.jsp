<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>
</head>

<body data-type="settlement-log">
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
								            <select name="refundstate" id="refundstate" data-am-selected>
												<option value="0">请选择</option>
												<option value="1" selected="selected">成功</option>
												<option value="2">处理中</option>
												<option value="3">失败</option>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="refundstarttime" id="refundstarttime" Placeholder="开始日期"　type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="refundendtime" id="refundendtime" Placeholder="结束日期"type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-input-group">
								            <input type="text" class="am-form-field" name="refundid" id="refundid" Placeholder="订单号">
								          <span class="am-input-group-btn">
								          <a href="javascript:refund(1);" class="am-btn am-btn-primary tpl-btn-bg-color-success">搜索</a>
								          </span>
								          </div>
								        </div>
							        </div>
						        </div>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
                                <div class="am-scrollable-horizontal">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
									<tbody>
										<tr>
											<th>订单号</th>
											<th>申请日期</th>
											<th>提现金额(元)</th>
											<th>提现方式</th>
											<th>提现说明</th>
											<th>提现状态</th>
										</tr>
									</tbody>
									<tbody id="refund">
									</tbody>
                                 </table>
                                </div>
                                <ul class="am-pagination tpl-pagination">
								  <li><a href="javascript:;" onclick="refund(0)" id="refundprev">&laquo;上一页</a></li>
								  <li class="am-active"><a href="javascript:;" id="refundnum">1</a></li>
								  <li><a href="javascript:;" onclick="refund(2)" id="refundnext">下一页&raquo;</a></li>
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
var basePath="<%=basePath %>";
var page = 1;
$(document).ready(function(){
	refund(page);
	});
function refund(pages) {
	var refundstarttime = $("#refundstarttime").val();
	var refundendtime = $("#refundendtime").val();
	var refundstate = $("#refundstate").val();
	var refundid = $("#refundid").val();
	refunds(basePath, pages, refundstarttime, refundendtime, refundstate,
			refundid);
}
</script>
</body>
</html>