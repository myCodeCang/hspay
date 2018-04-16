
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.gopay.server.GopayUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(18);
	String VerficationCode = gateway.getStr("gateway_key"); //商户密钥
	String p1_MerId = gateway.getStr("gateway_merid"); //商户ID
	   String version = request.getParameter("version");
	   String charset = request.getParameter("charset");
	   String language = request.getParameter("language");
	   String signType = request.getParameter("signType");
	   String tranCode = request.getParameter("tranCode");
	   String merchantID = request.getParameter("merchantID");
	   String merOrderNum = request.getParameter("merOrderNum");
	   String tranAmt = request.getParameter("tranAmt");
	   String feeAmt = request.getParameter("feeAmt");
	   String frontMerUrl = request.getParameter("frontMerUrl");
	   String backgroundMerUrl = request.getParameter("backgroundMerUrl");
	   String tranDateTime = request.getParameter("tranDateTime");
	   String tranIP = request.getParameter("tranIP");
	   String respCode = request.getParameter("respCode");
	   String msgExt = request.getParameter("msgExt");
	   String orderId = request.getParameter("orderId");
	   String gopayOutOrderId = request.getParameter("gopayOutOrderId");
	   String bankCode = request.getParameter("bankCode");
	   String tranFinishTime = request.getParameter("tranFinishTime");
	   String merRemark1 =  request.getParameter("merRemark1");
	   String merRemark2 =  request.getParameter("merRemark2");
	   String signValueFromGopay = request.getParameter("signValue");

	   // 组织加密明文
	   String plain = "version=[" + version + "]tranCode=[" + tranCode + "]merchantID=[" + merchantID + "]merOrderNum=[" + merOrderNum + "]tranAmt=[" + tranAmt + "]feeAmt=[" + feeAmt+ "]tranDateTime=[" + tranDateTime + "]frontMerUrl=[" + frontMerUrl + "]backgroundMerUrl=[" + backgroundMerUrl + "]orderId=[" + orderId + "]gopayOutOrderId=[" + gopayOutOrderId + "]tranIP=[" + tranIP + "]respCode=[" + respCode + "]gopayServerTime=[]VerficationCode=[" + VerficationCode + "]";
	   String signValue = GopayUtils.md5(plain);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (signValue.equals(signValueFromGopay)) {
		out.println("RespCode=0000|JumpURL=");
		if ("0000".equals(respCode)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = merOrderNum.substring(0, 1);
			String billnos = merOrderNum.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("1接口订单进行时");
				YeepayService.service.netcallback(orderId, merOrderNum, "", sdf.format(new Date()),
						sdf.format(new Date()));
				response.sendRedirect(basePath + "/shpay/shpayreturn?orderId=" + merOrderNum);
				System.out.println("1接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("1充值订单进行时");
				PaymentService.service.netcallback(orderId, merOrderNum, "", sdf.format(new Date()),
						sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayOk");
				System.out.println("1充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		} else {//失败处理
				//请修改订单状态,或者其他操作
			String billnostr = merOrderNum.substring(0, 1);
			String billnos = merOrderNum.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("2接口订单进行时");
				YeepayService.service.failure(merOrderNum, sdf.format(new Date()));
				response.sendRedirect(basePath + "/yeepay/yeeReturn?r6_Order=" + merOrderNum);
				System.out.println("2接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("2充值订单进行时");
				PaymentService.service.failure(merOrderNum, sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayNo");
				System.out.println("2充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		}
	} else {
		out.println("RespCode=9999|JumpURL=");
	}
%>

