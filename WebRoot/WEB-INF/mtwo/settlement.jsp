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

<body data-type="settlement-info">
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
                        <div class="widget am-cf" style="min-height: 280px;">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl" style="color: red;">提现申请</div>
                            </div>
                            <div class="widget-body am-fr">
							<form class="am-form tpl-form-border-form" id="refundform"
								action="<%=basePath%>/settlement/withdrawal" method="post">
								<input type="hidden" name="withdrawalToken" value="${withdrawalToken}" />
                                  <div class="am-form-group">
                                      <label class="am-u-sm-12 am-u-md-4 am-form-label am-text-left">提现方式：</label>
                                      <div class="am-u-sm-12 am-u-md-8">
								<c:if test="${balance.settlementauthority==1}">
									T+0 每天提现次数:无限
								</c:if>
								<c:if test="${balance.settlementauthority==2}">
									T+1 每天提现次数:1
								</c:if>
								<c:if test="${balance.settlementauthority==3}">
									D+0 每天提现次数:无限
								</c:if>
                                      </div>
                                  </div>
						          <div class="am-form-group">
						          <label class="am-u-sm-12 am-u-md-4 am-form-label am-text-left">提现账户类型：</label>
                                      <div class="am-u-sm-12 am-u-md-8">
						            <select id="selectError3" name="refund_types" data-am-selected>
									<c:choose>
										<c:when test="${empty bank}">
											<option value="">银行卡：未绑定</option>
										</c:when>
										<c:otherwise>
											<option value="${bank.account_types}">银行卡：${bank.codeid}</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty network}">
											<option value="">网络账户：未绑定</option>
										</c:when>
										<c:otherwise>
											<option value="${network.account_types}">网络账户：${network.branch}</option>
										</c:otherwise>
									</c:choose>
									</select>
									</div>
						          </div>
                                  <div class="am-form-group">
                                      <label class="am-u-sm-12 am-u-md-4 am-form-label am-text-left">可用账户余额：</label>
                                      <div class="am-u-sm-12 am-u-md-8">￥${balance.settlement }</div>
                                  </div>
                                  <div class="am-form-group">
                                      <label class="am-u-sm-12 am-u-md-4 am-form-label am-text-left">提现金额：</label>
                                      <div class="am-u-sm-12 am-u-md-8">
                                      <input type="text" class="am-margin-top-xs"  name="refund_amount"
	                    						 datatype="n" nullmsg="请输入金额！" errormsg="输入金额有误，请重新输入！" >
                                      </div>
                                  </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-12  am-text-right">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
							</form>
                            </div>
                         </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 widget-margin-bottom-lg ">
                        <div class="tpl-user-card am-text-center">
                            <div class="achievement-description">
							<ol>
								<li>为确保提现成功，请保证可用余额资金充足；</li>
								<li>T+0:0点~23点提交并审核的批付单，23点后一起付出，正常情况当天0:00左右到账；</li>
								<li>D+0:9点~21点提交并审核的批付单，申请实时转出，正常情况15分钟左右到账；</li>
								<li>周六、周末出款请咨询商务经理，正常情况下周六/周末提现周一上午10点到账。</li>
							</ol>
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
				window.location.href="<%=basePath%>/mtwo/settlement";
			},1000);
		}
			}
		});
	});
</script>
</body>
</html>