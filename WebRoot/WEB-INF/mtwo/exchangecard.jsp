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

<body data-type="exchange-card">
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
								            <select name="cardparticipate" id="cardparticipate" data-am-selected="{maxHeight:200}">
												<option value="0">请选择支付方式</option>
												<c:forEach items="${cardcode}" varStatus="l" var="par">
													<option value="${par.codeid}">${par.payable}</option>
												</c:forEach>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group tpl-table-list-select">
								            <select name="cardstate" id="cardstate" data-am-selected>
												<option value="0">请选择</option>
												<option value="1" selected="selected">成功</option>
												<option value="2">处理中</option>
											</select>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="cardstarttime" id="cardstarttime" Placeholder="开始日期"　type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								        <div class="am-u-sm-12 am-u-md-3">
								          <div class="am-form-group">
								            <input class="am-form-field" name="cardendtime" id="cardendtime" Placeholder="结束日期"type="text" data-am-datepicker readonly/>
								          </div>
								        </div>
								    </div>
	                                <div class="am-g">
								        <div class="am-u-sm-12 am-u-md-6">
								          <div class="am-input-group">
								            <input type="text" class="am-form-field" name="cardid" id="cardid" Placeholder="订单号或商户订单号">
								          <span class="am-input-group-btn">
								            <a class="am-btn am-btn-primary tpl-btn-bg-color-success" href="javascript:card(1);">搜索</a>
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
											<th>订单日期</th>
											<th>交易方式</th>
											<th>来源</th>
											<th>金额(元)</th>
											<th>状态</th>
											<th>同步</th>
											<th>通知</th>
											<th>操作</th>
										</tr>
									</tbody>
									<tbody id="card">
									</tbody>
                                 </table>
                                </div>
                                <ul class="am-pagination tpl-pagination">
								  <li><a href="javascript:;" onclick="card(0)" id="cardprev">&laquo;上一页</a></li>
								  <li class="am-active"><a href="javascript:;" id="cardnum">1</a></li>
								  <li><a href="javascript:;" onclick="card(2)" id="cardnext">下一页&raquo;</a></li>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">详细订单
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
        <div class="am-scrollable-horizontal">
		<table border="0" cellspacing="0" cellpadding="0">
		<tbody><tr>
		<th>订单号</th>
		<th>商户订单号</th>
		<th>支付时间</th>
		<th>支付通道</th>
		<th>支付金额</th>
		<th>实际金额</th>
		<th>扣除金额</th>
		<th>状态</th>
		<th>说明</th>
		</tr></tbody>
		<tbody id="singlecard"></tbody>
		</table>
		</div>
    </div>
  </div>
</div>
<jsp:include page="include/script.jsp"></jsp:include>
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script type="text/javascript">
	var cardpage = 1;
	var basePath="<%=basePath %>";
	$(document).ready(function() {
		card(cardpage);
	});
	function card(pages) {
		var cardstarttime = $("#cardstarttime").val();
		var cardendtime = $("#cardendtime").val();
		var cardparticipate = $("#cardparticipate").val();
		var cardstate = $("#cardstate").val();
		var cardid = $("#cardid").val();
		cards(basePath, pages, cardstarttime, cardendtime, cardparticipate,
				cardstate, cardid);
	}
	function showcard(singid) {
		sing(basePath, singid);
		var con=$('#singlecard').html();
		if(con)
			$('#your-modal').modal();
	}
</script>
</body>
</html>