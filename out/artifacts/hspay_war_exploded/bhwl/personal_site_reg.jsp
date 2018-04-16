<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公司简介</title>
<jsp:include page="include/script.jsp"></jsp:include>
 
</head>
<body class="pagepagereg">
	<jsp:include page="include/head.jsp"></jsp:include>

<section class="help_aboutus">
    <div class="help_aboutus_box centre clearfix">
        <h1>个人用户帮助</h1>
<jsp:include page="include/left.jsp"></jsp:include>
        <!--右边部分-->
       
    <!--右边部分-->
	<div class="help_aboutus_right" style="height:1068px;">
        <h2>帮助中心 > 网站注册</h2>
		<div class="help_right_box">
			<ul>
				<li><img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_site_registered.jsp.html">如何在银生宝网站注册？</a></em>
				</li>
				<li><img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_registered.jsp.html">使用邮箱注册个人账户</a></em>
				</li>
				<li><img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_phone_registered.jsp.html">使用手机注册个人账户</a></em>
				</li>
				<li><img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_use_email.jsp.html">注册时提示邮箱已被使用该如何处理？</a></em>
				</li>
			</ul>
		</div>
	</div>
    </div>
    </section>
	<jsp:include page="include/feet.jsp"></jsp:include>

<script>
	require('modules/widget/header/header');
	require('modules/widget/header/header');

	var _getpath=window.location.pathname.toString();
	  if(_getpath.indexOf("help_c")>0){
		$("title").html($(".help_aboutus_right h2").html())
	  }

 	require('modules/widget/footer/footer');
    require('modules/ui/index');
</script>
</body>
</html>