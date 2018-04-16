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

<body data-type="index-phone">
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
                                <form class="am-form tpl-form-border-form" id="mods" action="<%=basePath %>/mtwo/upPhone" method="post">
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


                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-form-label  am-text-left">新手机号码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-margin-top-xs" size="16" 
	                    name="newphone" id="newphone">
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-12 am-form-label am-text-left">验证码：</label>
                                        <div class="am-u-sm-12">
										  <div class="am-input-group">
                                            <input type="text" class="am-form-field tpl-form-no-bg am-margin-top-xs" 
	                    size="16" datatype="*" ajaxurl="<%=basePath%>/mtwo/newPhoneSms" nullmsg="请填写验证码！" errormsg="您填写的验证号不对不正确 ！">
										    <span class="am-input-group-btn">
										      <button class="am-btn am-btn-default am-margin-top-xs widget-fluctuation-tpl-btn newsms"  onclick="newsms()" type="button">获取验证码</button>
										    </span>
										  </div>
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
$("#mods").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		alert(data.info);
		if(data.status=="y"){
			setTimeout(function(){
				window.location.href="<%=basePath%>/mtwo/indexPhone";
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