
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.mzfpay.service.DigestUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(20);
	String MD5key = gateway.getStr("gateway_key"); // 商家密钥
	String p1_MerId = gateway.getStr("gateway_merid"); // 商户编号
	String r0_Cmd = request.getParameter("r0_Cmd");
	String r1_Code = request.getParameter("r1_Code");
	String r2_TrxId = request.getParameter("r2_TrxId"); // 平台流水号
	String r3_Amt = request.getParameter("r3_Amt"); // 支付金额
	String r4_Cur = request.getParameter("r4_Cur");
	String r5_Pid = request.getParameter("r5_Pid");
	String r6_Order = request.getParameter("r6_Order"); // 商户订单号
	String r7_Uid = request.getParameter("r7_Uid");
	String r8_MP = request.getParameter("r8_MP");
	String r9_BType = request.getParameter("r9_BType"); // 通知类型 1同步通知 2异步通知
	String rp_PayDate = request.getParameter("rp_PayDate");
	String sign = request.getParameter("hmac"); // 数据签名

	String sbOld = "";
	sbOld += p1_MerId;
	sbOld += r0_Cmd;
	sbOld += r1_Code;
	sbOld += r2_TrxId;
	sbOld += r3_Amt;
	sbOld += r4_Cur;
	sbOld += r5_Pid;
	sbOld += r6_Order;
	sbOld += r7_Uid;
	sbOld += r8_MP;
	sbOld += r9_BType;

	String nhmac = DigestUtil.hmacSign(sbOld, MD5key); //数据签名
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (nhmac.equals(sign)) {
		String url1="";
		if ("1".equals(r1_Code)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = r6_Order.substring(0, 1);
			String billnos = r6_Order.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("1接口订单进行时");
				YeepayService.service.netcallback(r2_TrxId, r6_Order, "", sdf.format(new Date()),
						sdf.format(new Date()));
				url1=basePath + "/mzfpay/mzfpayreturn?orderId=" + r6_Order;
				System.out.println("1接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("1充值订单进行时");
				PaymentService.service.netcallback(r2_TrxId, r6_Order, "", sdf.format(new Date()),
						sdf.format(new Date()));
				url1=basePath + "/payment/showPayOk";
				System.out.println("1充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		} else {//失败处理
				//请修改订单状态,或者其他操作
			String billnostr = r6_Order.substring(0, 1);
			String billnos = r6_Order.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("2接口订单进行时");
				YeepayService.service.failure(r6_Order, sdf.format(new Date()));
				url1=basePath + "/yeepay/yeeReturn?r6_Order=" + r6_Order;
				System.out.println("2接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("2充值订单进行时");
				PaymentService.service.failure(r6_Order, sdf.format(new Date()));
				url1=basePath + "/payment/showPayNo";
				System.out.println("2充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		}
		out.println("SUCCESS");
		out.print("<!doctype html>");
		out.print("<html lang=\"en\">");
		out.print(" <head>");
		out.print("  <meta charset=\"UTF-8\">");
		out.print("  <title>正在跳转</title>");
		out.print(" </head>");
		out.print(" <body>");
		out.print("<script type=\"text/javascript\">");
		out.print("setTimeout(function(){window.location.href='"+url1+"';},500);");
		out.print("</script>");
		out.print(" </body>");
		out.print("</html>");
	} else {
		out.println("Error");
	}
%>

