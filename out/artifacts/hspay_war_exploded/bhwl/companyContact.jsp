<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>联系我们</title>
<jsp:include page="include/script.jsp"></jsp:include>
 
</head>
<body class="pagelegel">
	<jsp:include page="include/head.jsp"></jsp:include>

    <section class="contactus" style="padding:10px 0 128px 0;">
        <div class="sub_coll">
            <p class="position">首页>联系我们</p>
        </div>
        <div class="container">
            <div class="contactmap">
                <div class="map">
                    <iframe width="858" height="460" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://map.sogou.com/card/index+s=858,432&p=1111&m=go2map&pl=r&d=150324308613142484.html#"></iframe>
                </div>
                <h3 class="ysbz">重庆市缤虎网络科技有限公司</h3>
                <p>重庆市九龙坡区九龙园大道26号6-4九龙云端创业孵化园1173号</p>
                <p>
                    <span class="tel">电话（上海）：400-889-5135</span> 总机：021-60790119  &nbsp;&nbsp;&nbsp;&nbsp;传真：021-60790122  &nbsp;&nbsp;&nbsp;&nbsp;邮编：200123

                </p>
            </div>
            <div class="contactustel">
                <div class="contact">
                    <span class="cltime"><img src="static/imgs/icons/F55.png" alt=""></span>
                    <span class="contactright"><em>联系我们</em><br>Contact us</span><br>
                    <span class="zxzx">在线咨询</span>
                </div>
                <h1 class="usphone">400-889-5135<span>（全国）</span></h1>
                <div class="contactadd">
                    <h3>客服电话：95139</h3>
                    <ul>
                        <li>
                            <span>北京</span>	<span>沈阳</span>	<span>上海</span>	<span>南京</span>	<span>合肥</span>
                            <span>广州</span>	<span>深圳</span>	<span>东莞</span>	<span>南宁</span>	<span>重庆</span>
                            <span>成都</span>	<span>西安</span>
                        </li>
                    </ul>
                </div>

                <p class="email">邮箱地址：service@unspay.com</p>

                <ul class="mkt">
                    <li>市场·战略合作</li>
                    <li>电话(北京)&nbsp;:&nbsp;010-60535085&nbsp;市场部</li>
                </ul>

            </div>
        </div>
    </section>
	<jsp:include page="include/feet.jsp"></jsp:include>

<script>
	require('modules/widget/header/header');
  	require('modules/widget/footer/footer');
    require('modules/ui/index');
</script>
</body>
</html>