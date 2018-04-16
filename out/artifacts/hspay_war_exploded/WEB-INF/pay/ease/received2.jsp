<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.jsp.payment.service.PaymentService"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<%@ page pageEncoding="GB2312"%>
<%@ page import="com.capinfo.crypt.*"%>
<%@ page import="java.lang.String.*"%>
<%
	request.setCharacterEncoding("8859_1");
	//��ȡ����
	String v_oid = request.getParameter("v_oid");//�������
	String v_pmode = request.getParameter("v_pmode");//֧����ʽ
	String v_pstatus = request.getParameter("v_pstatus");//֧����� 1֧���ɹ� 3 ֧��ʧ��
	String v_pstring = request.getParameter("v_pstring");//֧�������Ϣ˵��
	String v_count = request.getParameter("v_count");//��������
	String v_amount = request.getParameter("v_amount");//�������
	String v_moneytype = request.getParameter("v_moneytype");//����
	String v_md5money = request.getParameter("v_md5money");//����ָ��
	String v_mac = request.getParameter("v_mac");//����ָ��
	String v_sign = request.getParameter("v_sign");//RSA����ָ��
	//����ת��

	v_pstring = new String(v_pstring.getBytes("8859_1"));
	v_pmode = new String(v_pmode.getBytes("8859_1"));

	System.out.println("received2��������==============================");
	System.out.println("v_oid:"+v_oid);
	System.out.println("v_pmode:"+v_pmode);
	System.out.println("v_pstatus:"+v_pstatus);
	System.out.println("v_pstring:"+v_pstring);
	System.out.println("v_count"+v_count);
	System.out.println("v_amount:"+v_amount);
	System.out.println("v_moneytype:"+v_moneytype);
	System.out.println("v_md5money:"+v_md5money);
	System.out.println("v_mac:"+v_mac);
	System.out.println("v_sign:"+v_sign);
	System.out.println("received2�������ݽ���==============================");
	
	//��ֲ���
	String[] resultoid = v_oid.split("[|][_][|]");
	String[] resultpmode = v_pmode.split("[|][_][|]");
	String[] resultstatus = v_pstatus.split("[|][_][|]");
	String[] resultpstring = v_pstring.split("[|][_][|]");
	String[] resultamount = v_amount.split("[|][_][|]");
	String[] resultmoneytype = v_moneytype.split("[|][_][|]");

	//web.xml��дUTF-8������
	//v_pstring = new String(v_pstring.getBytes("ISO8859-1"), "GB2312");
	//v_pmode = new String(v_pmode.getBytes("ISO8859-1"), "GB2312"); 

	String source1 = v_oid + v_pmode + v_pstatus + v_pstring + v_count;
	String source2 = v_amount + v_moneytype;

	Gateway gateway = Gateway.dao.findById(8);
	String keyValue = gateway.getStr("gateway_key");   // �̼���Կ
	
	//md5����1

	Md5 md5 = new Md5("");
	md5.hmac_Md5(source1, keyValue);
	byte b[] = md5.getDigest();
	String digestString = md5.stringify(b);

	//md5����2

	Md5 m = new Md5("");
	md5.hmac_Md5(source2, keyValue);
	byte a[] = md5.getDigest();
	String digestString2 = md5.stringify(a);

	String publicKey = "D:/tomcat/webworkhs/haosong/WEB-INF/pay/ease/Public1024.key"; 
	String SignString = v_sign;
	String strSource = v_oid + v_pstatus + v_amount + v_moneytype
			+ v_count;
	RSA_MD5 rsaMD5 = new RSA_MD5();
	int k = rsaMD5.PublicVerifyMD5(publicKey, SignString, strSource);
	
	System.out.println("received2��֤����=================================");
	System.out.println("digestString:"+digestString);
	System.out.println("digestString2:"+digestString2);
	System.out.println("k:"+k);
	System.out.println("received2��֤���ݽ���==================================");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (digestString2.equals(v_md5money) && digestString.equals(v_mac)&&k == 0) {
		out.println("sent");
		for(int i=0; i<Integer.parseInt(v_count); i++){
			if(resultstatus[i].equals("1")){
				String[] v_oidu = resultoid[i].split("-");
				System.out.println("����===="+v_oidu[2]);
				String orderid = v_oidu[2].substring(0,1);
				String orderi = v_oidu[2].substring(0,2);
				if(orderid.equals("O")){
					System.out.println("�ӿڶ�������ʱ");
					YeepayService.service.netcallback("", v_oidu[2], "", sdf.format(new Date()), sdf.format(new Date()));
					YeepayService.service.asynchronous(v_oidu[2]);
					System.out.println("�ӿڶ�������");
				}else if(orderi.equals("RE")){
					System.out.println("��ֵ��������ʱ");
					PaymentService.service.netcallback("", v_oidu[2], "", sdf.format(new Date()), sdf.format(new Date()));
					System.out.println("��ֵ��������");
				}
				
			}
		}
	} else {
		out.println("error");
		/* out.print("<br>"); */
	}

	//RSA��֤
	/* 	out.print("<br>");
	 out.println ("RSA��֤���");
	 out.print("<br>"); */
	//���ݿ������
%>