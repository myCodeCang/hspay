package com.pay.lianpay.combinepay.test;

import com.alibaba.fastjson.JSON;
import com.pay.lianpay.pay.Bean.WeChatPayBean;
import com.pay.lianpay.share.BaseBean;
import com.pay.lianpay.util.HttpRequestSimple;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 余额支付测试
 * @author duzl
 * @date 2017-06-01
 */
public class TestCombinePay  extends BaseBean {
    private final static String SERVER         = "http://test.yintong.com.cn/llwalletapi/"; //测试环境
//  private final static String SERVER         = "https://wallet.lianlianpay.com/llwalletapi/";//生产环境
    private static  String public_key="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSS/DiwdCf/aZsxxcacDnooGph3d2JOj5GXWi+q3gznZauZjkNP8SKl3J2liP0O6rU/Y/29+IUe+GTMhMOFJuZm1htAtKiu5ekW0GlBMWxf4FPkYlQkPE0FtaoMP3gYfh+OwI+fIRrpW3ySn3mScnc6Z700nU/VYrRkfcSCbSnRwIDAQAB";
    
    public static void main(String[] args)
    {
        /**
         * 微信 支付宝支付
         */
        testWeChatAliPay();
    }
    
    /**
     * 微信支付宝支付
     */
    public static void testWeChatAliPay()
    {
        WeChatPayBean weChatPayBean = new WeChatPayBean();
        weChatPayBean.setNo_order("100001");
        weChatPayBean.setOid_partner("201606150000160004");
        weChatPayBean.setCol_oidpartner("201606150000160004");
        weChatPayBean.setBusi_partner("101001");
        weChatPayBean.setMoney_order("0.01");
        weChatPayBean.setUser_id("test10@yintong.com.cn");
        weChatPayBean.setName_goods("测试微信支付宝支付");
        weChatPayBean.setDt_order(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
        weChatPayBean.setNotify_url("http://payhttp.xiaofubao.com/***/back.shtml");
        weChatPayBean.setReturn_url("http://www.baidu.com");
        weChatPayBean.setInfo_order("买买买");
//        weChatPayBean.setPay_type("I");//微信扫码支付
//        weChatPayBean.setPay_type("L");//支付宝扫码支付
//        weChatPayBean.setPay_type("Y");//微信APP支付
        weChatPayBean.setPay_type("W");//微信公众号支付
        weChatPayBean.setAppid("wx2a5538052969956e");
        weChatPayBean.setOpenid("assgf");
        weChatPayBean.setRisk_item("{\"frms_client_chnl\":\"10\",\"frms_ip_addr\":\"183.172.12.108\",\"frms_imei\":\"423198429310234\",\"frms_mechine_id\":\"423198429310234\",\"frms_mac_addr\":\"7C:7D:3D:B8:F1:A9\"}");
        weChatPayBean.setSign_type("RSA");
//        weChatPayBean.setSecured_partner("201608160000201008");//需要担保交易
//        weChatPayBean.setSecured_partner("201701120000283007");
//        weChatPayBean.setCol_oidpartner("201701120000283007");
//        weChatPayBean.setShareing_data("15397177700^0^0.2^测试分账");
        weChatPayBean.setSign(genSign(JSON.parseObject(JSON.toJSONString(weChatPayBean))));
        String reqJson = JSON.toJSONString(weChatPayBean);
        HttpRequestSimple httpclent = new HttpRequestSimple();
        String resJson = httpclent.postSendHttp(SERVER + "combinepay.htm", reqJson);
        System.out.println("请求报文为:" + reqJson);
        System.out.println("结果报文为:" + resJson);
    }
    
  
   
   

}
