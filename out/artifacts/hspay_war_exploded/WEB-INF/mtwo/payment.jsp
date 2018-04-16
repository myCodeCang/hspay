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

<body data-type="recharge-info">
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
                                <form class="am-form tpl-form-border-form" id="netform" action="<%=basePath%>/payment/getre"
                                 target="_blank" method="post">
                                    <div class="am-form-group">
									  <h3>付款金额：</h3>
                                        <div class="am-u-sm-12">
                                            <input type="text" class="am-margin-top-xs" size="16" 
	                    						name="p3_Amt" id="p3_Amt" datatype="*" nullmsg="金额不能为空！" >
                                        </div>
                                    </div>
									<div class="am-form-group">
									  <h3>网银方式</h3>
								<label class="am-radio-inline" style="margin-left: 10px;"> <input
										type="radio" name="pd_FrpId" value="CCB-NET-B2C"
										checked="checked" data-am-ucheck> <img
										src="<%=basePath%>/images/banklogo/jianshe.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="ICBC-NET-B2C" data-am-ucheck>
										<img
										src="<%=basePath%>/images/banklogo/gongshang.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/zhaohang.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="ABC-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/nongye.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="BOCO-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/jiaotong.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="BOC-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/zhongguo.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="POST-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/youzheng.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="HKBEA-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/dongya.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CEB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/guangda.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="GDB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/guangfa.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="HZBANK-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/hangzhou.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="SCCB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/hebei.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="BCCB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/beijing.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CBHB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/buohai.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CMBC-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/minsheng.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="NJCB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/nanjing.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="NCBBANK-NET-B2C" data-am-ucheck>
										<img
										src="<%=basePath%>/images/banklogo/nanyanbank.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="NBCB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/ningbo.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="BJRCB-NET-B2C" data-am-ucheck>
										<img
										src="<%=basePath%>/images/banklogo/nongcunshangye.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="ECITIC-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/zhongxin.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="PINGANBANK-NET" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/pingan.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="SHB-NET-B2C" data-am-ucheck>
										<img
										src="<%=basePath%>/images/banklogo/shanghaibank.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="SRCB-NET-B2C" data-am-ucheck>
										<img width="154" height="33"
										src="<%=basePath%>/images/banklogo/shangnongshang.jpg">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="SPDB-NET-B2C" data-am-ucheck>
										<img
										src="<%=basePath%>/images/banklogo/shangpufa.gif" data-am-ucheck>
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="SDB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/shenfa.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="ZJTLCB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/tailong.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CIB-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/xingye.gif">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="CZ-NET-B2C" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/zheshang.gif">
								</label>
								</div>
									<div class="am-form-group">
									  <h3>扫码方式</h3>
								<label class="am-radio-inline" style="margin-left: 10px;"> <input
										type="radio" name="pd_FrpId" value="weixin" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/wxpay.jpg">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="qqmobile" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/qqpay.png">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="alipay" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/zfb.png">
								</label>
								<label class="am-radio-inline"> <input
										type="radio" name="pd_FrpId" value="tenpay" data-am-ucheck>
										<img src="<%=basePath%>/images/banklogo/tenpay.png">
								</label>
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
	$("#netform").Validform({
		tiptype : 1,
		ignoreHidden : true
	});
});
</script>
</body>
</html>