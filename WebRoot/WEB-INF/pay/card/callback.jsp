<%@page import="com.pay.cardyee.client.service.CardyeeService"%>
<%@page language="java" contentType="text/html;charset=gbk"%>
<%!	String formatString(String text){ 
			if(text == null) {
				return ""; 
			}
			return text;
		}
%>
<%
	String r0_Cmd 	  = formatString((String)request.getAttribute("r0_Cmd")); // ҵ������
	String r1_Code    = formatString((String)request.getAttribute("r1_Code"));// ֧�����
	String r6_Order   = formatString((String)request.getAttribute("r6_Order"));// �̻�������
	String rq_ReturnMsg       = formatString((String)request.getAttribute("rq_ReturnMsg"));
	String hmac       = formatString((String)request.getAttribute("hmac"));// ǩ������
	out.println("r0_Cmd="+r0_Cmd+"&r1_Code="+r1_Code+"&r6_Order="+r6_Order+"&rq_ReturnMsg="+rq_ReturnMsg+"&hmac="+hmac);
%>