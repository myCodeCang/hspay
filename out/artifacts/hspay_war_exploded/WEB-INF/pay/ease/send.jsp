<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.capinfo.crypt.*"%>
<%
/**
	��ҳ������������֧���ύҳ�档�ӿ��ĵ��ĵ�һ���֡���һ��13���Щ���������ó������档���Ų���ȡ�����ߵ�������Ϣ��
*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
  String v_mid = (String)request.getAttribute("v_mid");		//�̻���ţ�ǩԼ����֧�����䡣250�ǲ����̻���š�
  String ddate1= new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
  String v_oid = ddate1+"-"+v_mid+"-"+(String)request.getAttribute("v_oid");  //������ţ�������ŵĸ�ʽ:yyyymmdd-v_mid-��ˮ�š���ˮ�ſ��԰����Լ��Ķ����������ɣ�����Ҫ��֤ÿһ���ύ����������Ψһֵ����������
  String v_rcvname = (String)request.getAttribute("v_mid"); //�ջ����������������̻���Ŵ��档
  String v_rcvaddr = "����"; //�ջ��������������ó���
  String v_rcvtel = "12345678912";  	//�ջ��˵绰�������ó���
  String v_rcvpost = "100080";					//�ջ����ʱ࣬�����ó���
  String v_amount = (String)request.getAttribute("v_amount"); //�������
  String v_ymd = ddate1;        //��������
  String v_orderstatus = "1";		//���״̬��0-δ���룬1-�����롣
  String v_ordername = "����";  //�����������������ó���
  String v_moneytype = "0";  //���֡�0-����ң�1-��Ԫ��
  String v_url = (String)request.getAttribute("v_url");  //֧����ɺ󷵻ص�ַ���˵�ַ��֧����ɺ󣬶�����Ϣʵʱ���������ַ�����ء����ز�������ӿ��ĵ��ڶ����֡�
  String MD5Key = (String)request.getAttribute("MD5Key"); //MD5Key,ǩԼ�����̻��Զ���һ��16λ��������ĸ�����Ϊ��Կ������huangyi@payeasenet.com.˵���̻���ţ���˾���ƺ���Կ��
  //MD5�㷨
  Md5 md5 = new Md5 ("") ;
  md5.hmac_Md5(v_moneytype+v_ymd+v_amount+v_rcvname+v_oid+v_mid+v_url,MD5Key) ;
  byte b[]= md5.getDigest();
  String digestString = md5.stringify(b) ;
  String v_pmode = (String)request.getAttribute("v_pmode");
  System.out.println("send�ύ��=========v_mid:"+v_mid);
  System.out.println("ddate1:"+ddate1);
  System.out.println("v_oid:"+v_oid);
  System.out.println("v_rcvname:"+v_rcvname);
  System.out.println("v_rcvaddr:"+v_rcvaddr);
  System.out.println("v_rcvtel:"+v_rcvtel);
  System.out.println("v_rcvpost:"+v_rcvpost);
  System.out.println("v_amount:"+v_amount);
  System.out.println("v_ymd:"+v_ymd);
  System.out.println("v_orderstatus:"+v_orderstatus);
  System.out.println("v_ordername:"+v_ordername);
  System.out.println("v_moneytype:"+v_moneytype);
  System.out.println("v_url:"+v_url);
  System.out.println("MD5Key:"+MD5Key);
  System.out.println("digestString:"+digestString);
  System.out.println("v_pmode:"+v_pmode);
  System.out.println("send�ύ����===================");
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
		<p class="pzs">${title }</p>
		<img src="<%=basePath %>/img/ajax-loaders/ajax-loader-7.gif" />
	</div>
<form action="http://pay.beijing.com.cn/customer/gb/pay_bank.jsp" method="POST" name="ease">
  <input type="hidden" name="v_md5info" size="100"  value="<%=digestString%>">
	<input type="hidden" name="v_mid" value="<%=v_mid%>">
	<input type="hidden" name="v_oid" value="<%=v_oid%>">
	<input type="hidden" name="v_rcvname" value="<%=v_rcvname%>">
	<input type="hidden" name="v_rcvaddr" value="<%=v_rcvaddr%>">
	<input type="hidden" name="v_rcvtel" value="<%=v_rcvtel%>">
	<input type="hidden" name="v_rcvpost" value="<%=v_rcvpost%>">
	<input type="hidden" name="v_amount" value="<%=v_amount%>">
	<input type="hidden" name="v_ymd"  value="<%=v_ymd%>">
	<input type="hidden" name="v_orderstatus"  value="<%=v_orderstatus%>">
	<input type="hidden" name="v_ordername"  value="<%=v_ordername%>">
	<input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
	<input type="hidden" name="v_url" value="<%=v_url%>">
	<input type="hidden" name="v_pmode" value="<%=v_pmode %>"/>
</form>
</body>
<script type="text/javascript">
		function sub(){
			document.ease.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub,titletime);
	</script>
</html>