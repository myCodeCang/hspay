package com.function;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.pay.yeepay.server.Configuration;
import com.vo.System_interface;

/**
 * 
 * 文件作用：http接口使用实例
 * 
 * 创建时间：2009-06-03
 * 
 * 
 * 100 发送成功 101 验证失败 102 短信不足 103 操作失败 104 非法字符 105 内容过多 106 号码过多 107 频率过快 108
 * 号码内容空 109 账号冻结 110 禁止频繁单条发送 111 系统暂定发送 112 有错误号码 113 定时时间不对 114 账号被锁，10分钟后登录
 * 115 连接失败 116 禁止接口发送 117 绑定IP不正确 120 系统升级
 */

public class Yunsms {
	
	public static String result(int code){
		switch (code) {
		case 100:
			return "发送成功";
		case 101:
			return "验证失败";
		case 102:
			return "手机号码格式不正确";
		case 103:
			return "会员级别不够";
		case 104:
			return "内容未审核";
		case 105:
			return "内容过多";
		case 106:
			return "账户余额不足";
		case 107:
			return "IP受限";
		case 108:
			return "手机号码发送太频繁，请换号或隔天再发";
		case 109:
			return "帐号被锁定";
		case 110:
			return "手机号发送频率持续过高，黑名单屏蔽数日";
		default:
			return "短信服务商正在系统升级";
		}
	}

	/**
	 * @param args
	 * @throws IOException
	 */
	public static String sms(String phone, String contents) throws Exception{
		
/*//		String key = CryptTool.getPasswordOfNumber(6);
//		
//		// 发送内容
//		String content = "您好，您的验证码："+key+"  【浩松网络】";

		// 创建StringBuffer对象用来操作字符串
		//StringBuffer sb = new StringBuffer("http://http.yunsms.cn/tx/?");
		StringBuffer sb = new StringBuffer("http://www.dxton.com/webservice/sms.asmx/Submit?");
		// 向StringBuffer追加用户名
		sb.append("uid="+Types.uid);

		// 向StringBuffer追加密码（密码采用MD5 32位 小写）
		sb.append("&pwd="+Types.pwd);

		// 向StringBuffer追加手机号码
		sb.append("&mobile="+phone);

		sb.append("&encode=utf8");
		
		// 向StringBuffer追加消息内容转URL标准码
		sb.append("&content=" + URLEncoder.encode(contents));
		// System.out.println(sb.toString());

		
		// 向StringBuffer追加用户名
		sb.append("account=635355353");

		// 向StringBuffer追加密码（密码采用MD5 32位 小写）
		sb.append("&password=0985251f3d13076beec69aca778ea31f");

		// 向StringBuffer追加手机号码
		sb.append("&mobile="+phone);

		sb.append("&encode=utf8");
		
		// 向StringBuffer追加消息内容转URL标准码
		sb.append("&content=" + URLEncoder.encode(contents));
		// System.out.println(sb.toString());
		// 创建url对象
		URL url = new URL(sb.toString());

		// 打开url连接
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		// 设置url请求方式 ‘get’ 或者 ‘post’
		connection.setRequestMethod("POST");

		// 发送
		BufferedReader in = new BufferedReader(new InputStreamReader(
				url.openStream()));

		// 返回发送结果
		String inputline = in.readLine();

		// 返回结果为‘100’ 发送成功
//		System.out.println(inputline);
		return inputline;
		
*/		
		System_interface systeminterface = System_interface.dao.findById(1);
		String Url = systeminterface.getStr("system_interface_smsurl")+"?";
		String account = systeminterface.getStr("system_interface_smsaccount");
		String password = systeminterface.getStr("system_interface_smspassword");
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
	    
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", account), 
			    new NameValuePair("password", password), 			    
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", contents),
		};
		
		method.setRequestBody(data);		
		client.executeMethod(method);	
		
		String result =method.getResponseBodyAsString();
		return result;
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(sms("18754521921", "您的验证码是：【123456】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
