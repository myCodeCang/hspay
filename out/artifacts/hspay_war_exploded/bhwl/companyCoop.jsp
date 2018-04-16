<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>合作伙伴</title>
<jsp:include page="include/script.jsp"></jsp:include>
 
</head>
<body class="pagecorperate-banks">
	<jsp:include page="include/head.jsp"></jsp:include>
   <section class="corperate">
        <div class="sub_coll">
            <p class="position">首页>联系我们>合作银行</p>
        </div>


        <div class="content clearfix">
            <div class="con-tab">
                <ul class="con-left clearfix" id="con-left">
                    <li class="legel-bo" style="cursor: pointer;">合作银行</li>
                    <li style="cursor: pointer;">合作商户</li>

                </ul>

                <div class="kongb">
                </div>
            </div>

            <div class="wrap">
                <div class="active">
                    <h2 class="shengm">智汇宝已与60家银行和金融机构深入合作</h2>
                    <div class="wrap-content">
                        <h4>国有银行和全国股份制银行</h4>
                        <div class="banks">
                            <ul class="worldbanks clearfix">
                                <li>
                                    <img src="static/imgs/partners/F10.png" alt="">
                                    <img src="static/imgs/partners/F11.png" alt="">
                                    <img src="static/imgs/partners/F12.png" alt="">
                                    <img src="static/imgs/partners/F13.png" alt="">
                                    <img src="static/imgs/partners/F14.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F15.png" alt="">
                                    <img src="static/imgs/partners/F16.png" alt="">
                                    <img src="static/imgs/partners/F17.png" alt="">
                                    <img src="static/imgs/partners/F18.png" alt="">
                                    <img src="static/imgs/partners/F19.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F20.png" alt="">
                                    <img src="static/imgs/partners/F21.png" alt="">
                                    <img src="static/imgs/partners/F22.png" alt="">
                                    <img src="static/imgs/partners/F23.png" alt="">
                                    <img src="static/imgs/partners/F24.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F25.png" alt="">
                                    <img src="static/imgs/partners/F26.png" alt="">
                                    <img src="static/imgs/partners/F27.png" alt="">
                                    <img src="static/imgs/partners/F28.png" alt="">
                                </li>
                            </ul>
                        </div>
                        <h4>区域性银行</h4>
                        <div class="banks">
                            <ul class="worldbanks clearfix">
                                <li>
                                    <img src="static/imgs/partners/F29.png" alt="">
                                    <img src="static/imgs/partners/F30.png" alt="">
                                    <img src="static/imgs/partners/F31.png" alt="">
                                    <img src="static/imgs/partners/F32.png" alt="">
                                    <img src="static/imgs/partners/F33.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F34.png" alt="">
                                    <img src="static/imgs/partners/F35.png" alt="">
                                    <img src="static/imgs/partners/F36.png" alt="">
                                    <img src="static/imgs/partners/F37.png" alt="">
                                    <img src="static/imgs/partners/F38.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F39.png" alt="">
                                    <img src="static/imgs/partners/F40.png" alt="">
                                    <img src="static/imgs/partners/F41.png" alt="">
                                    <img src="static/imgs/partners/F42.png" alt="">
                                    <img src="static/imgs/partners/F43.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F44.png" alt="">
                                    <img src="static/imgs/partners/F45.png" alt="">
                                    <img src="static/imgs/partners/F46.png" alt="">
                                    <img src="static/imgs/partners/F47.png" alt="">
                                    <img src="static/imgs/partners/F48.png" alt="" style="margin-right:0;">
                                    <img src="static/imgs/partners/F49.png" alt="">
                                    <img src="static/imgs/partners/F50.png" alt="">
                                    <img src="static/imgs/partners/F51.png" alt="">
                                    <img src="static/imgs/partners/F52.png" alt="">
                                </li>
                            </ul>
                        </div>
                        <h4>外资银行</h4>
                        <div class="banks">
                            <ul class="worldbanks clearfix">
                                <li>
                                    <img src="static/imgs/partners/F53.png" alt="">
                                </li>
                            </ul>
                        </div>


                    </div>
                </div>

                <div class="hzsh">
                    <h2 class="shengm">合作商户</h2>
                    <div class="wrap-content">

                        <div class="banks">
                            <ul class="worldbanks clearfix">
                                <li>
                                    <img src="static/imgs/partners/h1.png" alt="">
                                    <img src="static/imgs/partners/h2.png" alt="">
                                    <img src="static/imgs/partners/h4.png" alt="">
                                    <img src="static/imgs/partners/h5.png" alt=""  style="margin-right:0;">
                                    <img src="static/imgs/partners/h6.png" alt="">
                                    <img src="static/imgs/partners/h7.png" alt="">
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>


            </div>


        </div>

</section>
	<jsp:include page="include/feet.jsp"></jsp:include>

<script>
	require('modules/widget/header/header');
  	require('modules/widget/footer/footer');

    var $ = require('components/jquery/jquery');
    $(function(){
        function tab(pa){

            $(pa+".con-left>li").click(function(){
                //找到是点击第几个
                var index=$(pa+".con-left>li").index($(this));
//                alert(index);
                //以前显示的隐藏
                $(pa+".wrap>div:visible").hide();
                //第几个显示
                $(pa+".wrap>div:eq("+index+")").show();

                $(pa+".con-left>li.legel-bo").removeClass("legel-bo");

                $(this).addClass("legel-bo");

            })//clicked
        }//tab ed
        tab(".content ");
    })
</script>
</body>
</html>