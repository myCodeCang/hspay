<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=systemss.getStr("system_webName") %></title>
<META name="Keywords" content="<%=systemss.getStr("system_keyword") %>" />
<link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico">
<link id="bs-css" href="<%=basePath%>/css/bootstrap-cerulean.css" rel="stylesheet">
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<link href="<%=basePath%>/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<%=basePath%>/css/charisma-app.css" rel="stylesheet">
<link href="<%=basePath%>/css/jquery-ui-1.8.21.custom.css"
	rel="stylesheet">
<link href='<%=basePath%>/css/fullcalendar.css' rel='stylesheet'>
<link href='<%=basePath%>/css/fullcalendar.print.css' rel='stylesheet'
	media='print'>
<link href='<%=basePath%>/css/chosen.css' rel='stylesheet'>
<link href='<%=basePath%>/css/uniform.default.css' rel='stylesheet'>
<link href='<%=basePath%>/css/colorbox.css' rel='stylesheet'>
<link href='<%=basePath%>/css/jquery.cleditor.css' rel='stylesheet'>
<link href='<%=basePath%>/css/jquery.noty.css' rel='stylesheet'>
<link href='<%=basePath%>/css/noty_theme_default.css' rel='stylesheet'>
<link href='<%=basePath%>/css/elfinder.min.css' rel='stylesheet'>
<link href='<%=basePath%>/css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=basePath%>/css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='<%=basePath%>/css/opa-icons.css' rel='stylesheet'>
<link href='<%=basePath%>/css/uploadify.css' rel='stylesheet'>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
      <script src="<%=basePath%>/js/html5shiv.js"></script>
<![endif]-->
<!-- jQuery -->
<script src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="<%=basePath%>/js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="<%=basePath%>/js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="<%=basePath%>/js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="<%=basePath%>/js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="<%=basePath%>/js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="<%=basePath%>/js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="<%=basePath%>/js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="<%=basePath%>/js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="<%=basePath%>/js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="<%=basePath%>/js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="<%=basePath%>/js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="<%=basePath%>/js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="<%=basePath%>/js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="<%=basePath%>/js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="<%=basePath%>/js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='<%=basePath%>/js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath%>/js/jquery.dataTables.min.js'></script>

<!-- chart libraries start -->
<script src="<%=basePath%>/js/excanvas.js"></script>
<script src="<%=basePath%>/js/jquery.flot.min.js"></script>
<script src="<%=basePath%>/js/jquery.flot.pie.min.js"></script>
<script src="<%=basePath%>/js/jquery.flot.stack.js"></script>
<script src="<%=basePath%>/js/jquery.flot.resize.min.js"></script>
<!-- chart libraries end -->

<!-- select or dropdown enhancer -->
<script src="<%=basePath%>/js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="<%=basePath%>/js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=basePath%>/js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="<%=basePath%>/js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath%>/js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="<%=basePath%>/js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath%>/js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath%>/js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath%>/js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath%>/js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath%>/js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=basePath%>/js/charisma.js"></script>
<script src="<%=basePath%>/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function user(){
	window.location.href="<%=basePath%>/user";
}
function exchange(){
	window.location.href="<%=basePath%>/exchange";
	}
function statement(){
	window.location.href="<%=basePath%>/statement";
}
function payment(){
	window.location.href="<%=basePath%>/payment";
}
function settlement(){
	window.location.href="<%=basePath%>/settlement";
}
</script>
</head>
<jsp:include page="footjsp.jsp"></jsp:include>
</html>