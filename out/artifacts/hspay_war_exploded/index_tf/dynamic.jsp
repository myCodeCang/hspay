<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="秒付宝" />
<title>秒付宝 - 新闻中心</title>
<link href="<%=basePath%>/index_tf/style/index.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/index_tf/style/global.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/index_tf/style/commons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/index_tf/script/jquery-1.8.2.min.js"></script>
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<!--[if lte IE 6]>
	<script src="<%=basePath%>/index_tf/script/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
	<script>
	  DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt,a,a:hover');
	</script>
<![endif]-->
</head>
<body class="body_about_us">
<div id="container">
<div class="about_us_top">
        <ul>
            <li><a href="<%=basePath%>/" target="_blank" class="white_a">秒付宝首页</a></li>
            <li><a href="<%=basePath%>/index_tf/nregiste.jsp" class="white_a">注册</a></li>
            <li><a href="<%=basePath%>/index_tf/nlogin.jsp" class="white_a">登录</a></li> 
        </ul>
  </div>
  <!--顶部帮助 退出结束-->
  <div class="left about_us_logo">
       <div class="about_logo left">
       <p class="left"><a href="<%=basePath%>/" tppabs="index_main.jsp"><img src="<%=basePath%>/index_tf/pic/logo_about.png" tppabs="newweb/pic/logo_about.png" alt="logo" width="142" height="77" border="0" /></a></p>
       <p class="left white height30 margint49">拥有秒付宝，生活更轻松！</p>
       </div><!--秒付宝logo结束-->
       <div id="about_nav">
      <ul>
          <li><a id="ha1" href="<%=basePath%>/index_tf/newweb/service/nabout_index.xhtml.htm" tppabs="newweb/service/nabout_index.xhtml">公司简介</a></li>
          <li><a id="ha2" href="<%=basePath%>/index_tf/dynamic.jsp" tppabs="newweb/service/newslist_center.xhtml">新闻中心</a></li>
          <li><a id="ha3" href="<%=basePath%>/index_tf/newweb/service/nabout_partner_business.xhtml.htm" tppabs="newweb/service/nabout_partner_business.xhtml">合作伙伴</a></li>
          <li><a id="ha4" href="<%=basePath%>/index_tf/newweb/service/nabout_contact.xhtml.htm" tppabs="newweb/service/nabout_contact.xhtml">联系我们</a></li>
          <li><a id="ha5" href="<%=basePath%>/index_tf/newweb/service/nabout_maps.xhtml.htm" tppabs="newweb/service/nabout_maps.xhtml">网站地图</a></li>
      </ul>
      </div>
  </div>

    <script type="text/javascript" language="javascript">
        document.getElementById('ha2').className = 'current';
    </script>
  <!--logo tel 结束-->
  <div class="about_us_main">
      <div class="about_us_main_l">
        <dl class="about_us_main_l_allapp">
            <dt>新闻中心</dt>
            <dd id="ln1" class="icon current2"><a href="<%=basePath%>/index_tf/dynamic.jsp" tppabs="newweb/service/newslist_center.xhtml?TYPE=1">公司公告</a></dd>
            <dd id="ln2" class="icon"><a href="<%=basePath%>/index_tf/newweb/service/newslist_center.xhtml-TYPE=2.htm" tppabs="newweb/service/newslist_center.xhtml?TYPE=2">公司动态</a></dd>
            <dd id="ln3" class="icon"><a href="<%=basePath%>/index_tf/newweb/service/newslist_center.xhtml-TYPE=3.htm" tppabs="newweb/service/newslist_center.xhtml?TYPE=3">媒体动态</a></dd>
        </dl>
           <!--内容 结束-->
      </div>
      <!--左边结束-->
      <div class="about_us_main_r right relative height500">
      <div class="left width720 margint30">
       <div id="banner_news_4" class="banner_news_4"></div>
               <script type="text/javascript" language="javascript">
			        var type="";
			        if(type==''||type==null){
			        	document.getElementById('banner_news_4').className = 'banner_news_4';
			        }else if(type=='1'){
			        	document.getElementById('banner_news_4').className = 'banner_news_1';
			        }else if(type=='2'){
			        	document.getElementById('banner_news_4').className = 'banner_news_2';
			        }else if(type=='3'){
			            document.getElementById('banner_news_4').className = 'banner_news_3';
			        }else{
			       	    document.getElementById('banner_news_4').className = 'banner_news_4';
			        }
			  </script>
            <!--banner结束-->
            <div class="news_list margint10">
            <h4><span class="right marginr10">日期</span>标题</h4>
            <ul id="ulList">
            </ul>
            </div>
            
               <script type="text/javascript" language="javascript">
               $(document).ready(function(){
            		var baseurl="<%=basePath%>";
    				var info="";
            		$.ajax({
            			type : "POST",
            			url : baseurl+"/newsList",
            			data : "",
            			dataType : "json",
            			async : "false",
            			success : function(data) {
            				for( var i = 0; i < data.length; i++ ) {
            					info+="<li><a href='"+baseurl+"/index_tf/dynamicInfo.jsp?dynamicid="+data[i].dynamicid+"'><span class='right marginr10'>"+data[i].createtime+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].title+"</a></li>";
            				}
            				$("#ulList").html(info);
            			},
            			error : function(data) {
            			}
            		});
            	}); 
			  </script>
           
            <div class="left bottom20 left233 right0 absolute">
<div class="r_btn">
<div align="right">
<script type="text/javascript">

	

	function prePage(){

		var f = document.getElementById("pageTagForm");

		f.currentPage.value=parseInt(f.currentPage.value)-1;

        f.submit();

	}

	function nextPage(){

		var f = document.getElementById("pageTagForm");

		f.currentPage.value=parseInt(f.currentPage.value)+1;

        f.submit();

	}

	function jumpPage(obj){

		var f = document.getElementById("pageTagForm");

		f.currentPage.value=parseInt(obj.getAttribute("pagval"));	

        f.submit();

	}	

</script>
</div>

<form name="pageTagForm" id="pageTagForm" action="newslist_center.xhtml-currentPage=1&PAG_CNT=26&TOT_REC_NUM=206&TYPE=.htm" tppabs="newweb/service/newslist_center.xhtml?currentPage=1&PAG_CNT=26&TOT_REC_NUM=206&TYPE="  method="post" callback="callback">
<input type="hidden" name="currentPage" value="1" /> 
<input type="hidden" name="PAG_CNT" value="26" /> 
<input type="hidden" name="TOT_REC_NUM" value="206" />
<input type="hidden" name="TYPE" value="" /> 
</form>
</div>
</div>
        </div>
      <!--右边结束-->
  </div>
</div>
  <!--主结束-->
<div id="foot" class="left">
	<div class="left tcenter width1002">
		<a href="<%=basePath%>/" tppabs="index_main.jsp" class="ray_a marginr5">首页</a>
		<font class="gray_foot_line marginr5">|</font> <a
			href="nabout_index.xhtml.htm" tppabs="newweb/service/nabout_index.xhtml"
			class="ray_a marginr5">关于我们</a> <font class="gray_foot_line marginr5">|</font>
		<a href="nabout_contact.xhtml.htm" tppabs="newweb/service/nabout_contact.xhtml"
			class="ray_a marginr5">联系我们</a> <font class="gray_foot_line marginr5">|</font>
		<a href="nabout_partner_business.xhtml.htm" tppabs="newweb/service/nabout_partner_business.xhtml"
			class="ray_a marginr5">合作伙伴</a> <font class="gray_foot_line marginr5">|</font><a
			href="nabout_maps.xhtml.htm" tppabs="newweb/service/nabout_maps.xhtml"
			class="ray_a marginr5">站点地图</a>
	</div>
	<div class="left tcenter width1002 gray_foot">Copyright&#169;2011-2016
		成都华翔通达网络科技有限公司 版权所有 粤ICP备11009418号-2 客服热线：0830-3153101</div>
</div>
  <!--foot结束-->
</div>
<!--所有结束-->
</body>
</html>