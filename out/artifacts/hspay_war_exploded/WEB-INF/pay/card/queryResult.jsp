<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�û���ѯ</title>
</head>

<body>
<center>
<h2>��ѯ�ɹ�</h2> 
        <form name="ofpay" action="" method="POST" >
        <table><tr>
			<td><label>�� �� ��:</label></td><td><%=request.getAttribute("usercode") %></tr>
			<tr><td><label>�̻�������:</label></td><td><%=request.getAttribute("orderno") %></td></tr>
			<tr><td><label>ŷ����ˮ��:</label></td><td><%=request.getAttribute("billid") %></td></tr>
			<tr><td><label>��ֵ����ֵ:</label></td><td><%=request.getAttribute("value") %></td></tr>
			<tr><td><label>������:</label></td><td><%=request.getAttribute("accountvalue") %></td></tr>
			<tr><td><label>������:</label></td><td><%=request.getAttribute("result") %></td></tr>
	    	<tr><td><label>��Ϣ:</label></td><td><%=request.getAttribute("info") %></td></tr>
			<tr><td><label>ʱ��:</label></td><td><%=request.getAttribute("datetime") %></td></tr>
			</table>
		</form>
		</center>
</body>
</html>