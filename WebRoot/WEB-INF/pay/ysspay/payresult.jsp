
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.ysspay.server.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(24);
	String apiName = request.getParameter("apiName");
	String notifyTime = request.getParameter("notifyTime");
	String tradeAmt = request.getParameter("tradeAmt");
	String merchNo = request.getParameter("merchNo");
	String merchParam = request.getParameter("merchParam");
	String orderNo = request.getParameter("orderNo");
	String tradeDate = request.getParameter("tradeDate");
	String accNo = request.getParameter("accNo");
	String accDate = request.getParameter("accDate");
	String orderStatus = request.getParameter("orderStatus");
	String signMsg = request.getParameter("signMsg");
	signMsg.replaceAll(" ", "\\+");

	String srcMsg = String
			.format(
					"apiName=%s&notifyTime=%s&tradeAmt=%s&merchNo=%s&merchParam=%s&orderNo=%s&tradeDate=%s&accNo=%s&accDate=%s&orderStatus=%s",
					apiName, notifyTime, tradeAmt, merchNo,
					merchParam, orderNo, tradeDate, accNo, accDate,
					orderStatus);
	String srcSign=SignUtil.signByMD5(srcMsg, gateway.getStr("gateway_key"));
	boolean verifyRst =signMsg.equalsIgnoreCase(srcSign);
	System.out.println("srcMsg>>>>>"+srcMsg);
	System.out.println("srcSign>>>>>"+srcSign);
	System.out.println("verifyRst>>>>>>>"+verifyRst);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (verifyRst) {
		if ("1".equals(orderStatus)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = orderNo.substring(0, 1);
			String billnos = orderNo.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("1接口订单进行时");
				YeepayService.service.netcallback(accNo, orderNo, "", sdf.format(new Date()),
						sdf.format(new Date()));
				response.sendRedirect(basePath + "/shpay/shpayreturn?orderId=" + orderNo);
				System.out.println("1接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("1充值订单进行时");
				PaymentService.service.netcallback(accNo, orderNo, "", sdf.format(new Date()),
						sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayOk");
				System.out.println("1充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		} else {//失败处理
				//请修改订单状态,或者其他操作
			String billnostr = orderNo.substring(0, 1);
			String billnos = orderNo.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("2接口订单进行时");
				YeepayService.service.failure(orderNo, sdf.format(new Date()));
				response.sendRedirect(basePath + "/yeepay/yeeReturn?r6_Order=" + orderNo);
				System.out.println("2接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("2充值订单进行时");
				PaymentService.service.failure(orderNo, sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayNo");
				System.out.println("2充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		}
		out.println("<result>1</result>");
	} else {
		out.println("<result>0</result><message>Second transaction signature tampered!</message>");
	}
%>

