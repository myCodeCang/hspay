<%@page import="com.tool.CryptTool"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.vo.Logrecord"%>
<%@page import="com.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../page/page.jsp"%>
<%
	Person map = (Person) request.getSession().getAttribute("session");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<jsp:include page="include/upage.jsp"></jsp:include>

</head>

<body data-type="index-payment">
<script src="<%=basePath%>/static/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
<jsp:include page="include/top.jsp"></jsp:include>
        <!-- 侧边导航栏 -->
<jsp:include page="include/left.jsp"></jsp:include>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
				<% 
					if(Person.dao.findById(map.getInt("id")).getInt("ifnet")!=2){
				%>
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">商户ID：${payment.id }</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text">
                                      KEY： ${payment.key }
                                        <button class="widget-fluctuation-tpl-btn" id="doc-prompt-toggle">
                        <i class="am-icon-rotate-left"></i>重新获取对接密钥</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
				<%}%>
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">微信扫码费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.weixin}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">微信WAP费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.wxwap}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">支付宝扫码费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.alipay}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">支付宝WAP费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.alipaywap}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">ＱＱ扫码费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.qqcode}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">ＱＱ钱包费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.qqwap}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">网银的费率</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.banking}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">提现手续费</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${rate.refund}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">手机验证</div>
    <div class="am-modal-bd">
    原手机号：<%= CryptTool.getphone(map.getStr("phone")) %><br/>
    <font color="red">(注：同一个手机号一小时最多能操作3次)</font>
      <div class="am-input-group">
      <input type="text" class="am-form-field am-modal-prompt-input">
      <span class="am-input-group-btn">
        <button class="am-btn am-btn-default sms" type="button" onclick="sms()">获取验证码</button>
      </span>
    </div>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</div>
<jsp:include page="include/script.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
	  $('#doc-prompt-toggle').on('click', function() {
	    $('#my-prompt').modal({
	      relatedTarget: this,
	      onConfirm: function(e) {
	    	$.ajax({
	    		type: "post", 
	    		url: "<%=basePath%>/mtwo/upKey",
	    		data:{yzm:e.data || ''},
	    		success: function(msg){
	    			if(msg.status=="y"){
	    				window.location.href="<%=basePath%>/mtwo/indexPayment";
	    			}else{
	    				alert(msg.info);
	    			}
	    		}
	    	}); 
	      }
	    });
	  });
	});
	var num=60;
function changeTime() {
	if (num > 0) {
		$("button.sms").html(num+'秒');
		num = num - 1;
	}else{
		clearInterval(interv);
		$("button.sms").removeAttr("disabled");
		$("button.sms").html("重新获取验证码");
	}
}
function sms(){
	num = 60;
	$.ajax({
		type: "post", 
		url: "<%=basePath%>/mtwo/getSms", 
		success: function(msg){
			if(msg=="100"){
				num = 300;
				$("button.sms").attr("disabled","disabled");
				interv = setInterval(changeTime,1000);
			}else{
				alert(msg);
			}
		}
	}); 
}
</script>
</body>
</html>