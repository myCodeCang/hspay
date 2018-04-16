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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../page/upage1.jsp"></jsp:include>
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script type="text/javascript">
var page = 1;
$(document).ready(function(){
	$('#refundstarttime').datepicker({autoclose:true}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	$('#refundendtime').datepicker({autoclose:true}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	refund(page);
$("#bankform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
			},1000);
		}else{
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
			},1000);
		}
	}
});
$("#networkform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
			},1000);
		}else{
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
			},1000);
		}
	}
});
$("#refundform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
			},1000);
		}else{
			setTimeout(function(){
				$.Hidemsg(); 
				window.location.href="<%=basePath%>/settlement";
					}, 1000);
				}
			}
		});
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
</head>
<body style="font-family: Microsoft YaHei">
	<jsp:include page="../page/top1.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<jsp:include page="../page/left1.jsp"></jsp:include>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
						<li class="active">结算管理</li>
					</ul>
					<!-- .breadcrumb -->
				</div>

				<div class="page-content" id="adminloading">
					<div class="row">
						<div class="col-sm-12">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#info">
											<i class="green icon-home bigger-110"></i> 提现申请
									</a></li>
									<li><a data-toggle="tab" href="#custom"> <i
											class="green icon-home bigger-110"></i> 提现记录
									</a></li>
									<li><a data-toggle="tab" href="#five"> <i
											class="green icon-home bigger-110"></i> 提现账号
									</a></li>
								</ul>

								<div class="tab-content">
									<div id="info" class="tab-pane in active">
										<div class="row">
											<div class="col-sm-6">
												<form class="form-horizontal"
													action="<%=basePath%>/settlement/withdrawal" method="post"
													id="refundform">
													<input type="hidden" name="withdrawalToken" value="${withdrawalToken}" />
													<fieldset>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">提现方式：</label>
															<c:if test="${balance.settlementauthority==1}">
																<div class="controls">T+0 每天提现次数:无限</div>
															</c:if>
															<c:if test="${balance.settlementauthority==2}">
																<div class="controls">T+1 每天提现次数:1</div>
															</c:if>
														</div>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="selectError3">提现账户类型：</label>
															<div class="col-sm-9">
																<select id="selectError3" name="refund_types">
																	<c:choose>
																		<c:when test="${empty bank}">
																			<option value="">银行卡：未绑定</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${bank.account_types}">银行卡：
																				<c:out value="${bank.codeid}"></c:out></option>
																		</c:otherwise>
																	</c:choose>
																	<c:choose>
																		<c:when test="${empty network}">
																			<option value="">网络账户：未绑定</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${network.account_types}">网络账户：
																				<c:out value="${network.branch}"></c:out></option>
																		</c:otherwise>
																	</c:choose>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">可用账户余额：</label>
															<div class="col-sm-9">
																<div class="input-prepend input-append">
																	<span class="add-on">$</span><span class="add-on"><c:out
																			value="${balance.settlement }"></c:out> </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">提现金额：</label>
															<div class="col-sm-9">
																<input type="text" name="refund_amount" datatype="n"
																	nullmsg="请输入金额！" errormsg="输入金额有误，请重新输入！" />
															</div>
														</div>
														<div class="clearfix form-actions">
															<button type="submit" class="btn btn-primary">确认提交</button>
															<button class="btn">重新填写</button>
														</div>
													</fieldset>
												</form>
											</div>
											<div class="col-sm-6">
												<div class="well">
													<ol>
														<li>为确保提现成功，请保证可用余额资金充足；</li>
														<li>目前只支持：工商银行、农业银行、招商银行、建设银行；</li>
														<li>招商银行、工商银行支持T+0到账、农业银行、建设银行支持T+1到账；</li>
														<li>T+0:0点~8点提交并审核的批付单，8点后一起付出，正常情况当天13:00左右到账；</li>
														<li>T+0:8点~12点提交并审核的批付单，12点后一起付出，正常情况当天16:00左右到账；</li>
														<li>T+0:12点~24点提交并审核的批付单，次日8点后一起付出，正常情况次日16:00左右到账；</li>
														<li>T+1结算，是指T日的交易，在T+1日结算。</li>
													</ol>
												</div>
											</div>
										</div>
									</div>

									<div id="custom" class="tab-pane">
										<div class="row">
											<div class="col-sm-3">
												订单编号：<input style="width: 150px" name="refundid"
													id="refundid" type="text" Placeholder="订单编号" />
											</div>
											<div class="col-sm-3">
												<div class="row">
													<div class="col-sm-6">
														日期：<input name="refundstarttime" id="refundstarttime"
															style="width: 70px" type="text" class="datepicker"
															Placeholder="开始时间">
													</div>
													<div class="col-sm-5">
														<input name="refundendtime" id="refundendtime"
															style="width: 70px" type="text" class="datepicker"
															Placeholder="结束时间">
													</div>
												</div>
											</div>
											<div class="col-sm-2">
												订单状态：<select name="refundstate" id="refundstate"
													style="width: 80px">
													<option value="0">请选择</option>
													<option value="1">成功</option>
													<option value="2">处理中</option>
													<option value="3">失败</option>
												</select>
											</div>
											<div class="col-sm-2">
												<input class="btn btn-small btn-primary" type="button"
													onclick="refund(1)" value="查询">
											</div>
										</div>
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>订单号</th>
													<th>申请日期</th>
													<th>提现金额(元)</th>
													<th>提现方式</th>
													<th>提现说明</th>
													<th>提现状态</th>
												</tr>
											</thead>
											<tbody id="refund">
											</tbody>
										</table>
										<ul class="pagination">
											<li class="active" id="refundprev"><a href="#"
												onclick="refund(0)" id="refundprev"> <i
													class="icon-double-angle-left"></i>
											</a></li>
											<li class="active"><a href="#" id="refundnum">1</a></li>
											<li id="refundnext"><a href="#" onclick="refund(2)"
												id="refundnext"> <i class="icon-double-angle-right"></i>
											</a></li>
										</ul>
									</div>

									<div id="five" class="tab-pane">
										<div class="row">
											<div class="col-sm-6">
												<div class="tabbable">
													<ul class="nav nav-tabs" id="myTab">
														<li class="active"><a data-toggle="tab" href="#bank">
																银行卡</a></li>
														<li><a data-toggle="tab" href="#network"> 网络账户</a></li>
													</ul>

													<div class="tab-content">
														<div id="bank" class="tab-pane in active">
															<form class="form-horizontal" id="bankform"
																action="<%=basePath%>/settlement/upSettleAcount"
																method="post">
																<input type="hidden" name="account_types" value="1" />
																<fieldset>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right"
																			for="selectError">开户银行：</label>
																		<div class="col-sm-8">
																			<select id="selectError" data-rel="chosen"
																				name="codeid">
																				<c:forEach items="${partici}" varStatus="l"
																					var="par">
																					<option value="${par.codeid}"><c:out
																							value="${par.payable}"></c:out></option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">开户姓名：</label>
																		<div class="col-sm-8">
																			<c:out value="${per.contacts}"></c:out>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">收款人开户行的省名：</label>
																		<div class="col-sm-8">
																			<input type="text" name="branchsheng" 
																				datatype="*" errormsg="开户行的省名不能为空" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">收款人开户行的市名：</label>
																		<div class="col-sm-8">
																			<input type="text" name="branchshi" 
																				datatype="*" errormsg="开户行的市名不能为空" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">开户支行：</label>
																		<div class="col-sm-8">
																			<input type="text" name="branch" 
																				datatype="*" errormsg="开户行不能为空" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">新银行卡号：</label>
																		<div class="col-sm-8">
																			<input type="text" name="account" datatype="*"
																				errormsg="新银行卡号不能为空" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-4 control-label no-padding-right">确认新卡号：</label>
																		<div class="col-sm-8">
																			<input type="text" datatype="*" recheck="account"
																				errormsg="您两次输入的银行卡号不一致！" />
																		</div>
																	</div>
																	<div class="clearfix form-actions">
																		<button type="submit" class="btn btn-primary">确认提交</button>
																		<button class="btn">重新填写</button>
																	</div>
																</fieldset>
															</form>
														</div>

														<div id="network" class="tab-pane">
															<form class="form-horizontal" id="networkform"
																action="<%=basePath%>/settlement/upSettleAcount"
																method="post">
																<input type="hidden" name="account_types" value="2" />
																<fieldset>
																	<div class="form-group">
																		<label class="col-sm-3 control-label no-padding-right"
																			for="selectError">账户类型：</label>
																		<div class="col-sm-9">
																			<label class="radio"> <input type="radio"
																				name="optionsRadios" id="optionsRadios1"
																				value="option1" checked=""> 支付宝
																			</label>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-3 control-label no-padding-right">真实姓名：</label>
																		<div class="col-sm-9">
																			<c:out value="${per.contacts}"></c:out>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-3 control-label no-padding-right">新收款帐号：</label>
																		<div class="col-sm-9">
																			<input type="text" name="account" datatype="*"
																				errormsg="新收款账号不能为空" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-3 control-label no-padding-right">确认新收款帐号：</label>
																		<div class="col-sm-9">
																			<input type="text" datatype="*" recheck="account"
																				errormsg="您两次输入的收款账号不一致！" />
																		</div>
																	</div>
																	<div class="clearfix form-actions">
																		<button type="submit" class="btn btn-primary">确认提交</button>
																		<button class="btn">重新填写</button>
																	</div>
																</fieldset>
															</form>
														</div>
													</div>
												</div>
											</div>
											<div class="col-sm-6 ">
												<div class="well">
													<h3>您当前绑定的结算账户</h3>
													<dl>
														<dt>银行卡：</dt>
														<c:choose>
															<c:when test="${empty bank}">
																<dd>尚未绑定银行卡</dd>
															</c:when>
															<c:otherwise>
																<dd>
																	银行类型：
																	<c:out value="${bank.codeid}"></c:out>
																</dd>
																<dd>
																	开户姓名：
																	<c:out value="${bank.account_name}"></c:out>
																</dd>
																<dd>
																	开户支行：
																	<c:out value="${bank.branch}"></c:out>
																</dd>
																<dd>
																	收款帐号：
																	<c:out
																		value="${fn:substring(bank.account, 0, 4)}**************${fn:substring(bank.account, fn:length(bank.account)-4, fn:length(bank.account))}"></c:out>
																</dd>
															</c:otherwise>
														</c:choose>
														<dt>网络帐户：</dt>
														<c:choose>
															<c:when test="${empty network}">
																<dd>尚未绑定银行卡</dd>
															</c:when>
															<c:otherwise>
																<dd>
																	帐户类型：
																	<c:out value="${network.branch}"></c:out>
																</dd>
																<dd>
																	真实姓名：
																	<c:out value="${network.account_name}"></c:out>
																</dd>
																<dd>
																	收款帐号：
																	<c:out
																		value="${fn:substring(fn:substringBefore(network.account,'@'),0,5)}************"></c:out>
																</dd>
															</c:otherwise>
														</c:choose>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- /span -->

						<div class="col-sm-12">
							<jsp:include page="../page/jspfooter.jsp"></jsp:include>
						</div>
						<!-- /span -->
					</div>
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
			<jsp:include page="../page/switch.jsp"></jsp:include>
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!--/.fluid-container-->
</body>
</html>