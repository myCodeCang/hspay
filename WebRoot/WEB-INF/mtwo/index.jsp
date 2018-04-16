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
	Logrecord log = (Logrecord) request.getSession().getAttribute("logrecord");
	List<Logrecord> logs = (List<Logrecord>) request.getAttribute("logs");
	Map<String,String> orderStatistics = (Map<String,String>) request.getAttribute("orderStatistics");
	String orderDay="";
	String orderCount="";
	String orderNum="";
	for (Map.Entry<String,String> entry : orderStatistics.entrySet()) { 
		String[] str=entry.getValue().split(",");
		orderDay+=","+entry.getKey();
		orderCount+=","+str[0];
		orderNum+=","+str[1];
	}
%>
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
	list-style: none;
	margin-top: 10px;
}
.am-list-static>li{
	padding-left: 15px;
}
.am-list-static>li span{
	float: right;
	padding-right: 15px;
}
</style>
</head>

<body data-type="index">
<script src="<%=basePath%>/static/assets/js/theme.js"></script>
<input type="hidden" id="orderDay" value="<%=orderDay.substring(1)%>"/>
<input type="hidden" id="orderCount" value="<%=orderCount.substring(1)%>"/>
<input type="hidden" id="orderNum" value="<%=orderNum.substring(1)%>"/>
    <div class="am-g tpl-g">
        <!-- 头部 -->
<jsp:include page="include/top.jsp"></jsp:include>
        <!-- 侧边导航栏 -->
<jsp:include page="include/left.jsp"></jsp:include>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">最近七天成功订单量</div>
                            </div>
                            <div class="widget-body-md widget-body tpl-amendment-echarts am-fr" id="tpl-echarts">

                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">总成功订单量</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    <c:out value="${ordertotal}"></c:out>
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">
                                帐户余额
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ￥<c:out value="${balance.amount}"></c:out>
                                </div>
                                <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">
                                可结算金额
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ￥<c:out value="${balance.settlement}"></c:out>
                                </div>
                                <span class="widget-statistic-icon am-icon-support"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">网银订单数量</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    ${ordernum.get("banknum")}
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">扫码订单数量<span style="font-size: 12px;">(微信/支付宝)</span></div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    ${ordernum.get("saoma")}
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">WAP订单数量<span style="font-size: 12px;">(微信/支付宝)</span></div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    ${ordernum.get("wapnum")}
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">点卡订单数量</div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text text-success" style="font-size: 50px;"><strong>
                                    ${ordernum.get("cardnum")}
                                    </strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">网银接口文档</div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                <a class="am-btn am-btn-danger am-radius" href="<%=basePath%>/api/BankofChina.zip" target="_blank">
                                <i class="am-icon-cloud-download"></i>下载</a>
                                </div>
                                <span class="widget-statistic-icon am-icon-cc-mastercard"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">扫码接口文档</div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                <a class="am-btn am-btn-danger am-radius" href="<%=basePath%>/api/ScanCode.zip" target="_blank">
                                <i class="am-icon-cloud-download"></i>下载</a>
                                </div>
                                <span class="widget-statistic-icon am-icon-desktop"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">WAP接口文档</div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                <a class="am-btn am-btn-danger am-radius" href="<%=basePath%>/api/wapapi.zip" target="_blank">
                                <i class="am-icon-cloud-download"></i>下载</a>
                                </div>
                                <span class="widget-statistic-icon am-icon-mobile" style="font-size: 100px;top: 5px;"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">点卡接口文档</div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                <a class="am-btn am-btn-danger am-radius" href="<%=basePath%>/api/cardapi.zip" target="_blank">
                                <i class="am-icon-cloud-download"></i>下载</a>
                                </div>
                                <span class="widget-statistic-icon am-icon-recycle"></span>
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