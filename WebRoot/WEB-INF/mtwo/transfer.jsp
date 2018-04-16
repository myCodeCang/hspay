<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>

</head>

<body data-type="transfer-info">
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
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl" style="color: red;">可用金额 :￥<c:out value="${balance.settlement }"></c:out></div>
                            </div>
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-border-form" id="transferform" action="<%=basePath%>/transfer/addTransfer" method="post">
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-12 am-form-label am-text-left">转账金额 :</label>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-form-field tpl-form-no-bg am-margin-top-xs"
                                             name="transfer_amount"  datatype="*" nullmsg="转账金额不能为空！">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-12 am-form-label am-text-left">转账id：</label>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-form-field tpl-form-no-bg am-margin-top-xs"
                                             name="transfer_usert"  datatype="*" nullmsg="转账id不能为空！">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-12 am-form-label am-text-left">支付密码：</label>
                                        <div class="am-u-sm-12">
                                            <input type="password" class="am-form-field tpl-form-no-bg am-margin-top-xs"
                                             name="payment"  datatype="*" nullmsg="支付密码不能为空！">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-12 am-form-label am-text-left">转账说明：</label>
                                        <div class="am-u-sm-12">
                                            <textarea type="text" class="am-form-field tpl-form-no-bg am-margin-top-xs"
                                             name="transfer_explain"  datatype="*" nullmsg="转账说明不能为空！"></textarea>
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
var basePath="<%=basePath %>";
$(document).ready(function(){
	$("#transferform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/transfer";
				},1000);
			}
			}
		});
	});
</script>
</body>
</html>