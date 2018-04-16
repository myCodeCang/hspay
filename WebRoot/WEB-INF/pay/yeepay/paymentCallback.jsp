<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.yeepay.server.PaymentForOnlineService"%>
<%@page import="com.pay.yeepay.server.Configuration"%>
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page language="java" contentType="text/html;charset=gbk"%>
<%!	String formatString(String text){ 
			if(text == null) {
				return ""; 
			}
			return text;
		}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	String r0_Cmd 	  = formatString(request.getParameter("r0_Cmd")); // ҵ������
	String r1_Code    = formatString(request.getParameter("r1_Code"));// ֧�����
	String r2_TrxId   = formatString(request.getParameter("r2_TrxId"));// �ױ�֧��������ˮ��
	String r3_Amt     = formatString(request.getParameter("r3_Amt"));// ֧�����
	String r4_Cur     = formatString(request.getParameter("r4_Cur"));// ���ױ���
	String r5_Pid     = new String(formatString(request.getParameter("r5_Pid")).getBytes("iso-8859-1"),"gbk");// ��Ʒ����
	String r6_Order   = formatString(request.getParameter("r6_Order"));// �̻�������
	String r7_Uid     = formatString(request.getParameter("r7_Uid"));// �ױ�֧����ԱID
	String r8_MP      = new String(formatString(request.getParameter("r8_MP")).getBytes("iso-8859-1"),"gbk");// �̻���չ��Ϣ
	String r9_BType   = formatString(request.getParameter("r9_BType"));// ���׽����������
	String ru_Trxtime       = formatString(request.getParameter("ru_Trxtime"));
	String ro_BankOrderId       = formatString(request.getParameter("ro_BankOrderId"));
	String rp_PayDate       = formatString(request.getParameter("rp_PayDate"));
	String hmac       = formatString(request.getParameter("hmac"));// ǩ������
	
	Gateway gateway = Gateway.dao.findById(1);
	String keyValue = gateway.getStr("gateway_key");   // �̼���Կ
	String p1_MerId = gateway.getStr("gateway_merid");   // �̻����
	
	boolean isOK = false;
	// У�鷵�����ݰ�
	isOK = PaymentForOnlineService.verifyCallback(hmac,p1_MerId,r0_Cmd,r1_Code, 
			r2_TrxId,r3_Amt,r4_Cur,r5_Pid,r6_Order,r7_Uid,r8_MP,r9_BType,keyValue);
	if(isOK) {
		//�ڽ��յ�֧�����֪ͨ���ж��Ƿ���й�ҵ���߼�������Ҫ�ظ�����ҵ���߼�����
		if(r1_Code.equals("1")) {
			// ��Ʒͨ�ýӿ�֧���ɹ�����-������ض���
			if(r9_BType.equals("1")) {
				PaymentService.service.netcallback(r2_TrxId, r6_Order, ro_BankOrderId, rp_PayDate, ru_Trxtime);
				response.sendRedirect(basePath+"/payment/showPayOk");
//				out.println("callback��ʽ:��Ʒͨ�ýӿ�֧���ɹ�����-������ض���");
				// ��Ʒͨ�ýӿ�֧���ɹ�����-��������Ե�ͨѶ
			} else if(r9_BType.equals("2")) {
				// ����ڷ���������ʱ	����ʹ��Ӧ�����ʱ������Ӧ����"success"��ͷ���ַ�������Сд������
				out.println("SUCCESS");
				PaymentService.service.netcallback(r2_TrxId, r6_Order, ro_BankOrderId, rp_PayDate, ru_Trxtime);
			  // ��Ʒͨ�ýӿ�֧���ɹ�����-�绰֧������		
			}
			// ����ҳ������ǲ���ʱ�۲���ʹ��
//			out.println("<br>���׳ɹ�!<br>�̼Ҷ�����:" + r6_Order + "<br>֧�����:" + r3_Amt + "<br>�ױ�֧��������ˮ��:" + r2_TrxId);
		}else{
			PaymentService.service.failure(r6_Order, ru_Trxtime);
			response.sendRedirect(basePath+"/payment/showPayNo");
		}
	} else {
		out.println("����ǩ�����۸�!");
	}
%>