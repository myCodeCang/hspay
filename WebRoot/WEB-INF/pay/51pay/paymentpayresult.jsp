
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.shpay.service.DigestUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(18);
	String MD5key = gateway.getStr("gateway_key"); // 商家密钥
	String MerNo = gateway.getStr("gateway_merid"); // 商户编号

    String state = request.getParameter("state");
    String sd51no = request.getParameter("sd51no");
    String BillNo = request.getParameter("sdcustomno");
    String sign = request.getParameter("sign");

	String sbOld = "";
	sbOld += "sdcustomno=" + BillNo;
	sbOld += "&state=" + state;
	sbOld += "&sd51no=" + sd51no;
	sbOld += "&key="+MD5key;

    String nhmac = DigestUtil.GetMD5(sbOld, true); //数据签名
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (nhmac.equals(sign)) {
		if ("1".equals(state)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = BillNo.substring(0, 1);
			String billnos = BillNo.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("接口订单进行时");
				YeepayService.service.netcallback(sd51no, BillNo, "", sdf.format(new Date()),
						sdf.format(new Date()));
				response.sendRedirect(basePath + "/shpay/shpayreturn?orderId=" + BillNo);
				System.out.println("接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("充值订单进行时");
				PaymentService.service.netcallback(sd51no, BillNo, "", sdf.format(new Date()),
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
		out.println("<result>1</result>");
	} else {
		out.println("<result>0</result><message>Signature forgery!</message>");
	}
%>

