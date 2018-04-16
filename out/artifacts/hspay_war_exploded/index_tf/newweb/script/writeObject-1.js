var _app = navigator.appName;

function powerConfig(args) {
	var defaults = { "width":150, "height":22, "maxLength":20, "minLength":6, "maskChar":"*", "backColor":"#FFFFFF", "textColor":"#0000FF", "borderColor":"#7F9DB9", "accepts":"\\w{0,}", "caption":"腾付通", "captionColor":"#FFFFFF", "captionFont":"", "captionSize":0, "captionBold":"true", "lang":"zh_CN"};
	for (var p in args)
		if (args[p] != null) defaults[p] = args[p];
	return defaults;
};

function writePluginObject(oid, clsid, cfg) {
	document.write('<object id="' + oid + '" type="' + clsid
		+ '" width="' + cfg.width + '" height="' + cfg.height
		+ '" style="width:' + cfg.width + 'px;height:' + cfg.height + 'px">');
	for (var name in cfg)
		document.write('<param name="' + name + '" value="' + cfg[name] + '">');
	document.write('</object>');
};

function writeObject(oid, clsid, cfg) {
	document.write('<object id="' + oid + '" codebase="ocx/PowerEnterTFTPAY.CAB#version=2,3,3,0" classid="' + clsid
		+ '" width="' + cfg.width + '" height="' + cfg.height
		+ '" style="width:' + cfg.width + 'px;height:' + cfg.height + 'px">');
	for (var name in cfg)
		document.write('<param name="' + name + '" value="' + cfg[name] + '">');
	document.write('</object>');
};

function writeEditObject(oid, cfg) {
	if (!oid || typeof(oid) != "string") {
		alert("writePassObj Failed: oid are required!");
	} else {
		if (_app == 'Microsoft Internet Explorer' || navigator.userAgent.indexOf("Trident")>0)
		{
			writeObject(oid+"_ie", "clsid:598BD733-AA6A-4E34-87A3-E145BB069409", powerConfig(cfg));
		}
		else
		{
			writePluginObject(oid+"_noie", "application/x-vnd-csii-powerenter-tftpay", powerConfig(cfg));
		}
	}
};

function writePassObject(oid, cfg, passid, name) {
	
	if (!oid || typeof(oid) != "string") {
		alert("writePassObj Failed: oid are required!");
	} else {
		
		if (_app == 'Microsoft Internet Explorer' || navigator.userAgent.indexOf("Trident")>0)
		{
			if(isActiveXRegistered("POWERENTERTFTPAY.PowerPasswordXTFTPAYCtrl.1")==false){
				 showTFTSetup(passid,name);
                 return false;
            }else{
            	 try {
			          writeObject(oid+"_ie", "clsid:A125423B-371E-49C4-BC26-8AA74B46EC6A", powerConfig(cfg));
            	 }catch(e){
            		 showTFTSetup(passid,name);
                     return false;
             }
            }
		}
		else
		{  
			var powerEnterPlugin = navigator.plugins["PowerEnter Plug-in for TFTPAY"];
            if(powerEnterPlugin == null ){
            	showTFTSetup(passid,name);
                return false;
            }else{
            	try{
			        writePluginObject(oid+"_noie", "application/x-vnd-csii-powerenter-tftpay", powerConfig(cfg));
                }catch (e) {
                	showTFTSetup(passid,name);
                    return false;
                }
            }
		}
	}
};


function getIBSInput(id, ts, spanId,massage) 
{
    try 
    {
		var powerobj = document.getElementById(id);	
		powerobj.setTimestamp(ts);
		var nresult = powerobj.verify();
		if(nresult < 0)
		{			
			var error;
			if(nresult == -1)
			{
				error = "内容不能为空";
			}
			else if(nresult == -2)
			{
				error = "输入长度不足";
			}
			else if(nresult == -3)
			{
				error = "输入内容不合法";
			}
			else if(nresult == -6)
			{
				error = "内容至少包括数字和字母";
			}
			else
			{
				error = powerobj.lastError(); 
			}
			PEGetElement(spanId).innerHTML = massage +error;
			return null;
		}	
				
		value = powerobj.getValue();
		if(value=="")
		{
			PEGetElement(spanId).innerHTML= massage+powerobj.lastError(); 
			return null;
		}
		else
		{
			return value;
		}
	}
	catch(e)
	{
		PEGetElement(spanId).innerHTML= massage +e.message; 
	}
	return null;
}

function getMFMInput(id, ts, spanId,massage) 
{
    try 
    {
		var powerobj = document.getElementById(id);	
		powerobj.setTimestamp(ts);		
		value = powerobj.getMFM();
		if(value=="")
		{
			PEGetElement(spanId).innerHTML= massage + powerobj.lastError(); 
			return null;
		}
		else
		{
			return value;
		}
	}
	catch(e)
	{
		PEGetElement(spanId).innerHTML= massage + e.message; 
	}
	return null;
}

function PEGetElement(id)
{
	return  window.document.getElementById(id);
}
function isActiveXRegistered(ctlname) {
	try {
		var comActiveX = new ActiveXObject(ctlname);
	} catch (e) {
		return false;
	}
	return true;
}
function showTFTSetup(passid, name){
	var divObj=document.getElementById(passid);
	tempObjHTML = '<a href="http://www.tftpay.com/newweb/script/'+name+'/setup/PowerEnterTFTPAY.exe">请安装安全输入控件</a>';
    divObj.innerHTML = tempObjHTML;
}