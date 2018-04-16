<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="page.jsp"%>
<div class="help_aboutus_left">
		<div class="panel panel-default" style="margin-bottom: 0px;">
			<!--注册-->
			<div class="panel-heading top">
				<h4 class="panel-title">
					<a href="personal_reg.jsp" target="_self" target="_self" class="aboutus">关于银生宝</a>
				</h4>
			</div>
			<div class="panel-heading top">
				<h4 class="panel-title">
					<a href="personal_site_reg.jsp" target="_self" target="_self" class="pagereg">网站注册</a>
				</h4>
			</div>
			<!--账户资产-->
			<div class="panel-heading">
				<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#zhanghu">账户资产<em><img src="static/imgs/help/A1jiantou.png" alt="" /></em></a>
			</h4>
			</div>
			<div id="zhanghu" class="panel-collapse collapse in">
				<div class="panel-body">
					<span class="recharge">
						<a href="personal_prepaid.jsp" target="_self">
							<em class="recharge"></em><span>充值</span>
						</a>
					</span>
				</div>
				<div class="panel-body">
					<span class="withdrawals">
						<a href="personal_cash_withdrawals.jsp" target="_self">
							<em class="withdrawals"></em><span>提现</span>
						</a>
					</span>
				</div>
				<div class="panel-body">
					<span class="integral">
						<a href="personal_integral.jsp" target="_self">
							<em class="integral"></em><span>转账</span>
						</a>
					</span>
				</div>
			</div>			
			<!--账户管理-->
			<div class="panel-heading">
				<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#zhanghugl">账户管理<em><img src="static/imgs/help/A1jiantou.png" alt="" /></em></a>
			</h4>
			</div>
			<div id="zhanghugl" class="panel-collapse collapse in">
				<div class="panel-body">
					<span class="authenticat">
						<a href="personal_real_name.jsp" target="_self">
							<em class="authenticat"></em><span>银生宝实名认证</span>
						</a>
					</span>
				</div>
				<div class="panel-body">
					<span class="account">
						<a href="personal_account_password.jsp" target="_self">
							<em class="account"></em><span>账户密码</span>
						</a>
					</span>
				</div>
				<div class="panel-body">
					<span class="accountinfo-mgt">
						<a href="personal_account_information.jsp" target="_self"><em class="accountinfo-mgt"></em>
					<span>账户信息管理</span></a></span>
				</div>
				<div class="panel-body">
					<span class="account-trade">
						<a href="personal_contact.jsp" target="_self"><em class="account-trade"></em>
					<span>往来账户</span></a></span>
				</div>
				<div class="panel-body">
					<span class="mobileservice">
						<a href="personal_mobileservice.jsp" target="_self"><em class="mobileservice"></em>
					<span>手机服务</span></a></span>
				</div>
				<div class="panel-body">
					<span class="account-off">
						<a href="personal_logout.jsp" target="_self"><em class="account-off"></em>
					<span>账户注销</span></a></span>
				</div>
			</div>
			<div class="panel-heading top">
				<h4 class="panel-title">
					<a href="personal_app.jsp" target="_self" class="appcenter">生活服务</a>
				</h4>
			</div>
			<div class="panel-heading top">
				<h4 class="panel-title">
					<a href="personal_transrecord.jsp" target="_self" class="traderecord">交易记录</a>
				</h4>
			</div>
			<div class="panel-heading top">
				<h4 class="panel-title">
					<a href="personal_detail.jsp" target="_self" class="charge-rules">收费规则</a>
				</h4>
			</div>
			<div class="panel-heading top">
				<h4 class="panel-title" style="border: none;">
					<a href="personal_safe.jsp" target="_self" class="safe-mgt">安全管理</a>
				</h4>
			</div>
			<div class="panel-heading top">
                <h4 class="panel-title" style="border: none;">
                    <a href="personal_netpay.jsp" target="_self" class="unspay-pay">网银支付</a>
                </h4>
            </div>
		</div>
	</div>