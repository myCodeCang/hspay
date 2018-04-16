
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.hundred.server.DigestUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String CharacterEncoding = "UTF-8";
	request.setCharacterEncoding(CharacterEncoding);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

	Gateway gateway = Gateway.dao.findById(17);
	String MD5key = gateway.getStr("gateway_key"); // 商家密钥
	String MerNo = gateway.getStr("gateway_merid"); // 商户编号

	String Key = "";								//商户密钥
    String p1_MerId = "";							//商户ID
    String r0_Cmd = request.getParameter("r0_Cmd");
    String r1_Code = request.getParameter("r1_Code");
    String r2_TrxId = request.getParameter("r2_TrxId");	//平台流水号
    String r3_Amt = request.getParameter("r3_Amt");		//支付金额
    String r4_Cur = request.getParameter("r4_Cur");
    String r5_Pid = request.getParameter("r5_Pid");
    String BillNo =request.getParameter("r6_Order");	//商户订单号
    String r7_Uid = request.getParameter("r7_Uid");
    String r8_MP = request.getParameter("r8_MP");
    String r9_BType = request.getParameter("r9_BType");  //通知类型 1同步通知 2异步通知
    String rp_PayDate = request.getParameter("rp_PayDate");
    String hmac = request.getParameter("hmac");			//数据签名

    String sbOld = "";
    sbOld += p1_MerId;
    sbOld += r0_Cmd;
    sbOld += r1_Code;
    sbOld += r2_TrxId;
    sbOld += r3_Amt;
    sbOld += r4_Cur;
    sbOld += r5_Pid;
    sbOld += BillNo;
    sbOld += r7_Uid;
    sbOld += r8_MP;
    sbOld += r9_BType;        
    sbOld += rp_PayDate;

    String nhmac = DigestUtil.hmacSign(sbOld, Key); //数据签名
    
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (nhmac.equals(hmac)) {
		if ("1".equals(r1_Code)) {
			//请修改订单成功状态,或者其他操作
			String billnostr = BillNo.substring(0,1);
			String billnos = BillNo.substring(0,2);
			if(billnostr.equals("O")){
				System.out.println("接口订单进行时");
				YeepayService.service.netcallback(r2_TrxId, BillNo, "", sdf.format(new Date()), sdf.format(new Date()));
				response.sendRedirect(basePath+"/hundredy/hundredreturn?orderId="+BillNo);
				System.out.println("接口订单结束");
			}else if(billnos.equals("RE")){
				System.out.println("充值订单进行时");
				PaymentService.service.netcallback(r2_TrxId, BillNo, "",sdf.format(new Date()), sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayOk");
				System.out.println("充值订单结束");
			}
			//在界面显示，付款结果提示信息 Result
		} else {//失败处理
				//请修改订单状态,或者其他操作
			String billnostr = BillNo.substring(0,1);
			String billnos = BillNo.substring(0,2);
			if(billnostr.equals("O")){
				System.out.println("接口订单进行时");
				YeepayService.service.failure(BillNo, sdf.format(new Date()));
				response.sendRedirect(basePath+"/yeepay/yeeReturn?r6_Order="+BillNo);
				System.out.println("接口订单结束");
			}else if(billnos.equals("RE")){
				System.out.println("充值订单进行时");
				PaymentService.service.failure(BillNo,sdf.format(new Date()));
				response.sendRedirect(basePath + "/payment/showPayNo");
				System.out.println("充值订单结束");
			}
				//在界面显示，付款结果提示信息 Result
		}
	} else {
		out.println("交易签名被篡改!");
	}
%>

