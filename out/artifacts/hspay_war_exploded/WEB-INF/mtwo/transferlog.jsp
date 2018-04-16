<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>
</head>

<body data-type="transfer-log">
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
								          <div class="am-form-group">
								            <input class="am-form-field" name="starttime" id="starttime" Placeholder="开始日期"　type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="endtime" id="endtime" Placeholder="结束日期"type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-6">
								          <div class="am-input-group">
								            <input type="text" class="am-form-field" name="transferid" id="transferid" Placeholder="订单编号">
								          <span class="am-input-group-btn">
								          <a href="javascript:net(1);" class="am-btn am-btn-primary tpl-btn-bg-color-success">搜索</a>
								          </span>
								          </div>
								        </div>
							        </div>
						        </div>
						    </div>
                            <div class="widget-body  widget-body-lg am-fr">
                                <div class="am-scrollable-horizontal">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                    <thead>
                                        <tr>
											<th>转账编号</th>
											<th>转账账户</th>
											<th>转账接收账户</th>
											<th>金额(元)</th>
											<th>转账时间</th>
											<th>转账说明</th>
                                        </tr>
                                    </thead>
									<tbody id="transfer">
									</tbody>
                                 </table>
                            	</div>
                                <ul class="am-pagination tpl-pagination">
								  <li><a href="javascript:;" onclick="transferpa(0)" id="tranprev">&laquo;上一页</a></li>
								  <li class="am-active"><a href="javascript:;" id="trannum">1</a></li>
								  <li><a href="javascript:;" onclick="transferpa(2)" id="trannext">下一页&raquo;</a></li>
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
$(document).ready(function(){
	transferpa(1);
	});
function transferpa(pages){
	var transferid = $("#transferid").val();
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	gettransfer(basePath, pages, starttime, endtime, transferid);
}
</script>
</body>
</html>