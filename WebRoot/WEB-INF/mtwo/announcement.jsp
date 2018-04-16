<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="include/upage.jsp"></jsp:include>
</head>
<body data-type="announcement">
<script src="<%=basePath%>/static/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
<jsp:include page="include/top.jsp"></jsp:include>
        <!-- 侧边导航栏 -->
<jsp:include page="include/left.jsp"></jsp:include>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-body  widget-body-lg am-fr">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                    <thead>
                                        <tr>      
				                            <th>标题</th>       
				                            <th>发布时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="dynamic" items="${dynamiclist}">
										<tr>
											<td><a target="_blank"
												href="<%=basePath%>/mtwo/getannouncementinfo?dynamicid=${dynamic.dynamicid}"><c:out
														value="${dynamic.title}"></c:out></a><span class="am-badge am-badge-danger am-round">New</span></td>
											<td>${dynamic.createtime}</td>
										</tr>
									</c:forEach>
                                    </tbody>
                                 </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<jsp:include page="include/script.jsp"></jsp:include>
</body>
</html>