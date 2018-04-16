<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<jsp:include page="include/script1.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<jsp:include page="include/search.jsp"></jsp:include>
	<div class="help_main height640">
		<jsp:include page="include/nihelplist_nav.jsp"></jsp:include>
		<div class="help_r right height640">
			<div class="left help_contact">
				<p class="left help_icon">
					<img src="pic/help_icon_1.gif" />
				</p>
				<p class="left b help_icon_h4">电话客服</p>
				<p class="width175">秒付宝客服热线：0830-3153101； 工作时间为：工作日 08：30-12:00 13:30-18:00；
					非工作时间或电话线路繁忙，请留言官方QQ，工作时间我司会第一时间跟进处理。</p>
			</div>
			<div class="left help_contact2">
				<p class="left help_icon">
					<img style="CURSOR: pointer" border="0" SRC="pic/help_icon_2.gif" alt="拥有秒付宝，生活更轻松！">
				</p>
				<p class="left b help_icon_h4">在线客服</p>
				<p class="width175">QQ直接交谈。<br/>QQ:97630424，97630425，
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;97630426，97630427； <br/>工作时间为：工作日 08：30-12:00 13:30-18:00； 非工作时间，请留言，工作时间我司会第一时间跟进处理。</p>
			</div>
			<div class="left help_contact">
				<p class="left help_icon">
					<img src="pic/help_icon_3.gif" />
				</p>
				<p class="left b help_icon_h4">邮件客服</p>
				<p class="width175">
					感谢您的建议, <a href="mailto:huaxiangwangluo@163.com">huaxiangwangluo@163.com</a><br /> 我们会做得更好！
				</p>
			</div>
			<div class="clearfix help_tab barProds left">
				<div class="left help_left2">
					<img src="pic/help_line_10.gif" class="margint10" />
				</div>
				<div class="left help_right">
					<ul class="tabs">
						<li class="tab1"><a class="selected" onclick="showOnly('tab1','barProds')"> <!--<img src="img/icons/notebooks.png" alt="Search product!"/>-->
								热点问题
						</a></li>
					</ul>
				</div>
				<!--右边结束-->
				<div class="tabContent clearfix">
					<div class="tab1">
						<div class="help_list1 margint10">
							<ul id="newlist">
							</ul>
						</div>
					</div>
				</div>
				<!--tab切换正文结束-->
			</div>
		</div>
		<!--联系我们结束-->

	</div>
	<!--主结束-->
<script type="text/javascript">
$(document).ready(function(){
	var baseurl="<%=basePath%>";
	$.ajax({
		type : "POST",
		url : baseurl+"/newsList",
		data : "",
		dataType : "json",
		async : "false",
		success : function(data) {
			var reslut="";
			for( var i = 0; i < data.length; i++ ) {
			   if(i==3){
			       break;
			   }
			   reslut+='<li><a href="'+baseurl+'/index_tf/dynamicInfo.jsp?dynamicid='+data[i].dynamicid+'">';
			   reslut+=data[i].title+'</a></li>';
			}
			$('#newlist').html(reslut);
		},
		error : function(data) {
		}
	});
}); 
</script>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>