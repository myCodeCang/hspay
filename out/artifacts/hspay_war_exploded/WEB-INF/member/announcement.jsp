<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="include/upage.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#active5").addClass("active");
		var pageNum = ${pageNum};
		var totalpage = ${totalpage};
		if(pageNum==1){
			$("#previous").addClass("disabled");
		}else{
			$("#previous").removeClass("disabled");
		}
		if (pageNum == totalpage) {
			$("#next").addClass("disabled");
		} else {
			$("#next").removeClass("disabled");
		}
	});
</script>
</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$('#nav_title').attr("href","<%=basePath%>/member/getannouncement?pageNum=1").text("公告列表");
});
</script>
<!--centers-->
<div class="centers_m">
	<div id="lefts">
		<h2 class="title"><a href="javascript:;">公告列表</a></h2>
		<ul id="nav">
			<li class="selected"><a href="javascript:;">公告列表</a></li>
		</ul>
	</div>
    <!--right-->
    <div class="center_right">
    	<h1 class="welcom_tm">公告列表</h1>
		<div class="dao_hang" style="height: 1px;background: #eaeaea;">
		</div>
    	<div class="public_m1">
            <div class="public_m5">
            	<table border="0" cellspacing="0" cellpadding="0">
                	<tbody>
						<tr style=" border-bottom:1px solid #000">       
                        	<th class="olist1">编号</th>       
                            <th class="olist2">标题</th>       
                            <th class="olist3">发布时间</th>
                        </tr>
						<c:forEach var="dynamic" items="${dynamiclist}">
							<tr>
								<td>${dynamic.dynamicid }</td>
								<td><a target="_blank"
									href="<%=basePath%>/index_tf/dynamicInfo.jsp?dynamicid=${dynamic.dynamicid}"><c:out
											value="${dynamic.title}"></c:out></a></td>
								<td>${dynamic.createtime}</td>
							</tr>
						</c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="fanyefh_m">
            <c:if test="${pageNum>1}">
            	<a id="previous" href="<%=basePath%>/member/getannouncement?pageNum=${pageNum-1}">上一页</a>
            	</c:if>
                <a href="javascript:;" class="addclass_m">${pageNum}</a>
            <c:if test="${totalpage>1 && totalpage>=pageNum}">
                <a id="next" href="<%=basePath%>/member/getannouncement?pageNum=${pageNum+1}">下一页</a>
                </c:if>
            </div>
        </div>
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>