<%@page import="java.util.List"%>
<%@page import="com.vo.Dynamic"%>
<%@page import="com.vo.Person"%>
<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
	Systemss systemss = Systemss.dao.findById(1);
	List<Dynamic> dynamiclist = Dynamic.dao.find("SELECT * FROM dynamic d ORDER BY d.createtime DESC");
	Dynamic dynamic = null;
	if(dynamiclist.size()>0){
		dynamic = dynamiclist.get(0);
	}
			
%>
<div style=" width:100%; height:auto; background:#fff">
<div class="dhjssk">
	<a href="#" class="logo"><img src="<%=basePath %>/static/hspay/images/logo.png" /></a>
	<%--
     --%>
    <!--我们的优势-->
    <div class="wmdys">
    	<ul id="urlid">
        	<li data-url="<%=basePath%>/"><img alt="" src="<%=basePath %>/static/hspay/images/member_index.png"><p>首页</p></li>
            <li data-url="<%=basePath%>/member"><img alt="" src="<%=basePath %>/static/hspay/images/member_manager.png"><p>用户管理</p></li>
            <li data-url="<%=basePath%>/member/exchange"><img alt="" src="<%=basePath %>/static/hspay/images/member_transaction.png"><p>交易管理</p></li>
            <li data-url="<%=basePath%>/member/payment"><img alt="" src="<%=basePath %>/static/hspay/images/member_recharge.png"><p>在线充值</p></li>
            <li data-url="<%=basePath%>/member/settlement"><img alt="" src="<%=basePath %>/static/hspay/images/member_calculation.png"><p>结算管理</p></li>
            <li data-url="<%=basePath%>/member/transfer"><img alt="" src="<%=basePath %>/static/hspay/images/member_settlement.png"><p>转账管理</p></li>
            <li data-url="<%=basePath%>/member/getannouncement?pageNum=1"><img alt="" src="<%=basePath %>/static/hspay/images/member_news.png"><p>公告列表</p></li>
            <li data-url="<%=basePath%>/api/document.zip"><img alt="" src="<%=basePath %>/static/hspay/images/member_api.png"><p>API下载</p></li>
            <li data-url="<%=basePath%>/member/getAbout"><img alt="" src="<%=basePath %>/static/hspay/images/member_contactus.png"><p>联系我们</p></li>
            <li data-url="<%=basePath%>/login/quit"><img alt="" src="<%=basePath %>/static/hspay/images/member_out.png"><p>退出</p></li>
        </ul>
    </div>
</div>
</div>
<div class="dao_hang">
</div>
<!--当前位置-->
<div class="now_positionm">
    <div class="searchk">
		<%
			if(dynamic!=null){
		%>
		<div class="navbar-header" align="center">
			<a target="_blank" href="<%=basePath%>/index_tf/dynamicInfo.jsp?dynamicid=<%=dynamic.getInt("dynamicid") %>" class="navbar-brand">
				<MARQUEE scrollAmount=2><small>【公告】<%=dynamic.getStr("title") %></small></MARQUEE>
			</a>
		</div>
		<%
			}
		%>
    </div>
<span>当前位置：</span><a href="<%=basePath%>/member">商户中心 &gt;</a><a href="#" id="nav_title">个人中心</a>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#urlid>li').click(function(){
		window.location.href=$(this).attr('data-url');
	});
});
</script>