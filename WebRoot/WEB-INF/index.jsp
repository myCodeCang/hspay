<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="page/Plug1.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
	$("li#top1").addClass("active");
	$("#indexform").Validform({
		tiptype : 1,
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
					window.location.href="<%=basePath%>/";
				},1000);
			}
		}
	});
});
</script>

<style>
.ocx_style_wrap {
	background: #fff url(<%=basePath %>/static/new/images/bgtxt2.jpg) left center no-repeat;
	border: 0 solid #BEBEBE;
	border-radius: 2px 2px 2px 2px;
	color: #333333;
	cursor: text;
	float: left;
	height: 41px;
	line-height: 20px;
	width: 220px;
}
.ocx_style {
	background: none repeat scroll 0 0 #FFFFFF;
	height: 30px;
	line-height: 30px;
	width: 170px;
	margin-left: 48px;
	margin-top: 6px;
}
</style>
</head>

<body>
	<script type="text/javascript" src="<%=basePath %>/static/js/PassGuardCtrl.js"></script>
	<script type="text/javascript">
		var pgeditor = new $.pge({
			pgePath: "static/ocx/",		//控件文件目录
			pgeId: "_ocx_password",			//控件ID
			pgeEdittype: 0,					//控件类型,0星号,1明文
			pgeClass: "ocx_style",			//控件css样式
			pgeTabindex: 2,					//tab键顺序
			tabCallback:"code_id",			//非IE tab键焦点切换的ID
			pgeMaxlength: 32,				//允许最大输入长度
			pgeEreg1: "[\\s\\S]*",			//输入过程中字符类型限制
			pgeEreg2: "[\\s\\S]{6,32}"		//输入完毕后字符类型判断条件
		});	
	</script>

  

  
  <jsp:include page="navigation1.jsp"></jsp:include>

  
  <div class="banner">
  
   <div class="ilogin">
     
     <div class="ilogin_con">
     
      <div class="tips" id="errorMsg_tip" style="display: none;"><span class="close" id="close"><img src="<%=basePath %>/static/new/images/close.jpg" style="vertical-align:middle;" /></span>
      <h3 id="errorMsg"></h3></div>
       
       <h2>登录快银</h2>
       
       <form id="indexform" action="<%=basePath %>/login/login" method="post">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="logintable">
          <tr>
            <td style="padding-bottom:10px;">
            	<input name="email" type="text" value="" class="txt1" id="username_id" placeholder="请输入邮箱" id="login-name" datatype="*"
								errormsg="请输入邮箱" />
            </td>
          </tr>
          <tr id="normal_pwd">
            <td><input name="password" type="password" value="" class="txt1 txt2"  id="password_id" placeholder="请输入密码" id="login-pass" datatype="*"
								errormsg="请输入密码" /></td>
          </tr>
            <tr>
            <td style="padding-top: 10px">
           		<input type="submit" name="login_sub" value="登  录" class="btn1" />
           		<input name="ocx_password" type="hidden" />
				<input name="srand_num" type="hidden" />
				<input id="dis_btn" type="hidden" value="1" />
           	</td>
          </tr>
          
          <tr>
            <td><p style="line-height:30px;"><a href="<%=basePath%>/forgetpassword" class="fr">忘记密码</a><a href="<%=basePath%>/register" class="fl red">免费注册快银</a> </p></td>
          </tr>
          
       </table>
		</form>
		
     
     
     </div>
     
   </div>
   
     <div class="focus">
       <ul class="rslides f426x240">
       	<!-- <li style="background:url(static/new/images/banner_newyear.jpg) center top no-repeat"></li> -->
        <li style="background:url(<%=basePath %>/static/new/images/BANNER5.jpg) center top no-repeat"><a href="#" style="margin-left:-324px; margin-top:264px;"></a></li>
        <li style="background:url(<%=basePath %>/static/new/images/ban31.jpg) center top no-repeat"><a href="#" style="margin-left:-165px; margin-top:268px;"></a></li>
        <li style="background:url(<%=basePath %>/static/new/images/ban32.jpg) center top no-repeat"><a href="#" style="margin-left:-165px; margin-top:268px;"></a></li>
        <li style="background:url(<%=basePath %>/static/new/images/ban23.jpg) center top no-repeat"><a href="#" style="margin-left:-165px; margin-top:268px;"></a></li>
       </ul>
   </div>
    
  
  </div>
  
  <!--banner end-->
  
  
  <div class="main">
  
    <div class="wrap">
    
    <div class="m1">
     <div class="items">
        
        
       <div class="itword">
          <a href="<%=basePath %>/index_new/businessApp/agencyReceipt.jsp"><h2>代收代付</h2>
          <p>快银支付资金归集，为您解决收款点分散所带来的资金管理难题。</p>
          </a>
       </div>
       <div class="itpic"><a href="<%=basePath %>/index_new/businessApp/fundCollection.jsp"><img src="<%=basePath %>/static/new/images/ipic1.png" width="110" height="119" /></a></div>
       
       
     
     </div>
     
     <div class="items2 items">
     
       <div class="itword">
          <a href="<%=basePath %>/index_new/businessApp/B2BGateway.jsp"><h2>B2B网关</h2>
          <p>快银支付B2B网关，企业间电子商务活动中资金流全新模式。</p>
          </a>
       </div>
       <div class="itpic"><a href="<%=basePath %>/index_new/businessApp/B2BGateway.jsp"><img src="<%=basePath %>/static/new/images/ipic2.png" width="110" height="119" /></a></div>
     
     </div>    
     
     <div class="items3 items">
     
        <div class="itword">
          <a href="<%=basePath %>/index_new/payTools/mobileHasCard.jsp"><h2>移动有卡支付</h2>
          <p>快银支付手机支付，轻松充值购物、买保险、查余额、订酒店、订机票、代购火车票</p>
          </a>
       </div>
       <div class="itpic"><a href="<%=basePath %>/index_new/payTools/mobile.jsp"><img src="<%=basePath %>/static/new/images/ipic3.png" width="110" height="119" /></a></div>
     
     </div>
     
    </div>  
    
    <div class="m2">
    
       <div class="m2item">
         
         <h2><h2><a href="<%=basePath%>/dynamic?pageNum=1">公司动态</a></h2></h2>
         
         <ul class="itemlist">
            	<c:forEach items="${dynamicList}" varStatus="l" var="dynamic" begin="0" end="5">
            			<li><a href='<%=basePath%>/dynamic/getDynamic?dynamicid=${dynamic.dynamicid}' title="${dynamic.title}" >
            			<c:if test="${fn:length(dynamic.title)<=17}">
									<c:out value="${dynamic.title}"></c:out>
								</c:if>
								<c:if test="${fn:length(dynamic.title)>17}">
									<c:out value="${fn:substring(dynamic.title,0,16)}..."></c:out>
								</c:if>
						</a></li>
	      			</c:forEach>
			
         </ul>
       
       </div>
       
        <div class="m2item m2item2">
         
         <ul class="itemlist">
            	<c:forEach items="${dynamicList}" varStatus="l" var="dynamic" begin="6" end="10">
            			<li><a href='<%=basePath%>/dynamic/getDynamic?dynamicid=${dynamic.dynamicid}' title="${dynamic.title}" >
            			<c:if test="${fn:length(dynamic.title)<=17}">
									<c:out value="${dynamic.title}"></c:out>
								</c:if>
								<c:if test="${fn:length(dynamic.title)>17}">
									<c:out value="${fn:substring(dynamic.title,0,16)}..."></c:out>
								</c:if>
						</a></li>
	      			</c:forEach>
         </ul>
       
       </div>
       
       <div class="m2item m2item3">
         
         <h2><a href="<%=basePath %>/index_new/joinUs/societyRecruit.jsp">加入我们</a></h2>
         
         <ul class="itemlist">
         	<li><a href="<%=basePath %>/index_new/joinUs/societyRecruit.jsp">社会招聘</a></li>
            <li><a href="<%=basePath %>/index_new/joinUs/campusRecruit.jsp">校园招聘</a></li>
            <li><a href="<%=basePath %>/index_new/joinUs/snsRecruit.jsp">SNS招聘</a></li>
         </ul>
       
       </div>
    
    </div>
    <!--m2 end-->
     
    
    <div class="cls"></div>
    </div>
  
  
  </div>
  
  <!--main end-->
  
  
  
  <!--foot s-->
  
  <div class="cls"></div>
  <jsp:include page="page/footer1.jsp"></jsp:include>
</body>
</html>