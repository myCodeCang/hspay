<%@page import="com.pay.caifutong.server.BaseSplitRequestHandler"%>
<%@page import="com.pay.caifutong.server.util.TenpayUtil"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//---------------------------------------------------------
//�Ƹ�֧ͨ������������ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//�̻���
String bargainor_id = request.getParameter("bargainor_id");
//bargainor_id = "2000000501";
//��Կ
String key = request.getParameter("key");
//key = "123456";
//���ش����ַ,��ʵ����������д����������IP��������
String return_url = request.getParameter("return_url");

//���б��
String bank_type = request.getParameter("bank_type");

//��Ʒ����
String desc = request.getParameter("desc");

//��Ʒ���
String total_fee = request.getParameter("total_fee");

//ip
String ip = request.getParameter("ip");

//�û����˽��
String amts1 = request.getParameter("amts1");

//ƽ̨����
String amts2 = request.getParameter("amts2");

//ƽ̨�Ƹ�ͨ�˺�
String caifutongemial = request.getParameter("caifutongemial");

//�û��Ƹ�ͨ�˺�
String caifu_account = request.getParameter("caifu_account");
//---------------���ɶ����� ��ʼ------------------------
//��ǰʱ�� yyyyMMddHHmmss
String currTime = TenpayUtil.getCurrTime();
//8λ����
String strDate = currTime.substring(0, 8);
//6λʱ��
String strTime = currTime.substring(8, currTime.length());
//��λ�����
String strRandom = TenpayUtil.buildRandom(4) + "";
//10λ���к�,�������е�����
String strReq = strTime + strRandom;
//�̼Ҷ����ţ�����������32λ��ȡǰ32λ���Ƹ�ֻͨ��¼�̼Ҷ����ţ�����֤Ψһ��
String sp_billno = request.getParameter("sp_billno");
//�Ƹ�ͨ���׵��ţ�����Ϊ��10λ�̻���+8λʱ�䣨YYYYmmdd)+10λ��ˮ�ţ��̻������Լ����������ֻҪ��֤Ψһ
String transaction_id = bargainor_id + strDate + strReq;
//---------------���ɶ����� ����------------------------

//����֧���������
BaseSplitRequestHandler reqHandler = new BaseSplitRequestHandler(request, response);
reqHandler.init();
reqHandler.setKey(key);
reqHandler.setGateUrl("https://www.tenpay.com/cgi-bin/v4.0/pay_set.cgi");

//-----------------------------
//����֧������
//-----------------------------
reqHandler.setParameter("bank_type", bank_type);
reqHandler.setParameter("cmdno", "1");
reqHandler.setParameter("date", strDate);
reqHandler.setParameter("fee_type", "1");
reqHandler.setParameter("version", "4");

reqHandler.setParameter("bargainor_id", bargainor_id);			//�̻���
reqHandler.setParameter("sp_billno", sp_billno);				//�̼Ҷ�����
reqHandler.setParameter("transaction_id", transaction_id);		//�Ƹ�ͨ���׵���
reqHandler.setParameter("return_url", return_url);				//֧��֪ͨurl
reqHandler.setParameter("desc", desc);				//��Ʒ����
reqHandler.setParameter("total_fee", total_fee);						//��Ʒ���,�Է�Ϊ��λ
reqHandler.setParameter("spbill_create_ip", ip);  //�û�IP

//ҵ������
reqHandler.setParameter("bus_type", "97");

/**
 * ҵ�����
 * �ʺ�^���ʽ��^��ɫ
 * ��ɫ˵��:	1:��Ӧ�� 2:ƽ̨���� 3:�ʽ����㷽 4:��������
 * �ʺ�1^���ʽ��1^��ɫ1|�ʺ�2^���ʽ��2^��ɫ2|...
 */
reqHandler.setParameter("bus_args", caifu_account+"^"+amts1+"^4|"+caifutongemial+"^"+amts2+"^1");
//��ҵ������Ϣ
reqHandler.setParameter("bus_desc","12345^����-�Ϻ�^1^fady^ׯ^13800138000");

//�����url
String requestUrl = reqHandler.getRequestURL();

String title = request.getParameter("title");
title = new String(title.getBytes("ISO-8859-1"),"UTF-8");



//debug��Ϣ
//String debuginfo = reqHandler.getDebugInfo();
//System.out.println("debuginfo:" + debuginfo);
//System.out.println("requestUrl:" + requestUrl);

%>
<html>
<head>
<style>
body{text-align:center;margin:0 atuto;}
.pzs{
	margin: 0;font-family: 'Karla', sans-serif;
  font-weight: bold;
  color: #317eac;
  text-rendering: optimizelegibility;
}
</style>
</head>
	<body>
	<div style="margin-top: 250px" align="center" >
		<p class="pzs"><%=title %></p>
		<img src="<%=basePath %>/img/ajax-loaders/ajax-loader-7.gif" />
	</div>
		<form name="yeepay" action='<%=requestUrl%>' method='POST'>
			
		</form>
	</body>
	<script type="text/javascript">
		function sub(){
			document.yeepay.submit();
		}
		var titletime = ${param["titletime"]};
		setTimeout(sub,titletime);
	</script>
</html>
