<%@page import="java.util.List"%>
<%@page import="com.vo.Dynamic"%>
<%@page import="com.vo.Person"%>
<%@page import="com.vo.Systemss"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
	Systemss systemss = Systemss.dao.findById(1);
	List<Dynamic> dynamiclist = Dynamic.dao.find("SELECT * FROM dynamic d ORDER BY d.createtime DESC");
	Dynamic dynamic = null;
	if(dynamiclist.size()>0){
		dynamic = dynamiclist.get(0);
	}
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> <%=systemss.getStr("system_webName") %>
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<%
				if(dynamic!=null){
			%>
			<div class="navbar-header" align="center" style="padding-left: 200px;width:1024px;">
				<a target="_blank" href="<%=basePath%>/index_tf/dynamicInfo.jsp?dynamicid=<%=dynamic.getInt("dynamicid") %>" class="navbar-brand">
					<MARQUEE scrollAmount=2><small>【公告】<%=dynamic.getStr("title") %></small></MARQUEE>
				</a>
			</div>
			<%
				}
			%>
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"><span class="user-info"> <small>欢迎光临,</small><%=map.get("email")%>
						</span> <i class="icon-caret-down"></i> </a>
						<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#" onclick="user()"><i class="icon-user"></i>个人资料 </a></li>
							<li class="divider"></li>
							<li><a href="<%=basePath%>/login/quit"> <i class="icon-off"></i> 退出
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>
</body>
</html>