<%@page import="com.pay.caifutong.client.service.CaiFuTongService"%>
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.caifutong.server.ResponseHandler"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//---------------------------------------------------------
//�Ƹ�֧ͨ�����ʻص�����ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//��Կ
Gateway gate = Gateway.dao.findById(4);
String key = gate.getStr("gateway_key");
//key = "123456";

//����֧��Ӧ�����
ResponseHandler resHandler = new ResponseHandler(request, response);
resHandler.setKey(key);

//֧�������״̬��
String pay_result = resHandler.getParameter("pay_result");

//֧����Ϣ��������Ϣ
String pay_info = resHandler.getParameter("pay_info");

//�ж�ǩ��
if(resHandler.isTenpaySign()) {
	//���׵���
	String transaction_id = resHandler.getParameter("transaction_id");
	//������
	String sp_billno = resHandler.getParameter("sp_billno");
	//����
	String date = resHandler.getParameter("date");
	//���,�Է�Ϊ��λ
	String total_fee = resHandler.getParameter("total_fee");
	
	if( "0".equals(pay_result) ) {
		//------------------------------
		//����ҵ��ʼ
		//------------------------------ 
		CaiFuTongService.service.paymentnetcallback(transaction_id, sp_billno, "", date, date);
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
	out.println("״̬�룺" + pay_result);
	out.println("������Ϣ��" + pay_info);	
	
	//������Ϣ
	/*
	String debugInfo = resHandler.getDebugInfo();
	System.out.println("debugInfo:" + debugInfo);
	*/
}

%>

