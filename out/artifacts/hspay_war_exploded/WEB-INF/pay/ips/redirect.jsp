<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.text.DecimalFormat"%> 
<%
//���������ַ��� �����������	
request.setCharacterEncoding("gb2312");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
//�ύ��ַ
String form_url;

	form_url = "http://pay.ips.net.cn/ipayment.aspx"; //����

	//form_url = "https://pay.ips.com.cn/ipayment.aspx"; //��ʽ

//�̻���
String Mer_code = (String)request.getAttribute("Mer_code");

//�̻�֤�飺��½http://merchant.ips.com.cn/�̻���̨���ص��̻�֤������
String Mer_key = (String)request.getAttribute("Mer_key");

//�̻��������
String Billno = (String)request.getAttribute("Billno");

//�������(����2λС��)
DecimalFormat currentNumberFormat=new DecimalFormat("#0.00"); 
String Amount = currentNumberFormat.format(Double.parseDouble((String)request.getAttribute("Amount")));
 
//��������
String Date = (String)request.getAttribute("Date");

//����  RMB �����
String Currency_Type = "RMB" ;

//֧������
String Gateway_Type = "01";

//����
String Lang = "GB";

//֧������ɹ����ص��̻�URL
String Merchanturl = (String)request.getAttribute("Merchanturl");

//֧�����ʧ�ܷ��ص��̻�URL
String FailUrl = (String)request.getAttribute("FailUrl");

//֧��������󷵻ص��̻�URL  ���鴫��
String ErrorUrl = "" ;

//�̻����ݰ�
String Attach = "";

//����֧���ӿڼ��ܷ�ʽ
String OrderEncodeType = "5";

//���׷��ؽӿڼ��ܷ�ʽ 
String RetEncodeType = "17";

//���ط�ʽ
String Rettype = "1";

//Server to Server ����ҳ��URL
String ServerUrl = (String)request.getAttribute("ServerUrl");

String Bankco = (String)request.getAttribute("Bankco");

String DoCredit = "";

if(!Bankco.equals("")){
	DoCredit = "1";
}

//����֧���ӿڵ�Md5ժҪ��ԭ��=������+���+����+֧������+�̻�֤�� 
cryptix.jce.provider.MD5 b=new cryptix.jce.provider.MD5();
//�������ܵ����� billno+��������š�+ currencytype +�����֡�+ amount +��������+ date +���������ڡ�+ orderencodetype +������֧���ӿڼ��ܷ�ʽ��+���̻��ڲ�֤���ַ����� 
String SignMD5 = b.toMD5("billno"+Billno +"currencytype"+Currency_Type+"amount"+ Amount + "date" +Date +"orderencodetype"+OrderEncodeType + Mer_key).toLowerCase();
%>
<html>
  <head>
    <title>��ת......</title>
    <meta http-equiv="content-Type" content="text/html; charset=gb2312" />
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
    <form action="<%=form_url%>" method="post" name="ips">
      <input type="hidden" name="Mer_code" value="<%=Mer_code%>">
      <input type="hidden" name="Billno" value="<%=Billno%>">
      <input type="hidden" name="Amount" value="<%=Amount%>" >
      <input type="hidden" name="Date" value="<%=Date%>">
      <input type="hidden" name="Currency_Type" value="<%=Currency_Type%>">
      <input type="hidden" name="Gateway_Type" value="<%=Gateway_Type%>">
      <input type="hidden" name="Lang" value="<%=Lang%>">
      <input type="hidden" name="Merchanturl" value="<%=Merchanturl%>">
      <input type="hidden" name="FailUrl" value="<%=FailUrl%>">
      <input type="hidden" name="ErrorUrl" value="<%=ErrorUrl%>">
      <input type="hidden" name="Attach" value="<%=Attach%>">
      <input type="hidden" name="OrderEncodeType" value="<%=OrderEncodeType%>">
      <input type="hidden" name="RetEncodeType" value="<%=RetEncodeType%>">
      <input type="hidden" name="Rettype" value="<%=Rettype%>">
      <input type="hidden" name="ServerUrl" value="<%=ServerUrl%>">
      <input type="hidden" name="SignMD5" value="<%=SignMD5%>">
      <%
      	if(!Bankco.equals("")){
      %>
      <input type="hidden" name="Bankco" value="<%=Bankco %>" />
      <input type="hidden" name="DoCredit" value="<%=DoCredit %>" />
      <%
      	}
      %>
    </form>
    <script type="text/javascript">
		function sub(){
			document.ips.submit();
		}
		var titletime = ${titletime};
		setTimeout(sub,titletime);
	</script>
  </body>
</html>
