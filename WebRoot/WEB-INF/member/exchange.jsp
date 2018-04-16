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
<style type="text/css">
.zanghye_m table tbody tr td{ text-align:left; border-bottom:0;}
</style>
<script type="text/javascript">
	var page = 1;
	var cardpage = 1;
	var basePath="<%=basePath %>";
	$(document).ready(function() {
		net(page);
		card(cardpage);
	});
	function net(pages) {
		var netstarttime = $("#netstarttime").val();
		var netendtime = $("#netendtime").val();
		var netparticipate = $("#netparticipate").val();
		var netstate = $("#netstate").val();
		var netid = $("#netid").val();
		wangyin(basePath, pages, netstarttime, netendtime, netparticipate,
				netstate, netid);
	}
	function card(pages) {
		var cardstarttime = $("#cardstarttime").val();
		var cardendtime = $("#cardendtime").val();
		var cardparticipate = $("#cardparticipate").val();
		var cardstate = $("#cardstate").val();
		var cardid = $("#cardid").val();
		cards(basePath, pages, cardstarttime, cardendtime, cardparticipate,
				cardstate, cardid);
	}
	function showcard(singid) {
		sing(basePath, singid);
		var con=$('#singlecard').html();
		if(con)
		layer.open({
			  type: 1,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['920px', '240px'], //宽高
			  content: $('#divcard').html()
			});
	}
</script>
</head>
<body style="font-family: Microsoft YaHei">
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/exchange").text("交易管理");
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
		<h2 class="title"><a href="javascript:;">交易管理</a></h2>
		<ul id="nav">
			<li><a href="javascript:navTabs('#info','#custom');">网银订单</a></li>
			<li><a href="javascript:navTabs('#custom','#info');">点卡订单</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
   		<div id="info">
	    	<h1 class="welcom_tm">网银订单</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<div class="public_m5">
	    		<div class="zanghye_m">
	    		<table border="0" cellpadding="0" cellspacing="0">
	    		<tr><td>订单号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" name="netid" id="netid" type="text"
	    		Placeholder="订单号或商户订单号" value=""/></td>
	    		<td>日期：</td><td><input name="netstarttime" id="netstarttime" Placeholder="开始日期"
							style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
				</td><td>
							<input name="netendtime" id="netendtime" style="width: 80px"  Placeholder="结束日期"
							type="text"  class="laydate-icon" onclick="laydate()"></td>
	    		<td>支付方式：</td><td><select name="netparticipate" id="netparticipate"
	    		style=" height:23px; border:1px solid #eaeaea"
							style="width: 85px">
							<option value="0">请选择</option>
							<c:forEach items="${partici}" varStatus="l" var="par">
								<option value="${par.codeid}"><c:out
										value="${par.payable}"></c:out></option>
							</c:forEach>
						</select></td>
	    		<td>订单状态：</td><td><select name="netstate" id="netstate"
	    		style=" height:23px; border:1px solid #eaeaea"
							style="width: 80px">
							<option value="0">请选择</option>
							<option value="1">成功</option>
							<option value="2">处理中</option>
							<option value="3">失败</option>
							<option value="4">失效</option>
						</select></td><td><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="net(1)">查询</a></td></tr>
	    		</table>
	    		</div>
				<div class="zanghye_m">
	            	<em>订单总数：</em><i>${ordertotal.tote }</i>
	                <em>条 交易金额：</em><i>${ordertotal.amttote }</i>
	                <em>（元）  实际金额：</em><i>${ordertotal.amounttote}</i>
	                <em>（元）</em>
	            </div>
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<th>订单号</th>
							<th>商户订单号</th>
							<th>订单日期</th>
							<th>交易方式</th>
							<th>来源</th>
							<th>金额(元)</th>
							<th>状态</th>
							<th>同步</th>
							<th>通知</th>
						</tr>
					</tbody>
					<tbody id="net">
					</tbody>
				</table>
	            <div class="fanyefh_m">
	            	<a href="javascript:;" onclick="net(0)" id="netprev">上一页</a>
	                <a href="javascript:;" id="netnum" class="addclass_m">1</a>
	                <a href="javascript:;" onclick="net(2)"
						id="netnext">下一页</a>
	            </div>
	    	</div>
	    	</div>
	    </div>
	    <div id="custom" class="disabled">
	    	<h1 class="welcom_tm">点卡订单</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<div class="public_m5">
	    		<div class="zanghye_m">
	    		<table border="0" cellpadding="0" cellspacing="0">
	    		<tr><td>订单编号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" name="cardid" id="cardid" type="text"
	    		Placeholder="订单编号" value=""/></td>
	    		<td>日期：</td><td><input name="cardstarttime" id="cardstarttime" Placeholder="开始日期"
							style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
				</td><td>
							<input name="cardendtime" id="cardendtime" style="width: 80px"  Placeholder="结束日期"
							type="text"  class="laydate-icon" onclick="laydate()"></td>
	    		<td>支付方式：</td><td><select name="cardparticipate" id="cardparticipate"
	    		style=" height:23px; border:1px solid #eaeaea"
							style="width: 85px">
							<option value="0">请选择</option>
							<c:forEach items="${partici}" varStatus="l" var="par">
								<option value="${par.codeid}"><c:out
										value="${par.payable}"></c:out></option>
							</c:forEach>
						</select></td>
	    		<td>订单状态：</td><td><select name="cardstate" id="cardstate"
	    		style=" height:23px; border:1px solid #eaeaea"
							style="width: 80px">
							<option value="0">请选择</option>
							<option value="1">成功</option>
							<option value="2">处理中</option>
							<option value="3">失败</option>
							<option value="4">失效</option>
						</select></td><td><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="card(1)">查询</a></td></tr>
	    		</table>
	    		</div>
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<th>订单号</th>
							<th>订单日期</th>
							<th>交易方式</th>
							<th>来源</th>
							<th>金额(元)</th>
							<th>状态</th>
							<th>同步</th>
							<th>通知</th>
							<th>操作</th>
						</tr>
					</tbody>
					<tbody id="card">
					</tbody>
				</table>
	            <div class="fanyefh_m">
	            	<a href="javascript:;" onclick="card(0)" id="cardprev">上一页</a>
	                <a href="javascript:;" id="cardnum" class="addclass_m">1</a>
	                <a href="javascript:;" onclick="card(2)"
						id="cardnext">下一页</a>
	            </div>
	    	</div>
	    	</div>
	    </div>
	</div>
</div>
<div id="divcard" style="display: none;">
<div class="public_m5">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<th>订单号</th>
<th>商户订单号</th>
<th>支付时间</th>
<th>支付通道</th>
<th>支付金额</th>
<th>实际金额</th>
<th>扣除金额</th>
<th>状态</th>
<th>说明</th>
</tr></tbody>
<tbody id="singlecard"></tbody>
</table></div></div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>