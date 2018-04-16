<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
<style type="text/css">
.zanghye_m table tbody tr td{ text-align:left; border-bottom:0;}
.public_m4 p input{float: none;}

#tabbox{ width:600px; overflow:hidden; margin:0 auto;}
.tab_conbox{border: 1px solid #eaeaea;border-top: none;}
.tab_con{ display:none;}

.tabs{height: 32px;border-bottom:1px solid #eaeaea;border-left: 1px solid #eaeaea;width: 100%;}
.tabs li{height:31px;line-height:31px;float:left;border:1px solid #eaeaea;border-left:none;margin-bottom: -1px;background: #e0e0e0;overflow: hidden;position: relative;}
.tabs li a {display: block;padding: 0 20px;border: 1px solid #fff;outline: none;}
.tabs li a:hover {background: #ccc;}	
.tabs .thistab,.tabs .thistab a:hover{background: #fff;border-bottom: 1px solid #fff;}

.tab_con {padding:12px;font-size: 14px; line-height:175%;}
</style>
<script type="text/javascript">
var basePath="<%=basePath %>";
var page = 1;
$(document).ready(function(){
	jQuery.jqtab = function(tabtit,tab_conbox,shijian) {
		$(tab_conbox).find("li").hide();
		$(tabtit).find("li:first").addClass("thistab").show(); 
		$(tab_conbox).find("li:first").show();
	
		$(tabtit).find("li").bind(shijian,function(){
		  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
			var activeindex = $(tabtit).find("li").index(this);
			$(tab_conbox).children().eq(activeindex).show().siblings().hide();
			return false;
		});
	
	};
	$.jqtab("#tabs","#tab_conbox","click");
	refund(page);
$("#bankform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				layer.load(1);
				window.location.href="<%=basePath%>/member/settlement";
			},1000);
		}else{
			setTimeout(function(){
				layer.load(1);
				window.location.href="<%=basePath%>/member/settlement";
			},1000);
		}
	}
});
$("#networkform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				layer.load(1);
				window.location.href="<%=basePath%>/member/settlement";
			},1000);
		}else{
			setTimeout(function(){
				layer.load(1);
				window.location.href="<%=basePath%>/member/settlement";
			},1000);
		}
	}
});
$("#refundform").Validform({
	tiptype:1,
	postonce:true,
	ajaxPost:true,
	ignoreHidden:true,
	callback:function(data){
		if(data.status=="y"){
			setTimeout(function(){
				layer.load(1);
				window.location.href="<%=basePath%>/member/settlement";
			},1000);
		}else{
			setTimeout(function(){
				layer.load(1); 
				window.location.href="<%=basePath%>/member/settlement";
					}, 1000);
				}
			}
		});
	});
	function refund(pages) {
		var refundstarttime = $("#refundstarttime").val();
		var refundendtime = $("#refundendtime").val();
		var refundstate = $("#refundstate").val();
		var refundid = $("#refundid").val();
		refunds(basePath, pages, refundstarttime, refundendtime, refundstate,
				refundid);
	}
</script>
</head>
<body style="font-family: Microsoft YaHei">
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/settlement").text("结算管理");
});
function navTabs(org1,org2,org3){
	$(org1).removeClass("disabled");
	$(org1).addClass("active");
	$(org2).removeClass("active");
	$(org2).addClass("disabled");
	$(org3).removeClass("active");
	$(org3).addClass("disabled");
}
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">结算管理</a></h2>
		<ul id="nav">
			<li><a href="javascript:navTabs('#info','#custom','#messages');">提现申请</a></li>
			<li><a href="javascript:navTabs('#custom','#info','#messages');">提现记录</a></li>
			<li><a href="javascript:navTabs('#messages','#custom','#info');">提现账号</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
   		<div id="info">
	    	<h1 class="welcom_tm">提现申请</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		    	<tr>
			    	<td>
				<form class="form-horizontal"
					action="<%=basePath%>/settlement/withdrawal" method="post"
					id="refundform">
					<input type="hidden" name="withdrawalToken" value="${withdrawalToken}" />
	            <div class="public_m4" style="width: 400px;">
	            	<p style="width: 400px;">
	                	<em>提现方式：</em>
						<c:if test="${balance.settlementauthority==1}">
							T+0 每天提现次数:无限
						</c:if>
						<c:if test="${balance.settlementauthority==2}">
							T+1 每天提现次数:1
						</c:if>
	                </p>
	            	<p style="width: 400px;">
	                	<em>密码类型选择：</em><select style=" height:23px; border:1px solid #eaeaea"
	                	id="selectError3" name="refund_types">
							<c:choose>
								<c:when test="${empty bank}">
									<option value="">银行卡：未绑定</option>
								</c:when>
								<c:otherwise>
									<option value="${bank.account_types}">银行卡：
										<c:out value="${bank.codeid}"></c:out></option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${empty network}">
									<option value="">网络账户：未绑定</option>
								</c:when>
								<c:otherwise>
									<option value="${network.account_types}">网络账户：
										<c:out value="${network.branch}"></c:out></option>
								</c:otherwise>
							</c:choose>
						</select>
	                </p>
	            	<p style="width: 400px;">
	                	<em>可用账户余额：</em>￥<c:out value="${balance.settlement }"></c:out> 
	                </p>
	                <p style="width: 400px;">
	                	<em>提现金额：</em><input type="text" name="refund_amount"
	                	style=" height:23px; border:1px solid #eaeaea; width:140px"
	                	 datatype="n" nullmsg="请输入金额！" errormsg="输入金额有误，请重新输入！" />
	                </p>
	                <button type="reset" class="public_m3" style="float: left;background-color: #b7b7b7;width: 100px;">重置</button>
	                <button type="submit" class="public_m3" style="width: 100px;">提交</button>
	            </div>
	            </form>
			    	</td>
			    	<td>
			    		<div class="well">
							<ol>
								<li>为确保提现成功，请保证可用余额资金充足；</li>
								<li>目前只支持：工商银行、农业银行、招商银行、建设银行；</li>
								<li>招商银行、工商银行支持T+0到账、农业银行、建设银行支持T+1到账；</li>
								<li>T+0:0点~8点提交并审核的批付单，8点后一起付出，正常情况当天13:00左右到账；</li>
								<li>T+0:8点~12点提交并审核的批付单，12点后一起付出，正常情况当天16:00左右到账；</li>
								<li>T+0:12点~24点提交并审核的批付单，次日8点后一起付出，正常情况次日16:00左右到账；</li>
								<li>T+1结算，是指T日的交易，在T+1日结算。</li>
							</ol>
			    		</div>
			    	</td>
		    	</tr>
	    	</table>
	        </div>
        </div>
   		<div id="custom" class="disabled">
	    	<h1 class="welcom_tm">提现记录</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<div class="public_m5">
	    		<div class="zanghye_m">
	    		<table border="0" cellpadding="0" cellspacing="0">
	    		<tr><td>订单编号：</td><td><input style="width: 150px;height:23px; border:1px solid #eaeaea;" 
	    		name="refundid" id="refundid" type="text"
	    		Placeholder="订单编号" value=""/></td>
	    		<td>日期：</td><td><input name="refundstarttime" id="refundstarttime" Placeholder="开始日期"
							style="width: 80px" type="text"  class="laydate-icon" onclick="laydate()">
				</td><td>
							<input name="refundendtime" id="refundendtime" style="width: 80px"  Placeholder="结束日期"
							type="text"  class="laydate-icon" onclick="laydate()"></td>
				<td>订单状态：</td><td><select name="refundstate" id="refundstate"
					style=" height:23px; border:1px solid #eaeaea"	style="width: 80px">
													<option value="0">请选择</option>
													<option value="1">成功</option>
													<option value="2">处理中</option>
													<option value="3">失败</option>
												</select></td>
	    		<td width="65px"><a href="javascript:;" class="btn_search" style="color: #fff;" onClick="refund(1)">查询</a></td></tr>
	    		</table>
	    		</div>
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<th>订单号</th>
							<th>申请日期</th>
							<th>提现金额(元)</th>
							<th>提现方式</th>
							<th>提现说明</th>
							<th>提现状态</th>
						</tr>
					</tbody>
					<tbody id="refund">
					</tbody>
				</table>
	            <div class="fanyefh_m">
	            	<a href="javascript:;" onclick="refund(0)" id="refundprev">上一页</a>
	                <a href="javascript:;" id="refundnum" class="addclass_m">1</a>
	                <a href="javascript:;" onclick="refund(2)"
						id="refundnext">下一页</a>
	            </div>
	    	</div>
	    	</div>
        </div>
   		<div id="messages" class="disabled">
	    	<h1 class="welcom_tm">提现账号</h1>
			<div class="dao_hang" style="height: 1px;background: #eaeaea;">
			</div>
	    	<div class="public_m1">
	    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		    	<tr>
			    	<td style="padding-right: 20px;width: 400px;">
    <ul class="tabs" id="tabs">
       <li><a href="javascript:;">银行卡</a></li>
       <li><a href="javascript:;">网络账户</a></li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox">
        <li class="tab_con">
			<form class="form-horizontal" id="bankform"
				action="<%=basePath%>/settlement/upSettleAcount"
				method="post">
				<input type="hidden" name="account_types" value="1" />
				<div class="public_m4" style="width: 390px;">
	            	<p>
	                	<em>开户银行：</em>
						<select id="selectError" data-rel="chosen" style=" height:23px; border:1px solid #eaeaea"
							name="codeid">
							<c:forEach items="${partici}" varStatus="l"
								var="par">
								<option value="${par.codeid}"><c:out
										value="${par.payable}"></c:out></option>
							</c:forEach>
						</select>
	                </p>
	            	<p>
	                	<em>开户姓名：</em><c:out value="${per.contacts}"></c:out>
	                </p>
	            	<p>
	                	<em>开户行的省名：</em><input type="text" name="branchsheng" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="开户行的省名不能为空" />
	                </p>
	            	<p>
	                	<em>开户行的市名：</em><input type="text" name="branchshi" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="开户行的市名不能为空" />
	                </p>
	            	<p>
	                	<em>开户支行：</em><input type="text" name="branch" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="开户行不能为空" />
	                </p>
	            	<p>
	                	<em>新银行卡号：</em><input type="text" name="account" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="新银行卡号不能为空" />
	                </p>
	            	<p>
	                	<em>确认新卡号：</em><input type="text" recheck="account" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="您两次输入的银行卡号不一致！" />
	                </p>
	                <button type="reset" class="public_m3" style="float: left;background-color: #b7b7b7;width: 100px;">重置</button>
	                <button type="submit" class="public_m3" style="width: 100px;">提交</button>
	            </div>
			</form>
        </li>
        <li class="tab_con">
			<form class="form-horizontal" id="networkform"
				action="<%=basePath%>/settlement/upSettleAcount"
				method="post">
				<input type="hidden" name="account_types" value="2" />
				<div class="public_m4" style="width: 390px;">
	            	<p>
	                	<em>账户类型：</em><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="checked"> 支付宝
	                </p>
	            	<p>
	                	<em>真实姓名：</em><c:out value="${per.contacts}"></c:out>
	                </p>
	            	<p>
	                	<em>新收款帐号：</em><input type="text" name="account" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" errormsg="新收款帐号不能为空" />
	                </p>
	            	<p>
	                	<em>确认新收款帐号：</em><input type="text" name="" style=" height:23px; border:1px solid #eaeaea; width:140px" datatype="*" recheck="account"
																				errormsg="您两次输入的收款账号不一致！" />
	                </p>
	                <button type="reset" class="public_m3" style="float: left;background-color: #b7b7b7;width: 100px;">重置</button>
	                <button type="submit" class="public_m3" style="width: 100px;">提交</button>
	            </div>
			</form>
        </li>
    </ul>
    				</td>
    				<td valign="top">
			    		<div class="well">
							<h3>您当前绑定的结算账户</h3>
							<dl>
								<dt>银行卡：</dt>
								<c:choose>
									<c:when test="${empty bank}">
										<dd>尚未绑定银行卡</dd>
									</c:when>
									<c:otherwise>
										<dd>
											银行类型：
											<c:out value="${bank.codeid}"></c:out>
										</dd>
										<dd>
											开户姓名：
											<c:out value="${bank.account_name}"></c:out>
										</dd>
										<dd>
											开户支行：
											<c:out value="${bank.branch}"></c:out>
										</dd>
										<dd>
											收款帐号：
											<c:out
												value="${fn:substring(bank.account, 0, 4)}**************${fn:substring(bank.account, fn:length(bank.account)-4, fn:length(bank.account))}"></c:out>
										</dd>
									</c:otherwise>
								</c:choose>
								<dt>网络帐户：</dt>
								<c:choose>
									<c:when test="${empty network}">
										<dd>尚未绑定银行卡</dd>
									</c:when>
									<c:otherwise>
										<dd>
											帐户类型：
											<c:out value="${network.branch}"></c:out>
										</dd>
										<dd>
											真实姓名：
											<c:out value="${network.account_name}"></c:out>
										</dd>
										<dd>
											收款帐号：
											<c:out
												value="${fn:substring(fn:substringBefore(network.account,'@'),0,5)}************"></c:out>
										</dd>
									</c:otherwise>
								</c:choose>
							</dl>
			    		</div>
    				</td>
    			</tr>
    		</table>
			</div>
   		</div>
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>