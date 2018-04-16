<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<meta name="description" content="秒付宝，国内领先的第三方支付平台，致力于为企业和个人用户提供安全便捷的支付应用服务，完善的服 务体系，全新的产品体验，用户覆盖机票、酒店、游戏、生活服务等多个领域。" />
<meta name="keywords" content="秒付宝,电子支付/网上支付/安全支付/手机支付,安全购物/网络购物付款/付款/收款,水电煤缴费/信用卡 还款/AA收款/手机充值,网上付款/机票预订,秒付宝网站" />
<jsp:include page="include/script.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<script type="text/javascript" language="javascript">
		document.getElementById('ins1').className = 'on';
	</script>
	<div class="banner">
		<div class="top_shadow">
			<div class="flexslider">
				<ul class="slides">
					<li><a href="#"><img src="<%=basePath%>/index_tf/pic/bannertftkjzf.jpg" /></a></li>
				</ul>
				<ul class="flexsliderb">
					<p>
						<a href="<%=basePath%>/index_tf/nlogin.jsp" ><img src="<%=basePath%>/index_tf/pic/merchant_login_img.png" /></a>
					</p>
					<p>
						<a href="<%=basePath%>/index_tf/nregiste.jsp" ><img
							src="<%=basePath%>/index_tf/pic/merchant_registe_img.png"  /></a>
					</p>
				</ul>
			</div>
		</div>
	</div>

	<div class="index_m2">
		<div class="index_producta">
			<div class="index_product">
				<ol>
					<li><a href="<%=basePath%>/index_tf/test.jsp"target="_blank"><p
								class="zjtg"></p>轻松体验,在线支付流程</a></li>
					<li><a
						href="#"><p class="fpyd"></p>无与伦比的快速，机票预订</a></li>
					<li><a href="index_pos.jsp" target="_blank"><p
								class="POS"></p>秒付宝 POS收单</a></li>
					<li><a href="index_mobile.jsp" target="_blank"><p
								class="MPOS"></p>秒付宝 M-POS</a></li>
				</ol>
			</div>
		</div>
		<div class="tftbackg">
			<div class="know_tft">
				<span>了解秒付宝</span><br />为线上线下不同行业提供全领域解决方案
			</div>
			<div class="know_tfta">
				<a href="<%=basePath%>/index_tf/newweb/service/Industry_flight.xhtml.htm"target="_blank"><p
						class="jpydimg marginr52">
						<span>机票旅游</span><br />高效回款、快速出票、精准对账
					</p></a> <a href="<%=basePath%>/index_tf/newweb/service/Industry_paychange.xhtml.htm"target="_blank"><p
						class="dfdkimg marginr52">
						<span>代付代扣</span><br />简单快捷，一站式解决交易资金划转需求
					</p></a> <a href="<%=basePath%>/index_tf/newweb/service/Industry_shopping.xhtml.htm" target="_blank"><p class="wlgwimg">
						<span>网络购物</span><br />提供安全、便捷的支付环境和集成系统
					</p></a> <a href="<%=basePath%>/index_tf/newweb/service/Paymethod_wireless1.xhtml.htm" target="_blank"><p
						class="zfjsimg marginr52">
						<span>支付介绍</span><br />优质、安全、高效、全新支付服务体验
					</p></a> <a href="<%=basePath%>/index_tf/newweb/service/newslist_center.xhtml-TYPE=2.htm"  target="_blank"><p
						class="zxzximg marginr52">
						<span>新闻中心</span><br />实时资讯更新，随时掌握最新信息
					</p></a> <a href="<%=basePath%>/index_tf/newweb/service/nabout_partner_business.xhtml.htm"  target="_blank"><p class="yqhzimg">
						<span>合作银行</span><br />我们与国内主要的银行展开深入合作
					</p></a>
			</div>
			<div class="notice">
				<span class="notices">
					<p class="noticess">
						公司公告<a href="<%=basePath%>/index_tf/dynamic.jsp"  target="_blank">了解更多</a>
					</p>
					<p class="noticesx"></p>
				</span> <span class="noticex marginr30">
					<dl id="notice0">
						<dt class="noticex_a"></dt>
					</dl>
				</span> <span class="noticex marginr30">
					<dl id="notice1">
						<dt class="noticex_b"></dt>
					</dl>
				</span> <span class="noticex">
					<dl id="notice2">
						<dt class="noticex_c"></dt>
					</dl>
				</span>
			</div>
		</div>
	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
	
<script type="text/javascript" src="<%=basePath%>/index_tf/script/jquery.flexslider-min.js" ></script>
<script type="text/javascript">
$(function() {
	$('.flexslider').flexslider({
		directionNav : true,
		pauseOnAction : true,
		start: function (slider) {
			var firstSlide = $(slider).find('.slides li :first a');
			var backgroundSrc = firstSlide.children('img').attr('src');
			firstSlide.css({
				'background-image' : 'url(' + backgroundSrc + ')'
			});
	    },
	    before: function (slider) {
	       // lazy load 点击翻动后加载
	       var slide = $(slider).find('.slides').children().eq(slider.animatingTo).find('a');
	       var img = slide.find('.lazy');
	       if(img.length > 0 ){
				var src = slide.find('.lazy').attr('data-src');
		    	img.attr('src',src).removeAttr("data-src").removeClass("lazy");
		    	slide.css({
					'background-image' : 'url(' + src + ')'
				});
			}
	    }
	});
	$('.flex-direction-nav').hide();
	$('.slides, .flex-direction-nav').hover(function() {
		$('.flex-direction-nav').show();
	}, function() {
		$('.flex-direction-nav').hide();
	});

});
$(document).ready(function(){
	var baseurl="<%=basePath%>";
	$.ajax({
		type : "POST",
		url : baseurl+"/newsList",
		data : "",
		dataType : "json",
		async : "false",
		success : function(data) {
			for( var i = 0; i < data.length; i++ ) {
			   if(i==3){
			       break;
			   }
			   $('#notice'+i).append("<dd><a href='"+baseurl+"/index_tf/dynamicInfo.jsp?dynamicid="+data[i].dynamicid+"' target='_blank'>"+data[i].title+"</a></dd><dd>"+data[i].createtime+"</dd>");
			}
		},
		error : function(data) {
		}
	});
}); 
</script>
</body>
</html>