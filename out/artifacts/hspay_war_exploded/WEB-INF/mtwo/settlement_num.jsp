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
<style type="text/css">
.achievement-description ol{
	margin: 25px 25px;
	padding: 0;
	font-size: 12px;
	text-align: left;
}
.achievement-description ol li{
	list-style: decimal;
	margin-top: 10px;
}
</style>
</head>

<body data-type="settlement-num">
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
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                        <div class="widget am-cf">
	                    <div class="am-tabs" data-am-tabs="{noSwipe: 1}" id="doc-tab-demo-1">
						  <ul class="am-tabs-nav am-nav am-nav-tabs">
						    <li class="am-active"><a href="javascript: void(0)">银行卡号</a></li>
						    <li><a href="javascript: void(0)">网络账号</a></li>
						  </ul>
						
						  <div class="am-tabs-bd">
						    <div class="am-tab-panel am-active">
								<form class="am-form tpl-form-border-form" id="bankform"
									action="<%=basePath%>/settlement/upSettleAcount"
									method="post">
									<input type="hidden" name="account_types" value="1" />
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4  am-form-label  am-text-left">开户银行：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
											<select id="selectError"  name="codeid" data-am-selected="{maxHeight: 200}">
												<c:forEach items="${partici}" varStatus="l"
													var="par">
													<option value="${par.codeid}"><c:out
										value="${par.payable}"></c:out></option>
												</c:forEach>
											</select>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">开户姓名：</label>
                                        <div class="am-u-sm-12 am-u-md-8">${per.contacts}</div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">开户行的省名：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" name="branchsheng"  datatype="*" nullmsg="开户行的省名不能为空" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">开户行的市名：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" name="branchshi" class="am-margin-top-xs" datatype="*" nullmsg="开户行的市名不能为空" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">开户支行：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" name="branch" class="am-margin-top-xs" datatype="*" nullmsg="开户支行不能为空" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">新银行卡号：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" name="account" class="am-margin-top-xs" datatype="*" nullmsg="新银行卡号不能为空" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">新银行卡号：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" recheck="account" class="am-margin-top-xs" datatype="*" errormsg="您两次输入的银行卡号不一致！" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-12 am-text-right">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
								</form>
						    </div>
						    <div class="am-tab-panel">
								<form class="am-form tpl-form-border-form" id="networkform"
									action="<%=basePath%>/settlement/upSettleAcount"
									method="post">
									<input type="hidden" name="account_types" value="2" />
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">账户类型：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <label class="am-checkbox">
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" data-am-ucheck checked> 支付宝
                                        </label>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">真实姓名：</label>
                                        <div class="am-u-sm-12 am-u-md-8">${per.contacts}</div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">新收款帐号：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" name="account" class="am-margin-top-xs" datatype="*" nullmsg="新收款帐号不能为空" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-12 am-u-md-4 am-form-label  am-text-left">确认新收款帐号：</label>
                                        <div class="am-u-sm-12 am-u-md-8">
                                        <input type="text" class="am-margin-top-xs" datatype="*" recheck="account" errormsg="您两次输入的收款账号不一致！" />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-12 am-text-right">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
								</form>
						    </div>
						  </div>
						</div>
						</div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 widget-margin-bottom-lg ">
                        <div class="tpl-user-card am-text-center widget-body-lg" style="min-height: 388px;">
                        	<div class="tpl-user-card-title">
                               <strong>您当前绑定的结算账户</strong>
                            </div>
                            <div class="achievement-description">
                            <strong>银行卡：</strong>
								<c:choose>
									<c:when test="${empty bank}">
										尚未绑定银行卡
									</c:when>
									<c:otherwise>
							<ol>
								<li>银行类型：<c:out value="${bank.codeid}"></c:out></li>
								<li>开户姓名：<c:out value="${bank.account_name}"></c:out></li>
								<li>开户支行：<c:out value="${bank.branch}"></c:out></li>
								<li>收款帐号：<c:out value="${fn:substring(bank.account, 0, 4)}**************${fn:substring(bank.account, fn:length(bank.account)-4, fn:length(bank.account))}"></c:out></li>
							</ol>
									</c:otherwise>
								</c:choose>
                            <strong>网络帐户：</strong>
								<c:choose>
									<c:when test="${empty network}">
										尚未绑定银行卡
									</c:when>
									<c:otherwise>
							<ol>
								<li>帐户类型：<c:out value="${network.branch}"></c:out></li>
								<li>真实姓名：<c:out value="${network.account_name}"></c:out></li>
								<li>收款帐号：<c:out value="${fn:substring(fn:substringBefore(network.account,'@'),0,5)}************"></c:out></li>
							</ol>
									</c:otherwise>
								</c:choose>
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
	$("#bankform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/settlementNum";
				},1000);
			}else{
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/settlementNum";
				},1000);
			}
		}
	});
	$("#networkform").Validform({
		tiptype:1,
		postonce:true,
		ajaxPost:true,
		ignoreHidden:true,
		callback:function(data){
			if(data.status=="y"){
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/settlementNum";
				},1000);
			}else{
				setTimeout(function(){
					window.location.href="<%=basePath%>/mtwo/settlementNum";
				},1000);
			}
		}
	});
});
</script>
</body>
</html>