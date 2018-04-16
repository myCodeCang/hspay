<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="com.itrus.util.sign.*" %>
<%
/* *
 *功能：即时到账交易接口接入页
 *版本：3.0
 *日期：2013-08-01
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,
 *并非一定要使用该代码。该代码仅供学习和研究智付接口使用，仅为提供一个参考。
 **/
 ////////////////////////////////////请求参数//////////////////////////////////////

 	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		//参数编码字符集(必选)
		String input_charset = "UTF-8";

		//接口版本(必选)固定值:V3.0
		String interface_version = "V3.0";

		//商家号（必填）
		String merchant_code = (String)request.getAttribute("merchant_code");

		//后台通知地址(必填)
		String notify_url = (String)request.getAttribute("notify_url");

		//定单金额（必填）
		String order_amount = (String)request.getAttribute("order_amount");

		//商家定单号(必填)
		String order_no = (String)request.getAttribute("order_no");

		//商家定单时间(必填)
		String order_time = (String)request.getAttribute("order_time");

		//签名方式(必填)
		String sign_type = "RSA-S";

		//商品编号(选填)
		//String product_code = (String) request.getParameter("product_code");

		//商品描述（选填）
		//String product_desc = (String) request.getParameter("product_desc");

		//商品名称（必填）
		String product_name = (String)request.getAttribute("product_name");

		//端口数量(选填)
		//String product_num = (String) request.getParameter("product_num");

		//页面跳转同步通知地址(选填)
		String return_url = (String)request.getAttribute("return_url");

		//业务类型(必填)
		String service_type = "direct_pay";

		//商品展示地址(选填)
		//String show_url = (String) request.getParameter("show_url");

		//公用业务扩展参数（选填）
		//String extend_param = (String) request.getParameter("extend_param");

		//公用业务回传参数（选填）
		//String extra_return_param = (String) request.getParameter("extra_return_param");

		// 直联通道代码（选填）
		String bank_code = (String)request.getAttribute("bank_code");

		String key = (String)request.getAttribute("key");
		//客户端IP（选填）
		//String client_ip = (String) request.getParameter("client_ip");
	String redo_flag ="1";
	/* 注  new String(参数.getBytes("ISO-8859-1"),"此页面编码格式"); 若为GBK编码 则替换UTF-8 为GBK*/
	if(product_name != null) {
	  product_name = new String(product_name.getBytes(),"UTF-8");
	}
/* 	if(product_desc != null) {
	  product_desc = new String(product_desc.getBytes("ISO-8859-1"),"UTF-8");
	} */
/* 	if(extend_param != null) {
	  extend_param = new String(extend_param.getBytes("ISO-8859-1"),"UTF-8");
	}
	if(extra_return_param != null) {
	  extra_return_param = new String(extra_return_param.getBytes("ISO-8859-1"),"UTF-8");
	} */
/* 	if(product_code != null) {
	  product_code = new String(product_code.getBytes("ISO-8859-1"),"UTF-8");
	} */
	if(return_url != null) {
	  return_url = new String(return_url.getBytes(),"UTF-8");
	}
/* 	if(show_url != null) {
	  show_url = new String(show_url.getBytes("ISO-8859-1"),"UTF-8");
	} */


	/*
	**
	 ** 签名顺序按照参数名a到z的顺序排序，若遇到相同首字母，则看第二个字母，以此类推，同时将商家支付密钥key放在最后参与签名，
	 ** 组成规则如下：
	 ** 参数名1=参数值1&参数名2=参数值2&……&参数名n=参数值n&key=key值
	 **/
	StringBuffer signSrc= new StringBuffer();

	//组织订单信息
	if(!"".equals(bank_code)) {
		signSrc.append("bank_code=").append(bank_code).append("&");
	}
/* 	if(!"".equals(client_ip)) {
		signSrc.append("client_ip=").append(client_ip).append("&");
	}
	if(!"".equals(extend_param)) {
		signSrc.append("extend_param=").append(extend_param).append("&");
	}
	if(!"".equals(extra_return_param)) {
		signSrc.append("extra_return_param=").append(extra_return_param).append("&");
	} */
	if (!"".equals(input_charset)) {
		signSrc.append("input_charset=").append(input_charset).append("&");
	}
	if (!"".equals(interface_version)) {
		signSrc.append("interface_version=").append(interface_version).append("&");
	}
	if (!"".equals(merchant_code)) {
		signSrc.append("merchant_code=").append(merchant_code).append("&");
	}
	if(!"".equals(notify_url)) {
		signSrc.append("notify_url=").append(notify_url).append("&");
	}
	if(!"".equals(order_amount)) {
		signSrc.append("order_amount=").append(order_amount).append("&");
	}
	if(!"".equals(order_no)) {
		signSrc.append("order_no=").append(order_no).append("&");
	}
	if(!"".equals(order_time)) {
		signSrc.append("order_time=").append(order_time).append("&");
	}
/* 	if(!"".equals(product_code)) {
		signSrc.append("product_code=").append(product_code).append("&");
	}
	if(!"".equals(product_desc)) {
		signSrc.append("product_desc=").append(product_desc).append("&");
	} */
	if(!"".equals(product_name)) {
		signSrc.append("product_name=").append(product_name).append("&");
	}
/* 	if(!"".equals(product_num)) {
		signSrc.append("product_num=").append(product_num).append("&");
	} */
	if (null != redo_flag && !"".equals(redo_flag)) {
		signSrc.append("redo_flag=").append(redo_flag).append("&");	
	}
	if(!"".equals(return_url)) {
		signSrc.append("return_url=").append(return_url).append("&");
	}
	if(!"".equals(service_type)) {
		signSrc.append("service_type=").append(service_type);
	}
/* 	if(!"".equals(show_url)) {
		signSrc.append("show_url=").append(show_url).append("&");
	} */

	String signInfo =signSrc.toString();
	//签名
	String sign = RSAWithSoftware.signByPrivateKey(signInfo, key);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
body{text-align:center;margin:0 atuto;}
.pzs{
	margin: 0;font-family: 'Karla', sans-serif;
  font-weight: bold;
  color: #317eac;
  text-rendering: optimizelegibility;
}
</style>
</head>
<body>
<div style="margin-top: 250px" align="center" >
		<p class="pzs">${title }</p>
		<img src="<%=basePath %>/img/ajax-loaders/ajax-loader-7.gif" />
	</div>
<form name="dinpayForm" method="post" action="https://pay.zhihpay.com/gateway?input_charset=UTF-8"><!-- 注意 非UTF-8编码的商家网站 此地址必须后接编码格式 -->
	<input type="hidden" name="sign" value="<%=sign%>" />
	<input type="hidden" name="merchant_code" value="<%=merchant_code%>" />
	<input type="hidden" name="bank_code" value="<%=bank_code%>"/>
	<input type="hidden" name="order_no" value="<%=order_no%>"/>
	<input type="hidden" name="order_amount" value="<%=order_amount%>"/>
	<input type="hidden" name="service_type" value="<%=service_type%>"/>
	<input type="hidden" name="input_charset" value="<%=input_charset%>"/>
	<input type="hidden" name="notify_url" value="<%=notify_url%>">
	<input type="hidden" name="interface_version" value="<%=interface_version%>"/>
	<input type="hidden" name="sign_type" value="<%=sign_type%>"/>
	<input type="hidden" name="order_time" value="<%=order_time%>"/>
	<input type="hidden" name="product_name" value="<%=product_name%>"/>	
	<input type="hidden" name="redo_flag" value="<%=redo_flag%>"/>
<%-- 	<input Type="hidden" Name="client_ip" value="<%=client_ip%>"/>
	<input Type="hidden" Name="extend_param" value="<%=extend_param%>"/>
	<input Type="hidden" Name="extra_return_param" value="<%=extra_return_param%>"/> --%>
	<%-- <input Type="hidden" Name="product_code" value="<%=product_code%>"/>
	<input Type="hidden" Name="product_desc" value="<%=product_desc%>"/> --%>
<%-- 	<input Type="hidden" Name="product_num" value="<%=product_num%>"/> --%>
	<input Type="hidden" Name="return_url" value="<%=return_url%>"/>
<%-- 	<input Type="hidden" Name="show_url" value="<%=show_url%>"/> --%>
	</form>
</body>
<script type="text/javascript">
		function sub(){
			document.dinpayForm.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub, titletime);
	</script>
</html>