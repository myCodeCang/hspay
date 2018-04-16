<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<style type="text/css">
.zanghye_m table tbody tr td{ text-align:left; border-bottom:0;}
.public_m4 p input{float: none;}
</style>
<script src="<%=basePath %>/static/hspay/laydate/laydate.js"></script>
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script src="<%=basePath%>/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
	var page = 1;
	var basePath="<%=basePath %>";
	$(document).ready(function() {
		recharge(page);
		circlip(page);
		$("#circlipform").Validform({
			tiptype:1,
			postonce:true,
			ajaxPost:true,
			callback:function(data){
				if(data.status=="y"){
					setTimeout(function(){
						$.Hidemsg(); 
						window.location.href="<%=basePath%>/member/payment";
						$("li#licirclip").addClass("active");
						$("li#lireceivables").removeClass("active");
					}, 1000);
				} else {
					setTimeout(function() {
						$.Hidemsg();
						document.getElementById("circlipform").reset();
					}, 1000);
				}
			}
		});
		$("#netform").Validform({
			tiptype : 1,
			ignoreHidden : true
		});
	});
	function recharge(pages) {
		var rechstarttime = $("#rechstarttime").val();
		var rechendtime = $("#rechendtime").val();
		var rechparticipate = $("#rechparticipate").val();
		var rechstate = $("#rechstate").val();
		var rechid = $("#rechid").val();
		rechar(basePath, pages, rechstarttime, rechendtime, rechparticipate,
				rechstate, rechid);
	}
	function circlip(pages) {
		var circstarttime = $("#circstarttime").val();
		var circendtime = $("#circendtime").val();
		var circparticipate = $("#circparticipate").val();
		var circstate = $("#circstate").val();
		var circid = $("#circid").val();
		circ(basePath, pages, circstarttime, circendtime, circparticipate,circstate, circid);
	}
</script>
</head>
<body style="font-family: Microsoft YaHei">
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/payment").text("在线充值");
});
function navTabs(org1,org2,org3,org4){
	$(org1).removeClass("disabled");
	$(org1).addClass("active");
	$(org2).removeClass("active");
	$(org2).addClass("disabled");
	$(org3).removeClass("active");
	$(org3).addClass("disabled");
	$(org4).removeClass("active");
	$(org4).addClass("disabled");
}
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">在线充值</a></h2>
		<ul id="nav">
			<li><a href="javascript:navTabs('#info','#custom','#messages','#four');">充值</a></li>
			<li><a href="javascript:navTabs('#custom','#info','#messages','#four');">充值记录</a></li>
			<li><a href="javascript:navTabs('#messages','#custom','#info','#four');">销卡</a></li>
			<li><a href="javascript:navTabs('#four','#custom','#info','#messages');">销卡记录</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
   		<div id="info">
	    	<h1 class="welcom_tm">充值</h1>
            <div class="gezhong_jdm">
            	<img src="<%=basePath%>/static/hspay/images/jkkll.png" />
                <ul>
                	<li>填写金额</li>
                    <li>选择银行</li>
                    <li>确认付款</li>
                    <li>充值成功</li>
                </ul>
            </div>
	    	<div class="public_m1">
	            <div class="public_m4">
	            <form class="form-horizontal"
											action="<%=basePath%>/payment/getre" id="netform"
											method="post" target="_blank">
											<input name="num" type="hidden" value="16" />
	            	<p>
	                	<em>付款金额：</em><input name="p3_Amt" size="16" type="text" style=" height:23px; border:1px solid #eaeaea; width:140px;" datatype="*" nullmsg="金额不能为空！" />
	                </p>
	                <table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td style="text-align: right;width: 126px;">支付方式：</td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CCB-NET-B2C"
										checked="checked"> <img
										src="<%=basePath%>/images/banklogo/jianshe.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="ICBC-NET-B2C">
										<img
										src="<%=basePath%>/images/banklogo/gongshang.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/zhaohang.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="ABC-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/nongye.gif">
								</label></td>
							</tr>
							<tr>
								<td rowspan="6">&nbsp;</td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="BOCO-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/jiaotong.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="BOC-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/zhongguo.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="POST-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/youzheng.gif">
								</label></td>
	
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="HKBEA-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/dongya.gif">
								</label></td>
	
							</tr>
							<tr>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CEB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/guangda.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="GDB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/guangfa.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="HZBANK-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/hangzhou.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="SCCB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/hebei.gif">
								</label></td>
							</tr>
							<tr>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="BCCB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/beijing.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CBHB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/buohai.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CMBC-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/minsheng.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="NJCB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/nanjing.gif">
								</label></td>
							</tr>
							<tr>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="NCBBANK-NET-B2C">
										<img
										src="<%=basePath%>/images/banklogo/nanyanbank.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="NBCB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/ningbo.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="BJRCB-NET-B2C">
										<img
										src="<%=basePath%>/images/banklogo/nongcunshangye.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="ECITIC-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/zhongxin.gif">
								</label></td>
							</tr>
							<tr>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="PINGANBANK-NET">
										<img src="<%=basePath%>/images/banklogo/pingan.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="SHB-NET-B2C">
										<img
										src="<%=basePath%>/images/banklogo/shanghaibank.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="SRCB-NET-B2C">
										<img width="154" height="33"
										src="<%=basePath%>/images/banklogo/shangnongshang.jpg">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="SPDB-NET-B2C">
										<img
										src="<%=basePath%>/images/banklogo/shangpufa.gif">
								</label></td>
							</tr>
							<tr>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="SDB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/shenfa.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="ZJTLCB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/tailong.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CIB-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/xingye.gif">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="CZ-NET-B2C">
										<img src="<%=basePath%>/images/banklogo/zheshang.gif">
								</label></td>
							</tr>
							<tr>
								<td style="text-align: right;width: 126px;">扫码支付：</td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="weixin">
										<img src="<%=basePath%>/images/banklogo/wxpay.jpg">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="qqmobile">
										<img src="<%=basePath%>/images/banklogo/qqpay.png">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="alipay">
										<img src="<%=basePath%>/images/banklogo/zfb.png">
								</label></td>
								<td><label class="radio"> <input
										type="radio" name="pd_FrpId" value="tenpay">
										<img src="<%=basePath%>/images/banklogo/tenpay.png">
								</label></td>
							</tr>
						</tbody>
					</table>
					<p></p>
					<button type="submit" class="public_m3">确认充值</button>
	            </form>
	            </div>
	        </div>
        </div>
   		<div id="custom" class="disabled">
	    	<h1 class="welcom_tm">充值记录</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<div class="public_m5">
		    		<div class="zanghye_m">
		    		<table border="0" cellpadding="0" cellspacing="0">
		    		<tr><td>订单编号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" name="rechid" id="rechid" type="text"
		    		Placeholder="订单编号" value=""/></td>
		    		<td>日期：</td><td><input name="rechstarttime" id="rechstarttime" Placeholder="开始日期"
								style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
					</td><td>
								<input name="rechendtime" id="rechendtime" style="width: 80px"  Placeholder="结束日期"
								type="text"  class="laydate-icon" onclick="laydate()"></td>
		    		<td>支付方式：</td><td><select name="rechparticipate" id="rechparticipate"
		    		style=" height:23px; border:1px solid #eaeaea"
								style="width: 85px">
								<option value="0">请选择</option>
								<c:forEach items="${partici}" varStatus="l" var="par">
									<option value="${par.codeid}"><c:out
											value="${par.payable}"></c:out></option>
								</c:forEach>
							</select></td>
		    		<td>订单状态：</td><td><select name="rechstate" id="rechstate"
		    		style=" height:23px; border:1px solid #eaeaea"
								style="width: 80px">
								<option value="0">请选择</option>
								<option value="1">成功</option>
								<option value="2">处理中</option>
								<option value="3">失败</option>
								<option value="4">失效</option>
							</select></td><td><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="recharge(1)">查询</a></td></tr>
		    		</table>
		    		</div>
					<div class="zanghye_m">
		            	<em>订单总数：</em><i>${rechordertotal.tote }</i>
		                <em>条 交易金额：</em><i>${rechordertotal.amttote }</i>
		                <em>（元）  实际金额：</em><i>${rechordertotal.amounttote}</i>
		                <em>（元）</em>
		            </div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th>订单号</th>
								<th>订单日期</th>
								<th>交易方式</th>
								<th>金额(元)</th>
								<th>实际金额(元)</th>
								<th>状态</th>
							</tr>
						</tbody>
						<tbody id="recharge">
						</tbody>
					</table>
		            <div class="fanyefh_m">
		            	<a href="javascript:;" onclick="recharge(0)" id="rechprev">上一页</a>
		                <a href="javascript:;" id="rechnum" class="addclass_m">1</a>
		                <a href="javascript:;" onclick="recharge(2)"
							id="rechnext">下一页</a>
		            </div>
		    	</div>
	        </div>
        </div>
   		<div id="messages" class="disabled">
	    	<h1 class="welcom_tm">销卡</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<form class="form-horizontal" id="circlipform"
					action="<%=basePath%>/payment/circlip" target="_blank">
					<input type="hidden" name="url"
						value="<%=basePath%>/hscard/querCirclip" />
	            <div class="public_m4">
	            	<p>
	                	<em>注：</em>请一定正确选择卡面值提交,否则造成损失商户自行承担；
	                </p>
	            	<p>
	                	<em>&nbsp;</em>卡信息提交成功后，可在订单查询页面查询支付结果。处理结果以订单查询页为准。
	                </p>
	                <p>
	                	<em>选择点卡类型：</em>
						<select id="cardcode" name="cardid" data-rel="chosen" style=" height:23px; border:1px solid #eaeaea">
							<c:forEach items="${cardcode}" varStatus="l" var="card">
								<option value="${card.codeid}"><c:out
										value="${card.payable}"></c:out></option>
							</c:forEach>
						</select>
	                </p>
	            	<p>
	                	<em>选择面额：</em> <label class="radio" >
							<input type="radio" name="amount" value="1"> 1
						</label> 
						<label class="radio" id="face0" style="display: none;">
							<input type="radio" name="amount" value="0"> 0
						</label> <label class="radio" id="face1" style="display: none;">
							<input type="radio" name="amount" value="1"> 1
						</label> <label class="radio" id="face2" style="display: none;">
							<input type="radio" name="amount" value="2"> 2
						</label> <label class="radio" id="face3" style="display: none;">
							<input type="radio" name="amount" value="3"> 3
						</label> <label class="radio" id="face5"> <input
							type="radio" name="amount" value="5"> 5
						</label> <label class="radio" id="face6"> <input
							type="radio" name="amount" value="6"> 6
						</label> <label class="radio" id="face9" style="display: none;">
							<input type="radio" name="amount" value="9"> 9
						</label> <label class="radio" id="face10"> <input
							type="radio" name="amount" value="10"> 10
						</label> <label class="radio" id="face15"> <input
							type="radio" name="amount" value="15"> 15
						</label> <label class="radio" id="face20"> <input
							type="radio" name="amount" value="20"> 20
						</label> <label class="radio" id="face25" style="display: none;">
							<input type="radio" name="amount" value="25"> 25
						</label> <label class="radio" id="face30"> <input
							type="radio" name="amount" value="30"> 30
						</label> <label class="radio" id="face35" style="display: none;">
							<input type="radio" name="amount" value="35"> 35
						</label> <label class="radio" id="face40" style="display: none;">
							<input type="radio" name="amount" value="40"> 40
						</label> <label class="radio" id="face45" style="display: none;">
							<input type="radio" name="amount" value="45"> 45
						</label> <label class="radio" id="face50"> <input
							type="radio" name="amount" value="50"> 50
						</label> <label class="radio" id="face60" style="display: none;">
							<input type="radio" name="amount" value="60"> 60
						</label> <label class="radio" id="face70" style="display: none;">
							<input type="radio" name="amount" value="70"> 70
						</label> <label class="radio" id="face80" style="display: none;">
							<input type="radio" name="amount" value="80"> 80
						</label> <label class="radio" id="face90" style="display: none;">
							<input type="radio" name="amount" value="90"> 90
						</label> <label class="radio" id="face100"> <input
							type="radio" name="amount" value="100"> 100
						</label> <label class="radio" id="face120"> <input
							type="radio" name="amount" value="120"> 120
						</label> <label class="radio" id="face200"> <input
							type="radio" name="amount" value="200"> 200
						</label> <label class="radio" id="face300"> <input
							type="radio" name="amount" value="300"> 300
						</label> <label class="radio" id="face350" style="display: none;">
							<input type="radio" name="amount" value="350">
							350
						</label> <label class="radio" id="face468" style="display: none;">
							<input type="radio" name="amount" value="468">
							468
						</label> <label class="radio" id="face500"> <input
							type="radio" name="amount" value="500"> 500
						</label> <label class="radio" id="face1000"> <input
							type="radio" name="amount" value="1000"> 1000
						</label>
	                </p>
	                <p>
	                	<em>卡号：</em>
						<input type="text" style=" height:23px; border:1px solid #eaeaea; width:240px" id="cardno" name="cardno">
	                </p>
	                <p>
	                	<em>卡密：</em>
						<input type="text" style=" height:23px; border:1px solid #eaeaea; width:240px" id="cardpass" name="cardpass">
	                </p>
	                <button type="submit" class="public_m3">确认提交</button>
	            </div>
				</form>
			</div>
   		</div>
   		<div id="four" class="disabled">
	    	<h1 class="welcom_tm">销卡记录</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
				<div class="public_m5">
		    		<div class="zanghye_m">
		    		<table border="0" cellpadding="0" cellspacing="0">
		    		<tr><td>订单编号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" name="circid" id="circid" type="text"
		    		Placeholder="订单编号" value=""/></td>
		    		<td>日期：</td><td><input name="circstarttime" id="circstarttime" Placeholder="开始日期"
								style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
					</td><td>
								<input name="circendtime" id="circendtime" style="width: 80px"  Placeholder="结束日期"
								type="text"  class="laydate-icon" onclick="laydate()"></td>
		    		<td>支付方式：</td><td><select name="circparticipate" id="circparticipate"
		    		style=" height:23px; border:1px solid #eaeaea"
								style="width: 85px">
								<option value="0">请选择</option>
								<c:forEach items="${cardcode}" varStatus="l" var="card">
									<option value="${card.codeid}"><c:out
											value="${card.payable}"></c:out></option>
								</c:forEach>
							</select></td>
		    		<td>订单状态：</td><td><select name="circstate" id="circstate"
		    		style=" height:23px; border:1px solid #eaeaea"
								style="width: 80px">
							<option value="0">请选择</option>
							<option value="2000">成功</option>
							<option value="2001">处理中</option>
							<option value="3">失败</option>
							</select></td><td><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="circlip(1)">查询</a></td></tr>
		    		</table>
		    		</div>
					<div class="zanghye_m">
		            	<em>订单总数：</em><i>${rechordertotal.tote }</i>
		                <em>条 交易金额：</em><i>${rechordertotal.amttote }</i>
		                <em>（元）  实际金额：</em><i>${rechordertotal.amounttote}</i>
		                <em>（元）</em>
		            </div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th>订单号</th>
								<th>订单日期</th>
								<th>交易方式</th>
								<th>金额(元)</th>
								<th>实际金额(元)</th>
								<th>扣除金额(元)</th>
								<th>状态</th>
								<th>说明</th>
							</tr>
						</tbody>
						<tbody id="circlip">
						</tbody>
					</table>
		            <div class="fanyefh_m">
		            	<a href="javascript:;" onclick="circlip(0)" id="circprev">上一页</a>
		                <a href="javascript:;" id="circnum" class="addclass_m">1</a>
		                <a href="javascript:;" onclick="circlip(2)"
							id="circnext">下一页</a>
		            </div>
		         </div>
			</div>
   		</div>
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>