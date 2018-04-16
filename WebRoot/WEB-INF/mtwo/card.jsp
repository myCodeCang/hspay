<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>
<style type="text/css">
.am-radio-inline{padding: 10px 10px;}
.am-ucheck-icons{top:15px;left:-10px;}
</style>
</head>

<body data-type="card-info">
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
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-border-form" id="circlipform" action="<%=basePath%>/payment/circlip"
                                 target="_blank" method="post">
                                    <div class="am-form-group">
									  <h3>选择点卡类型：</h3>
                                        <div class="am-u-sm-12">
										<select id="cardcode" name="cardid" data-rel="chosen"  data-am-selected="{maxHeight:200}">
											<c:forEach items="${cardcode}" varStatus="l" var="card">
												<option value="${card.codeid}">${card.payable}</option>
											</c:forEach>
										</select>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
									  <h3>选择面额：</h3>
                                        <div class="am-u-sm-12">
										 <label class="radio" >
							<input type="radio" name="amount" value="1" checked="checked"> 1
						</label> 
						<label class="radio" id="face0" style="display: none;">
							<input type="radio" name="amount" value="0"> 0
						</label> <label class="radio" id="face1" style="display: none;">
							<input type="radio" name="amount" value="1"> 1
						</label> <label class="radio" id="face2" style="display: none;">
							<input type="radio" name="amount" value="2"> 2
						</label> <label class="radio" id="face3" style="display: none;">
							<input type="radio" name="amount" value="3"> 3
						</label> <label class="radio" id="face5"> <input
							type="radio" name="amount" value="5"> 5
						</label> <label class="radio" id="face6"> <input
							type="radio" name="amount" value="6"> 6
						</label> <label class="radio" id="face9" style="display: none;">
							<input type="radio" name="amount" value="9"> 9
						</label> <label class="radio" id="face10"> <input
							type="radio" name="amount" value="10"> 10
						</label> <label class="radio" id="face15"> <input
							type="radio" name="amount" value="15"> 15
						</label> <label class="radio" id="face20"> <input
							type="radio" name="amount" value="20"> 20
						</label> <label class="radio" id="face25" style="display: none;">
							<input type="radio" name="amount" value="25"> 25
						</label> <label class="radio" id="face30"> <input
							type="radio" name="amount" value="30"> 30
						</label> <label class="radio" id="face35" style="display: none;">
							<input type="radio" name="amount" value="35"> 35
						</label> <label class="radio" id="face40" style="display: none;">
							<input type="radio" name="amount" value="40"> 40
						</label> <label class="radio" id="face45" style="display: none;">
							<input type="radio" name="amount" value="45"> 45
						</label> <label class="radio" id="face50"> <input
							type="radio" name="amount" value="50"> 50
						</label> <label class="radio" id="face60" style="display: none;">
							<input type="radio" name="amount" value="60"> 60
						</label> <label class="radio" id="face70" style="display: none;">
							<input type="radio" name="amount" value="70"> 70
						</label> <label class="radio" id="face80" style="display: none;">
							<input type="radio" name="amount" value="80"> 80
						</label> <label class="radio" id="face90" style="display: none;">
							<input type="radio" name="amount" value="90"> 90
						</label> <label class="radio" id="face100"> <input
							type="radio" name="amount" value="100"> 100
						</label> <label class="radio" id="face120"> <input
							type="radio" name="amount" value="120"> 120
						</label> <label class="radio" id="face200"> <input
							type="radio" name="amount" value="200"> 200
						</label> <label class="radio" id="face300"> <input
							type="radio" name="amount" value="300"> 300
						</label> <label class="radio" id="face350" style="display: none;">
							<input type="radio" name="amount" value="350">
							350
						</label> <label class="radio" id="face468" style="display: none;">
							<input type="radio" name="amount" value="468">
							468
						</label> <label class="radio" id="face500"> <input
							type="radio" name="amount" value="500"> 500
						</label> <label class="radio" id="face1000"> <input
							type="radio" name="amount" value="1000"> 1000
						</label>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
									  <h3>卡号：</h3>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-margin-top-xs" size="16" 
	                    						name="cardno" id="cardno" datatype="*" nullmsg="卡号不能为空！" >
                                        </div>
                                    </div>
                                    <div class="am-form-group">
									  <h3>卡密：</h3>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-margin-top-xs" size="16" 
	                    						name="cardpass" id="cardpass" datatype="*" nullmsg="卡密不能为空！" >
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-12 am-u-sm-push-12">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<jsp:include page="include/script.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
	$("#circlipform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/card";
				}, 1000);
			} else {
				setTimeout(function() {
					$.Hidemsg();
					document.getElementById("circlipform").reset();
				}, 1000);
			}
		}
	});
});
</script>
</body>
</html>