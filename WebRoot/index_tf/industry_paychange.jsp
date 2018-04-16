<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" language="javascript">
		document.getElementById('ins2').className = 'on';
	</script>
  <div id="m_banner_payinpout"></div>
  <div id="m_header2"></div>
  <div class="m2_main height800">
      <div class="m2_main_l">
      <div class="m2_main_l_tit">行业解决方案</div>
        <dl class="m2_left height245">
            <dd class="icon"><a href="industry_flight.jsp" class="icon01">机票旅游</a></dd>
            <dd class="icon"><a href="industry_shopping.jsp" class="icon02">网络购物</a></dd>
            <dd class="icon current2"><a href="industry_paychange.jsp" class="icon03">代付代扣</a></dd>
        </dl>
         <div class="safety_left_tit left">客服咨询</div>
         <div class="left safety_left">
         <p class="marginl15"><img src="pic/tel400.gif" /></p>
         <div class="left marginl15 inline margint15 width210"><div class="line-h32 left">在线咨询：</div><div class="left margint2"><img border="0" SRC=pic/btn_qq.gif alt="拥有腾付通，生活更轻松！"></div></div>
            <div class="gray marginl74 left width150 inline">(周一至周五 8:30-18:00)</div>
             <div class="left marginl15 inline margint5 width210">
             <p>签约专线：0755-83485999-6018</p>
             <p>客服专线：4000-288-309</p>
             <p class="gray marginl60">(7x24小时服务)</p>
             </div>
         </div>
          <!--内容 结束-->
      </div>
      <!--左边结束-->
      <div class="m2_main_r right height800">
      <div class="left width720 margint25">
      <div class="left width700 line-h22">
        <p class="font_14 font_purple b">代收代付</p>
        <p class="margint5">腾付通代收代付，简单快捷，一站式解决交易资金的划转需求，无论是企业间转账还是个人间转账都可轻松实现。      </p>
        <p class="font_14 font_purple b margint25">适用行业：</p>
        <p class="margint5">广泛适用于集团母子公司、连锁经营型企业等。</p>
        <p class="font_14 font_purple b margint25">方案介绍:</p>
        <p class="margint5">腾付通代收代付是解决企业间、企业与个人间资金往来划转的交易系统，可实现公对公、公对私、私对公（仅支持私对公付款，不支持私对公收款）、私对私银行资金转账交易，批量操作省时省心。提供低廉成本的跨行转账服务，优化支付、资金回笼、资金调配、对账、结算等环节，加快资金流转速度。为行业商家提供定制化综合性支付运营解决方案。</p>
      </div>
      <div class="clearfix paychange_tab barProds left">
                <div class="left paychange_left"></div>
                <div class="left paychange_right">
                        <ul class="tabs">
                    <li class="tab1">
                        <a id="tab_pay" name="tab_pay" class="selected" onclick="showOnly('tab1','barProds')" >
                            <!--<img src="img/icons/notebooks.png" alt="Search product!"/>-->
                           代付
                        </a>
                    </li>
                    <li class="tab2">
                        <a id="tab_rec" name="tab_rec" onclick="showOnly('tab2','barProds')">
                            <!--<img src="img/icons/plus-small.png" alt="Add product!"/>-->
              代收                
                        </a>
                    </li>
                </ul>
                </div>
                <!--右边结束-->
                <div class="tabContent clearfix">
                    <div class="tab1">
                    <div class="left margint15">
                        <p class="b blue paychange_right_tit">代付流程</p>
                        <p id="progress_line" class="left paddingl30 margint15">
                              <span class="font_color">签约合作并开通代付服务</span>
                              <span class="marginl40 font_color">通过腾付通发起付款请求</span>
                              <span class="marginl30 font_color">付款成功</span>
                          </p>
                          <p class="b blue paychange_right_tit margint30 left">产品特性</p>
                          <p class="width700 left margint10 line-h22">
                            1) <font class="b">系统自动处理付款，</font>不需要再按传统方式到银行柜台排队办理，省时省力，降低人力及时间成本；<br/> 
                            2) <font class="b">杜绝人工操作失误，</font>无需手工单笔处理付款，解决人工处理付款繁杂且易出错等问题，防范人工操作失误带来的风险；<br/>  
                            3) <font class="b">付款全程管理方便，</font>付款操作方便，付款记录和状态可查询管理，降低资金管理成本，促进企业整体业务效率提升；<br/>  
                            4) <font class="b">加快资金流动速度，</font>付款处理及到账时间快，不受地域限制，覆盖面广，资金可快速下发所有境内银行账户；<br/>  
                            5) <font class="b">更优惠的手续费率，</font>对比其他支付公司同类业务，具有付款手续费率低，对账方便等优势； <br/> 
                            6) <font class="b">更方便的接入支持，</font>如通过接口付款，腾付通提供专人一对一技术接入调试，集成更方便更可靠。</p>
                            <p class="b blue paychange_right_tit margint30 left">适用场景</p>
                          <p class="width700 left margint10 line-h22">
                            代付服务适用于合作企业不定期或定期的付款业务，如企业佣金代发，保险理赔批量代发，上级厂商货款批量回款，销售企业批量向供货商付款，企业员工薪资代发、费用报销等业务场景。</p>
                    </div>
                   </div>
                   <!--tab1结束-->
                    <div class="tab2" style="display:none;">
                    <div class="left margint15">
                        <p class="b blue paychange_right_tit">代收流程</p>
                        <p id="industry_progress_line" class="left paddingl30 margint15">
                              <span class="font_color">签约合作并开通代收服务</span>
                              <span class="marginl70 font_color">通过腾付通上传委托扣款协议</span>
                              <span class="marginl70 font_color">发起收款请求</span>
                              <span class="marginl74 font_color">收款成功</span>
                          </p>
                          <p class="b blue paychange_right_tit margint30 left">产品特性</p>
                          <p class="width700 left margint10 line-h22">
                            1) <font class="b">省时省力省心</font><br/>
                            省去用户跑银行或业务公司柜台排队缴费时间，用户只须一次设定即可长期使用，全程电子化，扣款无需手动，省时、省力、省心。<br/> 
                            2) <font class="b">账户资金安全</font><br/>
                            值得信赖的腾付通付通合作商户，用户可选择设定单笔和日累计扣款限额，扣款业务设定自动短信及邮件通知用户，用户账户资金安全有保障。<br/> 
                            3) <font class="b">用户管理方便</font><br/>
                            用户可登录腾付通网站随时查看已设定委托代扣业务，可随时更改扣款限额，每笔扣款记录均可通过交易管理进行查询管理。<br/> 
                            4) <font class="b">商户管理对账方便</font><br/>
                            合作商户可登录腾付通平台，在交易管理查看每笔扣款交易记录，财付通提供对账单下载，方便商户财务人员对账。</p>
                            <p class="b blue paychange_right_tit margint30 left">适用场景</p>
                          <p class="width700 left margint10 line-h22">
                            代收服务可广泛适用于行业企业针对下级代理的预付费及扣款，保险公司保险费，金融理财业务，信用卡委托还款，服务企业会员费，互联网增值服务包月业务，水电煤气公共事业缴费，物业管理缴费等自动扣款业务场景。</p>
                    </div>
                   </div>
                    <!--tab2结束-->
                </div>
                <!--tab切换正文结束-->
            </div>
     <!--右边结束-->
      </div>
      </div>
    </div>

	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>