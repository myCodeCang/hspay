<%@page import="com.vo.System_qq"%>
<%@page import="com.vo.Dynamic"%>
<%@page import="com.vo.Person"%>
<%@page import="java.util.List"%>
<%@page import="com.vo.Systemss"%>
<%@page import="com.tool.CryptTool"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Systemss systemss = Systemss.dao.findById(1);
	Person map = (Person) request.getSession().getAttribute("session");
	List<System_qq> systemqqlist = System_qq.dao.find("select * from system_qq");
	List<Dynamic> dynamiclist = Dynamic.dao.find("SELECT * FROM dynamic d ORDER BY d.createtime DESC limit 3");
	Dynamic dynamic = null;
	if(dynamiclist.size()>0){
		dynamic = dynamiclist.get(0);
	}
%>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="<%=basePath%>/static/assets/img/default.png" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i><%= CryptTool.getemail(map.getStr("email")) %>
          </span>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
		        <li class="sidebar-nav-link">
		          <a href="javascript:;" class="sidebar-nav-sub-title" id="member-nav"><span class="am-icon-file sidebar-nav-link-logo"></span> 用户管理 
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span></a>
		          <ul class="sidebar-nav sidebar-nav-sub" id="member-ul">
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo" id="member-info"><span class="am-icon-check sidebar-nav-link-logo"></span> 用户信息</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/indexPayment" id="member-payment"><span class="am-icon-check sidebar-nav-link-logo"></span> 接口接入</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/indexMember" id="member-member"><span class="am-icon-check sidebar-nav-link-logo"></span> 个人资料</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/indexPassword" id="member-password"><span class="am-icon-check sidebar-nav-link-logo"></span> 密码修改</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/indexPhone" id="member-phone"><span class="am-icon-check sidebar-nav-link-logo"></span> 手机修改</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/indexLog" id="member-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 登陆日志</a></li>
		          </ul>
		        </li>
		        <li class="sidebar-nav-link">
		          <a href="javascript:;" class="sidebar-nav-sub-title" id="exchange-nav"><span class="am-icon-file sidebar-nav-link-logo"></span> 交易管理 
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span></a>
		          <ul class="sidebar-nav sidebar-nav-sub" id="exchange-ul">
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=0" id="exchange-net"><span class="am-icon-check sidebar-nav-link-logo"></span> 网银订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=44" id="exchange-weixin"><span class="am-icon-check sidebar-nav-link-logo"></span> 微信扫码订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=46" id="exchange-alipay"><span class="am-icon-check sidebar-nav-link-logo"></span> 支付宝扫码订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=49" id="exchange-wxwap"><span class="am-icon-check sidebar-nav-link-logo"></span> 微信H5订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=45" id="exchange-aliwap"><span class="am-icon-check sidebar-nav-link-logo"></span> 支付宝H5订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchange?participate=50" id="exchange-qqmobile"><span class="am-icon-check sidebar-nav-link-logo"></span> QQ钱包订单</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/exchangeCard" id="exchange-card"><span class="am-icon-check sidebar-nav-link-logo"></span> 点卡订单</a></li>
		          </ul>
		        </li>
		        <li class="sidebar-nav-link">
		          <a href="javascript:;" class="sidebar-nav-sub-title" id="payment-nav"><span class="am-icon-file sidebar-nav-link-logo"></span> 在线充值
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span></a>
		          <ul class="sidebar-nav sidebar-nav-sub" id="payment-ul">
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/payment"  id="recharge-info"><span class="am-icon-check sidebar-nav-link-logo"></span> 在线充值</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/paymentlog"  id="recharge-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 充值记录</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/card"  id="card-info"><span class="am-icon-check sidebar-nav-link-logo"></span> 在线销卡</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/cardlog"  id="card-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 销卡记录</a></li>
		          </ul>
		        </li>
		        <li class="sidebar-nav-link">
		          <a href="javascript:;" class="sidebar-nav-sub-title" id="settlement-nav"><span class="am-icon-file sidebar-nav-link-logo"></span> 结算管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span></a>
		          <ul class="sidebar-nav sidebar-nav-sub" id="settlement-ul">
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/settlement" id="settlement-info"><span class="am-icon-check sidebar-nav-link-logo"></span> 结算申请</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/settlementlog" id="settlement-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 结算记录</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/settlementNum" id="settlement-num"><span class="am-icon-check sidebar-nav-link-logo"></span> 结算账号</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/anotherpay" id="another-pay"><span class="am-icon-check sidebar-nav-link-logo"></span> 录入代付</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/anotherlog" id="another-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 代付记录</a></li>
		          </ul>
		        </li>
		        <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title" id="transfer-nav">
                        <i class="am-icon-file sidebar-nav-link-logo"></i> 转账管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
		          <ul class="sidebar-nav sidebar-nav-sub" id="transfer-ul">
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/transfer"  id="transfer-info"><span class="am-icon-check sidebar-nav-link-logo"></span> 站内转账</a></li>
		            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/transferlog" id="transfer-log"><span class="am-icon-check sidebar-nav-link-logo"></span> 转账记录</a></li>
		          </ul>
		        </li>
	            <li class="sidebar-nav-link"><a href="<%=basePath%>/mtwo/getannouncement?pageNum=1" id="member-announcement"><span class="am-icon-file sidebar-nav-link-logo"></span>公告列表</a></li>
            </ul>
        </div>