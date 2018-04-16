package com.pay.shpay.service;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.digest.DigestUtils;

public class DigestUtil {
	public static String GetMD5(String str, boolean code) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			if (code) {// 32位的加密
				return buf.toString().toUpperCase();
			} else {// 16位的加密
				return buf.toString().substring(8, 24).toUpperCase();
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;

	}

	public static String getMD5(String password) {
		try {
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
			return buffer.toString().toUpperCase();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}

	}
	public static void main(String[] args) throws IOException {
		String plainText = "asdf";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			System.out.println(DigestUtils.md5Hex("customerid=101611&sdcustomno=20170508234580770001&ordermoney=10&cardno=34&faceno=zfb&noticeurl=http://zf.miaojiesuan.net/service/CallBack/callback51.aspx&backurl=http://zf.miaojiesuan.net/service/jump/Pay51PageCallback.aspx&endcustomer=&endip=127.0.0.1&remarks=JRSoft3.0&mark=JRSoft3.0&key=0c87085b8427da13d396ab52a2b25a3b"));
			System.out.println("result: " + buf.toString());// 32位的加密
			System.out.println("result: " + buf.toString().substring(8, 24));// 16位的加密
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}
}
