
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.jdpay.service.DigestUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String CharacterEncoding = "UTF-8";
request.setCharacterEncoding(CharacterEncoding);
response.setCharacterEncoding(CharacterEncoding);
response.setContentType("text/html; charset=UTF-8");

String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path;
String msg = DigestUtil.toEmpty((String)request.getAttribute("msg"));
System.out.println("msg:"+msg);
		
//成功收到通知需打印返回success
//验签 
String respMsgSign = DigestUtil.toEmpty((String)request.getAttribute("respMsgSign"));
String respSign = DigestUtil.toEmpty((String)request.getAttribute("respSign"));
String BillNo=DigestUtil.toEmpty((String)request.getAttribute("BillNo"));
String respCode=DigestUtil.toEmpty((String)request.getAttribute("respCode"));

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
if (respSign.equals(respMsgSign)) {
	if ("0000".equals(respCode)) {
		//请修改订单成功状态,或者其他操作
		String billnostr = BillNo.substring(0, 1);
		String billnos = BillNo.substring(0, 2);
		if (billnostr.equals("O")) {
			System.out.println("接口订单进行时");
			YeepayService.service.netcallback("", BillNo, "", sdf.format(new Date()),
					sdf.format(new Date()));
			response.sendRedirect(basePath + "/hundredy/hundredreturn?orderId=" + BillNo);
			System.out.println("接口订单结束");
		} else if (billnos.equals("RE")) {
			System.out.println("充值订单进行时");
			PaymentService.service.netcallback("", BillNo, "", sdf.format(new Date()),
					sdf.format(new Date()));
			response.sendRedirect(basePath + "/payment/showPayOk");
			System.out.println("充值订单结束");
		}
		//在界面显示，付款结果提示信息 Result
	} else {//失败处理
			//请修改订单状态,或者其他操作
		String billnostr = BillNo.substring(0, 1);
		String billnos = BillNo.substring(0, 2);
		if (billnostr.equals("O")) {
			System.out.println("接口订单进行时");
			YeepayService.service.failure(BillNo, sdf.format(new Date()));
			response.sendRedirect(basePath + "/yeepay/yeeReturn?r6_Order=" + BillNo);
			System.out.println("接口订单结束");
		} else if (billnos.equals("RE")) {
			System.out.println("充值订单进行时");
			PaymentService.service.failure(BillNo, sdf.format(new Date()));
			response.sendRedirect(basePath + "/payment/showPayNo");
			System.out.println("充值订单结束");
		}
		//在界面显示，付款结果提示信息 Result
	}
} else {
	out.println("交易签名被篡改!");
}
%>

