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

<body data-type="another-log">
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
												<option value="0" selected="selected">请选择</option>
												<option value="1">成功</option>
												<option value="2">处理中</option>
												<option value="3">失败</option>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group ">
								            <input class="am-form-field" name="refundstarttime" id="refundstarttime" Placeholder="开始日期"　type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group tpl-form-border-form cl-p">
								            <input class="am-form-field" name="refundendtime" id="refundendtime" Placeholder="结束日期"type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-input-group tpl-form-border-form cl-p">
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
											<th>收款者</th>
											<th>代付金额(元)</th>
											<th>代付方式</th>
											<th>代付说明</th>
											<th>代付状态</th>
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

function refunds(basePath, page, refundstarttime, refundendtime, refundstate,
		refundid) {
	$
			.ajax({
				url : basePath + "/mtwo/getRefund",
				data : 'refundpage=' + page + '&&refundstarttime='
						+ refundstarttime + '&&refundendtime=' + refundendtime
						+ '&&refundstate=' + refundstate + '&&refundid='
						+ refundid,
				type : 'post',
				dataType : 'json',
				error : function() {
					alert('数据获取失败');
				},
				success : function(datas) {
					var data = datas[0];
					refundpage = datas[1];
					if (page == 1) {
						$("li#refundprev").addClass("active");
					} else {
						$("li#refundprev").removeClass("active");
					}
					if (page == refundpage) {
						$("li#refundnext").addClass("active");
					} else {
						$("li#refundnext").removeClass("active");
					}
					var prev = page - 1;
					var next = page + 1;
					$("a#refundprev").attr("onclick", "refund(" + prev + ")");
					$("a#refundnum").html(page);
					$("a#refundnext").attr("onclick", "refund(" + next + ")");
					var st = "<ul class='ajax-loaders'>";
					st += "<li><img src='" + basePath
							+ "/img/ajax-loaders/ajax-loader-7.gif'></li></ul>";
					$("#refund").html(st);
					var str = "";
					for (var i = 0; i < data.length; i++) {
						str += "<tr>";
						str += "<td><span class='label'>" + data[i].refund_id
								+ "</span></td>";
						str += "<td class='center'><span class='label'>"
								+ data[i].createtime + "</span></td>";
						str += "<td class='center'><span class='label'>"
								+ data[i].account_name + "</span></td>";
						str += "<td class='center'><span class='label'>"
								+ data[i].refund_amount + "-"
								+ data[i].refund_fees + "="
								+ data[i].refund_actual + "</span></td>";
						str += "<td class='center'><span class='label'>"
								+ data[i].net_name + "</span></td>";
						str += "<td class='center'><span class='label'>"
								+ data[i].explain + "</span></td>";
						if (data[i].refund_state == '1') {
							str += "<td class='center'><span class='label label-success'>成功</span></td>";
						} else if (data[i].refund_state == '2') {
							str += "<td class='center'><span class='label label-warning'>处理中</span></td>";
						} else if (data[i].refund_state == '3') {
							str += "<td class='center'><span class='label label-warning'>失败</span></td>";
						}
						str += "</tr>";
					}
					$("#refund").html(str);
				}
			});
}
</script>
</body>
</html>