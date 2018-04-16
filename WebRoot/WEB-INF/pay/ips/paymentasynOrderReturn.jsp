<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="com.vo.Gateway"%>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

String billno=request.getParameter("billno");
String currency_type=request.getParameter("Currency_type");
String amount=request.getParameter("amount");
String mydate=request.getParameter("date");
String succ=request.getParameter("succ");
String msg=request.getParameter("msg");
String attach=request.getParameter("attach");
String ipsbillno=request.getParameter("ipsbillno");
String retEncodeType=request.getParameter("retencodetype");
String signature=request.getParameter("signature");
String bankbillno = request.getParameter("bankbillno");
//���ض������ܵ�����:billno+��������š�+currencytype+�����֡�+amount+��������+date+���������ڡ�+succ+���ɹ���־��+ipsbillno+��IPS������š�+retencodetype +�����׷���ǩ����ʽ��+���̻��ڲ�֤�顿 
String content="billno"+billno + "currencytype"+currency_type+"amount"+amount+"date"+mydate+"succ"+succ+"ipsbillno"+ipsbillno+"retencodetype"+retEncodeType;  //���ģ��������+�������+��������+�ɹ���־+IPS�������+����

boolean verify = false;

//��֤��ʽ��16-md5withRSA  17-md5
if(retEncodeType.equals("16"))
{
	cryptix.jce.provider.MD5WithRSA a=new cryptix.jce.provider.MD5WithRSA();
	a.verifysignature(content, signature, "c:\\PubKey\\publickey.txt");

	//Md5withRSA��֤���ش��뺬��
	//-99 δ����
	//-1 ��Կ·����
	//-2 ��Կ·��Ϊ��
	//-3 ��ȡ��Կʧ��
	//-4 ��֤ʧ�ܣ���ʽ����
	//1�� ��֤ʧ��
	//0: �ɹ�
	if (a.getresult() == 0)
	{
		verify = true;
	}	
}
else if(retEncodeType.equals("17"))
{
	Gateway gateway = Gateway.dao.findById(14);
	//��½http://merchant.ips.com.cn/�̻���̨���ص��̻�֤������
	String md5Key = gateway.getStr("gateway_key");
	cryptix.jce.provider.MD5 b=new cryptix.jce.provider.MD5();
	String SignMD5 = b.toMD5(content + md5Key).toLowerCase();
	
	if(SignMD5.equals(signature))
	{
		verify = true;
	}
}

if(verify)
{
	if (succ!=null)
	{
	 if(succ.equalsIgnoreCase("Y"))
	 {
		 PaymentService.service.netcallback(ipsbillno, billno, bankbillno, mydate, mydate);
	 }
	 else
	 {
		 PaymentService.service.failure(billno, mydate);
		 response.sendRedirect(basePath+"/payment/showPayNo");
	 }
	}
}
else
{
 out.println("��֤ʧ��");
}
%>