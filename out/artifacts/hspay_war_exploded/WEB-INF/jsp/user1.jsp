<%@page import="com.tool.CryptTool"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
	Logrecord log = (Logrecord) request.getSession().getAttribute(
	"logrecord");
	List<Logrecord> logs = (List<Logrecord>) request
	.getAttribute("logs");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../page/upage1.jsp"></jsp:include>
<script type="text/javascript">
var num = 60;
var interv = "";
$(document).ready(function(){
	$("#passw").change(function() {
		var huge = $("#passw").val();
		if(huge==1){
			$("#pas").fadeIn();
			$("#pas1").fadeIn();
			$("#pas2").fadeIn();
			$("#zhifu").fadeOut();
			$("#zhifu1").fadeOut();
			$("#zhifu2").fadeOut();
		}else{
			$("#pas").fadeOut();
			$("#pas1").fadeOut();
			$("#pas2").fadeOut();
			$("#zhifu").fadeIn();
			$("#zhifu1").fadeIn();
			$("#zhifu2").fadeIn();
		}
	});
	$("#changepassword").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}
		}
	});
	$("#mods").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}
		}
	});
	$("#modifikey").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
					}, 1000);
				}
			}
		});
	});
function changeTime() {
	if (num > 0) {
		$("button.sms").html(num+'秒');
		num = num - 1;
	}else{
		clearInterval(interv);
		$("button.sms").removeAttr("disabled");
		$("button.sms").html("重新获取验证码");
	}
}
function sms(){
	num = 60;
	$.ajax({
		type: "post", 
		url: "<%=basePath%>/user/getSms", 
		success: function(msg){
			if(msg=="100"){
				num = 300;
				$("button.sms").attr("disabled","disabled");
				interv = setInterval(changeTime,1000);
			}else{
				alert(msg);
			}
		}
	}); 
}
function newchangeTime() {
	if (num > 0) {
		$("button.newsms").html(num+'秒');
		num = num - 1;
	}else{
		clearInterval(interv);
		$("button.newsms").removeAttr("disabled");
		$("button.newsms").html("重新获取验证码");
	}
}
function newsms(){
	num = 60;
	var newphone = $("#newphone").val();
	$.ajax({
		type: "post", 
		url: "<%=basePath%>/user/getNewSms", 
		data: "newphone="+newphone ,
		success: function(msg){
			if(msg=="100"){
				num = 300;
				$("button.sms").attr("disabled","disabled");
				interv = setInterval(newchangeTime,1000);
			}else{
				alert(msg);
			}
		}
	}); 
}
</script>
</head>
<body>
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
						<li class="active">用户管理</li>
					</ul>
					<!-- .breadcrumb -->
				</div>

				<div class="page-content" id="adminloading">
					<div class="row">
						<div class="col-sm-8">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="smaller">用户管理</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div class="tabbable">
											<ul class="nav nav-tabs" id="myTab">
												<li class="active"><a data-toggle="tab" href="#info">
														用户信息 </a></li>
												<li><a data-toggle="tab" href="#custom"> 个人资料 </a></li>
												<li><a data-toggle="tab" href="#messages"> 密码修改 </a></li>
												<li><a data-toggle="tab" href="#phone"> 手机修改 </a></li>
												<li><a data-toggle="tab" href="#loginzone"> 登陆日志 </a></li>
											</ul>
											<div class="tab-content">
												<div id="info" class="tab-pane in active">
													<h3>账户信息</h3>
													<div class="well">
													<table>
														<tr>
															<td align="right">商&nbsp;&nbsp;&nbsp;户ID:</td>
															<td width="10px"></td>
															<td><%=map.get("id")%></td>
															<td width="100px"></td>
															<td align="right">登&nbsp;&nbsp;&nbsp;录IP:</td>
															<td width="10px"></td>
															<td><%=log.get("landingip")%></td>
														</tr>
														<tr>
															<td align="right">上次登录:</td>
															<td width="10px"></td>
															<c:forEach items="${logs}" var="log" begin="0" end="0">
																<td><c:out value="${log.landingtime}"></c:out></td>
															</c:forEach>
															<td width="100px"></td>
															<td align="right">登陆次数:</td>
															<td width="10px"></td>
															<td><%=logs.size()%></td>
														</tr>
													</table>
													</div>
													<h3>账户金额信息</h3>
													<div class="well">
													<table>
														<tr>
															<td align="right">帐户余额:</td>
															<td width="10px"></td>
															<td><c:out value="${balance.amount}"></c:out></td>
															<td width="100px"></td>
															<td align="right">可结算金额:</td>
															<td width="10px"></td>
															<td><c:out value="${balance.settlement}"></c:out></td>
														</tr>
													</table>
													</div>
													<h3>本日成功订单统计</h3>
													<div class="well">
													<table>
														<tr>
															<td align="right">网银订单:</td>
															<td width="10px"></td>
															<td>${ordercount }</td>
															<td width="100px"></td>
															<td align="right">点卡订单:</td>
															<td width="10px"></td>
															<td>${cardordercount }</td>
														</tr>
														<tr>
															<td align="right">在线入账:</td>
															<td width="10px"></td>
															<td>${rechargecount }</td>
															<td width="100px"></td>
															<td align="right">在线销卡:</td>
															<td width="10px"></td>
															<td>${circlipcount }</td>
														</tr>
													</table>
													</div>
												</div>

												<div id="custom" class="tab-pane">
													<h3>商户注册信息</h3>
													<div class="well">
													<p>
														<small>提示：如果需要修改相关信息 请联系在线 谢谢合作！</small>
													</p>
													<p>
														<%
															if (map.getInt("huge") == 0) {
														%>
														个人姓名：
														<%
															} else {
														%>
														企业名称：
														<%
															}
														%>
														<%=map.get("name")%></p>
													<p>
														联 系 人：<%=map.get("contacts")%></p>
													<p>
														联系地址：<%=map.get("address")%></p>
													<p>
														手机号码：<%=CryptTool.getphone(map.getStr("phone"))%></p>
													<p>
														QQ号码：<%=map.get("qq")%></p>
													<p>
														<%
															if (map.getInt("huge") == 0) {
														%>
														身 份 证：
														<%
															} else {
														%>
														营业执照：
														<%
															}
														%><%=CryptTool.getphone(map.getStr("idcard"))%></p>
													<p>
														网站名称：<%=map.get("webName")%></p>
													<p>
														网站网址：<%=map.get("website")%></p>
														</div>
												</div>

												<div id="messages" class="tab-pane">
													<h3>修改密码</h3>
									<div class="well">
										<form class="form-horizontal" id="changepassword" action="<%=basePath %>/user/upPassword" method="post">
											<fieldset>
												<div class="form-group">
													<label  class="col-sm-3 control-label no-padding-right" for="form-field-1">密码类型选择：</label>
													<div class="controls">
														<select id="passw" name="passwtype">
														<option value="1">登录密码</option>
														<option value="2">支付密码 </option>
													  	</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="prependedInput">手机号：</label>
													<div class="controls">
														<div class="input-append">
															<%= CryptTool.getphone(map.getStr("phone")) %>
															<font color="red">(注：同一个手机号一小时最多能操作3次)</font>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButton">验证码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="appendedInputButton" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证号！" errormsg="您填写的验证号不对不正确 ！">
															<button class="btn sms" onclick="sms()" type="button">获取验证码</button>
														</div>
													</div>
												</div>
												<div class="form-group" id="zhifu" style="display: none;">
													<label class="col-sm-3 control-label no-padding-right" for="appendedPrependedInput">支付原有密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/user/getPaymentboo" nullmsg="请输入支付原密码！" errormsg="请输入支付原有密码">
														</div>
													</div>
												</div>
												<div class="form-group" id="zhifu1" style="display: none;">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButton">支付新密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" name="payment" datatype="*6-20" errormsg="密码范围在6~20位之间！">
														</div>
													</div>
												</div>
												<div class="form-group" id="zhifu2" style="display: none;">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButtons">确认支付密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" datatype="*" recheck="payment" errormsg="您两次输入的支付密码不一致！">
														</div>
													</div>
												</div>
												<div class="form-group" id="pas">
													<label class="col-sm-3 control-label no-padding-right" for="appendedPrependedInput">原有密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/user/getPasswordboo" nullmsg="请输入原密码！" errormsg="请输入原有密码">
														</div>
													</div>
												</div>
												<div class="form-group" id="pas1">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButton">新密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" name="password" datatype="*6-20" errormsg="密码范围在6~20位之间！">
														</div>
													</div>
												</div>
												<div class="form-group" id="pas2">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButtons">确认密码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="prependedInput" size="16" type="text" datatype="*" recheck="password" errormsg="您两次输入的账号密码不一致！">
														</div>
													</div>
												</div>
												<div class="clearfix form-actions">
													<button type="submit" class="btn btn-primary">确认修改</button>
												</div>
											</fieldset>
										</form>
									</div>
												</div>

												<div id="phone" class="tab-pane">
													<h3>商户手机号码</h3>
									<div class="well">
										<form class="form-horizontal" id="mods" action="<%=basePath %>/user/upPhone" method="post">
											<fieldset>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="prependedInput">原手机号：</label>
													<div class="controls">
														<div class="input-append">
															<%= CryptTool.getphone(map.getStr("phone")) %>
															<font color="red">(注：同一个手机号一小时最多能操作3次)</font>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButton">验证码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="appendedInputButton" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证号！" errormsg="您填写的验证号不对不正确 ！">
															<button class="btn sms" onclick="sms()" type="button">获取验证码</button>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="prependedInput">新手机号：</label>
													<div class="controls">
														<div class="input-append">
															<input id="newphone" name="newphone" size="16" type="text">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="appendedInputButton">验证码：</label>
													<div class="controls">
														<div class="input-append">
															<input id="appendedInputButton" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/register/newPhoneSms" nullmsg="请填写验证号！" errormsg="您填写的验证号不对不正确 ！">
															<button class="btn newsms" onclick="newsms()" type="button">获取验证码</button>
														</div>
													</div>
												</div>
												<div class="clearfix form-actions">
													<button type="submit" class="btn btn-primary">确认修改</button>
												</div>
											</fieldset>
										</form>
									</div>
												</div>

												<div id="loginzone" class="tab-pane">
													<h3>登陆日志</h3>
									<div class="table-responsive">
										<table 
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>用户编号</th>
													<th>登陆IP</th>
													<th>登陆时间</th>
													<th>退出时间</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${logs}" varStatus="l" var="log">
													<tr>
														<td><c:out value="${l.index }"></c:out></td>
														<td><c:out value="${log.id }"></c:out></td>
														<td><c:out value="${log.landingip }"></c:out></td>
														<td><c:out value="${log.landingtime }"></c:out></td>
														<td><c:out value="${log.exittime }"></c:out></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						<!-- /span -->
						<div class="col-sm-4">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="smaller">
										商户接入信息
									</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main">
							<% 
								if(Person.dao.findById(map.getInt("id")).getInt("ifnet")!=2){
							%>
										<div class="well">
								<p>ID：<c:out value="${payment.id }"></c:out></p>
								<p>key：<c:out value="${payment.key }"></c:out> </p>
								<a  href="#key" role="button" class="green" data-toggle="modal" class="green btn btn-small btn-success btn-key">重新获取对接密钥</a>
							</div>
							<%}%>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td><label style="width:100px;">微信扫码:</label><c:out value="${rate.weixin}"></c:out></td>
										<td><label style="width:100px;">微信WAP:</label><c:out value="${rate.wxwap}"></c:out></td>
									</tr>
									<tr>
										<td><label style="width:100px;">支付宝扫码:</label><c:out value="${rate.alipay}"></c:out></td>
										<td><label style="width:100px;">支付宝WAP:</label><c:out value="${rate.alipaywap}"></c:out></td>
									</tr>
									<tr>
										<td><label style="width:100px;">财付通扫码:</label><c:out value="${rate.tenpay}"></c:out></td>
										<td><label style="width:100px;">ＱＱ钱包:</label><c:out value="${rate.qqmobile}"></c:out></td>
									</tr>
									<tr>
										<td><label style="width:100px;">网银的费率:</label><c:out value="${rate.banking}"></c:out></td>
										<td><label style="width:100px;">提现手续费:</label><c:out value="${rate.refund }"></c:out></td>
									</tr>
									<%-- 
									<tr>
										<td>久游一卡通:<c:out value="${rate.travel}"></c:out></td>
										<td>Q币充值卡:<c:out value="${rate.qqcoins}"></c:out></td>
									</tr>
									<tr>
										<td>征途游戏卡:<c:out value="${rate.journey}"></c:out></td>
										<td>盛大一卡通:<c:out value="${rate.grand}"></c:out></td>
									</tr>
									<tr>
										<td>天下一卡通:<c:out value="${rate.theworld}"></c:out></td>
										<td>完美一卡通:<c:out value="${rate.perfect}"></c:out></td>
									</tr>
									<tr>
										<td>联通充值卡:<c:out value="${rate.chinaunicom}"></c:out></td>
										<td>天宏一卡通:<c:out value="${rate.tianhong}"></c:out></td>
									</tr>
									<tr>
										<td>搜狐一卡通:<c:out value="${rate.sohu}"></c:out></td>
										<td>骏网一卡通:<c:out value="${rate.junwang}"></c:out></td>
									</tr>
									<tr>
										<td>全国神州行:<c:out value="${rate.shenzhouxing}"></c:out></td>
										<td>电信充值卡:<c:out value="${rate.telecom}"></c:out></td>
									</tr>
									<tr>
										<td>纵游一卡通:<c:out value="${rate.longitudinal}"></c:out></td>
										<td>提现手续费:<c:out value="${rate.refund }"></c:out></td>
									</tr>
									 --%>
								</tbody>
							</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<jsp:include page="../page/jspfooter.jsp"></jsp:include>
						</div>
						<!-- /span -->
					</div>
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
			<div class="modal fade" id="key">
			<div class="row">
			<div class="col-sm-12 well">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>手机验证</h3>
			</div>
			<form class="form-horizontal" id="modifikey" action="<%=basePath %>/user/upKey" method="post">
				<div class="modal-body">
					<fieldset>
						<div class="control-group">
							<label class="control-label" for="prependedInput">原手机号：</label>
							<div class="controls">
								<div class="input-append">
									<%= CryptTool.getphone(map.getStr("phone")) %>
									<font color="red">(注：同一个手机号一小时最多能操作3次)</font>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="appendedInputButton">验证码：</label>
							<div class="controls">
								<div class="input-append">
									<input id="appendedInputButton" size="16" type="text" datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证号！" errormsg="您填写的验证号不对不正确 ！">
									<button class="btn sms" onclick="sms()" type="button">获取验证码</button>
								</div>
							</div>
						</div>
					</fieldset>

				</div>
				<div class="modal-footer">
					<a href="#" class="btn" data-dismiss="modal">关闭</a>
					<button type="submit" class="btn btn-primary">确认获取</button>
				</div>
			</form>
			</div>
			</div>
		</div>
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