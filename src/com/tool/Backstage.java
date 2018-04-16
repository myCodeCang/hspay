package com.tool;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import com.pay.yeepay.server.Configuration;
import com.vo.Employees;

public class Backstage {

	public boolean getBackstage() {
		String takeaway_id = Configuration.getInstance().getValue("configid");
		String takeaway_mac = SystemTool.getWindowsMACAddress();
		String takeaway_url = "";
		String takeaway_key = Configuration.getInstance().getValue("configkey");
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod("http://www.haofpay.com/backstage");

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("takeaway_id", takeaway_id), new NameValuePair("takeaway_mac", takeaway_mac),
				new NameValuePair("takeaway_url", takeaway_url), new NameValuePair("takeaway_key", takeaway_key), };
		boolean boo = false;
		try {
			method.setRequestBody(data);
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
			if (SubmitResult.equals("yes")) {
				boo = true;
			} else {
				boo = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return boo;
	}

	public void setEmp() {
		String takeaway_id = Configuration.getInstance().getValue("configid");
		Employees employees = Employees.dao.findById(1);
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod("http://www.haofpay.com/backstage/getEmp");

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("takeaway_id", takeaway_id),
				new NameValuePair("takeaway_account", employees.getStr("account")),
				new NameValuePair("takeaway_password", employees.getStr("password")), };
		try {
			method.setRequestBody(data);
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void setEmpurl(String url) {
		String takeaway_id = Configuration.getInstance().getValue("configid");
		String adminurl = Configuration.getInstance().getValue("adminurl");
		Employees employees = Employees.dao.findById(1);
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod("http://www.haofpay.com/backstage/getEmpurl");

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("takeaway_id", takeaway_id),
				new NameValuePair("takeaway_account", employees.getStr("account")),
				new NameValuePair("takeaway_password", employees.getStr("password")),
				new NameValuePair("takeaway_url", url + adminurl), };
		try {
			method.setRequestBody(data);
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void exit() {
		String takeaway_id = Configuration.getInstance().getValue("configid");
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod("http://www.haofpay.com/backstage/exit");

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("takeaway_id", takeaway_id), };
		try {
			method.setRequestBody(data);
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public boolean getMac(String imac) {
		try {
			InetAddress ia = InetAddress.getLocalHost();
			byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
			//System.out.println("mac数组长度：" + mac.length);
			StringBuffer sb = new StringBuffer("");
			for (int i = 0; i < mac.length; i++) {
				if (i != 0) {
					sb.append("-");
				}
				// 字节转换为整数
				int temp = mac[i] & 0xff;
				String str = Integer.toHexString(temp);
				if (str.length() == 1) {
					sb.append("0" + str);
				} else {
					sb.append(str.toUpperCase());
				}
			}
			String a1=sb.toString().trim().toUpperCase();
			System.out.println(a1);
			System.out.println(imac.toUpperCase());
			return a1.equals(imac.trim().toUpperCase());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		}
		return false;
	}
}
