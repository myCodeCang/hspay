
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.tool.MD5Utils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(16);
	String MD5key = gateway.getStr("gateway_key"); // 商家密钥
	String p1_MerId = gateway.getStr("gateway_merid"); // 商户编号
	String returncode = request.getParameter("returncode");
	String userid = request.getParameter("userid");
	String orderid = request.getParameter("orderid"); 
	String money = request.getParameter("money"); // 支付金额
	String sign = request.getParameter("sign");
	String sign2 = request.getParameter("sign2");

	String hmac1 = "",hmac2 = "";
	String sbOld1 = "returncode="+returncode;
	sbOld1 += "&userid="+userid;
	sbOld1 += "&orderid="+orderid;
	sbOld1 += "&keyvalue="+MD5key;

	hmac1 = MD5Utils.createMD5(sbOld1.toLowerCase()); // 数据签名
	String sbOld2="money="+money;
	sbOld2 += "&returncode="+returncode;
	sbOld2 += "&userid="+userid;
	sbOld2 += "&orderid="+orderid;
	sbOld2 += "&keyvalue="+MD5key;
	hmac2 = MD5Utils.createMD5(sbOld2.toLowerCase());
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (hmac1.toLowerCase().equals(sign.toLowerCase())&&hmac2.toLowerCase().equals(sign2.toLowerCase())) {
		String url1="";
		if ("1".equals(returncode)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = orderid.substring(0, 1);
			String billnos = orderid.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("1接口订单进行时");
				YeepayService.service.netcallback("", orderid, "", sdf.format(new Date()),
						sdf.format(new Date()));
				url1=basePath + "/mzfpay/mzfpayreturn?orderId=" + orderid;
				System.out.println("1接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("1充值订单进行时");
				PaymentService.service.netcallback("", orderid, "", sdf.format(new Date()),
						sdf.format(new Date()));
				url1=basePath + "/payment/showPayOk";
				System.out.println("1充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		} else {//失败处理
				//请修改订单状态,或者其他操作
			String billnostr = orderid.substring(0, 1);
			String billnos = orderid.substring(0, 2);
			if (billnostr.equals("O")) {
				System.out.println("2接口订单进行时");
				YeepayService.service.failure(orderid, sdf.format(new Date()));
				url1=basePath + "/yeepay/yeeReturn?r6_Order=" + orderid;
				System.out.println("2接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("2充值订单进行时");
				PaymentService.service.failure(orderid, sdf.format(new Date()));
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
		out.println("返回的签名错误");
	}
%>

