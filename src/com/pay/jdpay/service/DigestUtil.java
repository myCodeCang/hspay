package com.pay.jdpay.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

public class DigestUtil {

	public static String setSign(Map<String, String> params, String key) {
		Map<String, String> sortMap = new TreeMap<String, String>();
		sortMap.putAll(params);
		// 以k1=v1&k2=v2...方式拼接参数
		StringBuilder builder = new StringBuilder();
		for (Map.Entry<String, String> s : sortMap.entrySet()) {
			String k = s.getKey();
			String v = s.getValue();
			if ("".equals(v)) {// 过滤空值
				continue;
			}
			builder.append(k).append("=").append(v).append("&");
		}
		if (!sortMap.isEmpty()) {
			builder.deleteCharAt(builder.length() - 1);
		}
		builder.append("&key").append("=").append(key);
		System.out.println("stringSignTemp:" + builder.toString());
		String signValue = md5Password(builder.toString());
		System.out.println("signValue:" + signValue);
		return signValue.toUpperCase();

	}

	public static String sendPost(String url, String Params) throws IOException {
		OutputStreamWriter out = null;
		BufferedReader reader = null;
		String response = "";
		try {
			URL httpUrl = null; // HTTP URL类 用这个类来创建连接
			// 创建URL
			httpUrl = new URL(url);
			// 建立连接
			HttpURLConnection conn = (HttpURLConnection) httpUrl
					.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("connection", "keep-alive");
			conn.setUseCaches(false);// 设置不要缓存
			conn.setInstanceFollowRedirects(true);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.connect();
			// POST请求
			out = new OutputStreamWriter(conn.getOutputStream());
			out.write(Params);
			out.flush();
			// 读取响应
			reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String lines;
			while ((lines = reader.readLine()) != null) {
				lines = new String(lines.getBytes(), "utf-8");
				response += lines;
			}
			reader.close();
			// 断开连接
			conn.disconnect();

		} catch (Exception e) {
			System.out.println("发送 POST 请求出现异常！" + e);
			e.printStackTrace();
		}
		return response;

	}

	public static String md5Password(String password) {
		try {
			System.out.println("md5:" + password);
			// 得到一个信息摘要器
			MessageDigest digest = MessageDigest.getInstance("md5");
			byte[] result = digest.digest(password.getBytes());
			StringBuffer buffer = new StringBuffer();
			// 把没一个byte 做一个与运算 0xff;
			for (byte b : result) {
				// 与运算
				int number = b & 0xff;// 加盐
				String str = Integer.toHexString(number);
				if (str.length() == 1) {
					buffer.append("0");
				}
				buffer.append(str);
			}

			// 标准的md5加密后的结果
			return buffer.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}

	}

	public static Map<String, String> parseParam(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Enumeration<String> paramsEnum = request.getParameterNames();
			while (paramsEnum.hasMoreElements()) {
				String paramName = paramsEnum.nextElement();
				String paramValue = request.getParameter(paramName);
				System.out.println("-->>" + paramName + "=" + paramValue);
				map.put(paramName, paramValue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public static String parseParam2(HttpServletRequest request) {
		String param = "";
		try {
			InputStreamReader reader = new InputStreamReader(
					request.getInputStream(), "UTF-8");
			char[] buff = new char[1024];
			int length = 0;
			String lines = "";
			while ((length = reader.read(buff)) != -1) {
				lines = new String(buff, 0, length);
				param += lines;
			}
			System.out.println("---->>>json:" + param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return param;
	}

	public static String getURLParam(Map<String, String> map, boolean isSort,
			Set<String> removeKey) {
		System.out
				.println("---------------->>>>>>>>>>>getURLParam------------");
		StringBuffer param = new StringBuffer();
		try {
			List<String> msgList = new ArrayList<String>();
			for (Iterator<String> it = map.keySet().iterator(); it.hasNext();) {
				String key = it.next();
				String value = map.get(key);
				if ((removeKey == null) || (!removeKey.contains(key))) {
					msgList.add(key + "=" + toEmpty(value));
				}
			}
			if (isSort) {
				Collections.sort(msgList);
			}

			for (int i = 0; i < msgList.size(); i++) {
				String msg = msgList.get(i);
				if (i > 0) {
					param.append("&");
				}
				param.append(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return param.toString();
	}

	public static String getSignMsg(Map<String, String> map,
			Set<String> removeKey) {
		return getURLParam(map, true, removeKey);
	}

	public static String toEmpty(String aStr) {
		return aStr == null ? "" : aStr;
	}
}
