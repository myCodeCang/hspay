<%@page import="com.pay.caifutong.server.client.ScriptClientResponseHandler"%>
<%@page import="com.pay.caifutong.server.client.TenpayHttpClient"%>
<%@page import="com.pay.caifutong.server.BaseSplitRequestHandler"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.File"%>
<%
    //�̻��� 
    String bargainor_id = request.getParameter("bargainor_id");
    //bargainor_id = "1900000109";
    //��Կ 
    String key = request.getParameter("key");
    //key = "8934e7d15453e97507ef794cf7b0519d";
    
    String sp_billno = request.getParameter("sp_billno");
    
    String transaction_id = request.getParameter("transaction_id");
    
    String total_fee = request.getParameter("total_fee");
    
  //�û����˽��
    String amts1 = request.getParameter("amts1");

    //ƽ̨����
    String amts2 = request.getParameter("amts2");

    //ƽ̨�Ƹ�ͨ�˺�
    String caifutongemial = request.getParameter("caifutongemial");

    //�û��Ƹ�ͨ�˺�
    String caifu_account = request.getParameter("caifu_account");
    
    //���������������
    BaseSplitRequestHandler reqHandler = new BaseSplitRequestHandler(null, null);
    //ͨ�Ŷ���
    TenpayHttpClient httpClient = new TenpayHttpClient();
    //Ӧ�����
    ScriptClientResponseHandler resHandler = new ScriptClientResponseHandler();
    
    //-----------------------------
    //�����������
    //-----------------------------
    reqHandler.init();
    reqHandler.setKey(key);
    reqHandler.setGateUrl("https://mch.tenpay.com/cgi-bin/split.cgi");
    String ddate1= new SimpleDateFormat("yyyyMMDDhhmmss").format(new Date());
    //-----------------------------
    //���ýӿڲ���
    //-----------------------------
    reqHandler.setParameter("cmdno", "3");
    reqHandler.setParameter("version", "4");
    reqHandler.setParameter("fee_type", "1");
    reqHandler.setParameter("bargainor_id", bargainor_id);    		    	//�̻���
    reqHandler.setParameter("sp_billno", sp_billno);    	    		//�̼Ҷ�����
    reqHandler.setParameter("transaction_id", transaction_id);	//�Ƹ�ͨ���׵���    
    reqHandler.setParameter("return_url", "http://127.0.0.1/");    	    //��̨ϵͳ���ã�������дΪhttp://127.0.0.1/
    reqHandler.setParameter("total_fee", total_fee);    	    	    	//��Ʒ���,�Է�Ϊ��λ
    reqHandler.setParameter("bus_type", "97");    	    	    	//ҵ������
    /**
     * ҵ�����
     * �ʺ�^���ʽ��^��ɫ
     * ��ɫ˵��:	1:��Ӧ�� 2:ƽ̨���� 3:�ʽ����㷽 4:��������
     * �ʺ�1^���ʽ��1^��ɫ1|�ʺ�2^���ʽ��2^��ɫ2|...
    **/
    reqHandler.setParameter("bus_args",  caifu_account+"^"+amts1+"^4|"+caifutongemial+"^"+amts2+"^1");

    //��ҵ������Ϣ
    reqHandler.setParameter("bus_desc","12345^����^1^spruce^1^1");
    
    //-----------------------------
    //����ͨ�Ų���
    //-----------------------------
    //֤���������û����ز�����Ŀ¼������֤�鱻��ȡ
    //����CA֤��
    httpClient.setCaInfo(new File("G:/Sirius/test/WebRoot/cacert.pem"));	
    //���ø���(�̻�)֤��
    httpClient.setCertInfo(new File("G:/Sirius/test/WebRoot/1215668201_20130311125023.pfx"), "1215668201");
    
    
    //������������
    httpClient.setReqContent(reqHandler.getRequestURL());
    System.out.println(reqHandler.getRequestURL());
    //��̨����
    if(httpClient.call()) {
    	//���ý������
    	resHandler.setContent(httpClient.getResContent());
    	resHandler.setKey(key);
    	
    	
    	//��ȡ���ز���
    	String pay_result = resHandler.getParameter("pay_result");
    	
    	//�ж�ǩ�������
    	if(resHandler.isTenpaySign()&& "0".equals(pay_result)) {
    		System.out.println("���˳ɹ�");
    		out.println("���˳ɹ�");
    		//ȡ���������ҵ����
    		
    	} else {
    		//����ʱ�����ؽ��δǩ����
    		//�����ʽ�����δȷ�Ͻ���ģ���ʹ��ԭ�����������·���ȷ�Ͻ���������β���
    		System.out.println("��֤ǩ��ʧ�ܻ�ҵ�����");
    		out.println("��֤ǩ��ʧ�ܻ�ҵ�����");
    		System.out.println("pay_result:" + resHandler.getParameter("pay_result")+
    	    	" pay_info:" + resHandler.getParameter("pay_info"));
    	}	
    } else {
    	System.out.println("��̨����ͨ��ʧ��");
    	out.println("��̨����ͨ��ʧ��");
    	System.out.println(httpClient.getResponseCode());
    	System.out.println(httpClient.getErrInfo());
    	//�п�����Ϊ����ԭ�������Ѿ�������δ�յ�Ӧ��
    }

%>
