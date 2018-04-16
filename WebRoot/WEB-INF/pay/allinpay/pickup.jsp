	<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"  errorPage="" %>
	<%
			request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
			String merchantId=request.getParameter("merchantId");
			String version=request.getParameter("version");
			String language=request.getParameter("language");
			String signType=request.getParameter("signType");
			String payType=request.getParameter("payType");
			String issuerId=request.getParameter("issuerId");
			String paymentOrderId=request.getParameter("paymentOrderId");
			String orderNo=request.getParameter("orderNo");
			String orderDatetime=request.getParameter("orderDatetime");
			String orderAmount=request.getParameter("orderAmount");
			String payDatetime=request.getParameter("payDatetime");
			String payAmount=request.getParameter("payAmount");
			String ext1=request.getParameter("ext1");
			String ext2=request.getParameter("ext2");
			String payResult=request.getParameter("payResult");
			String errorCode=request.getParameter("errorCode");
			String returnDatetime=request.getParameter("returnDatetime");
			String signMsg=request.getParameter("signMsg");
		
			//验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			//构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);
			
			//signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg); 
			//signType为"1"时，必须设置证书路径。
			paymentResult.setCertPath("TLCert.cer"); 
			
			//验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();
			
			//验签成功，还需要判断订单状态，为"1"表示支付成功。
			boolean paySuccess = verifyResult && payResult.equals("1");

			if(paySuccess){
				//TODO 商户订单处理，显示客户订单付款成功页面
				YeepayService.service.netcallback(paymentOrderId, merchantId, "", payDatetime, returnDatetime);
				response.sendRedirect(basePath+"/yeepay/yeeReturn?r6_Order="+merchantId);
			}else{
				if(!verifyResult){
					out.println("交易签名被篡改!");
				}else{
					YeepayService.service.failure(merchantId, returnDatetime);
					response.sendRedirect(basePath+"/yeepay/yeeReturn?r6_Order="+merchantId);
				}
			}
	 %>
