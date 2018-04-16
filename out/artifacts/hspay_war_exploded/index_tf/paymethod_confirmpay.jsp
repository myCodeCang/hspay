<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<jsp:include page="include/script1.jsp"></jsp:include>
<link href="style/bank-icon.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<script type="text/javascript" language="javascript">
		document.getElementById('ins4').className = 'on';
	</script>

	<div id="m_banner_pay"></div>
	<div id="m_header2"></div>
	<div class="m2_main height1100">
		<div class="m2_main_l">
			<div class="m2_main_l_tit">支付方式</div>
			<dl class="payclass_left height450">
				<dt>无线支付</dt>
				<dd class="icon">
					<a href="paymethod_wireless1.jsp">手机客户端支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_wireless2.jsp">WAP支付</a>
				</dd>
				<dt>其他支付方式</dt>
				<dd class="icon">
					<a href="paymethod_quickpay.jsp">快捷支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_bankpay.jsp">网银支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_cardpay.jsp">行业卡支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_directpay.jsp">直连支付</a>
				</dd>
				<dd class="icon current2">
					<a href="paymethod_confirmpay.jsp">认证支付</a>
				</dd>
				<dd class="icon">
					<a href="paymethod_accountpay.jsp">账户支付</a>
				</dd>
			</dl>
			<div class="safety_left_tit left">客服咨询</div>
			<div class="left safety_left">
				<p class="marginl15">
					<img src="pic/tel400.gif" />
				</p>
				<div class="left marginl15 inline margint15 width210">
					<div class="line-h32 left">在线咨询：</div>
					<!-- <div class="left margint2"><img  style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=8747930&o=秒付宝官网&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" SRC=/newweb/pic/btn_qq.gif alt="拥有秒付宝，生活更轻松！"></div> -->
					<div class="left margint2">
						<img border="0" src="pic/btn_qq.gif" alt="拥有秒付宝，生活更轻松！" />
					</div>
				</div>
				<div class="gray marginl74 left width150 inline">(周一至周五 8:30-18:00)</div>
				<div class="left marginl15 inline margint5 width210">
					<p>签约专线：0830-3153101</p>
					<p>客服专线：0830-3153101</p>
					<p class="gray marginl60">(7x24小时服务)</p>
				</div>
			</div>
			<!--内容 结束-->
		</div>
		<!--左边结束-->
      <div class="payclass_r right height1200">
      <div id="pro_wap" class="left">
     <h2 class="icon_pro_other5">认证支付</h2>
     <p>什么是认证支付？<br/>
区别于网银支付，无需跳转到银行官网页面，只需在腾付通支付页面输入目标银行所需的支付信息，即可完成支付。</p>
     <h4>特点：</h4>
     <ul class="pro_l_ul">
     <li>无需跳转银行页面</li>
     <li>快捷操作确保安全</li>
     <li>支付畅享乐趣无穷</li>
     </ul>
      <h4 style="margin-top:100px;">付款流程：</h4>
     <p class="pro_bz_bg"><span>1.提交付款订单</span><span> 2.输入银行卡的对应信息</span><span>3.完成付款</span></p>
      <h4>支持银行：</h4>
      <p>银联B2C(58家)</p>
      <UL class="ui-list-icons3 fn-clear cashier-bank" style="margin-top:20px; margin-bottom:20px;">
    <li><a class=icon-box href="http://www.icbc.com.cn/icbc/"><span 
    class="icon ICBC" title="中国工商银行">中国工商银行</span></a>    </li>
      <li><a class=icon-box href="http://www.ccb.com/cn/home/index.html"><span class="icon CCB" title="中国建设银行">中国建设银行</span> </a>    </li>
    <li><a class=icon-box href="http://www.abchina.com/cn/"><span 
    class="icon ABC" title="中国农业银行">中国农业银行</span> </a>    </li>
    <li><a class=icon-box href="http://www.boc.cn/"><span 
    class="icon BOC" title="中国银行">中国银行</span> </a>    </li>
    <li><a class=icon-box href="http://www.bankcomm.com/BankCommSite/cn/index.html"><span 
    class="icon COMM" title="交通银行">交通银行</span> </a>    </li>
    <li><a class=icon-box href="http://www.cmbchina.com/"><span 
    class="icon CMB" title="招商银行">招商银行</span> </a>    </li>
    <!--兴业银行-->
    <li><a class=icon-box href="http://www.cib.com.cn/netbank/cn/index.html"><span 
    class="icon CIB" title="兴业银行">兴业银行</span> </a>    </li>
    <!--华夏银行-->
    <li><a class=icon-box href="http://www.hxb.com.cn/chinese/index.html"><span 
    class="icon HXBANK" title="华夏银行">华夏银行</span> </a>    </li>
    <!--民生银行-->
    <li><a class=icon-box href="http://www.cmbc.com.cn/"><span 
    class="icon CMBC" title="民生银行">民生银行</span> </a>    </li>
    <!--中信银行-->
    <li><a class=icon-box href="中信银行"><span 
    class="icon CITIC" title="中信银行">中信银行</span> </a>    </li>
    <!--浦东发展银行-->
    <li><a class=icon-box href="http://www.spdb.com.cn/chpage/c1/"><span 
    class="icon SPDB" title="浦东发展银行">浦东发展银行</span> </a>    </li>
    <!--广东发展银行-->
    <li><a class=icon-box href="http://www.cgbchina.com.cn/"><span 
    class="icon GDB" title="广东发展银行">广东发展银行</span> </a>    </li>
    <!--平安银行-->
    <li><a class=icon-box href="http://www.pingan.com/?WT.mc_id=c03-BDPP-101&WT.srch=1"><span 
    class="icon SPABANKKT" title="平安银行">平安银行</span> </a>    </li>
    <!--渤海银行-->
    <li><a class=icon-box href="http://www.cbhb.com.cn/bhbank/S101/index.htm"><span 
    class="icon BOHAIBKT" title="渤海银行">渤海银行</span> </a>    </li>
    <!--汉口银行-->
    <li><a class=icon-box href="http://www.hkbchina.com/portal/zh_CN/home/index.html"><span 
    class="icon HKB" title="汉口银行">汉口银行</span> </a>    </li>
    <!--珠海市农村信用合作社-->
    <li><a class=icon-box href="http://www.zhnx.com.cn/"><span 
    class="icon ZHNX" title="珠海市农村信用合作社">珠海市农村信用合作社</span> </a>    </li>
    <!--晋城市商业银行-->
    <li><a class=icon-box href="http://www.jccbank.com.cn/"><span 
    class="icon JINCHB" title="晋城市商业银行">晋城市商业银行</span> </a>    </li>
    <!--山西省临汾市尧都区信用合作联社-->
    <li><a class=icon-box href="#"><span 
    class="icon LFYDBANK" title="山西省临汾市尧都区信用合作社">山西省临汾市尧都区信用合作社</span> </a>   </li>
    <!--温州银行-->
    <li><a class=icon-box href="http://www.wzcb.com.cn/"><span 
    class="icon WZCBKT" title="温州银行">温州银行</span> </a>    </li>
    <!--宁波银行-->
    <li><a class=icon-box href="http://www.nbcb.com.cn/"><span 
    class="icon NBBANKKT" title="宁波银行">宁波银行</span> </a>    </li>
    <!--江苏农村信用合作社-->
    <li><a class=icon-box href="http://www.js96008.com/"><span 
    class="icon JSRCU" title="江苏农村信用合作社">江苏农村信用合作社</span> </a>    </li>
    <!--富滇银行-->
    <li><a class=icon-box href="http://www.fudian-bank.com/"><span 
    class="icon FDBKT" title="富滇银行">富滇银行</span> </a>    </li>
    <!--河北银行-->
    <li><a class=icon-box href="http://www.sccb.com.cn/"><span 
    class="icon HEBBANK" title="河北银行">河北银行</span> </a>   </li>
    <!--齐鲁银行-->
    <li><a class=icon-box href="http://www.qlbchina.com/Site/Home/CN"><span 
    class="icon QILUBANK" title="齐鲁银行">齐鲁银行</span> </a>   </li>
    <!--晋中市商业银行-->
    <li><a class=icon-box href="http://www.jzbank.com/"><span 
    class="icon JZBANK" title="晋中市商业银行">晋中市商业银行</span> </a>    </li>
    <!--湖南农村信用社联合社-->
    <li><a class=icon-box href="http://www.hnnxs.com/"><span 
    class="icon HNBKT" title="湖南农村信用联合社">湖南农村信联合用社</span> </a>   </li>
    <!--重庆农村商业银行-->
    <li><a class=icon-box href="http://www.cqrcb.com/"><span 
    class="icon CQRCB" title="重庆农村商业银行">重庆农村商业银行</span> </a>    </li>
    <!--驻马店市商业银行-->
    <li><a class=icon-box href="http://www.zmdbank.cn/"><span 
    class="icon ZMDCB" title="驻马店市商业银行">驻马店市商业银行</span> </a>    </li>
    <!--海南省农村信用社联合社-->
    <li><a class=icon-box href="http://www.hainanbank.com.cn/"><span 
    class="icon HAINANBANK" title="海南省农村信用社联合社">海南省农村信用社联合社</span> </a>   </li>
    <!--成都农村商业银行-->
    <li><a class=icon-box href="http://www.cdrcb.com/"><span 
    class="icon CDRCB" title="成都农村商业银行">成都农村商业银行</span> </a>    </li>
    <!--日照银行-->
    <li><a class=icon-box href="http://www.bankofrizhao.com.cn/"><span 
    class="icon BANKOFRIZHAO" title="日照银行">日照银行</span> </a>    </li>
    <!--东莞银行-->
    <li><a class=icon-box href="http://www.dongguanbank.cn/Site/Home/CN"><span 
    class="icon DONGGUANBANK" title="东莞银行">东莞银行</span> </a>    </li>
    <!--广州银行-->
    <li><a class=icon-box href="http://www.gzcb.com.cn/i_index.shtml"><span 
    class="icon GCB" title="广州银行">广州银行</span> </a>    </li>
    <!--顺德农村商业银行-->
    <li><a class=icon-box href="http://www.sdebank.com/cms/S101_21/ebank/main/pweb.html"><span 
    class="icon SDEB" title="顺德农村商业银行">顺德农村商业银行</span> </a>    </li>
    <!--浙商银行-->
    <li><a class=icon-box href="http://www.czbank.com/czbank/"><span 
    class="icon CZBANK" title="浙商银行">浙商银行</span> </a>    </li>
    <!--德州市商业银行-->
    <li><a class=icon-box href="http://www.dzbchina.com/Site/Home/CN"><span 
    class="icon DZBCHINA" title="德州市商业银行">德州市商业银行</span> </a>   </li>
    <!--长沙银行-->
    <li><a class=icon-box href="http://www.cscb.cn/cms/S102/index.htm"><span 
    class="icon CSCB" title="长沙银行">长沙银行</span> </a>   </li>
    <!--广西北部湾银行-->
    <li><a class=icon-box href="http://www.bankofbbg.com/portal/index.htm"><span 
    class="icon BANKOFBBG" title="广西北部湾银行">广西北部湾银行</span> </a>    </li>
    <!--深圳农商银行-->
    <li><a class=icon-box href="http://www.961200.net/portal/zh_CN/home/index.html"><span 
    class="icon SZNSBANK" title="深圳农商银行">深圳农商银行</span> </a>    </li>
    <!--威海市商业银行-->
    <li><a class=icon-box href="http://www.whccb.com/"><span 
    class="icon WHCCB" title="威海市商业银行">威海市商业银行</span> </a>   </li>
    <!--大连银行-->
    <li><a class=icon-box href="http://www.bankofdl.com/sy/index.htm"><span 
    class="icon DLB" title="大连银行">大连银行</span> </a>    </li>
    <!--泰安市商业银行-->
    <li><a class=icon-box href="http://www.taccb.com.cn/"><span 
    class="icon TACCB" title="泰安市商业银行">泰安市商业银行</span> </a>    </li>
    <!--乌鲁木齐市商业银行-->
    <li><a class=icon-box href="http://www.uccb.com.cn/"><span 
    class="icon URMQCCB" title="乌鲁木齐市商业银行">乌鲁木齐市商业银行</span> </a>    </li>
    <!--宁夏银行-->
    <li><a class=icon-box href="http://www.ycccb.com/portal/zh_CN/index.html"><span 
    class="icon YCCCB" title="宁夏银行">宁夏银行</span> </a>    </li>
    <!--上饶银行-->
    <li><a class=icon-box href="http://www.srbank.cn/"><span 
    class="icon SRBANK" title="上饶银行">上饶银行</span> </a>    </li>
    <li><a class=icon-box href="http://www.cebbank.com/Site/ceb/cn" target="_blank"><span 
    class="icon CEB" title="光大银行">光大银行</span> </a>    </li>
    <!--江苏银行-->
    <li><a class=icon-box href="http://www.jsbchina.cn/"><span 
    class="icon JSBANK" title=江苏银行>江苏银行</span> </a>    </li>

    </UL>
      </div>
      </div>
	</div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>