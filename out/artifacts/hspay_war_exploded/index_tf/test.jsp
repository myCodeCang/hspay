<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="秒付宝" />
<title>轻松体验 - 秒付宝官网</title>
<meta http-equiv="X-UA-Compatible" content="IE=10;IE=9;IE=8;IE=7" />
<meta name="description" content="秒付宝，国内领先的第三方支付平台，致力于为企业和个人用户提供安全便捷的支付应用服务，完善的服 务体系，全新的产品体验，用户覆盖机票、酒店、游戏、生活服务等多个领域。" />
<meta name="keywords" content="秒付宝,电子支付/网上支付/安全支付/手机支付,安全购物/网络购物付款/付款/收款,水电煤缴费/信用卡 还款/AA收款/手机充值,网上付款/机票预订,秒付宝网站" />
<jsp:include page="include/script.jsp"></jsp:include>
<script src="<%=basePath %>/static/js/jquery.tabs.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("li#top1").addClass("active");
		$('.demo1').Tabs({
			event : 'click',
			callback : tabcallback
		});
		$("#ccbnetb2c").attr("checked", true);
	});

	function tabcallback() {
		var index = $(".current").index();
		if (index == 0) {
			$("#ccbnetb2c").attr("checked", true);
		} else if (index == 1) {
			$("#weixinId").attr("checked", true);
		} else if (index == 2) {
			$("#wxwap").attr("checked", true);
		} 

		if (index == 3) {
			$("#bankCardType").val("01");
			$("#Channel1").attr("checked", true);
		} else {
			$("#bankCardType").val("00");
		}
	}

    function sub() {
        $("#payfrom").submit();
    }
</script>
<style type="text/css">
.banner{ width:100%; border-top:1px solid #c6c4c9; border-bottom:1px solid #fff;position:relative;}
.pay{ width:1210px; margin:50px auto 30px auto; display:table}
.pay .title{ background:#F4F0E9; border-radius:10px; padding:20px 30px; border-bottom:5px #6C0460 solid; font-size:14px}
.pay .title span{ margin-right:60px}
.pay .title span em{ font-size:20px; font-weight:700; color:#FF7200}

.pay .bank{ width:100%; display:table;padding: 40px 0 0 0; }
.pay .bank .tab_menu{width:1213px;height:38px; position:relative;border-bottom:1px #6C9BC7 solid;border-left:1px #6C9BC7 solid;}
.pay .bank .tab_menu ul{ height:38px; width:100%; position:absolute; left:0px; bottom:0px}
.pay .bank .tab_menu li{width:120px;float:left;height:38px;line-height:38px;color:#555555;text-align:center;cursor:pointer; background:url(../images/t01.png)/*tpa=http://pay.qitianpay.com/static/demo/images/t01.png*/ no-repeat left bottom; font-size:14px; font-weight:700;border-right:1px #6C9BC7 solid;border-top:1px #6C9BC7 solid;}
.pay .bank .tab_menu li.current{color:#FFF;background:#6C9BC7 url(<%=basePath %>/static/new/images/d.jpg)/*tpa=http://pay.qitianpay.com/static/demo/images/d.jpg*/ no-repeat center bottom}
.pay .bank .tab_box{ border:1px #6C9BC7 solid;border-top:0px; padding:20px 0px 20px 20px; width:1192px; display:table}
.pay .bank .tab_box .hide{display:none;}
.pay .bank .tab_box .zhifu{ display:table; width:100%}
.pay .bank .tab_box .zhifu label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box .fastpay{ display:table; width:100%}
.pay .bank .tab_box .fastpay label{ display:block;cursor:pointer; vertical-align:middle; width:215px; float:left; margin:10px 15px 15px 0px}
.pay .bank .tab_box img{vertical-align:middle; margin-left:10px}
.pay .bank .tab_box .qita{ padding-left:30px; width:100%; display:table; margin:20px 0px}
.pay .bank .tab_box .qita .tit{ color:#0066FF; font-size:12px;}
.pay .bank .tab_box .qita .tit em{ display:block; background:url(<%=basePath %>/static/new/images/d1.jpg)/*tpa=http://pay.qitianpay.com/static/demo/images/d1.jpg*/ no-repeat 50px center}
.pay .bank .tab_box .car{ line-height:30px; font-size:14px; color:#545454; padding-left:20px}
.pay .bank .tab_box .car label{ margin-right:20px}
.pay .bank .tab_box .btn{ padding-left:20px;margin:30px 0px 30px 0px}
.pay .bank .tab_box .btn a{ width:144px; height:44px; color:#FFF; line-height:44px; background:url(<%=basePath %>/static/new/images/next.png)/*tpa=http://pay.qitianpay.com/static/demo/images/next.png*/ no-repeat; display:block; text-indent:30px; font-size:16px}
img{display: contents;}
</style>
</head>
<body>
	<jsp:include page="include/head.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
    <form id="payfrom" action="<%=basePath%>/paydo" method="post" target="_blank">
        <input type="hidden" name="bankCardType" id="bankCardType" value="00"/>
	<div class="banner">
		<div class="pay">
			<div class="title">
				<span>支付号：浩付</span><span>商户：测试</span><span>商品名称：充值体验</span><span>金额：<em>
				<select name="testAmt">
				<option value="1.00" selected="selected">1元</option>
				<option value="10.00">10元</option>
				<option value="19.00">19元</option>
				<option value="30.00">30元</option>
				<option value="30.01">30.01元</option>
				<option value="50.00">50元</option>
				<option value="100.00">100元</option>
				</select></em>
				</span>
			</div>
			<div class="bank">
				<div class="demo1">
					<ul class="tab_menu">
						<li class="current">网银支付</li>
						<li>扫码支付</li>
						<li>WAP支付</li>
						<li>点卡支付</li>
					</ul>
					<div class="tab_box">
						<div class="">
							<div class="zhifu">
								<label class="radio"> <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" id="ccbnetb2c" checked="checked">
									<img src="<%=basePath%>/images/banklogo/jianshe.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/gongshang.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/zhaohang.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/nongye.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/jiaotong.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/zhongguo.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="POST-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/youzheng.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="HKBEA-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/dongya.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/guangda.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="GDB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/guangfa.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="HZBANK-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/hangzhou.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="SCCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/hebei.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="BCCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/beijing.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CBHB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/buohai.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CMBC-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/minsheng.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="NJCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/nanjing.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="NCBBANK-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/nanyanbank.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="NBCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/ningbo.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="BJRCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/nongcunshangye.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="ECITIC-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/zhongxin.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"> <img
									src="<%=basePath%>/images/banklogo/pingan.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="SHB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/shanghaibank.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="SRCB-NET-B2C"> <img
									width="154" height="33" src="<%=basePath%>/images/banklogo/shangnongshang.jpg">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="SPDB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/shangpufa.gif">
								</label><label class="radio"> <input type="radio" name="pd_FrpId" value="SDB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/shenfa.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="ZJTLCB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/tailong.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CIB-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/xingye.gif">
								</label> <label class="radio"> <input type="radio" name="pd_FrpId" value="CZ-NET-B2C"> <img
									src="<%=basePath%>/images/banklogo/zheshang.gif">
								</label>

							</div>
							<div class="clear"></div>
							<div class="qita"></div>

							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>


						</div>
						<div class="hide">

							<div class="zhifu">
								<label> <input type="radio" name="pd_FrpId" id="weixinId" value="weixin" /><img
									src="<%=basePath%>/images/banklogo/wxpay.jpg" />
								</label>
								<label> <input type="radio" name="pd_FrpId" id="qqcodeId" value="qqcode" /><img
									src="<%=basePath%>/images/banklogo/qqcode.png" />
								</label>
								<label> <input type="radio" name="pd_FrpId" id="alipayId" value="alipay" /><img
									src="<%=basePath%>/images/banklogo/zfb.png" />
								</label>
								<label> <input type="radio" name="pd_FrpId" id="tenpaywapId" value="tenpay" /><img
									src="<%=basePath%>/images/banklogo/tenpay.png" />
								</label>
							</div>
							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>

						</div>
						<div class="hide">
							<div style="text-align: left;padding: 30px;font-size: 30px;">请从手机浏览器上打开当前界面，才能调相应的wap</div>
							<div class="zhifu">
								<label> <input type="radio" name="pd_FrpId" id="wxwap" value="wxwap" /><img
									src="<%=basePath%>/images/banklogo/wxpay.jpg" />
								</label>
								<label> <input type="radio" name="pd_FrpId" id="qqwap" value="qqwap" /><img
									src="<%=basePath%>/images/banklogo/qqpay.png" />
								</label>
								<label> <input type="radio" name="pd_FrpId"  value="alipaywap" /><img
									src="<%=basePath%>/images/banklogo/zfb.png" />
								</label>
								<label> <input type="radio" name="pd_FrpId" value="tenpaywap" /><img
									src="<%=basePath%>/images/banklogo/tenpay.png" />
								</label>
							</div>
							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>

						</div>
						<div class="hide">
							<div class="zhifu">
								<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" style="border-spacing: 0;">
									<tr>
										<td>充值金额(元)</td>
										<td>&nbsp;&nbsp;<input size="50" type="text" name="facevalue" id="facevalue" value="100" />&nbsp;<span
											style="color: #FF0000; font-weight: 100;">*</span>
										</td>
									</tr>
									<tr id="trcardNum">
										<td>卡号</td>
										<td>&nbsp;&nbsp;<input size="50" type="text" name="cardNo" id="cardNo" value="" />&nbsp;<span
											style="color: #FF0000; font-weight: 100;">*</span>
										</td>
									</tr>
									<tr id="trcardPwd">
										<td>卡密</td>
										<td>&nbsp;&nbsp;<input size="50" type="text" name="cardPwd" id="cardPwd" value="" />&nbsp;<span
											style="color: #FF0000; font-weight: 100;">*</span>
										</td>
									</tr>
								</table>
								<table>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Channel1" value="000701"> <img src="<%=basePath%>/images/banklogo/QBCZK.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio2" value="000601"> <img src="<%=basePath%>/images/banklogo/SDYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio3" value="000501"> <img src="<%=basePath%>/images/banklogo/JWYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio4" value="000801"> <img src="<%=basePath%>/images/banklogo/WMYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio5" value="001101"> <img src="<%=basePath%>/images/banklogo/SHYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio6" value="000901"> <img src="<%=basePath%>/images/banklogo/ZTYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio8" value="001201"> <img src="<%=basePath%>/images/banklogo/JYYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio9" value="001001"> <img src="<%=basePath%>/images/banklogo/WYYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio10" value="000301"> <img src="<%=basePath%>/images/banklogo/DXGK.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio11" value="000101"> <img src="<%=basePath%>/images/banklogo/YDSZX.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio12" value="000201"> <img src="<%=basePath%>/images/banklogo/LTYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio16" value="001401"> <img src="<%=basePath%>/images/banklogo/TXYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio17" value="001301"> <img src="<%=basePath%>/images/banklogo/THYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio18" value="001601"> <img src="<%=basePath%>/images/banklogo/ZYYKT.png"/></label>
								</td></tr>
								</table>
							</div>
							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	</form>
	<div class="cls"></div>
	<jsp:include page="include/feet.jsp"></jsp:include>
</body>
</html>