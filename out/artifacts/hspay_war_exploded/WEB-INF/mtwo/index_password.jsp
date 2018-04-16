<%@page import="com.tool.CryptTool"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>

</head>

<body data-type="index-password">
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
                                <div class="widget-title am-fl" style="color: red;"><em>提示：</em>同一个手机号一小时内最多能操作3次！</div>
                            </div>
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-border-form" id="changepassword" action="<%=basePath %>/mtwo/upPassword" method="post">
                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-12 am-form-label am-text-left">密码类型选择：</label>
                                        <div class="am-u-sm-12  am-margin-top-xs">
                                            <select id="passw" name="passwtype"  data-am-selected>
											  <option value="1">登录密码</option>
											  <option value="2">支付密码 </option>
											</select>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-12 am-form-label am-text-left">原手机号：</label>
                                        <div class="am-u-sm-12">
                                            <%= CryptTool.getphone(map.getStr("phone")) %>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-12 am-form-label am-text-left">验证码：</label>
                                        <div class="am-u-sm-12">
										  <div class="am-input-group">
                                            <input type="text" class="am-form-field tpl-form-no-bg am-margin-top-xs" 
	                    size="16" datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证码！" errormsg="您填写的验证号不对不正确 ！">
										    <span class="am-input-group-btn">
										      <button class="am-btn am-btn-default am-margin-top-xs widget-fluctuation-tpl-btn sms"  onclick="sms()" type="button">获取验证码</button>
										    </span>
										  </div>
                                        </div>
                                    </div>


                                    <div class="am-form-group" id="zhifu" style="display: none;">
                                        <label class="am-u-sm-12 am-form-label  am-text-left">原支付密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" class="am-margin-top-xs"
	                    datatype="*" ajaxurl="<%=basePath%>/user/getPaymentboo" nullmsg="请输入支付原密码！" errormsg="请输入支付原有密码">
                                        </div>
                                    </div>

                                    <div class="am-form-group" id="zhifu1" style="display: none;">
                                        <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">新支付密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" name="payment" class="am-margin-top-xs" 
	                    datatype="*6-20" errormsg="密码范围在6~20位之间！">
                                        </div>
                                    </div>

                                    <div class="am-form-group" id="zhifu2" style="display: none;">
                                        <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">确认支付密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" class="am-margin-top-xs" 
	                    recheck="payment" errormsg="您两次输入的支付密码不一致！">
                                        </div>
                                    </div>
                                    <div class="am-form-group" id="pas">
                                        <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">原密码：</label>
                                        <div class="am-u-sm-12">
	                    <input type="password" class="am-margin-top-xs" 
	                    datatype="*" ajaxurl="<%=basePath%>/user/getPasswordboo" nullmsg="请输入原密码！" errormsg="请输入原有密码">
                                        </div>
                                    </div>
                                    <div class="am-form-group" id="pas1">
                                        <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">新密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" class="am-margin-top-xs" 
	                    name="password" datatype="*6-20" errormsg="密码范围在6~20位之间！">
                                        </div>
                                    </div>
                                    <div class="am-form-group" id="pas2">
                                        <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">确认密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" class="am-margin-top-xs" 
	                    datatype="*" recheck="password" errormsg="您两次输入的账号密码不一致！">
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-u-sm-12 am-u-sm-push-12">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
                                </form>
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
			alert(data.info);
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/mtwo/indexPassword";
				},1000);
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
		url: "<%=basePath%>/mtwo/getSms", 
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
	if(newphone)
	$.ajax({
		type: "post", 
		url: "<%=basePath%>/mtwo/getNewSms", 
		data: "newphone="+newphone ,
		success: function(msg){
			if(msg=="100"){
				num = 300;
				$("button.newsms").attr("disabled","disabled");
				interv = setInterval(newchangeTime,1000);
			}else{
				alert(msg);
			}
		}
	}); 
	else
		alert('请输入能收到短信的新手机号');
}
</script>
</body>
</html>