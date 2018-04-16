var vUrl= "";
//银行充值
function CheckPostMsg_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成充值</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#'  onclick='javascript:reLoadTabBink();' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0'  class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'blue_001  f12\'>返回重新选择银行</a>"+
	     "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";        
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }
//信用卡充值
function CheckCredit_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>"+
	    "&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'>"+
	   "<table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成充值</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td>"+
	    "</tr></table>"+
	   "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'>"+
	   "<a  href='#'   onclick='javascript:reLoadTab();' onclick='return DialogHide();'    class=\'white_001 fb f14 hand\'>"+
	   "<table  width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\' ><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table>"+
	   "</a>"+
	   "</td>"+
	   "<td align='center' valign='middle'>"+
	   "<span src='#' class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table>"+
	    "</span>"+
	    "</td></tr></table>"+ 
	    "</td></tr>"+
	   "<tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'>"+
	   "<tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	  	"<a  href='#'  onclick='return DialogHide();' class=\'blue_001  f12\'>返回重新选择银行</a>"+
	    "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";           
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }
    
//卡通充值
function CheckCartoon_Fill(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left' class=\'border_02\'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成手机支付卡通签约</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>签约完成前请不要关闭本窗口<br />完成签约后请点击“签约完成”按钮</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#'  onclick='javascript:checkSigning();' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>签约完成</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'>"+
	    "<table width='139' height='33' border='0' cellpadding='0' cellspacing='0'  class=\'\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>"+
	    
	     "</td></tr>"+
	    "</table>"+
	    "</td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>"; 
		DialogShow(AJAX_LoginBody,500,300,500,300);
    }

//给他人充值时提示电话号码和缴费金额
function CheckMobileAndCountMsg_Fill(mobileNum,count)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
	    /*AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='500' align='left'>"+
	    "<table width='100%' border='0' cellpadding='0' cellspacing='6'>"+
	    "<tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'>"+
	    "<a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr>"+
	    "<tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'>"+
	    "<tr><td width='80' height='25' align='center' valign='middle'>&nbsp;</td>"+
	    "<td align='left' class=\'gray_006 f22 f_line1\'>您需要缴费的手机号码是"+mobileNum+"</td></tr>"+
	    "<tr><td width='80' height='' align='center' valign='middle'>&nbsp;</td><td align='left' class=\'gray_006 f22 f_line1\'>缴费金额是"+count+"&nbsp;元</td></tr></table>"+
	    "<table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table>"+
	    "<table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick='showPaymentTabs(); return DialogHide();' class=\'white_001 fb f14 hand\'>"+
	    "<table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>确定</td></tr></table></a></td>"+
	    "<td align='center' valign='middle'><table  onclick='mobilefocus();return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'>"+
	    "<tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>重新输入</td></tr></table></td></tr></table></td></tr>"+
	    "</table></td>"+
	    "</tr>"+
	    "</table>";*/
	    AJAX_LoginBody="<div style='height:230px;weight:400px;border:1px solid #778899;'><br/><br/>您需要缴费的手机号码是:<font color='#A52A2A'><strong>"+mobileNum+"</strong></font><br><br>"+
	     							   "缴费金额是:<font color='#A52A2A'><strong>"+count+"</strong></font>&nbsp;元<br><hr style='weight:200px;'>"+
	     							   "<div style='text-align:left;padding-left:20px;padding-right:20px;line-height:15px;font-size:12px;'><strong>免责声明：</strong><br><br>"+
	     							   "1、如果因为网络问题出现暂时缴话费不成功的情况，请耐心等待，避免造成重复缴费。<br>"+
										"2、缴费不成功且已扣款的用户，将在3-5个工作日内全额退款。<br>"+
										"3、由于用户操作失误造成的损失，将由用户自行承担，中国移动手机支付将不承担赔偿，详询10086。</div><br><br>"+
	     							   "<input type='button' size='30' value='确定' onClick='showPaymentTabs(); return DialogHide();'/>&nbsp;&nbsp;&nbsp;"+"<input type='button' size='30'  value='重新输入' onclick='resetMobileNO();return DialogHide();'/ ><br><br>"+
	     							   "</div>";	     
		DialogShow(AJAX_LoginBody,500,230,500,250);
    }
    
  /*
function mobilefocus(){
	$("#OPP_MBL").focus(); 
	}
	*/
	


//返回信用卡充值的tab页
function reLoadTabBink()    
    {
    	window.location.reload();    
   } 
//判断是否卡通签约
function checkSigning(){
	   window.location.href="../../OPTSPRG1/PTS2021000.dow-TABID=tab4"/*tpa=https://www.tftpay.com/OPTSPRG1/PTS2021000.dow?TABID=tab4*/;
	}

function CheckPostMsg_rechange(iflag)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert();
		AJAX_LoginBody="<div id='layer_box'><div id='layer_title'><div id='layer_left'>系统信息</div><div id='close'><img src='../../images/close.gif'/*tpa=https://www.tftpay.com/images/close.gif*/  onclick='return DialogHide();' /></div></div><div id='layer_input'><ul><li style='padding-left:40px;'>正在充值过程中....</li><li><input type=\"button\" class=\"inpubut\" border=\"0\" onclick=\"return DialogHide();\" value=\"充值确认\" /></li><li>&nbsp;</li></div>";
		DialogShow(AJAX_LoginBody,250,120,280,100);
    }
    
	function refulsh(){
		location.reload(true);
		return false; 	
	}

//快速缴话费网银补款
function CheckPostMsg_Fill2(iflag,hrefurl)    
    {
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成充值</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'  style='background-image: url(/images/arr_bg_1.jpg);'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\' style='background-image: url(/images/arr_bg_1.jpg);'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\' style='background-image: url(/images/arr_bg_2.jpg);'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick='return DialogHide();' class=\'blue_001 f12\'>返回重新选择银行</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    } 
 
 //快速缴话费充值卡补款  
function CheckPostMsg_Fill3(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>请等待系统处理</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' ><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'>&nbsp;</td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    } 
   
//缴话费网银补款(蒙住时隐藏密码控件，完成后显示密码控件)
function CheckPostMsg_Fill4(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
		document.getElementById("paypwdFrameDiv").style.display="none";
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick=\"document.getElementById('paypwdFrameDiv').style.display=''; DialogHide();\" class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成充值</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'DialogHide();callAjax()\' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'  ><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick=\"document.getElementById('paypwdFrameDiv').style.display=''; DialogHide();\" class=\'blue_001 f12\'>返回重新选择银行</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    }
     
 

//生活缴费补款
function CheckPostMsg_Fill_lifePay(iflag,hrefurl)    
    {    
	var AJAX_LoginBody = "";
		ScreenConvert2();
	    AJAX_LoginBody="<table border='0' cellspacing='0' cellpadding='0'><tr><td width='580' align='left' class=\'border_02\'><table width='100%' border='0' cellpadding='0' cellspacing='6'><tr><td height='32' align='right' valign='middle' bgcolor='#dae1e5'><a href='#' onclick='return DialogHide();' class=\'gray_005\'>关闭</a>&nbsp;&nbsp;</td></tr><tr><td align='center' valign='top'><table width='85%' border='0' cellspacing='0' cellpadding='0'><tr><td width='80' height='80' align='center' valign='middle'><img src='../../merchant/images/arr_jth_1.jpg'/*tpa=https://www.tftpay.com/merchant/images/arr_jth_1.jpg*/ width='49' height='50' /></td><td align='left' class=\'gray_006 f22 f_line1\'>请您在弹出的银行页面上完成充值</td></tr></table><table width='80%' border='0' cellspacing='0' cellpadding='0'><tr><td height='100' align='left' valign='middle' class=\'gray_006 f14 f_line2\'>充值完成前请不要关闭本窗口<br />完成充值后请点击“充值完成”按钮</td></tr></table><table width='60%' height='60' border='0' cellpadding='0' cellspacing='0'><tr><td align='center' valign='middle'><a href='#' onclick=\'window.location.reload()\' onclick='return DialogHide();' class=\'white_001 fb f14 hand\'><table width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle' class=\'white_001 fb f14 hand\'>充值完成</td></tr></table></a></td><td align='center' valign='middle'><span class=\'white_001 fb f14 hand\'><table  onclick='window.open(\""+hrefurl+"\");return DialogHide();' width='138' height='41' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg1\'><tr><td align='center' valign='middle'  class=\'white_001 fb f14 hand\'>帮助中心</td></tr></table></span></td></tr></table></td></tr><tr><td align='right' valign='middle'><table width='139' height='33' border='0' cellpadding='0' cellspacing='0' class=\'table-background-bg2\'><tr><td width='30'>&nbsp;</td><td align='left' valign='middle'><a href='#' onclick='return DialogHide();' class=\'blue_001  f12\'>返回重新选择银行</a></td></tr></table></td></tr></table></td><td width='8' valign='top' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8' class='border_02'></td></tr></table></td></tr><tr><td align='left' bgcolor='#c1c1c1'><table width='8' border='0' cellpadding='0' cellspacing='0' bgcolor='#A3A3A3'><tr><td width='8' height='8'  class='border_02'></td></tr></table></td><td width='8' height='8' align='left' bgcolor='#c1c1c1'></td></tr></table>";       
		DialogShow(AJAX_LoginBody,580,300,580,300);
    }

function callback(data)    
    {    
	ScreenConvert();
	var AJAX_LoginBody="<div id='layer_box'><div id='layer_title'><div id='layer_left'>推荐邮件成功发送</div><div id='close'><img src='../../public/images/close.gif'/*tpa=https://www.tftpay.com/public/images/close.gif*/ onclick='return DialogHide();' /></div></div><div id='layer_input'><ul><li style='padding-left:40px;'>您的推荐邮件已经成功发送。</li><li>&nbsp;</li></div>";
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
//================================================================处理============================================================
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
//================================================================公用============================================================
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

//蒙出整个页面
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
	DialogShow("<div id=\"DialogLoading\">正在读取,请稍候...</div>",110,24,124,24);
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
function InitRequest(){var C_req = null;try{C_req = new ActiveXObject("Msxml2.XMLHTTP");}catch(e){try{C_req = new ActiveXObject("Microsoft.XMLHTTP");}catch(oc){C_req = null;}}if (!C_req && typeof XMLHttpRequest != "undefined"){try{C_req = new XMLHttpRequest();}catch(fa){alert("对不起!您的浏览器不支持该功能,请使用Internet Explorer 6.0或FireFox浏览器!");C_req = null;}}return C_req;}

function PostRequest(url){var AjaxRequestObj = InitRequest();if (AjaxRequestObj != null){AjaxRequestObj.onreadystatechange = function (){if (AjaxRequestObj.readyState == 4 && AjaxRequestObj.responseText){ProcessAjaxData(AjaxRequestObj.responseText);}};AjaxRequestObj.open("get", url, true);AjaxRequestObj.setRequestHeader("Content-Type","application/x-www-form-urlencoded");AjaxRequestObj.send(null);}}

function ProcessAjaxData(data){
	//alert(data);
	eval(data);
}