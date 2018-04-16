
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

	
	Gateway gateway = Gateway.dao.findById(19);
	String Key = gateway.getStr("gateway_key"); //商户密钥
	String p1_MerId = gateway.getStr("gateway_merid"); //商户ID
	
	Map<String, String> paramMap = DigestUtil.parseParam(request);
	String msg = DigestUtil.getSignMsg(paramMap, null);
	System.out.println("msg:"+msg);
			
	//成功收到通知需打印返回success
	//验签 
	String respMsgSign = paramMap.get("sign").toString();
	paramMap.remove("sign");
	String respSign = DigestUtil.setSign(paramMap,Key);
	String BillNo=paramMap.get("orderId").toString();
	String respCode=paramMap.get("respCode").toString();

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
				System.out.println("接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("充值订单进行时");
				PaymentService.service.netcallback("", BillNo, "", sdf.format(new Date()),
						sdf.format(new Date()));
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
				System.out.println("接口订单结束");
			} else if (billnos.equals("RE")) {
				System.out.println("充值订单进行时");
				PaymentService.service.failure(BillNo, sdf.format(new Date()));
				System.out.println("充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		}
		out.write("success");
	} else {
		out.write("fail");
	}
%>

