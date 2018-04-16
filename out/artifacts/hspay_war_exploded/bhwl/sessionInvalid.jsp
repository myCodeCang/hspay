<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商户登录</title>
<jsp:include page="include/script.jsp"></jsp:include>
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#defaultForm").Validform({
		tiptype : 1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/member";
				},1000);
			}else{
				$('#mererror').css('display','block').html(data.info);
			}
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	
	<section class="login">
	<div class="login_box centre clearfix">
		<div class="login_left" style="width: 795px;height: 491px;">
			<img src="static/imgs/icons/A1tu.png" alt="" />
		</div>
		<div class="login_right">
			<h1>登录智汇宝</h1>
			<form name="frmLogon" action="<%=basePath%>/login/login" id="defaultForm" method="post"
				class="form-horizontal ysbformvalidate" style="padding: 25px 37px">
							<input type="hidden" name="IS_PAGE_CODE" value="T" id="IS_PAGE_CODE" />
							<input type="hidden" name="CHK_SMS_FLG" value="Y" id="CHK_SMS_FLG" />
							<input id="VER_CD" name="VER_CD" type="hidden" size="4" value="1234" maxlength="4" class="loginyzm"/>
				<div class="form-group has-feedback">
					<div class="" style="height: 75px;">
						<input type="text" class="form-control" name="email" id="email" placeholder="请输入用户名" nullmsg="请输入用户名！" style="line-height: 17px;"/>
						<div class="errorholder" style="display: none; height: 25px;margin-left:10px;">
							<img src="static/imgs/icons/A2.png" style="margin-left: 5px;margin-top:8px;" /> 
							<small class="help-block" id="username_error" validType="mobile-email"
								style="margin-top: -16px; margin-left: 30px;">请填写邮箱</small>
						</div>
					</div>
				</div>
				<div class="form-group has-feedback">
					<input name="cr" id="cr" type="hidden" value="">
					<div class="" style="height: 75px;">
						<input type="password" id="password" name="password" value="" oncopy="return false;" placeholder="请输入登录密码"  nullmsg="请输入登录密码！"
							onpaste="return false;" oncut="return false;" autocomplete="off" style="padding: 6px 12px;line-height: 17px;" class="form-control"/>
						<div class='keyboard' onclick = "showKeyboard('password')" id ="toggle2" 
							style="cursor: pointer;position: absolute; top: 14px; right: 11px;">
						</div>
						<div class="errorholder" style="display: none; height: 25px;margin-left:10px;">
							<img src="static/imgs/icons/A2.png" style="margin-left: 5px;margin-top:8px;" /> 
							<small class="help-block" validType="pwd" id="password_error" style="margin-top: -16px; margin-left: 30px;">密码格式不正确</small>
						</div>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="" style="height: 75px;">
						<font id="mererror" name="mererror" style="display: none; height:34px;" class="tsypic"></font>
					</div>
				</div>
				<div class="form-group">
					<div class="button_btn">
						<button id="btnSubmit" class="btn btn-primary" name="signup2" value="Sign up 2"
							style="margin: 0px 0 13px 0;">登录</button>
						<a href="toRegister.jsp" title="注册">
							<em class="btn btn-primary2" value="Sign up 2" style="padding-top: 5px;">注册</em>
						</a>
					</div>
				</div>
			</form>
			<div class="login_text"
				style="height: 60px; line-height: 25px; border-top: 1px solid #e4e4e4;">
				<em class="login_three">忘记密码请联系客服！</em>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="include/feet.jsp"></jsp:include>

<script type="text/javascript">
	$(".dropdown a").click(function(){
		$(".dropdown-menu").slideToggle(0)
	});
	var msg='';
	if(msg!='' && msg!='SCM00000'){
		$('#mererror').css('display','block').html("您的输入有错");
	}
	/* $(window).click(function(){
		$(".dropdown-menu").slideToggle(0)
	}) */
	
</script>
</body>
</html>