<%@page import="com.pay.caifutong.client.service.CaiFuTongService"%>
<%@page import="com.pay.caifutong.server.util.TenpayUtil"%>
<%@page import="com.pay.caifutong.server.client.ScriptClientResponseHandler"%>
<%@page import="com.pay.caifutong.server.client.TenpayHttpClient"%>
<%@page import="com.pay.caifutong.server.BaseSplitRequestHandler"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.File"%>
<%
    //�̻��� 
    String bargainor_id = request.getParameter("bargainor_id");

    //��Կ 
    String key = request.getParameter("key");
    
  	//������
    String sp_billno = request.getParameter("sp_billno");
  	
  	//�Ƹ�ͨ�������
  	String transaction_id = request.getParameter("transaction_id");
  	
  	//���
  	String total_fee = request.getParameter("total_fee");
  	
  	//�̻����ʺ���
  	String amts1 = request.getParameter("amts1");
  	
  	//ƽ̨����
  	String amts2 = request.getParameter("amts2");
  	
  	//ƽ̨�˺�
  	String caifutongemial = request.getParameter("caifutongemial");
  	
  	//�̻��˺�
  	String caifu_account = request.getParameter("caifu_account");
  	
  //---------------���ɶ����� ��ʼ------------------------
  //��ǰʱ�� yyyyMMddHHmmss
  String currTime = TenpayUtil.getCurrTime();
  //8λ����
  String strDate = currTime.substring(0, 8);
  //6λʱ��
  String strTime = currTime.substring(8, currTime.length());
  //��λ�����
  String strRandom = TenpayUtil.buildRandom(1) + "";
  //10λ���к�,�������е�����
  String strReq = strTime + strRandom;
  //�̼Ҷ����ţ�����������32λ��ȡǰ32λ���Ƹ�ֻͨ��¼�̼Ҷ����ţ�����֤Ψһ��
  //�Ƹ�ͨ���׵��ţ�����Ϊ��10λ�̻���+8λʱ�䣨YYYYmmdd)+10λ��ˮ�ţ��̻������Լ����������ֻҪ��֤Ψһ
  String refund_id = 109 + bargainor_id + strDate + strReq;
  //---------------���ɶ����� ����------------------------
  	
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
    reqHandler.setGateUrl("https://mch.tenpay.com/cgi-bin/split_rollback.cgi");
    
    //-----------------------------
    //���ýӿڲ���
    //-----------------------------
    reqHandler.setParameter("cmdno", "95");
    reqHandler.setParameter("version", "4");
    reqHandler.setParameter("fee_type", "1");
    reqHandler.setParameter("bargainor_id", bargainor_id);    	        //�̻���
    reqHandler.setParameter("sp_billno", sp_billno);    	    		//�̼Ҷ�����
    reqHandler.setParameter("transaction_id", transaction_id);	//�Ƹ�ͨ���׵���    
    reqHandler.setParameter("return_url", "http://127.0.0.1/");    	    //��̨ϵͳ���ã�������дΪhttp://127.0.0.1/
    reqHandler.setParameter("total_fee", total_fee);    	    	    	//��Ʒ���,�Է�Ϊ��λ
    //�˿�ID��ͬ��ID�Ƹ�ͨ��Ϊ��ͬһ���˿�,��ʽΪ109+10λ�̻���+8λ����+7λ���к�
    reqHandler.setParameter("refund_id", refund_id);
    reqHandler.setParameter("bus_type", "97");
    
    //ҵ��������ض���ʽ���ַ�������ʽΪ
    //�˿��ܶ�|�˻�^�˿���[|�˻�^�˿���]
    reqHandler.setParameter("bus_args", total_fee+"|"+caifu_account+"^"+amts1+"|"+caifutongemial+"^"+amts2);
    //reqHandler.setParameter("bus_args", "3|896070200^1|1445575273^1|1552565201^1");
    //-----------------------------
    //����ͨ�Ų���
    //-----------------------------
    //֤���������û����ز�����Ŀ¼������֤�鱻��ȡ
    //����CA֤��
    httpClient.setCaInfo(new File("cacert.pem"));	
    //���ø���(�̻�)֤��
    httpClient.setCertInfo(new File("1900000107.pfx"), "1900000107");
    //������������
    httpClient.setReqContent(reqHandler.getRequestURL());

    //��̨����
    if(httpClient.call()) {
    	//���ý������
    	String tmp = httpClient.getResContent();
    	resHandler.setContent(tmp);
    	resHandler.setKey(key);
    	
    	
    	//��ȡ���ز���
    	String pay_result = resHandler.getParameter("pay_result");
    	
   		String pay_info = resHandler.getParameter("pay_info");
    	
   		refund_id = reqHandler.getParameter("refund_id");
   		
    	//�ж�ǩ�������
    	if(resHandler.isTenpaySign()&& "0".equals(pay_result)) {
    		CaiFuTongService.service.caifutongOrderreturn(sp_billno, pay_result, pay_info, refund_id);
    		System.out.println("���˻��˳ɹ�");
    		out.println("���˻��˳ɹ�");
    		//ȡ���������ҵ����
    		
    	} else {
    		//����ʱ�����ؽ��δǩ����
    		//�����ʽ�����δȷ�Ͻ���ģ���ʹ��ԭ��refund_id���·���ȷ�Ͻ���������β���
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
