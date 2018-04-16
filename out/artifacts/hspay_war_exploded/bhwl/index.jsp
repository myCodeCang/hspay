<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>智汇宝 – 专业的第三方支付平台</title>
<jsp:include page="include/script.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	
<section class="banner">
    <div class="carousel slide">
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="static/imgs/index/jichengzhifuzhuangjia.png" alt="First slide">
                <!--只有第一页登录注册-->
                <div class="fixe">
                    
						<div class="fixe_top">
							<a href="sessionInvalid.jsp">登 &nbsp;录</a>
						</div>
						<div class="fixe_bottom">
							<a href="toRegister.jsp">注&nbsp; 册</a>
						</div>
					
                </div>
            </div>
        </div>
	</div>
</section>

<!--第一部分     公告-->
<section class="announcement centre clearfix">
    <div style="padding: 20px 0 36px 0px;width: 32%;">
        <div class="border clearfix">
            <p>智汇宝</p>
            <div style="float: left;margin-top:18px;">
                <img src="static/imgs/index/fuwu.png" alt="" />
            </div>
            <div class="announcement_right">
                <span>我们致力于为用户打造安全、便捷、专业的</span>
                <span>支付平台，便捷交易，快速到账，操作方</span>
                <span>便，一站式服务，打造您专属的网络银行</span>
            </div>
        </div>
    </div>
    <div>
        <div class="border clearfix">
            <p>安全保障</p>
            <div style="float: left;margin-top:12px;">
                <img src="static/imgs/index/anquanbaozhang.png" alt="" />
            </div>
            <div class="announcement_right">
                <span>严格的资金监管，健全的制度，J2EE技术架</span>
                <span>构，双密码保护，加密传输存储，为您的资</span>
                <span>金安全保驾护航</span>
            </div>
        </div>
    </div>
    <div>
        <div class="clearfix" style="width:75%;margin: 0 auto;">
            <p style="margin-bottom: 10px;">
            	<em style="font-size: 18px;">重要公告</em>
                <a href="companyBull.do.html"><em style="color: #00A0E8;font-size: 14px;float: right;font-weight:normal;">更多</em></a>
            </p>
            <div class="announcement_right" style="border: none;width:100%;padding-right: 0;">
                <span>
                     <a href="page/information/toInformationDetail.do~id=517.html">&#8226&nbsp; 2016年智汇宝关于反洗钱宣传活动的公告</a>
                 </span>
                <div class="scrollbox">
                    <div id="scrollDiv">
                        <ul>
							
								<li>
									<h3>
										<a
											href="page/information/toInformationDetail.do~id=797.html"
											class="linktit">&#8226&nbsp; 关于中信银行系统维护的公告</a>
									</h3>
								</li>
							
								<li>
									<h3>
										<a
											href="page/information/toInformationDetail.do~id=798.html"
											class="linktit">&#8226&nbsp; 关于浦发银行系统维护公告</a>
									</h3>
								</li>
							
								<li>
									<h3>
										<a
											href="page/information/toInformationDetail.do~id=774.html"
											class="linktit">&#8226&nbsp; 重要声明</a>
									</h3>
								</li>
							
								<li>
									<h3>
										<a
											href="page/information/toInformationDetail.do~id=764.html"
											class="linktit">&#8226&nbsp; 金融知识普及内容</a>
									</h3>
								</li>
							
						</ul>
						
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<!--第二部分   欢迎使用智汇宝-->
<!-- <script src="sectioniphone.js" charset="utf-8"></script> -->
<div class="sectioniphone">

    <section class="welcome centre clearfix">

        <div class="welcome_left centre">
            <h1>简单&nbsp;快速&nbsp;安全</h1>
            <p>致力于为个人用户打造最贴心的私人网络银行，提供“简单、快速、安全”的支付服务</p>

                        <section class="hero fullheight">
                <div class="row align-center clearfix">
                    <div class="columns fullheight-column-align">
                        <div class="row">
                            <div class="columns align-self-middle" style="margin-left: 8px;">
                                <div class="hero-scene-intro">
                                    <div class="viewport hide-for-small-only">
                                        <ul class="hero-scene-text">
                                           
                                            <li>
                                                <h1 class="title" data-t="index.hero.scene.transfer"><p></p>
                                                	<p style="margin-top: 30px;font-size:25px;">优质服务，省时省心</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                    收益稳健，存取灵活，安全有保障，理财更安心 
                                                </h4>
                                            </li>
                                            <li>
                                                <h1 class="title" data-t="index.hero.scene.offline"><p></p>
                                                	<p style="margin-top: 30px;font-size: 25px;">便捷支付，全方位安全保护</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                                                                      全面网络支付方式，覆盖国内主流银行卡种，<br />严密流程及专业风控团队
                                                </h4>
                                            </li>
                                            <li>
                                                <h1 class="title" data-t="index.hero.scene.web"><p></p>
                                                	<p style="margin-top: 30px;font-size:25px;">无需排队，实时到帐</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                                                                         官方合作，值得信赖，正规发票消费无忧，<br />
                                                                                                         线上充值，定期推出优惠活动
                                                                                                       
                                                </h4>
                                            </li>
                                            <li>
                                            	 <h1 class="title" data-t="index.hero.scene.app"><p></p>
                                                	<p style="margin-top:30px;font-size:25px;">操作便捷，安全保障</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                    1分钟完成还款，跨行还款无需任何手续费，<br />银行级金融服务全面保护
                                                </h4>
                                               
                                            </li>
                                             <li>
                                                <h1 class="title" data-t="index.hero.scene.transfer"><p></p>
                                                    <p style="margin-top: 30px;font-size:25px;">足不出户，预约挂号</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                    手机支付，各类医药费边走变付；<br />消息通知，随时查看就诊报告
                                                </h4>
                                            </li>
                                            <li>
                                                <h1 class="title" data-t="index.hero.scene.transfer"><p></p>
                                                	<p style="margin-top: 30px;font-size:25px;">优质服务，省时省心</p></h1>
                                                <h4 class="intro1" data-t="index.hero.subheading" style="width: 410px;font-size: 14px;color: #585858;line-height:30px;">
                                                    收益稳健，存取灵活，安全有保障，理财更安心 
                                                </h4>
                                            </li>
                                        </ul>
                                    </div>
                                </h1>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="hero-bg home" style="left: 300px;position: relative;">
                    <div class="row align-right" style="background-color: #fff;">
                        <div class="columns align-self-middle">
                            <div class="line-box-wrap">
                                <div class="line-box-viewport">
                                    <div class="line-boxes">
                                        <div class="box web"></div>
                                        <div class="box apple-pay"></div>
                                        <div class="box hongbao"></div>
                                        <div class="box qr"></div>
                                        <div class="box fuwu"></div>
                                        <div class="box web"></div>
                                        <div class="box apple-pay"></div>
                                        <div class="box hongbao"></div>
                                        <div class="box qr"></div>
                                        <div class="box fuwu"></div>
                                        <div class="box web"></div>
                                        <div class="box apple-pay"></div>
                                        <div class="box hongbao"></div>
                                        <div class="box qr"></div>
                                        <div class="box fuwu"></div>
                                        <div class="box web"></div>
                                        <div class="box apple-pay"></div>
                                        <div class="box hongbao"></div>
                                        <div class="box qr"></div>
                                        <div class="box fuwu"></div>
                                    </div>
                                    <div class="scene-slider-wrap">
                                        <!--<div class="iphone-hand-bg"></div>-->
                                        <div class="device-iphone6" id="iphone6">
                                            <!--<div class="topbar">
                                                <span class="camera"></span>
                                                <span class="speaker-before"></span>
                                                <span class="speaker"></span>
                                            </div>-->
                                           <!-- <span class="home"></span>-->
                                            <div class="screen">
                                                <div class="scene-viewport">
                                                    <div class="scene-viewes">
                                                        <div class="scene apple-pay"></div>
                                                        <div class="scene hongbao"></div>
                                                        <div class="scene qr"></div>
                                                        <div class="scene fuwu"></div>
                                                        <div class="scene web"></div>
                                                        <div class="scene apple-pay"></div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </section>

        </div>

        <div class="row"></div>

    </section>
</div>

<!--第三部分   转账付款-->
<section class="sectionA payment">
	<div style="background-color: #F7F7F7;overflow: hidden;">
		<div class="container" style="padding-left: 0px;margin-top: 0;">
			<div class="row">
				<div class="col-md-4" style="float: left;">
					<div class="bglight">
						<div class="payment_left">
							<h1>轻松转账   随需支付</h1>
							<p>智汇宝注册账号作为您的个人网络银行，可使用查询，收款，充值，提现等多种功能，智汇宝账户支付为您提供更快捷更安全的在线支付交易</p>
							<a href="to_PersonalUnspay.do.html">
								<div class="view">查看详情</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-8" style="float: right;">
					<div class="bgpics">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="payment_top">
		<div class="centre clearfix">
			<div class="beautify active">
				<a href="route.do~modual=pay$innerPay.html">
					<div class="center_box">
						<img src="static/imgs/index/zzyinshengbao.png" alt="" />
						<p>转账到智汇宝</p>
					</div>
				</a>
			</div>
			
			<div class="beautify">
				<a href="route.do~modual=pay$drawToOther.html">
					<div class="center_box">
						<img src="static/imgs/index/zzbankzhanghu.png" alt="" />
						<p>转账到银行帐户</p>
					</div>
				</a>
			</div>
			
			<div class="beautify">
				<a href="route.do~modual=pay$batch.html">
					<div class="center_box">
						<img src="static/imgs/index/xiangduorenfukuan.png" alt="" />
						<p>向多人付款</p>
					</div>
				</a>
			</div>
			
			<div class="beautify">
				<a href="route.do~modual=pay$innerCollect.html">
					<div class="center_box">
						<img src="static/imgs/index/woyaoshoukuan.png" alt="" />
						<p>我要收款</p>
					</div>
				</a>
			</div>
			
			<div class="beautify">
				<a href="route.do~modual=pay$innerMoreCollect.html">
					<div class="center_box">
						<img src="static/imgs/index/xiangduorenshoukuan.png" alt="" />
						<p>向多人收款</p>
					</div>
				</a>
			</div>

		</div>
	</div>
	
	<div class="payment_buttom">
		<h1>遍享优惠  &nbsp; 品质生活</h1>
		<div class="payment_buttom_box">
			<p>汇聚当下热门服务，信用卡还款，生活缴费，手机充值，游戏充值，加油卡充值等，智汇宝助您轻松生活</p>
		</div>
	</div>
</section>

<!--第四部分   -->
<section class="lift">
    <div class="lijishiyong">
        <img src="static/imgs/index/banner4.png" style="width: 100%; overflow: hidden;" alt="" />
        <em class="lijishiyong_a"><a href="page/barcodepay/toBarCodePay.do~type=3.html">立即使用</a></em>
        <div class="lift_tu">
          <em class="em1"></em>
          <em class="em2"></em>
          <em class="em3"></em>
        </div>
        
        <div class="lift_tu1">        
        </div>

    </div>

    <div class="lift_top">
        <div class="centre clearfix">
            <div class="beautify active">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/gonggongshiyejiaofei.png" alt="" />
	                    <p>公共事业缴费</p>
	                </div>
	            </a>
            </div>
            <div class="beautify">
                <a href="route.do~modual=mobile$inpour&mob_flag=hasacc.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/shoujichongzhi.png" alt="" />
	                    <p>手机充值</p>
	                </div>
	            </a>
            </div>
            <div class="beautify">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/xinyongkahuankuan.png" alt="" />
	                    <p>信用卡还款</p>
	                </div>
                </a>
            </div>
            <div class="beautify">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/youxichongzhi.png" alt="" />
	                    <p>游戏充值</p>
	                </div>
                </a>
            </div>
            <div class="beautify">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/jiayoukachongzhi.png" alt="" />
	                    <p>加油卡充值</p>
	                </div>
                </a>
            </div>
            <div class="beautify">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/dianyingpiao.png" alt="" />
	                    <p>电影票</p>
	                </div>
                </a>
            </div>
            <div class="beautify">
                <a href="sessionInvalid.do.html">
	                <div class="center_box">
	                    <img src="static/imgs/index/yiliaoyuyue.png" alt="" />
	                    <p>医疗预约</p>
	                </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!--第五部分   合作银行/合作机构-->
<section class="cooperation">
    <div class="centre">
        <p style="margin-bottom: 10px;">合作银行</p>
        <ul class="clearfix">
            <li><img src="static/imgs/index/gongshangyinhang.png" alt="" /></li>
            <li><img src="static/imgs/index/nongyeyinhang.png" alt="" /></li>
            <li><img src="static/imgs/index/zhongguoyinhang.png" alt="" /></li>
            <li><img src="static/imgs/index/jiansheyinhang.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang5.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang6.png" alt="" /></li>
        </ul>
        <ul class="clearfix">
            <li><img src="static/imgs/index/hezuoyinhang7.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang8.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang9.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang10.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang11.png" alt="" /></li>
            <li><img src="static/imgs/index/hezuoyinhang12.png" alt="" /></li>
        </ul>
    </div>
    <div class="centre">
        <p style="margin:10px 0;">合作机构</p>
        <ul class="clearfix">
            <li><img src="static/imgs/partners/h1.png" alt="" /></li>
            <li><img src="static/imgs/partners/h2.png" alt="" /></li>
            <li><img src="static/imgs/partners/h4.png" alt="" /></li>
            <li><img src="static/imgs/partners/h5.png" alt="" /></li>
            <li><img src="static/imgs/partners/h6.png" alt="" /></li>
            <li><img src="static/imgs/partners/h7.png" alt="" /></li>
        </ul>
    </div>
</section>
	<jsp:include page="include/feet.jsp"></jsp:include>
<script>
	require('modules/widget/header/header');
    require('modules/widget/indexSection/sectioniphone');
  	require('modules/widget/footer/footer');
    require('modules/ui/index');
</script>
</body>
</html>