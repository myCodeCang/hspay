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
	Logrecord log = (Logrecord) request.getSession().getAttribute("logrecord");
	List<Logrecord> logs = (List<Logrecord>) request.getAttribute("logs");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
<style type="text/css">
#Validform_msg{
	z-index: 999999999;
}
</style>
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
					window.location.href="<%=basePath%>/member";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/member";
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
					window.location.href="<%=basePath%>/member";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/member";
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
					window.location.href="<%=basePath%>/member";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/member";
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
		url: "<%=basePath%>/member/getSms", 
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
		url: "<%=basePath%>/member/getNewSms", 
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
function keyshow(){
	layer.open({
		  title:'手机验证',
		  type: 1,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['500px', '280px'], //宽高
		  content: $('#keyphone')
		});
}
</script>
</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member").text("用户管理");
});
function navTabs(org1,org2,org3,org4,org5,org6){
	$(org1).removeClass("disabled");
	$(org1).addClass("active");
	$(org2).removeClass("active");
	$(org2).addClass("disabled");
	$(org3).removeClass("active");
	$(org3).addClass("disabled");
	$(org4).removeClass("active");
	$(org4).addClass("disabled");
	$(org5).removeClass("active");
	$(org5).addClass("disabled");
	$(org6).removeClass("active");
	$(org6).addClass("disabled");
}
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">用户管理</a></h2>
		<ul id="nav">
			<li><a href="javascript:navTabs('#info','#custom','#messages','#phone','#loginzone','#access');">用户信息</a></li>
			<li><a href="javascript:navTabs('#access','#loginzone','#custom','#info','#messages','#phone');">接口接入</a></li>
			<li><a href="javascript:navTabs('#custom','#info','#messages','#phone','#loginzone','#access');">个人资料</a></li>
			<li><a href="javascript:navTabs('#messages','#custom','#info','#phone','#loginzone','#access');">密码修改</a></li>
			<li><a href="javascript:navTabs('#phone','#custom','#info','#messages','#loginzone','#access');">手机修改</a></li>
			<li><a href="javascript:navTabs('#loginzone','#custom','#info','#messages','#phone','#access');">登陆日志</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
   		<div id="info">
	    	<h1 class="welcom_tm">用户信息</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<h3 class="page-title">账户金额信息</h3>
				<div class="stat-container">
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${balance.amount}"></c:out></span>							
							帐户余额					
						</div> 					
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${balance.settlement}"></c:out></span>							
							可结算金额							
						</div>						
					</div>
				</div>
				<h3 class="page-title">本日成功订单统计</h3>
				<div class="stat-container">
					<div class="stat-holder">						
						<div class="stat">							
							<span>${ordercount }</span>							
							网银订单					
						</div> 					
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span>${cardordercount }</span>							
							点卡订单							
						</div>						
					</div>
					
					<div class="stat-holder">						
						<div class="stat">							
							<span>${rechargecount }</span>							
							在线入账							
						</div>						
					</div>
					
					<div class="stat-holder">						
						<div class="stat">							
							<span>${circlipcount }</span>							
							在线销卡						
						</div>						
					</div>
					
				</div>
				<h3 class="page-title">登录信息</h3>
	            <div class="gezhong_xxm">
	            	<ul>
	                	<li><em>商&nbsp;&nbsp;&nbsp;户ID：</em><i><%=map.get("id")%></i></li>
	                    <li><em>登&nbsp;&nbsp;&nbsp;录IP：</em><i><%=log.get("landingip")%></i></li>
	                    <li><em>上次登录：</em><i>
						<c:forEach items="${logs}" var="log" begin="0" end="0">
							<c:out value="${log.landingtime}"></c:out>
						</c:forEach></i></li>
	                    <li><em>登陆次数：</em><i><%=logs.size()%></i></li>
	                </ul>
	            </div>
	        </div>
        </div>
   		<div id="access" class="disabled">
	    	<h1 class="welcom_tm">商户接入信息 </h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<% 
					if(Person.dao.findById(map.getInt("id")).getInt("ifnet")!=2){
				%>
            	<div class="gezhong_szm" style="margin-bottom: 10px;">
	                <div class="gezhong_szm_in">
	                    <span>&nbsp;&nbsp;ID：</span>
	                    <p><c:out value="${payment.id }"></c:out></p>
	                </div>
	                <div class="gezhong_szm_in">
	                    <span>key：</span>
	                    <p><c:out value="${payment.key }"></c:out></p>
	                    <a href="javascript:;" onclick="keyshow()">重新获取对接密钥</a>
	                </div>
				</div>
				<%}%>
				<h3 class="page-title">费率说明</h3>
				<div class="stat-container">
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.weixin}"></c:out></span>
							微信扫码
						</div>
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.wxwap}"></c:out></span>							
							微信WAP
						</div>						
					</div>
					
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.alipay}"></c:out></span>							
							支付宝扫码
						</div>						
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.alipaywap}"></c:out></span>							
							支付宝WAP							
						</div>						
					</div>
				</div>
				<div class="stat-container">
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.tenpay}"></c:out></span>
							财付通扫码
						</div>
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.qqmobile}"></c:out></span>							
							ＱＱ钱包
						</div>						
					</div>
					
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.banking}"></c:out></span>							
							网银的费率
						</div>						
					</div>
					<div class="stat-holder">						
						<div class="stat">							
							<span><c:out value="${rate.refund}"></c:out></span>							
							提现手续费
						</div>						
					</div>
				</div>
	        </div>
        </div>
   		<div id="custom" class="disabled">
	    	<h1 class="welcom_tm">个人资料</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<div class="public_m4">
				<p style="color: red;">
					<em>提示：</em>如果需要修改相关信息 请联系客服 谢谢合作！
				</p>
				<p><em>
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
					</em>
					<%=map.get("name")%></p>
				<p>
					<em>联 系 人：</em><%=map.get("contacts")%></p>
				<p>
					<em>联系地址：</em><%=map.get("address")%></p>
				<p>
					<em>手机号码：</em><%=CryptTool.getphone(map.getStr("phone"))%></p>
				<p>
					<em>QQ号码：</em><%=map.get("qq")%></p>
				<p>
					<em><%
						if (map.getInt("huge") == 0) {
					%>
					身 份 证：
					<%
						} else {
					%>
					营业执照：
					<%
						}
					%></em><%=CryptTool.getphone(map.getStr("idcard"))%></p>
				<p>
					<em>网站名称：</em><%=map.get("webName")%></p>
				<p>
					<em>网站网址：</em><%=map.get("website")%></p>
					</div>
	        </div>
        </div>
   		<div id="messages" class="disabled">
	    	<h1 class="welcom_tm">修改密码</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<form class="form-horizontal" id="changepassword" action="<%=basePath %>/member/upPassword" method="post">
	            <div class="public_m4">
	            	<p>
	                	<em>密码类型选择：</em><select id="passw" name="passwtype" style=" height:23px; border:1px solid #eaeaea">
						<option value="1">登录密码</option>
						<option value="2">支付密码 </option>
					  	</select>
	                </p>
	            	<p>
	                	<em>原手机号：</em>
	                    <%= CryptTool.getphone(map.getStr("phone")) %><font color="red">(注：同一个手机号一小时最多能操作3次)</font>
	                </p>
	                <p>
	                	<em>验证码：</em>
	                    <input type="text" style=" height:23px; border:1px solid #eaeaea; width:140px"  
	                    size="16" datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证码！" errormsg="您填写的验证号不对不正确 ！">
	                    <input type="button" class="btn_mfyzm sms" onclick="sms()" value="获取验证码" 
	                    style=" border:1px solid #c8c8c8; margin-left:6px"/>
	                </p>
	                <p  id="zhifu" style="display: none;">
	                	<em>原支付密码：</em>
	                    <input type="password" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    datatype="*" ajaxurl="<%=basePath%>/user/getPaymentboo" nullmsg="请输入支付原密码！" errormsg="请输入支付原有密码">
	                </p>
	                <p  id="zhifu1" style="display: none;">
	                	<em>新支付密码：</em>
	                    <input type="password" name="payment" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    datatype="*6-20" errormsg="密码范围在6~20位之间！">
	                </p>
	                <p  id="zhifu2" style="display: none;">
	                	<em>确认支付密码：</em>
	                    <input type="password" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    datatype="*" recheck="payment" errormsg="您两次输入的支付密码不一致！">
	                </p>
	                <p id="pas">
	                	<em>原密码：</em>
	                    <input type="password" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    datatype="*" ajaxurl="<%=basePath%>/user/getPasswordboo" nullmsg="请输入原密码！" errormsg="请输入原有密码">
	                </p>
	                <p id="pas1">
	                	<em>新密码：</em>
	                    <input type="password" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    name="password" datatype="*6-20" errormsg="密码范围在6~20位之间！">
	                </p>
	                <p id="pas2">
	                	<em>确认密码：</em>
	                    <input type="password" style=" height:23px; border:1px solid #eaeaea; width:140px" 
	                    datatype="*" recheck="password" errormsg="您两次输入的账号密码不一致！">
	                </p>
	                <button type="submit" class="public_m3">确认修改</button>
	            </div>
	            </form>
			</div>
   		</div>
   		<div id="phone" class="disabled">
	    	<h1 class="welcom_tm">商户手机号码</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<form class="form-horizontal" id="mods" action="<%=basePath %>/member/upPhone" method="post">
	            <div class="public_m4">
	            	<p>
	                	<em>原手机号：</em>
	                    <%= CryptTool.getphone(map.getStr("phone")) %><font color="red">(注：同一个手机号一小时最多能操作3次)</font>
	                </p>
	                <p>
	                	<em>验证码：</em>
	                    <input type="text" style=" height:23px; border:1px solid #eaeaea; width:140px"  size="16" 
	                    datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证码！" errormsg="您填写的验证号不对不正确 ！">
	                    <input type="button" class="btn_mfyzm sms" onclick="sms()" value="获取验证码" 
	                    style=" border:1px solid #c8c8c8; margin-left:6px"/>
	                </p>
	                <p>
	                	<em>新手机号：</em>
	                    <input type="text" style=" height:23px; border:1px solid #eaeaea; width:140px" size="16" 
	                    name="newphone" id="newphone">
	                </p>
	                <p>
	                	<em>验证码：</em>
						<input  style=" height:23px; border:1px solid #eaeaea; width:140px" size="16" type="text" 
						datatype="*" ajaxurl="<%=basePath%>/member/newPhoneSms" nullmsg="请填写验证码！" errormsg="您填写的验证号不对不正确 ！">
						<input type="button" class="btn_mfyzm newsms" onclick="newsms()" value="获取验证码" 
						style=" border:1px solid #c8c8c8; margin-left:6px"/>
	                </p>
	                <button type="submit" class="public_m3">确认修改</button>
	            </div>
	            </form>
			</div>
   		</div>
   		<div id="loginzone" class="disabled">
	    	<h1 class="welcom_tm">登陆日志</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<div class="public_m5">
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr style=" border-bottom:1px solid #000">
							<th>序号</th>
							<th>用户编号</th>
							<th>登陆IP</th>
							<th>登陆时间</th>
							<th>退出时间</th>
						</tr>
						<c:forEach items="${logs}" varStatus="l" var="log">
							<tr>
								<td><c:out value="${l.index+1 }"></c:out></td>
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
<div id="keyphone" class="disabled">
	<div class="public_m1" style="width: 450px;">
	<form id="modifikey" action="<%=basePath %>/member/upKey" method="post">
		<div class="public_m4" style="width: 450px;">
			<p style="width: 450px;">
				<em style="width: 90px;">原手机号：</em><%= CryptTool.getphone(map.getStr("phone")) %>
				<font color="red">(注：同一个手机号一小时最多能操作3次)</font>
			</p>
			<p style="width: 450px;">
				<em style="width: 90px;">验证码：</em><input  size="16" type="text" 
				datatype="*" ajaxurl="<%=basePath%>/register/valiSms" nullmsg="请填写验证号！" errormsg="您填写的验证号不对不正确 ！" 
				style="height:23px; border:1px solid #eaeaea; width:140px">
				<input id="btnsj" class="btn_mfyzm sms" onclick="sms()" value="获取验证码" 
				style=" border:1px solid #c8c8c8; margin-left:6px" type="button">
			</p>
			<button type="submit" class="public_m3">确认获取</button>
		</div>
	</form>
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>