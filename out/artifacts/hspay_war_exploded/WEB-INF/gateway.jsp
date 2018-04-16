<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="page/Plug1.jsp"></jsp:include>
<style type="text/css">
.btn {
	background: inherit;
	border: 0;
}

.banner {
	height: inherit;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("li#top1").addClass("active");
	$("#indexform").Validform({
		tiptype : 1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/user";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/";
					}, 1000);
				}
			}
		});
		$('.demo1').Tabs({
			event : 'click',
			callback : tabcallback
		});
	});

	function tabcallback() {
		var index = $(".current").index();
		if (index == 0) {
			$("#ccbnetb2c").attr("checked", true);
		} else if (index == 1) {
			$("#alipaywapId").attr("checked", true);
		} else if (index == 2) {
			$("#tenpaywapId").attr("checked", true);
		} else if (index == 3) {
			$("#weixinId").attr("checked", true);
		} 

		if (index == 4) {
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

<style>
.ocx_style_wrap {
	background: #fff url(<%=basePath%>/static/new/images/bgtxt2.jpg) left
		center no-repeat;
	border: 0 solid #BEBEBE;
	border-radius: 2px 2px 2px 2px;
	color: #333333;
	cursor: text;
	float: left;
	height: 41px;
	line-height: 20px;
	width: 220px;
}

.ocx_style {
	background: none repeat scroll 0 0 #FFFFFF;
	height: 30px;
	line-height: 30px;
	width: 170px;
	margin-left: 48px;
	margin-top: 6px;
}
</style>
</head>

<body>
	<script type="text/javascript" src="<%=basePath%>/static/js/PassGuardCtrl.js"></script>
	<script type="text/javascript">
		var pgeditor = new $.pge({
			pgePath : "static/ocx/", //控件文件目录
			pgeId : "_ocx_password", //控件ID
			pgeEdittype : 0, //控件类型,0星号,1明文
			pgeClass : "ocx_style", //控件css样式
			pgeTabindex : 2, //tab键顺序
			tabCallback : "code_id", //非IE tab键焦点切换的ID
			pgeMaxlength : 32, //允许最大输入长度
			pgeEreg1 : "[\\s\\S]*", //输入过程中字符类型限制
			pgeEreg2 : "[\\s\\S]{6,32}" //输入完毕后字符类型判断条件
		});
	</script>
	<jsp:include page="navigation1.jsp"></jsp:include>
    <form id="payfrom" action="<%=basePath%>/paydo" method="post" target="_blank">
        <input type="hidden" name="bankCardType" id="bankCardType" value="00"/>
        <input type="hidden" name="testAmt" value="2"/>
	<div class="banner">
		<div class="pay">
			<div class="title">
				<span>支付号：浩付</span><span>商户：测试</span><span>商品名称：充值体验</span><span>金额：<em>10</em>元
				</span>
			</div>
			<div class="bank">
				<div class="demo1">
					<ul class="tab_menu">
						<li class="current">网银</li>
						<li>支付宝wap</li>
						<li>财付通</li>
						<li>微信扫码</li>
						<li>点卡</li>
					</ul>
					<div class="tab_box">
						<div class="">
							<div class="zhifu">
								<label class="radio"> <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" id="ccbnetb2c">
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
								<label> <input type="radio" name="pd_FrpId" id="alipaywapId" value="alipaywap" /><img
									src="<%=basePath%>/images/banklogo/zfb.png" />
								</label>
							</div>
							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>

						</div>
						<div class="hide">

							<div class="zhifu">
								<label> <input type="radio" name="pd_FrpId" id="tenpaywapId" value="tenpaywap" /><img
									src="<%=basePath%>/images/banklogo/tenpay.png" />
								</label>
							</div>
							<div class="btn">
								<a href="javascript:sub()">下一步</a>
							</div>

						</div>
						<div class="hide">

							<div class="zhifu">
								<label> <input type="radio" name="pd_FrpId" id="weixinId" value="weixin" /><img
									src="<%=basePath%>/images/banklogo/wxpay.jpg" />
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
										<label class="radio"><input type="radio" name="Channel" id="Channel1" value="QQCARD"> <img src="<%=basePath%>/images/banklogo/QBCZK.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio2" value="SNDACARD"> <img src="<%=basePath%>/images/banklogo/SDYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio3" value="JUNNET"> <img src="<%=basePath%>/images/banklogo/JWYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio4" value="WANMEI"> <img src="<%=basePath%>/images/banklogo/WMYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio5" value="SOHU"> <img src="<%=basePath%>/images/banklogo/SHYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio6" value="ZHENGTU"> <img src="<%=basePath%>/images/banklogo/ZTYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio8" value="JIUYOU"> <img src="<%=basePath%>/images/banklogo/JYYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio9" value="NETEASE"> <img src="<%=basePath%>/images/banklogo/WYYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio10" value="TELECOM"> <img src="<%=basePath%>/images/banklogo/DXGK.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio11" value="SZX"> <img src="<%=basePath%>/images/banklogo/YDSZX.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio12" value="UNICOM"> <img src="<%=basePath%>/images/banklogo/LTYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio16" value="TIANXIA"> <img src="<%=basePath%>/images/banklogo/TXYKT.png"/></label>
								</td></tr>
								<tr><td>
										<label class="radio"><input type="radio" name="Channel" id="Radio17" value="TIANHONG"> <img src="<%=basePath%>/images/banklogo/THYKT.png"/></label>
										<label class="radio"><input type="radio" name="Channel" id="Radio18" value="ZONGYOU"> <img src="<%=basePath%>/images/banklogo/ZYYKT.png"/></label>
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
	<jsp:include page="page/footer1.jsp"></jsp:include>
</body>
</html>