<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itrus.util.sign.*" %>
<%
/* *
 功能：智付页面跳转同步通知页面
 版本：3.0
 日期：2013-08-01
 说明：
 以下代码仅为了方便商户安装接口而提供的样例具体说明以文档为准，商户可以根据自己网站的需要，按照技术文档编写。

 * */
	//获取智付GET过来反馈信息
	//商号号
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	
	String merchant_code	= request.getParameter("merchant_code");

	//通知类型
	String notify_type = request.getParameter("notify_type");

	//通知校验ID
	String notify_id = request.getParameter("notify_id");

	//接口版本
	String interface_version = request.getParameter("interface_version");

	//签名方式
	String sign_type = request.getParameter("sign_type");

	//签名
	String dinpaySign = request.getParameter("sign");

	//商家订单号
	String order_no = request.getParameter("order_no");

	//商家订单时间
	String order_time = request.getParameter("order_time");

	//商家订单金额
	String order_amount = request.getParameter("order_amount");

	//商家原订单金额
	String orginal_money = request.getParameter("orginal_money");
	
	//回传参数
	String extra_return_param = request.getParameter("extra_return_param");

	//智付交易定单号
	String trade_no = request.getParameter("trade_no");

	//智付交易时间
	String trade_time = request.getParameter("trade_time");

	//交易状态 SUCCESS 成功  FAILED 失败
	String trade_status = request.getParameter("trade_status");

	//银行交易流水号
	String bank_seq_no = request.getParameter("bank_seq_no");


	/**
	 *签名顺序按照参数名a到z的顺序排序，若遇到相同首字母，则看第二个字母，以此类推，
	*同时将商家支付密钥key放在最后参与签名，组成规则如下：
	*参数名1=参数值1&参数名2=参数值2&……&参数名n=参数值n&key=key值
	**/


	//组织订单信息
	StringBuilder signStr = new StringBuilder();
	if(bank_seq_no != null && !bank_seq_no.equals("")) {
		signStr.append("bank_seq_no=").append(bank_seq_no).append("&");
	}
	if(extra_return_param != null && !extra_return_param.equals("")) {
		signStr.append("extra_return_param=").append(extra_return_param).append("&");
	}
	signStr.append("interface_version=").append(interface_version.toUpperCase());
	signStr.append("&").append("merchant_code=").append(merchant_code);
	if(notify_id != null && !notify_id.equals("")) {
		signStr.append("&").append("notify_id=").append(notify_id).append("&notify_type="+notify_type);
	}

	signStr.append("&").append("order_amount=").append(order_amount);
	signStr.append("&").append("order_no=").append(order_no);
	signStr.append("&").append("order_time=").append(order_time);
	signStr.append("&").append("orginal_money=").append(orginal_money);
	signStr.append("&").append("trade_no=").append(trade_no);
	signStr.append("&").append("trade_status=").append(trade_status);
	if(trade_time != null  && !trade_time.equals("")) {
		signStr.append("&").append("trade_time=").append(trade_time);
	}
	String signInfo = signStr.toString();
	System.out.println(signInfo);
	System.out.println(dinpaySign);
	boolean result = false;
	
	if("RSA-S".equals(sign_type)){ // sign_type = "RSA-S"			
		
		/**
		1)dinpay_public_key，智付公钥，每个商家对应一个固定的智付公钥（不是使用工具生成的商户公钥merchant_public_key，不要混淆），
		     即为智付商家后台"支付管理"->"公钥管理"->"智付公钥"里的绿色字符串内容
		2)demo提供的dinpay_public_key是测试商户号1111110166的智付公钥，请自行复制对应商户号的智付公钥进行调整和替换	*/		
					
		String dinpay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQClAyH/gZVt+AxIlHvA+ydVE1sAQjlo+6Yd3MtOniRdLsX/3sorPLX5st+2qIHBajVOniSkpvUgIAick6dNGv31NpRwm4WGslFs9nb0G/1aLE/RAGuiR839/hRdKbOtDRDCcmuE3hlJo+twp4MwuYtq3yLALrxBjODuvw6SbHj16wIDAQAB";
		result = RSAWithSoftware.validateSignByPublicKey(signInfo, dinpay_public_key, dinpaySign);	// 验签   signInfo智付返回的签名参数排序， dinpay_public_key智付公钥， dinpaySign智付返回的签名
	}
	//比较智付返回的签名串与商家这边组装的签名串是否一致
	if(result) {
		//验签成功
		/**
		此处进行商户业务操作
		业务结束
		*/
		System.out.println("SUCCESS");
		if(trade_status.equals("SUCCESS")){
			String billnostr = order_no.substring(0, 1);
			String billnos = order_no.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("paymentDinpay接口订单进行时");
				YeepayService.service.netcallback(trade_no, order_no, bank_seq_no, trade_time, order_time);
				YeepayService.service.asynchronous(order_no);
				System.out.println("paymentDinpay接口订单结束");
				out.println("SUCCESS");
			} else if (billnos.equals("RE")) {
				System.out.println("paymentDinpay充值订单进行时");
				PaymentService.service.netcallback(trade_no, order_no, bank_seq_no, trade_time, order_time);
				response.sendRedirect(basePath+"/payment/showPayOk");
				System.out.println("paymentDinpay充值订单结束");
			}
		}else{
			PaymentService.service.failure(order_no, trade_time);
			response.sendRedirect(basePath+"/payment/showPayNo");
		}
	}else{
		//验签失败 业务结束
		out.println("Signature Error");   
	}

%><!-- 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
此处可添加页面展示  提示相关信息给消费者 
</body>
</html> -->