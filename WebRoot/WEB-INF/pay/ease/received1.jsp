<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vo.Gateway"%>
<%@page import="com.pay.yeepay.client.service.YeepayService"%>
<%@page contentType="text/html;charset=gb2312"%>
<%@page import="com.capinfo.crypt.*"%>

<%
	//���ղ���
	request.setCharacterEncoding("gb2312");
	String v_oid = request.getParameter("v_oid");//�������
	String v_pmode = request.getParameter("v_pmode");//֧����ʽ
	String v_pstatus = request.getParameter("v_pstatus");//֧����� 20֧���ɹ� 30 ֧��ʧ��
	String v_pstring = request.getParameter("v_pstring");//֧�������Ϣ˵��
	String v_amount = request.getParameter("v_amount");//�������
	String v_moneytype = request.getParameter("v_moneytype");//����
	String v_md5money = request.getParameter("v_md5money");//����ָ��
	String v_md5info = request.getParameter("v_md5info");//����ָ��
	String v_sign = request.getParameter("v_sign");//RSA����ָ��

	
	//���Ľ���
	v_pstring = new String(v_pstring.getBytes("8859_1"));
	v_pmode = new String(v_pmode.getBytes("8859_1"));

	System.out.println("received1��������==============================");
	System.out.println("v_oid:"+v_oid);
	System.out.println("v_pmode:"+v_pmode);
	System.out.println("v_pstatus:"+v_pstatus);
	System.out.println("v_pstring:"+v_pstring);
	System.out.println("v_amount:"+v_amount);
	System.out.println("v_moneytype:"+v_moneytype);
	System.out.println("v_md5money:"+v_md5money);
	System.out.println("v_md5info:"+v_md5info);
	System.out.println("v_sign:"+v_sign);
	System.out.println("received1�������ݽ���==============================");
	
	String source1 = v_oid + v_pstatus + v_pstring + v_pmode;
	String source2 = v_amount + v_moneytype;

	/*  out.println("v_pmode:");
	 out.print(v_pmode);  
	 out.print("<br>");  
	 
	 out.println("v_pstring:");
	 out.print(v_pstring);  
	 out.print("<br>");  
	 
	 
	 out.println("v_md5infoָ�ƽ��");
	 out.print("<br>");   */
	request.setCharacterEncoding("gb2312");

	Gateway gateway = Gateway.dao.findById(8);
	String keyValue = gateway.getStr("gateway_key");   // �̼���Կ
	 
	Md5 md5 = new Md5("");
	md5.hmac_Md5(source1, keyValue);
	byte b[] = md5.getDigest();
	String digestString = md5.stringify(b);

	/*   out.println (digestString) ;
	 out.print("<br>"); 
	

	 out.println("v_md5moneyָ�ƽ��");
	 out.print("<br>");   */
	request.setCharacterEncoding("gb2312");

	Md5 m = new Md5("");
	md5.hmac_Md5(source2, keyValue);
	byte a[] = md5.getDigest();
	String digestString2 = md5.stringify(a);

	
	String publicKey = "D:/tomcat/webworkhs/haosong/WEB-INF/pay/ease/Public1024.key";  //public1024.key��·��
	String SignString = v_sign;
	String strSource = v_oid + v_pstatus + v_amount + v_moneytype;
	RSA_MD5 rsaMD5 = new RSA_MD5();
	int k = rsaMD5.PublicVerifyMD5(publicKey, SignString, strSource);
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	/* out.println (digestString2) ;
	out.print("<br>");

	
	out.println("���md5info�ԱȽ��");
	out.print("<br>"); */
	System.out.println("received1��֤����=================================");
	System.out.println("digestString:"+digestString);
	System.out.println("digestString2:"+digestString2);
	System.out.println("k:"+k);
	System.out.println("received1��֤���ݽ���==================================");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String[] v_oidu = v_oid.split("-");
	System.out.println("����===="+v_oidu[2]);
	if (digestString.equals(v_md5info)&&digestString2.equals(v_md5money)&&k == 0) {
		if(v_pstatus.equals("20")){
			YeepayService.service.netcallback("", v_oidu[2], "",sdf.format(new Date()), sdf.format(new Date()));
			response.sendRedirect(basePath+"/yeepay/yeeReturn?r6_Order="+v_oidu[2]);
		}else{
			YeepayService.service.failure(v_oidu[2], sdf.format(new Date()));
			response.sendRedirect(basePath+"/yeepay/yeeReturn?r6_Order="+v_oidu[2]);
		}
	} else {
		out.println("error");
	}
	//���ݿ������
%>