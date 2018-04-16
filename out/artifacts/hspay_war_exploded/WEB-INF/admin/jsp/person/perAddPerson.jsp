<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<div class="pageContent">
		<form action="<%=adminbasePath%>/person/addPerson" class="pageForm required-validate" method="post"
			onsubmit="return validateCallback(this, dialogAjaxDone)">
			<input type="hidden" name="addpersonToken" value="${addpersonToken}" />
			<div class="pageFormContent" layoutH="58">
				<fieldset>
					<legend>添加客户</legend>
					<dl class="nowrap">
						<dt>邮箱：</dt>
						<dd>
							<input type="text" name="email" class="required email" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>密码：</dt>
						<dd>
							<input type="password" name="password" id="password" class="required alphanumeric" minlength="6" maxlength="20" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>确认密码：</dt>
						<dd>
							<input type="password" name="repassword" class="required" equalto="#password" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>支付密码：</dt>
						<dd>
							<input type="password" name="payment" class="required" minlength="6" maxlength="20" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>网站名称：</dt>
						<dd>
							<input type="text" name="webName" class="required" />
							<span class="info">* 个人填写姓名公司填写公司名称</span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>网站网址：</dt>
						<dd>
							<input type="text" name="website" class="required url" />
							<span class="info">请添加http://开头</span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>所属行业：</dt>
						<dd>
							<select name="herolist">
								<option value="0" selected="selected">党政机关</option>
								<option value="1">商业</option>
								<option value="2">制造业</option>
								<option value="3">服务业</option>
								<option value="4">农业牧渔业</option>
								<option value="5">其它行业</option>
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>用户类型：</dt>
						<dd>
							<select name="huge">
								<option value="0" selected="selected">个人</option>
								<option value="1">企业</option>
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>公司/个人：</dt>
						<dd>
							<input type="text" name="name" class="required" />
							<span class="info">请输入个人或公司名称</span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>联 系 人：</dt>
						<dd>
							<input type="text" name="contacts" class="required" />
							<span class="info"></span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>身 份 证：</dt>
						<dd>
							<input type="text" name="idcard" class="required" />
							<span class="info"></span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>营业执照：</dt>
						<dd>
							<input type="text" name="licence" class="required" />
							<span class="info"></span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>联系地址：</dt>
						<dd>
							<input type="text" name="address" class="required" />
							<span class="info"></span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>手机号码：</dt>
						<dd>
							<input type="text" name="phone" class="required phone" />
							<span class="info"></span>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>QQ号码：</dt>
						<dd>
							<input type="text" name="qq" class="required" />
							<span class="info"></span>
						</dd>
					</dl>
				</fieldset>
			</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">提交</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>