!function(window){"use strict";function KF5SupportBox(t){this.config=t||{},this.config.is_overdue||(this.config.version=this.config.version||2,2===this.config.version&&(this.config.facade={0:2,1:3,2:1,3:4}[this.config.facade]),this.events={},this.init())}function bindEvent(t,e,i){if(t.addEventListener)return t.addEventListener(e,i,!1);if(t.attachEvent)return t.attachEvent(e,i,!1);throw new Error("Error with binding Event!")}function embed(t,e){var i,n,o,s=window.document.createElement("iframe");s.src="javascript:false",s.title="",s.role="presentation",(s.frameElement||s).style.cssText="display: none",window.document.body.appendChild(s),o=s.contentWindow;try{n=o.document}catch(t){i=window.document.domain,s.src='javascript:var doc=document.open();doc.domain="'+i+'";void(0);',n=o.document}n.open().start=function(){e&&("object"==typeof e?e.iframeWindow=o:"function"==typeof e&&e(o))},n.write('<body onload="document.start();">'),n.write('<script src="'+t+'""><\/script>'),n.close()}function getStyle(t,e){var i,n,o=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,s=/^margin/,a=/^(top|right|bottom|left)$/,r=new RegExp("^("+o+")(?!px)[a-z%]+$","i");return window.getComputedStyle?(i=function(t){return t.ownerDocument.defaultView.getComputedStyle(t,null)},n=function(t,e,n){var o,a,p,c,l=t.style;return n=n||i(t),c=n?n.getPropertyValue(e)||n[e]:void 0,n&&r.test(c)&&s.test(e)&&(o=l.width,a=l.minWidth,p=l.maxWidth,l.minWidth=l.maxWidth=l.width=c,c=n.width,l.width=o,l.minWidth=a,l.maxWidth=p),void 0===c?c:c+""}):document.documentElement.currentStyle&&(i=function(t){return t.currentStyle},n=function(t,e,n){var o,s,p,c,l=t.style;return n=n||i(t),c=n?n[e]:void 0,null==c&&l&&l[e]&&(c=l[e]),r.test(c)&&!a.test(e)&&(o=l.left,s=t.runtimeStyle,p=s&&s.left,p&&(s.left=t.currentStyle.left),l.left="fontSize"===e?"1em":c,c=l.pixelLeft+"px",l.left=o,p&&(s.left=p)),void 0===c?c:c+""||"auto"}),n&&n(t,e)}function animate(t,e,i){function n(){if(clearInterval(c),c=null,!i.carryOn){for(var n in e)t.style[n]=e[n]+"px";"function"==typeof i.callback&&i.callback.call(t)}t._finishAnimation=null}var o={};for(var s in e)o[s]=parseInt(getStyle(t,s));var a=i.duration||500,r=Date.now(),p=0,c=setInterval(function(){p=(Date.now()-r)/a,p=p>1?1:p;var s=easing[i.easing||"swing"](p);for(var c in e)t.style[c]=o[c]+(e[c]-o[c])*s+"px";p>=1&&n()},1e3/60);t._finishAnimation=n}function slideUp(t,e){t._finishAnimation&&t._finishAnimation(),e=e||{};var i,n=e.by||"height";t.style.display="block",i=parseInt(getStyle(t,n)),t.style[n]=(e.from||0)+"px";var o={};o[n]=i,animate(t,o,e)}function slideDown(t,e){t._finishAnimation&&t._finishAnimation(),e=e||{};var i=e.by||"height",n=getStyle(t,i),o=e.callback;e.callback="function"==typeof o?function(){this.style.display="none",this.style[i]=n,o.call(this)}:function(){this.style.display="none",this.style[i]=n};var s={};s[i]=e.to||0,animate(t,s,e)}function hideElement(t){t.style.display="none"}function showElement(t){t.style.display="block"}function cookie(t,e,i){if(void 0===e){var n=null;if(document.cookie&&""!=document.cookie)for(var o=document.cookie.split(";"),s=0;s<o.length;s++){var a=o[s].replace(/^\s+|\s+$/g,"");if(a.substring(0,t.length+1)==t+"="){n=decodeURIComponent(a.substring(t.length+1));break}}return n}i=i||{},null===e&&(e="",i.expires=-1);var r="";if(i.expires&&("number"==typeof i.expires||i.expires.toUTCString)){var p;"number"==typeof i.expires?(p=new Date,p.setTime(p.getTime()+24*i.expires*60*60*1e3)):p=i.expires,r="; expires="+p.toUTCString()}var c=i.path?"; path="+i.path:"",l=i.domain?"; domain="+i.domain:"",f=i.secure?"; secure":"";document.cookie=[t,"=",encodeURIComponent(e),r,c,l,f].join("")}var privateData={},script=window.document.getElementById("kf5-provide-supportBox"),parts=script.src.split("//"),assetsHost=parts.length>1?parts[1].split("/")[0]:"assets.kf5.com",kf5Domain=script.getAttribute("kf5-domain"),lang=script.getAttribute("lang"),supportboxConfigURL="//"+kf5Domain+"/supportbox/buttonconfig",date=(new Date).getDay(),_config={btn_name:"鍦ㄧ嚎鍜ㄨ",facade:4,icon:0,color:"#5d94f3",position:"left",vertical:!1,iframeURL:"//"+kf5Domain+"/supportbox/index?active_in_iframe=0",styleURL:"//"+assetsHost+"/supportbox_v2/css/supportBtn.css",template:'<div id="kf5-support-block" class="kf5-supportBox" style="display: none"><a id="kf5-close-btn" class="kf5-support-chat_close kf5-waves" href="javascript:;"></a><div id="kf5-loading" class="kf5-loading kf5-loading-md kf5-center"></div><div id="kf5-iframe-holder"></div></div><div id="kf5-support-btn" style="{{text_color}}; {{bg_color}};" class="kf5-chatSupport-btn kf5-chatSupport-style{{facade}} kf5-chatSupport-icon{{icon}} kf5-waves waves-effect waves-light"><span>{{title}}</span><div id="msg-number" class="kf5-chatSupport_msgNumber" style="display: none"></div></div><div id="kf5-backdrop" class="kf5-backdrop" style="display: none;"><a class="kf5-backdrop-close">鍏抽棴</a><a href="" target="_blink"><img id="kf5-view-image" class="kf5-backdrop-img" src=""></a></div>',noticeTemplate:'<div class="kf5-support-message" style="right:30px;bottom: 30px"> <div class="kf5-support-message-left"> <img src="{{avatar}}" alt=""> </div> <div class="kf5-support-message-content"> <div class="kf5-support-message-name">{{title}}</div> <div class="kf5-support-message-info">{{content}}</div> </div> <div class="kf5-support-message-right"> <a id="kf5-support-message-accept" class="kf5-support-message-accept">{{submitText}}</a> <a id="kf5-support-message-reject" class="kf5-support-message-reject">{{cancelText}}</a> </div> </div>',defaultNoticeAvatar:"//"+assetsHost+"/supportbox/images/kf5-icon-talk.png",autoLoadIframe:!0},_old_config={has_aside:!1,btn_icon:"//"+assetsHost+"/supportbox/images/icon2.png",styleURL:"//"+assetsHost+"/supportbox/css/btn.css",template:'<div id="kf5-support-btn" class="kf5-support-btn" style="{{bg_color}}"> <img src="{{btn_icon}}" alt=""><span>{{title}}</span> </div> <div id="kf5-support-block" class="kf5-support kf5-support-show {{blockClassNames}}" style="display: none;"> <a id="kf5-close-btn" class="kf5-close" title="鏈€灏忓寲"><i class="kf5-icon-clear"></i></a> <div id="kf5-loading" class="kf5-loading"> </div> <div id="kf5-iframe-holder" style="display:none;"></div> </div>'};Date.now=Date.now||function(){return(new Date).getTime()},window.JSON=window.JSON||{stringify:function(t){t&&t.toJSON&&(t=t.toJSON());var e="";if($.isArray(t)){e+="[";for(var i=0;i<t.length;++i)e+=JSON.stringify(t[i])+",";e=e.replace(/,$/,""),e+="]"}else if($.isPlainObject(t)){e+="{";for(var n in t)t.hasOwnProperty(n)&&(e+='"'+n+'":'+JSON.stringify(t[n])+",");e=e.replace(/,$/,""),e+="}"}else e+="number"==typeof t?t:"string"==typeof t?'"'+t+'"':null===t?"null":t;return e},parse:function(jsonStr){return eval("("+jsonStr+")")}},KF5SupportBox.prototype={el:null,on:function(t,e){return void 0===this.events[t]&&(this.events[t]=[]),"function"==typeof e&&this.events[t].push(e),this},emit:function(t){for(var e=this.events[t]||[],i=Array.prototype.slice.call(arguments,1),n=e.length,o=0;o<n;o++)e[o].apply(null,i)},getElement:function(t){return window.document.getElementById(t.replace("#",""))},getOpt:function(t){var e=this.config||{};return void 0!==e[t]?e[t]:1===e.version&&void 0!==_old_config[t]?_old_config[t]:_config[t]},init:function(){return this.initElements(),this},initElements:function(){1===this.getOpt("version")?this._prepareOldElement():this._prepareElement(),this.render()},render:function(){var t=this;this._prepareStyle(),t.link.onload=function(){document.body.appendChild(t.el),t.onDidInsertElement(),t._bindEvents(),t.link.onload=null},document.body.appendChild(t.link)},onDidInsertElement:function(){if(this.waitingQueue)for(;this.waitingQueue.length;)this.waitingQueue.shift()(this)},waitingQueue:null,ready:function(t){this.el&&this.el.parentNode?t(this):(this.waitingQueue||(this.waitingQueue=[]),this.waitingQueue.push(t))},_prepareStyle:function(){var t=this.link=window.document.createElement("link");return t.rel="styleSheet",t.type="text/css",t.href=this.getOpt("styleURL")+"?v="+date,this},_prepareElement:function(){var t="kf5-support-chat";"left"===this.getOpt("position")?t+=" kf5-chatSupport-left-bottom":"right"===this.getOpt("position")?t+=" kf5-chatSupport-right-bottom":t+=" "+this.getOpt("position");var e=this.getOpt("facade")||4;return this.getOpt("is_mobile")&&(t+=" kf5-mobile"),this.el=window.document.createElement("div"),this.el.setAttribute("class",t),this.el.setAttribute("style","position: relative;z-index: 2147483000"),this.el.innerHTML=this.getOpt("template").replace("{{title}}",this.getOpt("btn_name")).replace("{{facade}}",e).replace("{{icon}}",this.getOpt("icon")).replace("{{text_color}}",this.getOpt("text_color")?"color:"+this.getOpt("text_color"):"").replace("{{bg_color}}",this.getOpt("color")?"background:"+this.getOpt("color"):""),this},_prepareOldElement:function(){var t="kf5-support-123456789";return"left"===this.getOpt("position")?t+=" kf5-left":"right"===this.getOpt("position")?t+=" kf5-right":t+=" "+this.getOpt("position"),isNaN(+this.getOpt("facade"))?t+=" "+this.getOpt("facade"):t+=" kf5-style"+(parseInt(this.getOpt("facade"))||1),this.getOpt("is_mobile")&&(t+=" kf5-mobile"),this.el=window.document.createElement("div"),this.el.setAttribute("class",t),this.el.setAttribute("id","kf5-support-123456789"),this.el.innerHTML=this.getOpt("template").replace("{{title}}",this.getOpt("btn_name")||"鑾峰彇甯姪").replace("{{btn_icon}}",this.getOpt("btn_icon")+"?v="+date).replace("{{bg_color}}",this.getOpt("color")?"background:"+this.getOpt("color"):"").replace("{{blockClassNames}}",this.getOpt("has_aside")?"kf5-has-aside":""),this},addEventCreater:function(){var t=function(t,e){for(var i=t.split(/\s+/g),n=0;n<i.length;n++){var o=i[n];e.call(this,o)}};return"function"==typeof window.addEventListener?function(e,i,n){t(i,function(t){e.addEventListener(t,n,!1)})}:"function"==typeof window.attachEvent?function(e,i,n){t(i,function(t){e.attachEvent("on"+t,n)})}:function(e,i,n){t(i,function(t){e["on"+t]=n})}},_bindEvents:function(){var t=this,e=this.addEventCreater();if(!this.el.eventBinded){var i=this.getElement("#kf5-support-btn"),n=this.getElement("#kf5-close-btn"),o=this.getElement("#kf5-backdrop");e(i,"click touchstart",function(){t.open(),t.hideButton()}),e(n,"click touchstart",function(){t.close(function(){t.showButton()})}),o&&e(o,"click touchstart",function(){o.style.display="none"}),this.el.eventBinded=!0}return this.ready(function(){t.getOpt("autoLoadIframe")&&t.loadIframe(),!t.getOpt("is_mobile")&&cookie("kf5-supportBox-autoOpen")&&(t.open(),t.hideButton())}),this},onIframeReady:function(t){var e=this;this.getElement("#kf5-loading").style.display="none",this.iframe=t,this.emit("iframeReady",t),this.identifyData&&this.identify(this.identifyData),this.AgentGroupData&&this.setAgents(this.AgentGroupData),this.AIQuestionBankType&&this.setAIStore(this.AIQuestionBankType),this.CategoryType&&this.setKnowledgeStore(this.CategoryType),e.iframe&&e.iframe.contentWindow&&e.iframe.contentWindow.postMessage&&(e.iframe.contentWindow.postMessage("CMD::referrerInfo "+JSON.stringify({title:document.title,url:location.href,referrer:document.referrer}),"*"),e.postMessage("CMD::toggleIframePanel",{opened:e.isOpened}))},loadIframe:function(){var t=this,e=this.getElement("#kf5-widget-iframe"),i=this.getElement("kf5-iframe-holder");return e||(e=document.createElement("iframe"),e.setAttribute("id","kf5-widget-iframe"),e.setAttribute("class","kf5-supportBox_iframe"),e.setAttribute("frameborder","0"),e.setAttribute("scrolling","no"),e.attachEvent?e.attachEvent("onload",function(){t.onIframeReady(e)}):e.onload=function(){t.onIframeReady(e)}),e.getAttribute("src")||e.setAttribute("src",this.getOpt("iframeURL")),i&&(i.parentNode.insertBefore(e,i),i.parentNode.removeChild(i)),this},reloadIframe:function(){var t=this.getElement("#kf5-widget-iframe");return this.iframe=null,this.getElement("#kf5-loading").style.display="block",t.setAttribute("src",this.getOpt("iframeURL")),this},removeButton:function(){return hideElement(this.getElement("#kf5-support-btn")),this.buttonRemoved=!0,this},showButton:function(t){if(!this.buttonRemoved){var e={duration:300,easing:"swing",callback:t,from:-80};this.getOpt("vertical")?/left/.test(this.getOpt("position"))?e.by="left":e.by="right":e.by="bottom",slideUp(this.getElement("#kf5-support-btn"),e)}},hideButton:function(t){if(!this.buttonRemoved&&!this.getOpt("is_mobile")){var e={duration:300,easing:"swing",callback:t,to:-80};this.getOpt("vertical")?/left/.test(this.getOpt("position"))?e.by="left":e.by="right":e.by="bottom",slideDown(this.getElement("#kf5-support-btn"),e)}},open:function(t){if(this.getOpt("is_mobile"))return void this.openNewPage();this.isOpened||(this.loadIframe(),slideUp(this.getElement("#kf5-support-block"),{duration:300,easing:"swing",callback:t,by:"bottom",from:-450}),this.getOpt("is_mobile")||cookie("kf5-supportBox-autoOpen",1,{expires:.125,path:"/"}),this.isOpened=!0,this.postMessage("CMD::toggleIframePanel",{opened:!0}))},postMessage:function(t,e){this.iframe&&this.iframe.contentWindow&&this.iframe.contentWindow.postMessage&&this.iframe.contentWindow.postMessage(t+" "+JSON.stringify(e),"*")},openNewPage:function(){var t,e,i="//"+kf5Domain+"/kchat/",n=this.identifyData,o="?lang="+(this.getOpt("lang")||"");if(n&&"object"==typeof n)for(t in n)e=n[t],e="string"==typeof e?e:JSON.stringify(e),o+="&"+t+"="+e;window.location.href=i+o},close:function(t){slideDown(this.getElement("#kf5-support-block"),{duration:300,easing:"swing",callback:t,by:"bottom",to:-450}),cookie("kf5-supportBox-autoOpen",null,{path:"/"}),this.isOpened=!1,this.postMessage("CMD::toggleIframePanel",{opened:!1})},hide:function(){hideElement(this.el)},show:function(){showElement(this.el)},identify:function(t){if(t){var e=JSON.stringify(t);this.iframe&&this.iframe.contentWindow&&this.iframe.contentWindow.postMessage&&this.iframe.contentWindow.postMessage("CMD::identify "+e,"*"),this.identifyData=t}},setAgents:function(t){if(t){var e=JSON.stringify(t);this.iframe&&this.iframe.contentWindow&&this.iframe.contentWindow.postMessage&&this.iframe.contentWindow.postMessage("CMD::setAgents "+e,"*"),this.AgentGroupData=t}},setKnowledgeStore:function(t){if(t){var e=JSON.stringify(t);this.iframe&&this.iframe.contentWindow&&this.iframe.contentWindow.postMessage&&this.iframe.contentWindow.postMessage("CMD::setKnowledgeStore "+e,"*"),this.CategoryType=t}},setAIStore:function(t){if(t){var e=JSON.stringify(t);this.iframe&&this.iframe.contentWindow&&this.iframe.contentWindow.postMessage&&this.iframe.contentWindow.postMessage("CMD::setAIStore "+e,"*"),this.AIQuestionBankType=t}},showNotice:function(t){var e=this,i=window.document.createElement("div");return t="object"==typeof t?t:{},i.innerHTML=this.getOpt("noticeTemplate").replace("{{title}}",t.title||"鎻愮ず淇℃伅").replace("{{content}}",t.content||"").replace("{{avatar}}",t.avatar||this.getOpt("defaultNoticeAvatar")).replace("{{submitText}}",t.submitText||"鎺ュ彈").replace("{{cancelText}}",t.cancelText||"鎷掔粷"),this.closeNotice(),this.noticeElement=i,1===this.getOpt("version")?document.body.appendChild(i):this.el&&this.el.appendChild(i),bindEvent(document.getElementById("kf5-support-message-accept"),"click",function(){e.open(),e.hideButton(),e.iframe&&e.iframe.contentWindow&&e.iframe.contentWindow.postMessage("CMD::kf5NoticeAccepted "+JSON.stringify(t.data),"*"),e.closeNotice()}),bindEvent(document.getElementById("kf5-support-message-reject"),"click",function(){e.iframe&&e.iframe.contentWindow&&e.iframe.contentWindow.postMessage("CMD::kf5NoticeRejected "+JSON.stringify(t.data),"*"),e.closeNotice()}),i},closeNotice:function(){this.noticeElement&&(this.noticeElement.parentNode.removeChild(this.noticeElement),this.noticeElement=null)}},KF5SupportBox.waitingQueue=[],KF5SupportBox.onConfigReady=function(){if(!KF5SupportBox.instance)for(KF5SupportBox.init();KF5SupportBox.waitingQueue.length;)KF5SupportBox.waitingQueue.shift()()},KF5SupportBox.ready=function(t){KF5SupportBox.instance?t():KF5SupportBox.waitingQueue.push(t)},KF5SupportBox.init=function(){if(!KF5SupportBox.instance)return KF5SupportBox.instance=new KF5SupportBox(privateData.KF5_SUPPORTBOX_BUTTON),KF5SupportBox.instance},KF5SupportBox.destroy=function(){KF5SupportBox.instance.el.parent.removeChild(KF5SupportBox.instance.el),KF5SupportBox.instance=null},KF5SupportBox.loadConfig=function(){KF5SupportBox.instance||embed(supportboxConfigURL,function(t){t.KF5_SUPPORTBOX_BUTTON&&t.KF5_SUPPORTBOX_BUTTON.show&&(privateData.KF5_SUPPORTBOX_BUTTON=t.KF5_SUPPORTBOX_BUTTON,KF5SupportBox.onConfigReady())})},bindEvent(window,"DOMContentLoaded",KF5SupportBox.loadConfig),bindEvent(window,"load",KF5SupportBox.loadConfig),bindEvent(window.document,"page:load",KF5SupportBox.loadConfig),bindEvent(window.document,"onreadystatechange",function(){"complete"===window.document.readyState&&KF5SupportBox.loadConfig()}),window.initializeKF5SupportBox||(window.initializeKF5SupportBox=KF5SupportBox.loadConfig),bindEvent(window,"message",function(t){var e,i,n;if(t.data&&"string"==typeof t.data&&(e=t.data.match(/^([^ ]+)(?: +(.*))?/),i=e[1],n=e[2]),"CMD::showSupportbox"===i)KF5SupportBox.instance&&(KF5SupportBox.instance.open(),KF5SupportBox.instance.hideButton());else if("CMD::hideSupportbox"===i)KF5SupportBox.instance&&KF5SupportBox.instance.close(function(){KF5SupportBox.instance.showButton()});else if("CMD::resizeIframe"===i);else if("CMD::kf5Notice"===i)KF5SupportBox.instance&&KF5SupportBox.instance.showNotice(n&&JSON.parse(n));else if("CMD::newMsgCountNotice"===i){if(KF5SupportBox.instance){var o=KF5SupportBox.instance.getElement("#msg-number");n=parseInt(n),n?(o.style.display="block",o.innerHTML=n<10?n:"..."):(o.style.display="none",o.innerHTML="")}}else if("CMD::showImage"===i&&KF5SupportBox.instance){var s=KF5SupportBox.instance.getElement("#kf5-view-image"),a=KF5SupportBox.instance.getElement("#kf5-backdrop"),r=s.parentNode||s.parentElement;n=n?JSON.parse(n):{},a.style.display="block",r.setAttribute("href",n.url),r.setAttribute("title",n.name||""),s.setAttribute("src",n.url),s.setAttribute("alt",n.name||"")}});var easing={swing:function(t){return.5-Math.cos(t*Math.PI)/2},linear:function(t){return t}};window.KF5SupportBoxAPI={init:KF5SupportBox.loadConfig,ready:KF5SupportBox.ready,removeButton:function(){KF5SupportBox.instance&&KF5SupportBox.instance.ready(function(){KF5SupportBox.instance.removeButton()})},showButton:function(t){KF5SupportBox.instance&&KF5SupportBox.instance.ready(function(){KF5SupportBox.instance.showButton()})},hideButton:function(t){KF5SupportBox.instance&&KF5SupportBox.instance.ready(function(){KF5SupportBox.instance.hideButton()})},refresh:function(){KF5SupportBox.instance&&KF5SupportBox.instance.render()},open:function(t){KF5SupportBox.instance&&KF5SupportBox.instance.ready(function(){KF5SupportBox.instance.open(t)})},close:function(t){KF5SupportBox.instance&&KF5SupportBox.instance.ready(function(){KF5SupportBox.instance.close(t)})},identify:function(t){KF5SupportBox.instance&&t&&KF5SupportBox.instance.identify(t)},registerLang:function(t,e){var i=KF5SupportBox.instance;if(i){var n=function(){i.postMessage("CMD::registerLang",{name:t,map:e})};if(i.iframe)return n();i.on("iframeReady",n)}},useLang:function(t){var e=KF5SupportBox.instance;if(e){var i=function(){e.postMessage("CMD::useLang",{name:t})};e.iframe&&i(),e.on("iframeReady",i)}},setParams:function(t){this.setAIStore(t.forum_ids),this.setAgents(t.agent_ids,!!t.force),this.setKnowledgeStore(t.category_ids)},setAgents:function(t,e){if("[object Array]"!==Object.prototype.toString.call(t))throw TypeError("agent_ids is expected to be an array");KF5SupportBox.instance&&t.length>0&&KF5SupportBox.instance.setAgents({agent_ids:t,force:e})},setKnowledgeStore:function(t){if("[object Array]"!==Object.prototype.toString.call(t))throw TypeError("category_ids is expected to be an array");KF5SupportBox.instance&&t.length>0&&KF5SupportBox.instance.setKnowledgeStore({category_ids:t})},setAIStore:function(t){if("[object Array]"!==Object.prototype.toString.call(t))throw TypeError("forum_ids is expected to be an array");KF5SupportBox.instance&&t.length>0&&KF5SupportBox.instance.setAIStore({forum_ids:t})}},"string"==typeof lang&&lang&&KF5SupportBoxAPI.ready(function(){KF5SupportBoxAPI.useLang(lang)})}(window);// JavaScript Document