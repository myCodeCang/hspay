/**
 * 
 */
package com.pay.ysspay.server;

/**
 * @author 春春
 *
 */
public class MoboConfig {
	// 请选择签名类型， MD5、CER(证书文件)、RSA
	public static final String SIGN_TYPE = "MD5";
//	public static final String SIGN_TYPE = "CER";
//	public static final String SIGN_TYPE = "RSA";

	//******************配置商户基本信息
	// 商户ID
	public static String PLATFORM_ID = "2105841509425819";
	// 商户帐号
	public static String MERCHANT_ACC = "2105841509425819";
	//******************配置商户基本信息***结束
	
	//******************使用MD5签名方式需配置下列参数
	// MD5签名的key值
	public static String MD5_KEY = "683c9f31489abdf4e7a571f3278e476e";
	//******************MD5签名方式需配置***结束
	
	//******************使用证书签名方式需配置下列参数
	// 商户私钥文件--用于商户数据签名
	public static String PFX_FILE = "c:/temp/test/merchtest.pfx";
	// 摩宝支付公钥文件--用于摩宝支付返回数据验签
	public static String CERT_FILE = "c:/temp/test/mobaopay.cer";
	// 私钥文件密码
	public static String PASSWD = "merchtest";
	//******************证书签名方式需配置***结束

	//******************使用RSA签名方式需配置下列参数
	// 用于签名的商户RSA私钥
	public static String RSA_MERCH_PRIVATE_KEY = "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAojv6Zh4PbSdmGCqTwYBNf3R/DyRexUpvlA4r8xSsR14nODVaADDzuFj7dnlh+xlOUd5zZQaHxttD6mONx7MwwwIDAQABAkEAnZpKrL1zGwT1R3DFTWuI3dKcRGd+sYaYUmpaA7EHk+O1MTJuN+OKG9SgPGVDq/2Bov7qLBeuXnkXLHbBvS9rAQIhANVnQ3zUOPPC1vBYYQAP7Se6tXBHi0lKLVWjEwQ2ZdaDAiEAwp4EOeLmgCJrX3MXw1NyrBnpkHsbSyLs2DJ2SRp4KMECIDFfyfqIs4CalNZY7GByTuGBTldjBjP3yJNmvpCb8WX3AiB5lh8tywQWqWpLh6wg69GIk+fHzCGRH5C4wU4E/fR0AQIgIUD1fTkUbKvdcc5mG0gyGUvG0XvazP5GhB9RarzD6Bk=";
	// 用于验签的摩宝支付RSA公钥
	public static String RSA_MBP_PUBLIC_KEY = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKI7+mYeD20nZhgqk8GATX90fw8kXsVKb5QOK/MUrEdeJzg1WgAw87hY+3Z5YfsZTlHec2UGh8bbQ+pjjcezMMMCAwEAAQ==";
	//******************RSA签名方式需配置***结束

	// 通知地址
	public static String MERCHANT_NOTIFY_URL = "http://192.168.31.104:8080/MobaoPayExample/callBack.jsp";
	//public static String MERCHANT_NOTIFY_URL = "http://127.0.0.1:8080/MobaoPayExample/callBack.jsp";
	// 摩宝支付网关
    // 正式地址
	public static String MOBAOPAY_GETWAY = "http://pay.ysspay.cn/cgi-bin/netpayment/pay_gate.cgi";
	
	// 摩宝支付接口版本
	public static final String MOBAOPAY_API_VERSION = "1.0.0.0";

	// 接口名称
	public static final String MOBAOPAY_APINAME_PAY = "WEB_PAY_B2C";
	/**微信扫码*/
	public static final String MOBAOPAY_WEIXIN_PAY = "WECHAT_PAY";
	/**支付宝扫码*/
	public static final String MOBAOPAY_ALI_PAY = "AL_SCAN_PAY";
	public static final String MOBAOPAY_APINAME_QUERY = "MOBO_TRAN_QUERY";
	public static final String MOBAOPAY_APINAME_REFUND = "MOBO_TRAN_RETURN";


}
