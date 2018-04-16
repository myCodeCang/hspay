/**
 * 
 */
package com.pay.gopay.server;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpConnectionParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;

/**
 * @author Administrator
 * 
 */
public class GopayUtils {
	/**
	 * 国付宝提供给商户调试的网关地址
	 */
	public static String gopay_gateway = "https://gateway.gopay.com.cn/Trans/WebClientAction.do";

	/**
	 * 国付宝服务器时间，反钓鱼时使用
	 */
	public static String gopay_server_time_url = "https://gateway.gopay.com.cn/time.do";

	/**
	 * 字符编码格式，目前支持 GBK 或 UTF-8
	 */
	public static String input_charset = "UTF-8";

	/**
	 * 获取国付宝服务器时间 用于时间戳
	 * 
	 * @return 格式YYYYMMDDHHMMSS
	 */
	public static String getGopayServerTime() {
		HttpClient httpClient = new HttpClient();
		httpClient.getParams().setCookiePolicy(CookiePolicy.RFC_2109);
		httpClient.getParams().setIntParameter(HttpConnectionParams.SO_TIMEOUT,
				10000);
		GetMethod getMethod = new GetMethod(gopay_server_time_url);
		getMethod.getParams().setParameter(
				HttpMethodParams.HTTP_CONTENT_CHARSET, "GBK");
		// 执行getMethod
		int statusCode = 0;
		try {
			statusCode = httpClient.executeMethod(getMethod);
			if (statusCode == HttpStatus.SC_OK) {
				String respString = StringUtils.trim((new String(getMethod
						.getResponseBody(), "GBK")));
				return respString;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			getMethod.releaseConnection();
		}
		return null;
	}

	/**
	 * Convenience method to get the IP Address from client.
	 * 
	 * @param request
	 *            the current request
	 * @return IP to application
	 */
	public static String getIpAddr(HttpServletRequest request) {
		if (request == null)
			return "";

		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static String isEmpty(String str) {
		if (StringUtils.isBlank(str))
			return StringUtils.EMPTY;
		else
			return StringUtils.trimToEmpty(str);
	}

	/**
	 * 对字符串进行MD5签名
	 * 
	 * @param text
	 *            明文
	 * 
	 * @return 密文
	 */
	public static String md5(String text) {
		return DigestUtils.md5Hex(getContentBytes(text, input_charset));
	}

	/**
	 * 对字符串进行SHA签名
	 * 
	 * @param text
	 *            明文
	 * 
	 * @return 密文
	 */
	public static String sha(String text) {
		return DigestUtils.shaHex(getContentBytes(text, input_charset));
	}

	/**
	 * @param content
	 * @param charset
	 * @return
	 * @throws SignatureException
	 * @throws UnsupportedEncodingException
	 */
	private static byte[] getContentBytes(String content, String charset) {
		if (charset == null || "".equals(charset)) {
			return content.getBytes();
		}

		try {
			return content.getBytes(charset);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:"
					+ charset);
		}
	}

}
