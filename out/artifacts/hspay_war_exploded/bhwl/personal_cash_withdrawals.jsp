<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公司简介</title>
<jsp:include page="include/script.jsp"></jsp:include>
 
</head>
<body class="pagewithdrawals">
	<jsp:include page="include/head.jsp"></jsp:include>

<section class="help_aboutus">
    <div class="help_aboutus_box centre clearfix">
        <h1>个人用户帮助</h1>
<jsp:include page="include/left.jsp"></jsp:include>
        <!--右边部分-->
        <div class="help_aboutus_right" style="height:1092px;">
            <h2>申请提现一般多久到账？</h2>
            <div class="help_right_box" id="a1">
                <P>理财客户，银生宝将于1-2个工作日内将此笔款项转入您的银生宝账户；非理财客户，将于5-7个工作日内将此笔款项转入您的银生宝账户。如提现失败，资金将退回您的银生宝账户。</P>
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