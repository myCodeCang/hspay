<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>生活服务</title>
<jsp:include page="include/script.jsp"></jsp:include>
<link rel="stylesheet" href="static/css/common2.css" />
    <link rel="stylesheet" href="static/css/life.css" />
    <style>
    .life_step:hover{
    background-color:#0068b6
    }
    </style>
<script type="text/javascript" src="static/js/common2.js"></script>
<script type="text/javascript" src="static/app/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
		
<div class="lifeban">
    <img src="static/imgs/postappls/B1.png">
</div>
<!--body-->
<div class="bo"  style="padding-top: 30px">

    <div class="layout">

        <div class="lifebo">
            <!--生活服务左边-->
            <div class="lifel">
			    <ul class="lifelu">
			        <li style="border-top: none" class="act">
			        	<a href="page/barcodepay/toBarCodePay.do~type=3.html">公共事业缴费
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			        <li>
			        	<a href="route.do~modual=mobile$inpour&mob_flag=hasacc.html" >手机充值
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a> 
			        </li>
			        <li>
			        	<a href="page/product/gamerechargeindex.do.html" >游戏充值
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			        <li>
			        	<a href="page/product/toGasCardRecharge.do.html">加油卡充值
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			        <li>
			        	<a href="page/product/creditCardPayments.do.html">信用卡还款
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			        <li>
			        	<a href="page/product/tickets.do.html">电影票
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			        <li style="border-bottom: none">
			        	<a href="page/product/medicalAppointment.do.html">医疗预约
			        	<img src="static/imgs/postappls/1.jpg" class="life1"></a>
			        </li>
			    </ul>
			</div>

            <!--生活服务右边-->
            <div class="lifer">
                <div class="liferone">
                    <div class="onetop">公共事业缴费</div>
                    <div class="onebo">
                        <h2 class="s15">产品介绍</h2>
                        <img src="static/imgs/postappls/line.jpg" class="life_line">
                        <div class="cpjs">无需手续费，足不出户，即可随时完成缴费。</div>
                        
                        <div class="bar_article clearfix" style="width: 100%;">
							<ul class="clearfix" style="padding: 50px 0px 20px 0px;">
								<li>
									<div class="zhong">
										<div class="tiao one"></div>
										<div class="yuan one"><em>1</em></div>
										<div class="tiao"></div>
									</div>
									<p>选择缴费项目</p>
								</li>
								<li>
									<div class="zhong">
										<div class="tiao"></div>
										<div class="yuan one"><em>2</em></div>
										<div class="tiao"></div>
									</div>
									<p>核对账单信息</p>
								</li>
								<li>
									<div class="zhong">
										<div class="tiao"></div>
										<div class="yuan one"><em>3</em></div>
										<div class="tiao"></div>
									</div>
									<p>进入银生宝支付中心，完成付款</p>
								</li>
								
							</ul>
						</div>
                        <h2 class="s15"> 选择缴费项目</h2>
                        <img src="static/imgs/postappls/line.jpg" class="life_line">
                        <div class="xzjfxm">
                            <div style="float: left;width: 80px;text-align: center;margin-bottom: 30px"><img src="static/imgs/postappls/B4.png"><p>水费</p></div>
                            <div style="float: right;width: 80px;text-align: center"><img src="static/imgs/postappls/B6.png"><p>燃气费</p></div>
                            <div style="margin: 0 auto;width: 80px;text-align: center"><img src="static/imgs/postappls/B5.png"><p>电费</p></div>
                        </div>
                    </div>
                </div>
                <div class="liferone">
                    <div class="onebo">
                        <h2 class="s15">填写账单信息</h2>
                        <img src="static/imgs/postappls/line.jpg" class="life_line">
                        <div style="overflow: hidden;width: 100%">

                            <!--表单-->
                            <form action="/page/barcodepay/toBarCodePayDetail.do" method="post" class="form-horizontal ysbbd ggsy" style="float:left">
                                <fieldset>
                                    <div style="overflow: hidden">

                                        <img src="static/imgs/postappls/B7.png" style="float: left">

                                        <div style="overflow: hidden">
                                            <!-- 公司名称-->
                                            <div class="form-item">
                                                <label class="form-left">

                                                    <span class="yell must">*</span>&nbsp;公司名称&nbsp;</label>
                                                <div class="form-right">
                                                    <select  style="width:245px">
                                                        <option>上海某某自来水公司</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- 充值金额-->
                                            <div class="form-item">
                                                <label class="form-left"><span class="yell must">*</span>&nbsp;条形码&nbsp;</label>
                                                <div class="form-right">
                                                    <input type="text" placeholder="请输入真实有效地缴费条形码以避免损失" name="txm" id="txm"  style="width:245px">
                                                </div>
                                            </div>
                                        </div>

                                    </div>

								
									
                                    <h2 class="s15">填写个人信息</h2>
                                    <img src="static/imgs/postappls/line.jpg" class="life_line">
                                    <!-- 充值金额-->
                                    <div class="form-item">
                                        <label class="form-left"><span class="yell must">*</span>&nbsp;请填写您的名字&nbsp;</label>
                                        <div class="form-right">
                                            <input type="text" name="personName" id="yourname">
                                        </div>
                                    </div>

                                    <!-- 充值金额-->
                                    <div class="form-item">
                                        <label class="form-left"><span class="yell must">*</span>&nbsp;请填写您的手机号码&nbsp;</label>
                                        <div class="form-right">
                                            <input type="text" name="mobile" id="yourphone">
                                        </div>
                                    </div>

                                    <!-- 充值金额-->
                                    <div class="form-item">
                                        <label class="form-left"><span class="yell must">*</span>&nbsp;请填写您的Email地址&nbsp;</label>
                                        <div class="form-right">
                                            <input type="text" name="email" id="youremail">
                                        </div>
                                    </div>
							
                            </fieldset>

                            </form>
                        </div>

                        <div class="lifejg">
                            <p style="margin-bottom: 10px;font-size: 12px"><img src="static/imgs/icons/B3-2.png" style="margin-right: 10px"><b style="font-weight: bold">友情提示</b></p>
                            <p>1.对于初次使用用户如有任何疑问，请访问"公共事业费须知"。</p>
                            <p>2.由于每个公共事业单位存在制度差异，请您务必在账单的"最后付费日期"之前10个工作日完成缴纳；若超过此期限缴费， 建议到各公共事业单位的营业网点缴纳，否则，产生的账单滞纳金由用户自行承担。</p>
                            <p>3.单张账单金额超过一万元的，网站无法缴纳，需要到我公司或者其他收费点缴纳，敬请谅解。</p>
                            <p>4.本网站全心全意为广大市民服务。对企业用户的公共事业费账单，请按照各公用事业单位规定处理，本网站不接受企业用户， 如因此行为导致的后果，本网站不承担任何责任。</p>
                        </div>

                        <a href="sessionInvalid.do.html" class="life_step">下一步</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	<jsp:include page="include/feet.jsp"></jsp:include>

<script>
    var $ = require('components/jquery/jquery');
    require('modules/js/common2');
    require('modules/app/jquery.validate.min');
	require('modules/widget/header/header');
  	require('modules/widget/footer/footer');

    $(function(){

       $(".lifelu li").click(function(){
           $("li").removeClass("act");
           //$("li").eq(i).css("background-image","url('/imgs/lifeservice/A"+(i+1)+".png')");
           $(this).addClass("act");
           //$(this).css("background-image","url('/imgs/lifeservice/A"+(i+8)+".png')")
       })

    })
</script>
</body>
</html>