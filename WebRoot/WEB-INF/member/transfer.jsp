<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
<style type="text/css">
.zanghye_m table tbody tr td{ text-align:left; border-bottom:0;}
.public_m4 p input{float: none;}
</style>
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">
<script src="<%=basePath%>/js/ajaxs/order.js"></script>
<script src="<%=basePath%>/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
var basePath="<%=basePath %>";
$(document).ready(function(){
	transferpa(1);
	$("#transferform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/member/transfer";
				},1000);
			}else{
				setTimeout(function(){
					$.Hidemsg(); 
					window.location.href="<%=basePath%>/member/transfer";
					}, 1000);
				}
			}
		});
	});
function transferpa(pages){
	var transferid = $("#transferid").val();
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	gettransfer(basePath, pages, starttime, endtime, transferid);
}
</script>
</head>
<body style="font-family: Microsoft YaHei">
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/transfer").text("转账管理");
});
function navTabs(org1,org2){
	$(org1).removeClass("disabled");
	$(org1).addClass("active");
	$(org2).removeClass("active");
	$(org2).addClass("disabled");
}
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">转账管理</a></h2>
		<ul id="nav">
			<li><a href="javascript:navTabs('#info','#custom');">转账</a></li>
			<li><a href="javascript:navTabs('#custom','#info');">转账记录</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
   		<div id="info">
	    	<h1 class="welcom_tm">转账</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	            <div class="public_m4">
				<form class="form-horizontal" role="form" id="transferform"
					action="<%=basePath%>/transfer/addTransfer" method="post">
	            	<p>
	                	<em>可用金额 :</em>￥<c:out value="${balance.settlement }"></c:out>
	                </p>
	            	<p>
	                	<em>转账金额 :</em><input name="transfer_amount" size="16" type="text" style=" height:23px; border:1px solid #eaeaea; width:140px;" datatype="*" nullmsg="转账金额不能为空！" />
	                </p>
	            	<p>
	                	<em>转账id：</em><input name="transfer_usert" size="16" type="text" style=" height:23px; border:1px solid #eaeaea; width:140px;" datatype="*" nullmsg="转账id不能为空！" />
	                </p>
	            	<p>
	                	<em>支付密码：</em><input name="payment" size="16" type="password" style=" height:23px; border:1px solid #eaeaea; width:140px;" datatype="*" nullmsg="支付密码不能为空！" />
	                </p>
	            	<p style="height: 100px;">
	                	<em>转账说明：</em><textarea name="transfer_explain" type="text" style=" border:1px solid #eaeaea; width:300px;height:70px;"  datatype="*" nullmsg="转账说明不能为空！" ></textarea>
	                </p>
	                <button type="reset" class="public_m3" style="float: left;background-color: #b7b7b7;width: 100px;">重置</button>
	                <button type="submit" class="public_m3">提交</button>
	            </form>
	            </div>
	    	</div>
	    </div>
	    <div id="custom" class="disabled">
	    	<h1 class="welcom_tm">转账记录</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<div class="public_m5">
	    		<div class="zanghye_m">
	    		<table border="0" cellpadding="0" cellspacing="0">
	    		<tr><td>订单编号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" 
	    		name="transferid" id="transferid" type="text"
	    		Placeholder="订单编号" value=""/></td>
	    		<td>日期：</td><td><input name="starttime" id="starttime" Placeholder="开始日期"
							style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
				</td><td>
							<input name="endtime" id="endtime" style="width: 80px"  Placeholder="结束日期"
							type="text"  class="laydate-icon" onclick="laydate()"></td>
	    		<td width="65px"><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="card(1)">查询</a></td></tr>
	    		</table>
	    		</div>
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<th>转账编号</th>
							<th>转账账户</th>
							<th>转账接收账户</th>
							<th>金额(元)</th>
							<th>转账时间</th>
							<th>转账说明</th>
						</tr>
					</tbody>
					<tbody id="transfer">
					</tbody>
				</table>
	            <div class="fanyefh_m">
	            	<a href="javascript:;" onclick="transferpa(0)" id="tranprev">上一页</a>
	                <a href="javascript:;" id="trannum" class="addclass_m">1</a>
	                <a href="javascript:;" onclick="transferpa(2)"
						id="trannext">下一页</a>
	            </div>
	    	</div>
	    	</div>
	    </div>
	</div>
</div>
<div id="singlecard" style="display: none;"></div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>