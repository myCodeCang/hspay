<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>秒付宝 - 商户登录</title>
<link href="<%=basePath%>/index_tf/style/index_specpurpcss.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>/css/validform.css" rel="stylesheet">

<script src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/bootstrap-select.js"></script>
<script src="<%=basePath%>/js/bootstrap-switch.js"></script>

<script type="text/javascript" language="javascript" src="<%=basePath%>/index_tf/script/writeObject_index_main.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>/index_tf/script/tinytable.js"></script>
<script type="text/javascript">
	function writePassShow(oid, cfg, passid){
		writePassObject(oid, cfg, passid, "");
	}
    
    var ts="1493301122992";
    var message = "密码";
	var chkSmsFlg='Y';
	var smsSndFlg=0;
    function merchantSubmit(pwdId) {
    	var loginname=$.trim($("#mer_loginname").val());
    	var loginpwd=$.trim($("#merx_password").val());
    	var sms=$.trim($("#VER_CD").val());
		if (loginname == "") {
            $('#mererror').css('display','block').html("请输入登录用户名");
            return false;
        }
		if (loginpwd == "") {
            $('#mererror').css('display','block').html("请输入登录密码");
            return false;
        }
        if (sms == "") {
            $('#mererror').css('display','block').html("请输入图片验证码");
            return false; 
        }
		$.ajax({
			type:"post",
			url:"<%=basePath%>/login/login",
			data:{email:loginname,password:loginpwd,sms:sms},
			dataType : "json",
			success : function(data) {
				if(data.status=="y"){
					setTimeout(function(){
						window.location.href="<%=basePath%>/member";
					},1000);
				}else{
					$('#mererror').css('display','block').html(data.info);
				}
			},error:function(xhr,status,error){
				alert("对不起，出现错误！"+error);
				return false;
			}
		});
    }
    function updateCode()
    {
		var verify=document.getElementById('divCode');
		verify.setAttribute('src','<%=basePath%>/login/random_number?'+ Math.random());
    }
	
	function checkoper(){
		if ($.trim($("#mer_loginname").val()) == "") {
            $('#mererror').css('display','block').html("请输入登录用户名");
            return false;
        }else{
			$('#mererror').css('display','none');
			return true;
		}
	}
	function checkpwd(){
		if ($.trim($("#merx_password").val()) == "") {
            $('#mererror').css('display','block').html("请输入登录密码");
            return false;
        }else{
			$('#mererror').css('display','none');
			return true;
		}
	}
	function checkcode(){
		var verCd=$.trim($("#VER_CD").val());
		if (verCd.length == 0) {
            $('#mererror').css('display','block').html("请输入图片验证码");
            return false;
        }else if (verCd.length == 4){
			$('#mererror').css('display','none');
			return true;
		}else{
			$('#mererror').css('display','block').html("请输入正确的图片验证码");
            return false;
		}
	}
</script>
<!--[if lte IE 6]>
    <script src="/script/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
    <script>
      DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt,a,a:hover');
    </script>
<![endif]-->
</head>
<body class="body_register">
<div id="container">
<div class="top">
        <ul>
            <li><a href="<%=basePath%>/" target="_blank">网站首页</a></li>
            <li><a href="<%=basePath%>/index_tf/nihelplist_center.jsp">帮助中心</a></li>
            <li><a href="<%=basePath%>/index_tf/nregiste.jsp" >商户注册</a></li> 
        </ul>
  </div> 
	<div class="container" style="width: 970px;">
		<div class="row demo-tiles" >
			<div class="col-md-15">
				<div class="tile">
                  <div class="page-header">
                        <h2 style="font-size: 35px;text-align: left;margin-top: 50px;">商户登录</h2>
                    </div>
					<form class="form-horizontal"  id="merLogin" name="merLogin" action="#" method="post">
							<input type="hidden" name="IS_PAGE_CODE" value="T" id="IS_PAGE_CODE" />
							<input type="hidden" name="CHK_SMS_FLG" value="Y" id="CHK_SMS_FLG" />
							<input id="VER_CD" name="VER_CD" type="hidden" size="4" value="1234" maxlength="4" class="loginyzm"/>
						<div class="form-group">
							<label class="col-sm-3 control-label">登录账号：</label>
							<div class="col-sm-4">
								<input name="USR_ID" type="text" class="form-control" id="mer_loginname" onblur="checkoper();" placeholder="请输入商户名称" />
							</div>
							<div align="left" class="col-sm-5">
								<span class="help-block Validform_checktip"> * 登录用户名</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">登录密码：</label>
							<div class="col-sm-4">
								<input name="password" id="merx_password" type="password" class="form-control" onblur="checkpwd();" maxlength="20" placeholder="请输入登录密码" />
							</div>
							<div align="left" class="col-sm-5">
								<span class="help-block Validform_checktip"> * 登录密码</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-5">
								<input type="button" onclick="merchantSubmit('merpassword')" class="btn btn-lg btn-block btn-primary" value="提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交"></input>
							</div>
						</div>
					</form>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-5">
							<font id="mererror" name="mererror" style="display: none; height:34px;" class="tsypic"></font>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!--主结束--> 

 <div id="foot" class="left">
      <div class="left tcenter width1002">
          <a href="<%=basePath%>/" class="ray_a marginr5">首页</a> <font class="gray_foot_line marginr5">|</font>
          <a href="newweb/service/nabout_index.xhtml.htm" class="ray_a marginr5">关于我们</a> <font class="gray_foot_line marginr5">|</font>
          <a href="newweb/service/nabout_contact.xhtml.htm" class="ray_a marginr5">联系我们</a> <font class="gray_foot_line marginr5">|</font>
          <a href="newweb/service/nabout_partner_business.xhtml.htm" class="ray_a marginr5">合作伙伴</a> <font class="gray_foot_line marginr5">|</font>          
          <a href="newweb/service/nabout_maps.xhtml.htm" class="ray_a marginr5">站点地图</a>
      </div>
      <div class="left tcenter width1002 gray_foot">
      Copyright&#169;2014-2019 成都华翔通达网络科技有限公司 版权所有 粤ICP备11009418号-2 客服热线：0830-3153101 
      </div>
  </div> <!--foot结束-->
</div>
<!--所有结束-->
<script type="text/javascript" src="script/jquery.enplaceholder-home.js"></script>
<script type="text/javascript">
 <!-- placeholderhome-->     
	$('#merLogin #mer_loginname').placeholder({isUseSpan:true});
    $('#merLogin #VER_CD').placeholder();
	var msg='';
	if(msg!='' && msg!='SCM00000'){
		$('#mererror').css('display','block').html("您的输入有错");
	}
</script>
</body>
</html>