var vUrl= "";
//���г�ֵ
function CheckPostMsg_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ������ɳ�ֵ</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#'  onclick='javascript:reLoadTabBink();' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0'  class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'blue_001  f12\'>��������ѡ������</a>"+
	     "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";        
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }
//���ÿ���ֵ
function CheckCredit_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>"+
	    "&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'>"+
	   "<table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ������ɳ�ֵ</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td>"+
	    "</tr></table>"+
	   "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'>"+
	   "<a  href='#'   onclick='javascript:reLoadTab();' onclick='return DialogHide();'    class=\'white_001 fb f14 hand\'>"+
	   "<table  width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\' ><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table>"+
	   "</a>"+
	   "</td>"+
	   "<td align='center' valign='middle'>"+
	   "<span src='#' class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table>"+
	    "</span>"+
	    "</td></tr></table>"+ 
	    "</td></tr>"+
	   "<tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'>"+
	   "<tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	  	"<a  href='#'  onclick='return DialogHide();' class=\'blue_001  f12\'>��������ѡ������</a>"+
	    "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";           
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }
    
//��ͨ��ֵ
function CheckCartoon_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ��������ֻ�֧����ͨǩԼ</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>ǩԼ���ǰ�벻Ҫ�رձ�����<br />���ǩԼ��������ǩԼ��ɡ���ť</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#'  onclick='javascript:checkSigning();' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>ǩԼ���</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0'  class=\'\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	    
	     "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>"; 
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }

//�����˳�ֵʱ��ʾ�绰����ͽɷѽ��
function CheckMobileAndCountMsg_Fill(mobileNum,count)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    /*AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='25' align='center' valign='middle'>&nbsp;</td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>����Ҫ�ɷѵ��ֻ�������"+mobileNum+"</td></tr>"+
	    "<tr><td width='80' height='' align='center' valign='middle'>&nbsp;</td><td align='left' class=\'gray_006 f22 f_line1\'>�ɷѽ����"+count+"&nbsp;Ԫ</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick='showPaymentTabs(); return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>ȷ��</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><table  onclick='mobilefocus();return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></td></tr></table></td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";*/
	    AJAX_LoginBody="<div style='height:230px;weight:400px;border:1px solid #778899;'><br/><br/>����Ҫ�ɷѵ��ֻ�������:<font color='#A52A2A'><strong>"+mobileNum+"</strong></font><br><br>"+
	     							   "�ɷѽ����:<font color='#A52A2A'><strong>"+count+"</strong></font>&nbsp;Ԫ<br><hr style='weight:200px;'>"+
	     							   "<div style='text-align:left;padding-left:20px;padding-right:20px;line-height:15px;font-size:12px;'><strong>����������</strong><br><br>"+
	     							   "1�������Ϊ�������������ʱ�ɻ��Ѳ��ɹ�������������ĵȴ�����������ظ��ɷѡ�<br>"+
										"2���ɷѲ��ɹ����ѿۿ���û�������3-5����������ȫ���˿<br>"+
										"3�������û�����ʧ����ɵ���ʧ�������û����ге����й��ƶ��ֻ�֧�������е��⳥����ѯ10086��</div><br><br>"+
	     							   "<input type='button' size='30' value='ȷ��' onClick='showPaymentTabs(); return DialogHide();'/>&nbsp;&nbsp;&nbsp;"+"<input type='button' size='30'  value='��������' onclick='resetMobileNO();return DialogHide();'/ ><br><br>"+
	     							   "</div>";	     
		DialogShow(AJAX_LoginBody,500,230,500,250);
    }
    
  /*
function mobilefocus(){
	$("#OPP_MBL").focus(); 
	}
	*/
	


//�������ÿ���ֵ��tabҳ
function reLoadTabBink()    
    {
    	window.location.reload();    
   } 
//�ж��Ƿ�ͨǩԼ
function checkSigning(){
	   window.location.href="../../OPTSPRG1/PTS2021000.dow-TABID=tab4"/*tpa=https://www.tftpay.com/OPTSPRG1/PTS2021000.dow?TABID=tab4*/;
	}

function CheckPostMsg_rechange(iflag)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
		AJAX_LoginBody="<div id='layer_box'><div id='layer_title'><div id='layer_left'>ϵͳ��Ϣ</div><div id='close'><img src='../../images/close.gif'/*tpa=https://www.tftpay.com/images/close.gif*/  onclick='return DialogHide();' /></div></div><div id='layer_input'><ul><li style='padding-left:40px;'>���ڳ�ֵ������....</li><li><input type=\"button\" class=\"inpubut\" border=\"0\" onclick=\"return DialogHide();\" value=\"��ֵȷ��\" /></li><li>&nbsp;</li></div>";
		DialogShow(AJAX_LoginBody,250,120,280,100);
    }
    
	function refulsh(){
		location.reload(true);
		return false; 	
	}

//���ٽɻ�����������
function CheckPostMsg_Fill2(iflag,hrefurl)    
    {
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ������ɳ�ֵ</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'  style='background-image: url(/images/arr_bg_1.jpg);'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\' style='background-image: url(/images/arr_bg_1.jpg);'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\' style='background-image: url(/images/arr_bg_2.jpg);'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick='return DialogHide();' class=\'blue_001 f12\'>��������ѡ������</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    } 
 
 //���ٽɻ��ѳ�ֵ������  
function CheckPostMsg_Fill3(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>��ȴ�ϵͳ����</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' ><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>&nbsp;</td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    } 
   
//�ɻ�����������(��סʱ��������ؼ�����ɺ���ʾ����ؼ�)
function CheckPostMsg_Fill4(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
		document.getElementById("paypwdFrameDiv").style.display="none";
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick=\"document.getElementById('paypwdFrameDiv').style.display=''; DialogHide();\" class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ������ɳ�ֵ</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'  ><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick=\"document.getElementById('paypwdFrameDiv').style.display=''; DialogHide();\" class=\'blue_001 f12\'>��������ѡ������</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    }
     
 

//����ɷѲ���
function CheckPostMsg_Fill_lifePay(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>�ر�</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>�����ڵ���������ҳ������ɳ�ֵ</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>��ֵ���ǰ�벻Ҫ�رձ�����<br />��ɳ�ֵ����������ֵ��ɡ���ť</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'window.location.reload()\' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>��ֵ���</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>��������</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick='return DialogHide();' class=\'blue_001  f12\'>��������ѡ������</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    }

function callback(data)    
    {    
	ScreenConvert();
	var AJAX_LoginBody="<div id='layer_box'><div id='layer_title'><div id='layer_left'>�Ƽ��ʼ��ɹ�����</div><div id='close'><img src='../../public/images/close.gif'/*tpa=https://www.tftpay.com/public/images/close.gif*/ onclick='return DialogHide();' /></div></div><div id='layer_input'><ul><li style='padding-left:40px;'>�����Ƽ��ʼ��Ѿ��ɹ����͡�</li><li>&nbsp;</li></div>";
DialogShow(AJAX_LoginBody,250,120,280,100);
    }   


function CheckEmail( str )
{
	var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	return Check( reg,str );
}

function Check(reg, str)
{
	if( reg.test( str ) )
	{
		return true;
	}
	else
	{
		return false;
	}
}
//================================================================����============================================================
var interval;
function PostOpen(posturl)
{
	popup = window.open(posturl,"TripodPopup",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=0,height=0,left=500,top=350');
	popup.blur();
	interval=window.setInterval(GetRet,10);
}

function PostFrame(posturl)
{
	document.getElementById ("ret").value="1";
	var oblog_bIsIE5=document.all;
	//alert(oblog_bIsIE5);

	if (oblog_bIsIE5){
	window.document.frames("iframehide").location.href=posturl;
	}
	else
	{
	window.document.getElementById("iframehide").contentWindow.location.href=posturl;
	}
	interval=window.setInterval(GetRet,10);
}

function GetRet()
{
	if(document.getElementById ("ret").value!="1")
	{
		eval(document.getElementById ("ret").value);
		document.getElementById ("ret").value="1";
		GetStop();
	}
}

function GetStop()
{
	document.getElementById ("ret").value="1";
	clearInterval(interval);
}
//================================================================����============================================================
function ScreenConvert()
{
var browser = new Browser();
var objScreen = gid("ScreenOver");
if(!objScreen) var objScreen = document.createElement("div");
var oS = objScreen.style;
objScreen.id = "ScreenOver";
oS.display = "block";
oS.top = oS.left = oS.margin = oS.padding = "0px";
if (document.body.clientHeight)	{var wh = document.body.scrollHeight + "px";}
else if (window.innerHeight){var wh = window.innerHeight + "px";}
else{var wh = "100%";}
oS.width = "100%";
oS.height = wh;oS.position = "absolute";
oS.zIndex = "3";
if ((!browser.isSF) && (!browser.isOP))
{oS.background = "#181818";}else{oS.background = "#F0F0F0";}
oS.filter = "alpha(opacity=40)";
oS.opacity = 40/100;
oS.MozOpacity = 40/100;
document.body.appendChild(objScreen);
var allselect = gname("select");
for (var i=0; i<allselect.length; i++) 
allselect[i].style.visibility = "hidden";
}

//�ɳ�����ҳ��
function ScreenConvert2()
{var browser = new Browser();
var objScreen = gid("ScreenOver");
if(!objScreen) var objScreen = document.createElement("div");
var oS = objScreen.style;
objScreen.id = "ScreenOver";
oS.display = "block";
oS.top = oS.left = oS.margin = oS.padding = "0px";
if (document.body.clientHeight) {var wh = document.body.scrollHeight + "px";}
else if (window.innerHeight){var wh = window.innerHeight + "px";}
else{var wh = "100%";}
oS.width = "100%";
oS.height = wh;oS.position = "absolute";
oS.zIndex = "3";
if ((!browser.isSF) && (!browser.isOP))
{oS.background = "#181818";}else{oS.background = "#F0F0F0";}
oS.filter = "alpha(opacity=40)";
oS.opacity = 40/100;oS.MozOpacity = 40/100;
document.body.appendChild(objScreen);
var allselect = gname("select");
for (var i=0; i<allselect.length; i++) 
allselect[i].style.visibility = "hidden";
}

function gid(id){return window.document.getElementById?window.document.getElementById(id):null;}

function gname(name){return window.document.getElementsByTagName?window.document.getElementsByTagName(name):new Array()}

function DialogLoc(){var dde = window.document.documentElement;if (window.innerWidth){var ww = window.window.innerWidth;var wh = window.window.innerHeight;var bgX = window.pageXOffset;var bgY = window.pageYOffset;}else{var ww = dde.offsetWidth;var wh = dde.offsetHeight;var bgX = dde.scrollLeft;var bgY = dde.scrollTop;}t_DiglogX = (bgX + ((ww - t_DiglogW)/2));t_DiglogY = (bgY + ((wh - t_DiglogH)/2));}

function Browser(){var ua, s, i;this.isIE = false;this.isNS = false;this.isOP = false;this.isSF = false;ua = navigator.userAgent.toLowerCase();s = "opera";if ((i = ua.indexOf(s)) >= 0){this.isOP = true;return;}s = "msie";if ((i = ua.indexOf(s)) >= 0) {this.isIE = true;return;}s = "netscape6/";if ((i = ua.indexOf(s)) >= 0) {this.isNS = true;return;}s = "gecko";if ((i = ua.indexOf(s)) >= 0) {this.isNS = true;return;}s = "safari";if ((i = ua.indexOf(s)) >= 0) {this.isSF = true;return;}}

function DialogHide(){ScreenClean();var objDialog = document.getElementById("DialogMove");if (objDialog) objDialog.style.display = "none";}
function DialogHide2(){ScreenClean();var objDialog = document.getElementById("DialogMove");if (objDialog) objDialog.style.display = "none";window.frames[0].location.reload();}

function ScreenClean(){var objScreen = document.getElementById("ScreenOver");if (objScreen) objScreen.style.display = "none";var allselect = gname("select");for (var i=0; i<allselect.length; i++) allselect[i].style.visibility = "visible";}

function DialogShow(showdata,ow,oh,w,h){var objDialog = document.getElementById("DialogMove");if (!objDialog) objDialog = document.createElement("div");t_DiglogW = ow;t_DiglogH = oh;DialogLoc();objDialog.id = "DialogMove";var oS = objDialog.style;oS.display = "block";oS.top = t_DiglogY + "px";oS.left = t_DiglogX + "px";oS.margin = "0px";oS.padding = "0px";oS.width = w + "px";oS.height = h + "px";oS.position = "absolute";oS.zIndex = "5";oS.background = "#FFF";objDialog.innerHTML = showdata;document.body.appendChild(objDialog);}

function WishListAction(ActionType, ReferID, WishType, update,SendType,ID)
{
	ScreenConvert();
	DialogShow("<div id=\"DialogLoading\">���ڶ�ȡ,���Ժ�...</div>",110,24,124,24);
	if (update == null)
	{
		update = true;
	}
	update = (update)?1:0;
	if (ActionType != null && ReferID != null && WishType != null)
	{
		var PostData = "do=" + ((ActionType == 0)?"delmsgwishlist":"addwishlist") + "&referid=" + ReferID + "&wishtype=" + WishType + "&update=" + update;
		PostRequest(vUrl+"ajax_recomment2.aspx?k="+SendType+"&ID="+ID, PostData);
	}
}
function InitRequest(){var C_req = null;try{C_req = new ActiveXObject("Msxml2.XMLHTTP");}catch(e){try{C_req = new ActiveXObject("Microsoft.XMLHTTP");}catch(oc){C_req = null;}}if (!C_req && typeof XMLHttpRequest != "undefined"){try{C_req = new XMLHttpRequest();}catch(fa){alert("�Բ���!�����������֧�ָù���,��ʹ��Internet Explorer 6.0��FireFox�����!");C_req = null;}}return C_req;}

function PostRequest(url){var AjaxRequestObj = InitRequest();if (AjaxRequestObj != null){AjaxRequestObj.onreadystatechange = function (){if (AjaxRequestObj.readyState == 4 && AjaxRequestObj.responseText){ProcessAjaxData(AjaxRequestObj.responseText);}};AjaxRequestObj.open("get", url, true);AjaxRequestObj.setRequestHeader("Content-Type","application/x-www-form-urlencoded");AjaxRequestObj.send(null);}}

function ProcessAjaxData(data){
	//alert(data);
	eval(data);
}