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
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>
</head>

<body data-type="another-pay">
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
                            	<strong style="font-size: 1.5em;">实际金额：<font color="red">￥${balance.settlement}</font></strong>
                            	<p class="page-header-description">多个代付账号，可以一个一个的添加。</p>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
							<form class="am-form tpl-form-border-form" id="refundform"
								action="<%=basePath%>/settlement/anotherpay" method="post">
                                 <div class="am-form-group am-u-lg-12">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">收款银行：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
										<select id="selectError"  name="codeid" data-am-selected="{maxHeight: 200}">
											<option value="46">支付宝</option>
											<c:forEach items="${partici}" varStatus="l"
												var="par">
												<option value="${par.codeid}">${par.payable}</option>
											</c:forEach>
										</select>
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">收款账号：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="account"  datatype="*" nullmsg="收款账号不能为空" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">收款姓名：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="accountname"  datatype="*" nullmsg="收款姓名不能为空" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">开户省份：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="branchsheng" class="am-margin-top-xs" datatype="*" nullmsg="开户行的省名不能为空" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">开户城市：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="branchshi" class="am-margin-top-xs" datatype="*" nullmsg="开户行的市名不能为空" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">开户支行：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="branch" class="am-margin-top-xs" datatype="*" nullmsg="开户支行不能为空" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-6">
                                     <label class="am-u-sm-12 am-u-md-3 am-form-label  am-text-left">代付金额：</label>
                                     <div class="am-u-sm-12 am-u-md-9">
                                     <input type="text" name="refund_amount" class="am-margin-top-xs" 
                                      datatype="n" nullmsg="请输入金额！" errormsg="输入金额有误，请重新输入！" />
                                     </div>
                                 </div>
                                 <div class="am-form-group am-u-lg-12">
                                     <div class="am-u-sm-12  am-text-right">
                                         <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success "><span class="am-icon-plus"></span>&nbsp;&nbsp;保存后新增</button>
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
var page = 1;
$(document).ready(function(){
	$("#refundform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/anotherpay";
				},1000);
			}
				}
			});
});
</script>
</body>
</html>