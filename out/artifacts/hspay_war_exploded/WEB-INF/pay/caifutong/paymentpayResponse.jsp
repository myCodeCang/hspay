<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.caifutong.server.PayResponseHandler"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//---------------------------------------------------------
//�Ƹ�ͨ��ʱ����֧��Ӧ�𣨴���ص���ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
//��Կ
Gateway gate = Gateway.dao.findById(4);
String key = gate.getStr("gateway_key");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//����֧��Ӧ�����
PayResponseHandler resHandler = new PayResponseHandler(request, response);
resHandler.setKey(key);

//�ж�ǩ��
if(resHandler.isTenpaySign()) {
	//���׵���
	String transaction_id = resHandler.getParameter("transaction_id");
	String sp_billno = resHandler.getParameter("sp_billno");
	//���,�Է�Ϊ��λ
	String total_fee = resHandler.getParameter("total_fee");
	String date = resHandler.getParameter("date");
	//֧�����
	String pay_result = resHandler.getParameter("pay_result");
	
	if( "0".equals(pay_result) ) {
		//------------------------------
		//����ҵ��ʼ
		//------------------------------ 
		PaymentService.service.netcallback(transaction_id, sp_billno, "", date, date);
		//ע�⽻�׵���Ҫ�ظ�����
		//ע���жϷ��ؽ��
		
		//------------------------------
		//����ҵ�����
		//------------------------------
			
		//����doShow, ��ӡmetaֵ��js����,���߲Ƹ�ͨ����ɹ�,�����û��������ʾshowҳ��.
		resHandler.doShow(basePath+"/payment/showPayOk");
	} else {
		//�������ɹ�����
		PaymentService.service.failure(sp_billno, date);
		resHandler.doShow(basePath+"/payment/showPayNo");
	}
	
} else {

	out.println("��֤ǩ��ʧ��");
	//debug��Ϣ
        String debuginfo = resHandler.getDebugInfo();
        System.out.println("debuginfo:" + debuginfo);
}

%>
