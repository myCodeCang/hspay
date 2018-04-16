// Data 12.15 ljm

function trimBothSideSpace(str){if(checkNull(str)){return"";}
return str.replace(/(^\s*)|(\s*$)/g,"");}
function getShengXiao(yyyy){var arr=['猴','鸡','狗','猪','鼠','牛','虎','兔','龙','蛇','马','羊'];return/^\d{4}$/.test(yyyy)?arr[yyyy%12]:null;}
function getXingZuo(month,day){var d=new Date(1999,month-1,day,0,0,0);var arr=[];arr.push(["魔羯座",new Date(1999,0,1,0,0,0)])
arr.push(["水瓶座",new Date(1999,0,20,0,0,0)])
arr.push(["双鱼座",new Date(1999,1,19,0,0,0)])
arr.push(["牡羊座",new Date(1999,2,21,0,0,0)])
arr.push(["金牛座",new Date(1999,3,21,0,0,0)])
arr.push(["双子座",new Date(1999,4,21,0,0,0)])
arr.push(["巨蟹座",new Date(1999,5,22,0,0,0)])
arr.push(["狮子座",new Date(1999,6,23,0,0,0)])
arr.push(["处女座",new Date(1999,7,23,0,0,0)])
arr.push(["天秤座",new Date(1999,8,23,0,0,0)])
arr.push(["天蝎座",new Date(1999,9,23,0,0,0)])
arr.push(["射手座",new Date(1999,10,22,0,0,0)])
arr.push(["魔羯座",new Date(1999,11,22,0,0,0)])
for(var i=arr.length-1;i>=0;i--){if(d>=arr[i][1])return arr[i][0];}}
function getAge(birth){var strA;if(birth.indexOf("-")!=-1){strA=birth.split("-");}else if(birth.indexOf("/")!=-1){strA=birth.split("/");}
var year=strA[0];var month=strA[1];var date=strA[2];if(month.charAt(0)=="0"){month=month.charAt(1);}
if(date.charAt(0)=="0"){date=date.charAt(1);}
birth=year+"/"+month+"/"+date;var now=new Date();var old=new Date(birth);return(now.getFullYear()-old.getFullYear());}
function toCharArray(str){var charArr=new Array();for(var i=0;i<str.length;i++)
charArr[i]=str.charAt(i);return charArr;}
function compareDate(strv1,strv2,strv3){var error="";if(strv1!=""&&strv2!=""){er1=checkDate(strv1);er2=checkDate(strv2);if(er1!=""||er2!=""){error="请检查日期的输入格式！";}else if(strv1!=""&&strv2!=""){s1=convertDate(strv1);s2=convertDate(strv2);if(!eval(s1+strv3+s2)){error="关系错误:";}}}
return error;}
function convertDate(vstrDate)
{var s="";for(i=0;i<2;i++){s+=vstrDate.substring(0,vstrDate.indexOf("-"));vstrDate=vstrDate.substr(vstrDate.indexOf("-")+1);}
s=s+vstrDate;return s;}
function convertDatetime(vstrDatetime){var s="";for(i=0;i<4;i++){if(i<2){s+=vstrDatetime.substring(0,vstrDatetime.indexOf("-"));vstrDatetime=vstrDatetime.substr(vstrDatetime.indexOf("-")+1);}
else if(i==2){s+=vstrDatetime.substring(0,2);vstrDatetime=vstrDatetime.substr(3);}
else if(i==3){s+=vstrDatetime.substring(0,vstrDatetime.indexOf(":"));vstrDatetime=vstrDatetime.substr(vstrDatetime.indexOf(":")+1);}}
s=s+vstrDatetime;return s;}
function compareNum(strv1,strv2,strv3)
{var error="";if(strv1!=""&&strv2!=""){er1=checkNumber(strv1);er2=checkNumber(strv2);if(er1!=""||er2!=""){error="请检查整型的输入格式！";}
else if(!eval(strv1+strv3+strv2)){error="关系错误:";}}
return error;}
function trimLeftSpace(str){return str.replace(/(^\s*)/g,"");}
function trimRightSpace(str){return str.replace(/(\s*$)/g,"");}
function trimAllSpace(str){return str.replace(/\s/g,"");}
function compareChar(strv1,strv2){return(strv1!=strv2);}
function trim(str){return str.trim();}
String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"");}
function get(id){return document.getElementById(id);}
function getCurrentTimeSeconds(){var d=new Date();var hour=d.getHours();var minute=d.getMinutes();var second=d.getSeconds();return hour*60*60+minute*60+second;}
function WaitTime(sec,timeout){var startPos=getCurrentTimeSeconds();var pass;while(true){pass=getCurrentTimeSeconds()-startPos;if(pass>=sec){break;}
if(pass>=timeout){break;}}}
function getRadioValue(radioArray){var i;for(i=0;i<radioArray.length;++i){if(radioArray[i].checked){return radioArray[i].value;}}
return null;}
function getNodeValue(node,name){var value="";if(node!=null){var elem=node.getElementsByTagName(name)[0];if(elem!=null){if(elem.firstChild!=null){value=elem.firstChild.nodeValue;}}}
return value;}
function include(path,type,title){var s,i,t;if(arguments.length<1){return;}
if(arguments.length==1){type="js";}
switch(type.toLowerCase()){case"css":t=document.getElementsByTagName("link");for(i=0;i<t.length;i++){if(t[i].href&&t[i].href.indexOf(path)!=-1){return;}}
s=document.createElement("link");s.rel="alternate stylesheet";s.type="text/css";s.href=path;s.title=title;s.disabled=false;break;case"js":case"javascript":default:t=document.getElementsByTagName("script");for(i=0;i<t.length;i++){if(t[i].src&&t[i].src.indexOf(path)!=-1){return;}}
s=document.createElement("script");s.type="text/javascript";s.src=path;break;}
var h=document.getElementsByTagName("head")[0];h.appendChild(s);}
function setDeferEvent(type,action,time){if(trim(time).length==0)time=1;if(typeof(time)!="number")time=1;switch(type.toLowerCase()){case"go":window.setTimeout("window.location='"+action+"'",time);break;case"alert":window.setTimeout("alert('"+action+"')",time);break;case"js":case"javascript":window.setTimeout("'"+action.toString()+"'",time);break;default:alert("Nothing will do!");break;}}
function addLoadListener(handler){if(typeof window.addEventListener!='undefined')
window.addEventListener('load',handler,false);else if(typeof document.addEventListener!='undefined')
document.addEventListener('load',handler,false);else if(typeof window.attachEvent!='undefined')
window.attachEvent('onload',handler);};function addEventListener(element,eventType,handler,capture){try{if(element.addEventListener)
element.addEventListener(eventType,handler,capture);else if(element.attachEvent)
element.attachEvent("on"+eventType,handler);}catch(e){}};function removeEventListener(element,eventType,handler,capture){try
{if(element.removeEventListener)
element.removeEventListener(eventType,handler,capture);else if(element.detachEvent)
element.detachEvent("on"+eventType,handler);}
catch(e){}};function preloadImages(){var d=document;if(d.images){if(!d.pic)d.pic=new Array();var i,j=d.pic.length,a=arguments;for(i=0;i<a.length;i++){d.pic[j]=new Image();d.pic[j++].src=a[i];}}}
function loadAjaxElement(ele,url,params,fMethod,desc){if(arguments.length<3){return;}
var o=$(ele);o.innerHTML=l;params=$H(params).toQueryString();new Ajax.Updater({success:ele},url,{method:'get',parameters:param,onFailure:fMethod});}
function sendAjaxElement(ele,url,params,fMethod,desc){if(arguments.length<3){return;}
var o=$(ele);o.innerHTML=desc;params=$H(params).toQueryString();new Ajax.Updater({success:ele},url,{method:'post',parameters:params,onFailure:fMethod});}
function loadAjaxData(url,params,sMethod,fMethod){if(arguments.length<3){return;}
params=$H(params).toQueryString();new Ajax.Request(url,{method:'get',parameters:params,onSuccess:sMethod,onFailure:fMethod});}
function sendAjaxData(url,params,sMethod,fMethod){if(arguments.length<3){return;}
params=$H(params).toQueryString();new Ajax.Request(url,{method:'post',parameters:params,onSuccess:sMethod,onFailure:fMethod});}
function showDivInfo(Divid,msg){var ido=document.getElementById(Divid);if(ido!=null){if(msg==null||msg==""){ido.innerHTML="&nbsp;";}else{ido.className="show_err";ido.innerHTML=msg;}}}
function clearDivInfo(Divid){showDivInfo(Divid);}
function showRightInfo(id,msg){var ido=document.getElementById(id+"InfoDiv");var html="";ido.className="show_point";if(typeof msg=='undefined'){html=" 填写正确！";}else{html=msg;}
ido.innerHTML=html;}
function showNoteInfo(input){var id=input.id;var note=input.getAttribute("note");var ido=document.getElementById(id+"InfoDiv");if(note&&note.length>0){ido.className="show_rule";ido.innerHTML=note;}else{ido.innerHTML='';}
return false;}
function showMsgInfo(id,msg){var ido=document.getElementById(id+"InfoDiv");if(msg.length>0){ido.innerHTML=msg;}else{ido.innerHTML='';}}
function submitHref(url,target){document.submitHrefForm.action=url;if(typeof(target)!="undefined"){document.submitHrefForm.target=target;}
document.submitHrefForm.submit();}
/*function showInfo(id,msg){var ido=document.getElementById(id+"InfoDiv");if(ido!=null){if(msg==null||msg==""){ido.className="show_succ";ido.innerHTML="&nbsp;";}else{ido.className="show_err";ido.innerHTML=msg;}}}*/
function showNoInfo(id){var ido=document.getElementById(id+"InfoDiv");ido.className="show_rule";ido.innerHTML="";}
function navInit2(){jQuery("ul.menu_center a").mouseover(function(){jQuery("ul.menu_center a").removeClass();jQuery(this).addClass("on");});jQuery(".mianMenu").hover(function(){},function(){navMouseOut1();});}
var navPId="";
var navCurId="";
var mPid=new Array(["01"],["02"],["03"],["04"]);
var mCid=new Array();
mCid[0]=new Array(["0101"],["0102"],["0103"],["0104"],["0105"],["0106"],["0107"],["0108"],["0109"],["0110"],["0111"]);
mCid[1]=new Array(["0201"],["0202"],["0203"],["0204"],["0205"],["0206"],["0207"]);
mCid[2]=new Array(["0301"],["0302"],["0303"],["0304"],["0305"],["0306"]);
mCid[3]=new Array(["0401"]);
/*
*登陆后-初始菜单导航mouseover
*/
function navInit(){
	jQuery("ul.top a").mouseover(function(){
	jQuery("ul.top a").removeClass();
	jQuery(this).addClass("on");
	jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	jQuery($(this).attr("item")).show();
	});
	jQuery(".menu_conter").hover(function(){},function(){
        navMouseOut();
    });
}
/*
*登陆后-当前菜单高亮
*/
function highOnclick(curId) {
	  if(typeof(curId)=="undefined")return false;
	  if(curId == "")return false;
	  var pid="";
	  for(var i=0;i<mCid.length;i++){
		  for(var j=0;j<mCid[i].length;j++){ 
		   if(curId==mCid[i][j]){
			  pid=""+mPid[i];
		    }
		  }
	  }
	  navPId=pid;
	  navCurId=curId;
	  jQuery("ul.top a").removeClass();
      jQuery("#"+pid).addClass("on");
      jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	  jQuery("ul.bot a").each(function(i){$(this).removeClass();});
	  jQuery("ul.bot span").each(function(i){$(this).removeClass();});
      jQuery("#"+curId+" a").addClass("chtab");
	  jQuery("#"+curId+" span").addClass("chtab2");
	  jQuery($("#"+pid).attr("item")).show();
}
/*
*登陆后-当鼠标离开菜单，恢复到当前菜单
*/
function navMouseOut(){
	if(navPId != "" && navCurId != "" && navPId != null && navCurId != null){
	jQuery("ul.top a").removeClass();
	jQuery("#"+navPId).addClass("on");
	jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	jQuery("ul.bot a").each(function(i){$(this).removeClass();});
	jQuery("ul.bot span").each(function(i){$(this).removeClass();});
	jQuery("#"+navCurId+" a").addClass("chtab");
	jQuery("#"+navCurId+" span").addClass("chtab2");
	jQuery($("#"+navPId).attr("item")).show();
	}
}
/*before login--begin*/
var navPId1="";var navCurId1="";
var mPid1=new Array(["01"],["02"],["03"],["04"],["05"],["06"]);
var mCid1=new Array();
mCid1[0]=new Array(["0101"],["0102"]);
mCid1[1]=new Array(["0201"],["0202"],["0203"]);
mCid1[2]=new Array(["0301"],["0302"],["0303"],["0304"]);
mCid1[3]=new Array(["0401"],["0402"],["0403"],["0404"],["0405"],["0405"],["0406"],["0407"],["0408"]);
mCid1[4]=new Array(["0501"],["0502"]);
mCid1[5]=new Array(["0601"],["0602"],["0603"],["0604"]);
function navInit1(){
	jQuery("ul.top a").mouseover(function(){
	jQuery("ul.top a").removeClass();
	jQuery(this).addClass("on");
	jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	jQuery($(this).attr("item")).show();
	});
	jQuery(".menu_conter").hover(function(){},function(){
        navMouseOut1();
    });
}
function highOnclick1(curId) {
	  //if(typeof(curId)=="undefined")return false;
	  //if(curId == "")return false;
	  //navCurId=curId;
	  //jQuery("ul.menu_center a").removeClass();
    //jQuery("#"+curId).addClass("on");
    
    if(typeof(curId)=="undefined")return false;
	  if(curId == "")return false;
	  var pid="";
	  for(var i=0;i<mCid1.length;i++){
		  for(var j=0;j<mCid1[i].length;j++){ 
		   if(curId==mCid1[i][j]){
			  pid=""+mPid1[i];
		    }
		  }
	  }
	  navPId1=pid;
	  navCurId1=curId;
	  jQuery("ul.top a").removeClass();
    jQuery("#"+pid).addClass("on");
    jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	  jQuery("ul.bot a").each(function(i){$(this).removeClass();});
	  jQuery("ul.bot span").each(function(i){$(this).removeClass();});
    jQuery("#"+curId+" a").addClass("chtab");
	  jQuery("#"+curId+" span").addClass("chtab2");
	  jQuery($("#"+pid).attr("item")).show();
}
function navMouseOut1(){
	if(navPId1 != "" && navCurId1 != "" && navPId1 != null && navCurId1 != null){
	jQuery("ul.top a").removeClass();
	jQuery("#"+navPId1).addClass("on");
	jQuery("https://www.tftpay.com/script/ul.bot").each(function(i){$(this).hide();});
	jQuery("ul.bot a").each(function(i){$(this).removeClass();});
	jQuery("ul.bot span").each(function(i){$(this).removeClass();});
	jQuery("#"+navCurId1+" a").addClass("chtab");
	jQuery("#"+navCurId1+" span").addClass("chtab2");
	jQuery($("#"+navPId1).attr("item")).show();
	}
}
/*before login--end*/
/*function navMouseOut2(){if(navCurId!=""&&navCurId!=null){jQuery("ul.menu_center a").removeClass();jQuery("#"+navCurId).addClass("on");}};(function($){jQuery.ajaxSetup({dataFilter:function(data,type){try{eval("var obj="+data);if(obj.RSP_AJA_ERR!==undefined&&obj.RSP_AJA_ERR=="true"){if(obj.RSP_AJA_URL!==undefined){var bln=window.confirm("您的登录已经超时,是否重新登录?");if(bln){window.location.href=obj.RSP_AJA_URL;return data=null;}
return data=null;}
if(obj.RSP_AJA_MSG!==undefined){if(obj.RSP_AJA_MSG!="1"&&obj.RSP_AJA_MSG!="2"){alert(obj.RSP_AJA_MSG);}else if(obj.RSP_AJA_MSG=="1"){alert("您的登录已经超时,请重新登录!");}else if(obj.RSP_AJA_MSG=="2"){alert("您输入的数据含有特殊字符,请重新输入!");}
return data=null;}}
return data;}catch(e){try{if(type!="json"){if(data==""){data="<div style=\"line-height:22px;text-align:center;padding:5px 0\"><span class=\"show_err\" style=\"padding: 2px 2px 2px 27px\">登录已超时！</span></div>";}else if(jQuery(data).find(".realn_info h3").text()!=""){data="<div style=\"line-height:22px;text-align:center;padding:5px 0\"><span class=\"show_err\" style=\"padding: 2px 2px 2px 27px\">对不起,系统出现异常,请稍候再试!</span></div>";}else if(jQuery(data).find(".login_mod h3").text()!=""){data="<div style=\"line-height:22px;text-align:center;padding:5px 0\"><span class=\"show_err\" style=\"padding: 2px 2px 2px 27px\">登录已超时！</span></div>";}}
return data;}catch(e){}}}});})(jQuery);var addClass=function(event,id,f,b){try{if(event.type=='focus'){jQuery('#'+id).removeClass(b);jQuery('#'+id).addClass(f);return;}
if(event.type=='blur'){jQuery('#'+id).removeClass(f);jQuery('#'+id).addClass(b);return;}
if(event.type=="mouseout"){jQuery('#'+id).removeClass(f);jQuery('#'+id).addClass(b);return;}
if(event.type=="mouseover"){jQuery('#'+id).removeClass(b);jQuery('#'+id).addClass(f);return;}
if(event.type=="mouseove"){jQuery('#'+id).removeClass(b);jQuery('#'+id).addClass(f);return;}}catch(e){}};*/
/**
 * 删除字符串左右的空格
 * @param str 需要删除空格的字符串
 * @return 删除空格后的字符串
 */
function trimBothSideSpace(str) {
    if (checkNull(str)) {
        return "";
    }
	return str.replace(/(^\s*)|(\s*$)/g, ""); 
}
/**
 * 检查输入值是不是null
 * @param str 待检查字串
 * @return true:是null false：不是null
 */
function checkNull(str) {
	if (str == null) {
		return true;
	}
	return false;
}
/**
 * 检查输入值是否是空串
 * @param str 待检查字串
 * @return true:是空串 false：不是空串
 */
function checkEmpty(str) {
    if (checkNull(str)) {
        return true;
    }
    str = trimBothSideSpace(str);
    if( str.length == 0 ){
        return true;
    }
    return false;
}
/**
 * 判断是否是日期格式
 * 
 * @param str
 *            格式为20080808
 * @return true:是指定格式的日期 false：不是指定格式的日期
 */
function IsDate(str) {
	if (checkEmpty(str)) {
		return false;
	}

    var reg = /^(\d{4})(\d{2})(\d{2})$/;
    var arr = reg.exec(str);
    
    if (!(reg.test(str))) {
        return false;
    }
    var intYear = RegExp.$1;
    var intMonth = RegExp.$2;
    var intDay = RegExp.$3;
    if(intYear>2100 || intYear<1900 || intMonth>12 || intMonth<=0 || intDay>31 || intDay<=0) {
        return false;
    }
    if((intMonth==4 || intMonth==6 || intMonth==9 || intMonth==11) && intDay>30) {
        return false;
    }
    if((intMonth==1 || intMonth==3 || intMonth==5 || intMonth==7 || intMonth==8 || intMonth==10 || intMonth==12) && intDay>31) {
        return false;
    }
    if (intMonth == 2) {
        if(new Date(intYear , 2 , 0).getDate() == 29) {
            if (intDay > 29) {
                return false;
            }
        } else {
            if (intDay > 28) {
                return false;
            }
        }
    }
    return true;
} 
function isNumberSelf(s) {
    return !isNaN(s);
}
function isNumber(s) {
    return !isNaN(s);
}
function showInfo(id , msg){
	var icon = "<img src='../images/worning.gif'/*tpa=https://www.tftpay.com/images/worning.gif*/ border='0' align='absmiddle'>";
	//var fdo = $(id+"FrameDiv");
	var ido = document.getElementById(id+"InfoDiv");
	//var al="";
	//if (align!=null&&align.length>0){
		//al=align;
	//}
	if(typeof(msg) == "undefined"){
		//fdo.className = "FrameDivPass";
		ido.innerHTML = "";
	}else{
		//fdo.className = "FrameDivWarn";
		//var html="<span style='text-align:"+al+"'> &nbsp;"+icon+" "+msg+"</span>";
		var html=" &nbsp;"+icon+" <span style='color: #ff8400;'>"+msg+"</span>";
		//alert(html);
		ido.innerHTML = html;
	}
}
function showicon(id , msg){
	var icon = "<img src='../images/icon_11.jpg'/*tpa=https://www.tftpay.com/images/icon_11.jpg*/ border='0' align='absmiddle'>";
	//var fdo = $(id+"FrameDiv");
	var ido = document.getElementById(id+"InfoDiv");
	//var al="";
	//if (align!=null&&align.length>0){
		//al=align;
	//}
	if(typeof msg == "undefined"){
		//fdo.className = "FrameDivPass";
		ido.innerHTML = "";
	}else{
		//fdo.className = "FrameDivWarn";
		//var html="<span style='text-align:"+al+"'> &nbsp;"+icon+" "+msg+"</span>";
		var html=" &nbsp;"+icon+" <span style='color: #ff8400;'>"+msg+"</span>";
		//alert(html);
		ido.innerHTML = html;
	}
}
//add by luo_chp 商户充值
/**
 * 显示输入框的提示信息
 * @param input 输入框的标签
 *        input标签里使用showNoteInfo(this)
 */
function showNoteInfo2(input){
    var icon = "<img src='../images/info.gif'/*tpa=https://www.tftpay.com/images/info.gif*/ border='0' align='absmiddle'>";
    var id = input.id;
    var note = input.getAttribute("note");
    var ido = document.getElementById(id+"InfoDiv");
    if (note && note.length>0){
        ido.innerHTML = '&nbsp;'+icon +" "+ note;
    } else{
        ido.innerHTML = '';
    }
    return false;
}

/**
 * submit提交时检查，非submit提交,有值时才检查
 * @param input 提交的input标签的值
 * @param from 提交形式(submit/非submit)
 * @return true:需要检查的输入 false:不需要检查的输入
 */
function isInfoCheck(input, from) {
	var id = input.id;
	var value = input.value;
	var label = input.label;
	var infoDiv = document.getElementById(id + "InfoDiv");
	if (from != 'submit' && value.length == 0) {
		return false;// no check
	} else if (from != 'submit' && value.length >= 0) {
		return true;// check
	} else if (from == 'submit') {
		return true;// check
	}
}


