/**
 * 
 */
package com.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.pay.yeepay.server.HttpRequest;

/**
 * @author Administrator
 *
 */
public class Test {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
//	    String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><dinpay><response><interface_version>V3.1</interface_version><merchant_code>Z801200801263</merchant_code><order_amount>1.00</order_amount><order_no>O2017051623349822</order_no><order_time>2017-05-16 23:34:08</order_time><qrcode>weixin://wxpay/bizpayurl?pr=zqPhBiP</qrcode><resp_code>SUCCESS</resp_code><resp_desc>通讯成功</resp_desc><result_code>0</result_code><sign>h5LSMb7cYplOPcVBrRL5o8IOzE2eat7ZSZHMH+PV4xg5YPRChkLXchzDZtSRlehoGcJtbGaBf/yy08DmqUaxFK1zhtzkz5aMcdfpZ0ODu8QGUvagQLJCcUKx/WGmKYnM4JCSDOjJhix2HgNM/b1LmY3N4xB1BlN2Qt1L6GaheVo=</sign><sign_type>RSA-S</sign_type><trade_no>Z1025554169</trade_no><trade_time>2017-05-16 23:34:13</trade_time></response></dinpay>";
//		Document document;
//		try {
//			document = DocumentHelper.parseText(xml);
//			Element root=document.getRootElement();
//			System.out.println(root.getName());
//			List<Element> elementList=root.elements("response"); //获得根元素下所有指定的子节点
//			Element element = elementList.get(0);
//			System.out.println(element.getName());
//			System.out.println(element.elementTextTrim("merchant_code"));
//			System.out.println(element.elementTextTrim("order_no"));
//			System.out.println(element.elementTextTrim("qrcode"));
//			System.out.println(element.elementTextTrim("resp_code"));
//			System.out.println(element.elementTextTrim("sign"));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		String url="http://ipn.lanmogu.net/pay/callback.php";
//		String param="?&s&p1_MerId=39&r0_Cmd=Buy&r1_Code=1&r2_TrxId=O2017051822480839&r3_Amt=30.000&r4_Cur=CNY&r5_Pid=Point&r6_Order=2017051822481959550&r7_Uid=&r8_MP=175_9291&r9_BType=2&rb_BankId=weixin&ro_BankOrderId=102510818856201705181295301244&rp_PayDate=2017-05-18&rq_CardNo=&ru_Trxtime=2017-05-18&hmac=148b09b30052810d658b94eea3c71c65";
//		String returnStr=HttpRequest.sendGet(url, param);
//		System.out.println(returnStr);
//		System.out.println( MD5Utils.createMD5(MD5Utils.createMD5("123456")));

//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(new Date());
//		calendar.add(Calendar.DAY_OF_MONTH, -1);
//		System.out.println(sdf.format(calendar.getTime()));
		String url="http://pay.xingwangb.top/miaofu/notice";
		String param="?p1_MerId=88000137&r0_Cmd=Buy&r1_Code=1&r2_TrxId=O2017080804057288000137&r3_Amt=1.000&r4_Cur=CNY&r5_Pid=recharge&r6_Order=a01CK170808040430089&r7_Uid=&r8_MP=recharge&r9_BType=2&rb_BankId=alipay&ro_BankOrderId=105530010039201708086129074879&rp_PayDate=2017-08-08&rq_CardNo=&ru_Trxtime=2017-08-08&hmac=f7a22fd4c6431fc92a379af8eebb928a";
		String returnStr=HttpRequest.sendGet(url, param);
		System.out.println(returnStr);
	}

}
