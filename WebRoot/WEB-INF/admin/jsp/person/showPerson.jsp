<%@page import="com.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Employees emp = (Employees)request.getSession().getAttribute("adminsession");
	int employeeid = emp.getInt("employeeid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
$("input[name='settlementauthority'][value='${balance.settlementauthority}']").attr("checked",true); 
$("#herolist option[value='${person.herolist}']").attr("selected", true);
$("#huge option[value='${person.huge}']").attr("selected", true);
$("#upiflock option[value='${person.iflock}']").attr("selected", true);
$("#upifnet option[value='${person.ifnet}']").attr("selected", true);
	function upkey(){
		$.ajax({
			url: '<%=adminbasePath%>/person/getkey',
			type:'post',
			error:function(){
				alert('数据获取失败');
			},
			success:function(data){
				$("#key").val(data);
			}
		})
	}
</script>
</head>
<body>
	<style type="text/css">
ul.rightTools {
	float: right;
	display: block;
}

ul.rightTools li {
	float: left;
	display: block;
	margin-left: 5px
}

.td1 {
	width: 90px;
}
</style>

	<div class="pageContent" style="padding: 5px">
		<div class="panel" defH="40">
			<h1>商户基本信息</h1>
			<div>
				<table>
					<tr>
						<td class="td1" align="right">商户id：</td>
						<td>${person.id}</td>
						<td class="td1" align="right">邮箱：</td>
						<td>${person.email }</td>
						<td class="td1" align="right">手机号码：</td>
						<td>${person.phone }</td>
						<td class="td1" align="right">商户类型：</td>
						<td><c:choose>
								<c:when test="${person.huge==1}">
						企业
					</c:when>
								<c:otherwise>
						个人
					</c:otherwise>
							</c:choose></td>
						<td class="td1" align="right">锁定状态：</td>
						<td><c:choose>
								<c:when test="${person.iflock==1}">
						正常
					</c:when>
								<c:otherwise>
						锁定
					</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td class="td1" align="right">名称：</td>
						<td>${person.name }</td>
						<td class="td1" align="right">QQ号码：</td>
						<td>${person.qq }</td>
						<td class="td1" align="right">注册时间：</td>
						<td>${person.time }</td>
						<td class="td1" align="right">联系人名称：</td>
						<td>${person.contacts }</td>
						<td class="td1" align="right">网银状态：</td>
						<td><c:choose>
								<c:when test="${person.ifnet==1}">
						开通
					</c:when>
								<c:otherwise>
						未开通
					</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="divider"></div>
		<div class="tabs">
			<div class="tabsHeader">
				<div class="tabsHeaderContent">
					<ul>
						<li><a href="javascript:;"><span>用户订单</span></a></li>
						<%
							if(employeeid==1){
						%>
						<li><a href="javascript:;"><span>用户密钥</span></a></li>
						<li><a href="javascript:;"><span>用户余额</span></a></li>
						<li><a href="javascript:;"><span>用户信息</span></a></li>
						<li><a href="javascript:;"><span>用户费率</span></a></li>
						<li><a href="javascript:;"><span>用户提现账户</span></a></li>
						<li><a href="javascript:;"><span>用户通道</span></a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="tabsContent">
				<div>

					<div layoutH="146"
						style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
						<ul class="tree treeFolder">
							<li><a href="javascript">用户订单</a>
								<ul>
									<li><a
										href="<%=adminbasePath %>/person/showNet?pageNum=1&numPerPage=15&netstarttime=&netendtime=&netparticipate=0&netstate=0&id=${person.id }"
										target="ajax" rel="jbsxBox">网银订单</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showCard?pageNum=1&numPerPage=20&cardstarttime=&cardendtime=&cardparticipate=0&cardstate=0&id=${person.id }"
										target="ajax" rel="jbsxBox">点卡订单</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showRecharge?pageNum=1&numPerPage=15&rechstarttime=&rechendtime=&rechparticipate=0&rechstate=0&id=${person.id }"
										target="ajax" rel="jbsxBox">充值订单</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showCirclip?pageNum=1&numPerPage=15&circstarttime=&circendtime=&circparticipate=0&circstate=0&id=${person.id }"
										target="ajax" rel="jbsxBox">销卡订单</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showRefund?pageNum=1&numPerPage=15&refustarttime=&refuendtime=&refustate=0&id=${person.id }"
										target="ajax" rel="jbsxBox">提现订单</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showAddedamount?pageNum=1&numPerPage=15&addestarttime=&addeendtime=&id=${person.id }"
										target="ajax" rel="jbsxBox">加款记录</a></li>
									<li><a
										href="<%=adminbasePath %>/person/showLog?pageNum=1&numPerPage=15&logstarttime=&logendtime=&id=${person.id }"
										target="ajax" rel="jbsxBox">登陆记录</a></li>
								</ul></li>

						</ul>
					</div>

					<div id="jbsxBox" class="unitBox" style="margin-left: 246px;">
						<!--#include virtual="list1.html" -->
					</div>
				</div>
				<%
					if(employeeid==1){
				%>
				<div layoutH="146" align="center" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent" align="center">
					<fieldset>
					<legend>用户密钥</legend>
					<form action="<%=adminbasePath %>/person/upPerPass" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<dl class="nowrap">
							<dt>登陆密码：</dt>
							<dd>
								<input name="password" style="width: 230px" value="" type="text" />
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>支付密码：</dt>
							<dd>
								<input name="payment" style="width: 230px" value="" type="text" />
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>接口key：</dt>
							<dd>
								<input name="key" style="width: 230px" value="${payment.key }" type="text" id="key" />
								<div class="buttonActive">
								<div class="buttonContent">
								<button onclick="upkey()" type="button">重新获取</button>
								</div></div>
							</dd>
						</dl>
						<dl class="nowrap">
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">提交</button>
								</div>
							</div>
						</dl>
					</form>
					</fieldset>
					</div>
				</div>
				<div layoutH="146" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent">
						<fieldset>
							<legend>用户余额</legend>
							<dl>
								<dt>实际金额：</dt>
								<dd><c:out value="${balance.amount }"></c:out></dd>
							</dl>
							<dl>
								<dt>点卡金额：</dt>
								<dd><c:out value="${balance.cardamount }"></c:out></dd>
							</dl>
							<dl>
								<dt>扣除点卡金额：</dt>
								<dd><c:out value="${balance.deductedcard }"></c:out></dd>
							</dl>
							<dl>
								<dt>网银金额：</dt>
								<dd><c:out value="${balance.netamount }"></c:out></dd>
							</dl>
							<dl>
								<dt>网银扣除金额：</dt>
								<dd><c:out value="${balance.deductednet }"></c:out></dd>
							</dl>
							<dl>
								<dt>等待入账金额：</dt>
								<dd><c:out value="${balance.waitamount }"></c:out></dd>
							</dl>
							<dl>
								<dt>新进金额：</dt>
								<dd><c:out value="${balance.newamount }"></c:out></dd>
							</dl>
							<dl>
								<dt>可结算金额：</dt>
								<dd><c:out value="${balance.settlement }"></c:out></dd>
							</dl>
							<dl>
								<dt>已结算金额：</dt>
								<dd><c:out value="${balance.refundamout }"></c:out></dd>
							</dl>
						</fieldset>
						<form action="<%=adminbasePath %>/person/upPersonMoney" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<input type="hidden" name="uppersonmoney" value="${uppersonmoney}" />
						<fieldset>
							<legend>添加金额</legend>
							<dl class="nowrap">
								<dt>金额：</dt>
								<dd>
									<input type="text" name="money" class="required" />
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">提交</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upSettAuthor" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>提款权限</legend>
							<dl class="nowrap">
								<dt>提款权限：</dt>
								<dd><label><input type="radio" name="settlementauthority" value="1" />T+0</label>
									<label><input type="radio" name="settlementauthority" value="2" />T+1</label>
									<label><input type="radio" name="settlementauthority" value="3" />D+0</label></dd>
							</dl>
							<dl class="nowrap">
								<dt>最低提现金额：</dt>
								<dd>
									<input type="text" name="cashleast" value="${balance.cashleast }" />
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
					</div>
				</div>
				<div layoutH="146" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent">
					<form action="<%=adminbasePath %>/person/upPerPerson" class="pageForm required-validate"  method="post" onsubmit="return validateCallback(this, dialogAjaxDone)">
					<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>用户信息</legend>
							<dl>
								<dt>邮箱</dt>
								<dd><input type="text" name="email" value="${person.email }"/></dd>
							</dl>
							<dl>
								<dt>网站名称</dt>
								<dd><input type="text" name="webName" value="${person.webName }"/></dd>
							</dl>
							<dl>
								<dt>网站网址</dt>
								<dd><input type="text" name="website" value="${person.website }"/></dd>
							</dl>
							<dl>
								<dt>名称</dt>
								<dd><input type="text" name="name" value="${person.name }"/></dd>
							</dl>
							<dl>
								<dt>联系人名称</dt>
								<dd><input type="text" name="contacts" value="${person.contacts }"/></dd>
							</dl>
							<dl>
								<dt>身份证/营业执照</dt>
								<dd><input type="text" name="idcard" value="${person.idcard }"/></dd>
							</dl>
							<dl>
								<dt>联系地址</dt>
								<dd><input type="text" name="address" value="${person.address }"/></dd>
							</dl>
							<dl>
								<dt>手机号码</dt>
								<dd><input type="text" name="phone" value="${person.phone }"/></dd>
							</dl>
							<dl>
								<dt>用户QQ号码</dt>
								<dd><input type="text" name="qq" value="${person.qq }"/></dd>
							</dl>
							<dl>
								<dt>行业</dt>
								<dd><select class="combox" name="herolist" id="herolist">
									<option value="0">党政机关</option>
									<option value="1">商业</option>
									<option value="2">制造业</option>
									<option value="3">服务业</option>
									<option value="4">农业牧渔也</option>
									<option value="5">其它行业</option>
								</select></dd>
							</dl>
							<dl>
								<dt>账户类型</dt>
								<dd><select class="combox" name="huge" id="huge">
									<option value="0">个人</option>
									<option value="1">企业</option>
								</select></dd>
							</dl>
							<dl>
								<dt>锁定状态</dt>
								<dd><select class="combox" name="iflock" id="upiflock">
									<option value="1">正常</option>
									<option value="2">锁定</option>
								</select></dd>
							</dl>
							<dl>
								<dt>网银状态</dt>
								<dd><select class="combox" name="ifnet" id="upifnet">
									<option value="1">开通</option>
									<option value="2">未开通</option>
								</select></dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
					</form>
					</div>
				</div>
				<div layoutH="146" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent">
						<form action="<%=adminbasePath %>/person/upRate" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
						<legend>用户费率</legend>
						<dl>
							<dt>网银支付</dt>
							<dd><input type="text" name="banking" value="${rate.banking }"/></dd>
						</dl>
						<dl>
							<dt>QQ扫码</dt>
							<dd><input type="text" name="qqcode" value="${rate.qqcode }"/></dd>
						</dl>
						<dl>
							<dt>QQ钱包</dt>
							<dd><input type="text" name="qqwap" value="${rate.qqwap }"/></dd>
						</dl>
						<dl>
							<dt>微信扫码</dt>
							<dd><input type="text" name="weixin" value="${rate.weixin }"/></dd>
						</dl>
						<dl>
							<dt>微信WAP</dt>
							<dd><input type="text" name="wxwap" value="${rate.wxwap }"/></dd>
						</dl>
						<dl>
							<dt>支付宝扫码</dt>
							<dd><input type="text" name="alipay" value="${rate.alipay }"/></dd>
						</dl>
						<dl>
							<dt>支付宝WAP</dt>
							<dd><input type="text" name="alipaywap" value="${rate.alipaywap }"/></dd>
						</dl>
						<dl>
							<dt>财付通扫码</dt>
							<dd><input type="text" name="tenpay" value="${rate.tenpay }"/></dd>
						</dl>
						<dl>
							<dt>财付通WAP</dt>
							<dd><input type="text" name="tenpaywap" value="${rate.tenpaywap }"/></dd>
						</dl>
						<dl>
							<dt>网易一卡通</dt>
							<dd><input type="text" name="netease" value="${rate.netease }"/></dd>
						</dl>
						<dl>
							<dt>久游一卡通</dt>
							<dd><input type="text" name="travel" value="${rate.travel }"/></dd>
						</dl>
						<dl>
							<dt>QQ币充值卡</dt>
							<dd><input type="text" name="qqcoins" value="${rate.qqcoins }"/></dd>
						</dl>
						<dl>
							<dt>征途游戏卡</dt>
							<dd><input type="text" name="journey" value="${rate.journey }"/></dd>
						</dl>
						<dl>
							<dt>盛大一卡通</dt>
							<dd><input type="text" name="grand" value="${rate.grand }"/></dd>
						</dl>
						<dl>
							<dt>天下一卡通</dt>
							<dd><input type="text" name="theworld" value="${rate.theworld }"/></dd>
						</dl>
						<dl>
							<dt>完美一卡通</dt>
							<dd><input type="text" name="perfect" value="${rate.perfect }"/></dd>
						</dl>
						<dl>
							<dt>联通充值卡</dt>
							<dd><input type="text" name="chinaunicom" value="${rate.chinaunicom }"/></dd>
						</dl>
						<dl>
							<dt>天宏一卡通</dt>
							<dd><input type="text" name="tianhong" value="${rate.tianhong }"/></dd>
						</dl>
						<dl>
							<dt>搜狐一卡通</dt>
							<dd><input type="text" name="sohu" value="${rate.sohu }"/></dd>
						</dl>
						<dl>
							<dt>骏网一卡通</dt>
							<dd><input type="text" name="junwang" value="${rate.junwang }"/></dd>
						</dl>
						<dl>
							<dt>全国神州行</dt>
							<dd><input type="text" name="shenzhouxing" value="${rate.shenzhouxing }"/></dd>
						</dl>
						<dl>
							<dt>电信充值卡</dt>
							<dd><input type="text" name="telecom" value="${rate.telecom }"/></dd>
						</dl>
						<dl>
							<dt>纵游一卡通</dt>
							<dd><input type="text" name="longitudinal" value="${rate.longitudinal }"/></dd>
						</dl>
						<dl>
							<dt>32一卡通</dt>
							<dd><input type="text" name="thirtytwo" value="${rate.thirtytwo }"/></dd>
						</dl>
						<dl>
							<dt>提现手续费</dt>
							<dd><input type="text" name="refund" value="${rate.refund }"/></dd>
						</dl>
						<dl>
							<dt>代付手续费</dt>
							<dd><input type="text" name="dfrefund" value="${rate.dfrefund }"/></dd>
						</dl>
						<dl class="nowrap">
							<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">修改</button>
							</div>
							</div>
						</dl>
						</fieldset>
						</form>
					</div>
				</div>
				<div layoutH="146" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent">
						<form action="<%=adminbasePath %>/person/upBankAccount" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
							<input type="hidden" name="id" value="${person.id}">
							<fieldset>
							<legend>银行账户</legend>
										<dl>
											<dt>银行类型：</dt>
											<dd>
												<script type="text/javascript">
													$("#codeid option[value='${bank.codeid}']").attr("selected", true);
												</script>
												<select class="combox" name="codeid" id="codeid" style="width: 200px">
														<option value="0">支付方式</option>
														<c:forEach items="${partici}" varStatus="l" var="par">
															<option value="${par.codeid}"><c:out
																	value="${par.payable}"></c:out></option>
														</c:forEach>
												</select>
											</dd>
										</dl>
										<dl>
											<dt>开户姓名：</dt>
											<dd><input type="text" name="account_name" value="${bank.account_name}"/></dd>
										</dl>
										<dl>
											<dt>收款人开户行的省名：</dt>
											<dd><input type="text" name="branchsheng" value="${bank.branchsheng}"/></dd>
										</dl>
										<dl>
											<dt>收款人开户行的市名：</dt>
											<dd><input type="text" name="branchshi" value="${bank.branchshi}"/></dd>
										</dl>
										<dl>
											<dt>开户支行：</dt>
											<dd><input type="text" name="branch" value="${bank.branch}"/></dd>
										</dl>
										<dl>
											<dt>收款帐号：</dt>
											<dd><input type="text" name="account" value="${bank.account}"/></dd>
										</dl>
										<dl class="nowrap">
											<div class="buttonActive">
											<div class="buttonContent">
												<button type="submit">修改</button>
											</div>
											</div>
										</dl>
							</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upNetwork" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
							<input type="hidden" name="id" value="${person.id}">
							<fieldset>
							<legend>网络账户</legend>
								<dl>
									<dt>帐户类型：</dt>
									<dd><input type="text" name="branch" value="${network.branch}" /></dd>
								</dl>
								<dl>
									<dt>真实姓名：</dt>
									<dd><input type="text" name="account_name" value="${network.account_name}" /></dd>
								</dl>
								<dl>
									<dt>收款帐号：</dt>
									<dd><input type="text" name="account" value="${network.account}" /></dd>
								</dl>
								<dl class="nowrap">
									<div class="buttonActive">
									<div class="buttonContent">
										<button type="submit">修改</button>
									</div>
									</div>
								</dl>
							</fieldset>
						</form>
					</div>
				</div>
				<div layoutH="146" style="display: block; overflow: auto; width:100%; border: solid 1px #CCC; background: #fff">
					<div class="pageFormContent">
						<form action="<%=adminbasePath %>/person/upGateway" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>网银通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='gateway_id'][value='${gateway.gateway_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="gateway_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<%--
						<form action="<%=adminbasePath %>/person/upGateway1" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>充值1</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='paygete_id1'][value='${gateway.paygete_id1}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="paygete_id1" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upGateway2" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>收款通道2</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='paygete_id2'][value='${gateway.paygete_id2}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="paygete_id2" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upGateway3" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>充值3</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='paygete_id3'][value='${gateway.paygete_id3}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="paygete_id3" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upGateway4" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>充值4</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='paygete_id4'][value='${gateway.paygete_id4}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="paygete_id4" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upGateway5" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>充值5</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='paygete_id5'][value='${gateway.paygete_id5}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="paygete_id5" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						 --%>
						<form action="<%=adminbasePath %>/person/upWeixin" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>微信扫码通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='weixin_id'][value='${gateway.weixin_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="weixin_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upWxwap" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>微信WAP通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='wxwap_id'][value='${gateway.wxwap_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="wxwap_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upAlipay" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>支付宝扫码通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='alipay_id'][value='${gateway.alipay_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="alipay_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upAlipaywap" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>支付宝WAP通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='alipaywap_id'][value='${gateway.alipaywap_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="alipaywap_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upTenpay" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>财付通扫码通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='tenpay_id'][value='${gateway.tenpay_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="tenpay_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upTenpaywap" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>财付通WAP通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='tenpaywap_id'][value='${gateway.tenpaywap_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="tenpaywap_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upQqcode" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>QQ扫码通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='qqcode_id'][value='${gateway.qqcode_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="qqcode_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upQqwallet" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>QQ钱包通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='qqwap_id'][value='${gateway.qqwap_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="qqwap_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upCard" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>点卡通道</legend>
							<dl class="nowrap">
								<dt>通道列表：</dt>
								<dd>
									<script type="text/javascript">
										$("input[name='card_id'][value='${gateway.card_id}']").attr("checked",true); 
									</script>
									<c:forEach items="${gatewaylist}" var="gateways">
										<label><input type="radio" name="card_id" value="${gateways.gateway_id }" /><c:out value="${gateways.gateway_name }"></c:out></label>
									</c:forEach>
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<form action="<%=adminbasePath %>/person/upGatewayTitle" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>通道文字</legend>
							<dl class="nowrap">
								<dt>通道文字显示：</dt>
								<dd>
									<textarea name="title" cols="80" rows="2">${gateway.title }</textarea>
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>通道文字时间：</dt>
								<dd>
									<input type="text" name="titletime" value="${gateway.titletime }" />（单位毫秒）
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						<%--
						<form action="<%=adminbasePath %>/person/upCaifutong" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
						<input type="hidden" name="id" value="${person.id}">
						<fieldset>
							<legend>财付通账号以及费率</legend>
							<dl class="nowrap">
								<dt>账号：</dt>
								<dd>
									<input type="text" class="required" name="caifu_account" value="${caifutong.caifu_account }" />
								</dd>
							</dl>
							<dl class="nowrap">
								<dt>费率：</dt>
								<dd>
									<input type="text" class="required" name="caifu_rate" value="${caifutong.caifu_rate }" />（例：0.01）
								</dd>
							</dl>
							<dl class="nowrap">
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit"">修改</button>
								</div>
								</div>
							</dl>
						</fieldset>
						</form>
						 --%>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<div class="tabsFooter">
				<div class="tabsFooterContent"></div>
			</div>
		</div>
	</div>
</body>
</html>