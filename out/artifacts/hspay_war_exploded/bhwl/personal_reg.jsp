<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公司简介</title>
<jsp:include page="include/script.jsp"></jsp:include>
 
</head>
<body class="pageaboutus">
	<jsp:include page="include/head.jsp"></jsp:include>

<section class="help_aboutus">
    <div class="help_aboutus_box centre clearfix">
        <h1>个人用户帮助</h1>
<jsp:include page="include/left.jsp"></jsp:include>
        <!--右边部分-->
       
    <!--右边部分-->
	<div class="help_aboutus_right" style="height:1092px;">
		<h2>帮助中心 >关于银生宝</h2>
		<div class="help_right_box">
			<ul>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_unspay_introduce.jsp.html">银生宝简介</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_benefits.jsp.html">银生宝的优势</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_pay.jsp.html">什么是银生宝账户支付？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_foreign_currency.jsp.html">银生宝网站能使用外卡吗？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_unspay_pay.jsp.html">没有开通网上银行可以通过银生宝进行支付吗?</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_use_unspay.jsp.html">未注册用户可以使用银生宝产品服务吗？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_user_interests.jsp.html">银生宝系统是否安全？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_pay_cost_region.jsp.html">目前可以缴纳公共事业费的地区有哪些？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_credit_card.jsp.html">能通过银生宝账户进行信用卡还款吗？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_message_remind.jsp.html">设置银生宝账户短消息提醒功能需要收费吗？</a></em>
				</li>
				<li>
					<img src="static/imgs/help/G27.png" alt="" />
					<em><a href="unsService.do~page=personal_prepaid_phone.jsp.html">通过银生宝进行手机充值有优惠吗？</a></em>
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