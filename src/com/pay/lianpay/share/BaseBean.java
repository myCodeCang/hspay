package com.pay.lianpay.share;

import com.alibaba.fastjson.JSONObject;
import com.pay.lianpay.util.RSAUtil;
import com.pay.llpay.client.security.Md5Algorithm;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
*
*
* @auther duzl
* @date 2016-8-2 下午1:35:06
* @verison 1.0
**/
public class BaseBean {
    private static String       TRADER_MD5_KEY = "201606150000160004";
    private final static String prikeyvalue       = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKZGXpmfgya2gGh6UdFPqPqi6e2z/HX4aIlMH394FOXTVwErnSGY5S0YFw5WskJrQLU2RHwFiA5P9Yt8VPxwgLDpdIm1/a7NlyjvWNvBd8V7wyITH8teJA1Ae5yWmRRrWFcVRSjpBq3xfwv76lVl+Nq/jR08p/ugVYJgtYEIM53JAgMBAAECgYA17SarPj+j45a7y8gTUXmlaAbkb/ZWMG1+8fBZQBHPA/74wzNf/R1+xYxcuyNvRSekXehSLN0WfzpMtdM+WCJ0ODqHRFsbAxmi784hzBZHOAxoJV49P8PVy6HIPthXxiSNUcacSt/HKJrUI6zACpymJLiVxMb9GqQAyx3BJl7rjQJBANG+RDszZYl3J1z1AtD0WggycrH2YOB7v5o3qKOz2AQ6CHWApSN6cuvqFwaUtHK9gMpDhvWR6zbYVRP+f4AxoQ8CQQDK8fTkpHNrHc011E8jjk3Uq5PWTJ0jAvcqk4rqZa4eV9953YSJYtJ2Fk2JnL3Ba7AU+qStnyD6MvSIpwIPSaOnAkEAptbFaZ4Jn55jdmMC2Xn1f925NGx6RTbKg37Qq18sbrhG8Ejjk2QctCIiLL7vBvJM1xd97CslQhw1GNFxVGSl6wJAQzwFtfoFgudMpRjBXzY18s8lG0omhQLmf+SBkUY+eS8Diowo7Jsgvp6E8aJL+1iB7XFcPWkKs9lNyjgKJqZu4QJAM22ULfWKrNIqaBJaYDmQSupUkHR/WL5rQJtAuVo8Zg3+rBrtMTXfIHJpR0MNpMgRSsPK6pZ3n4i+VvC5WxKUzA==";//正式
//    private final static String prikeyvalue       = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKZGXpmfgya2gGh6UdFPqPqi6e2z/HX4aIlMH394FOXTVwErnSGY5S0YFw5WskJrQLU2RHwFiA5P9Yt8VPxwgLDpdIm1/a7NlyjvWNvBd8V7wyITH8teJA1Ae5yWmRRrWFcVRSjpBq3xfwv76lVl+Nq/jR08p/ugVYJgtYEIM53JAgMBAAECgYA17SarPj+j45a7y8gTUXmlaAbkb/ZWMG1+8fBZQBHPA/74wzNf/R1+xYxcuyNvRSekXehSLN0WfzpMtdM+WCJ0ODqHRFsbAxmi784hzBZHOAxoJV49P8PVy6HIPthXxiSNUcacSt/HKJrUI6zACpymJLiVxMb9GqQAyx3BJl7rjQJBANG+RDszZYl3J1z1AtD0WggycrH2YOB7v5o3qKOz2AQ6CHWApSN6cuvqFwaUtHK9gMpDhvWR6zbYVRP+f4AxoQ8CQQDK8fTkpHNrHc011E8jjk3Uq5PWTJ0jAvcqk4rqZa4eV9953YSJYtJ2Fk2JnL3Ba7AU+qStnyD6MvSIpwIPSaOnAkEAptbFaZ4Jn55jdmMC2Xn1f925NGx6RTbKg37Qq18sbrhG8Ejjk2QctCIiLL7vBvJM1xd97CslQhw1GNFxVGSl6wJAQzwFtfoFgudMpRjBXzY18s8lG0omhQLmf+SBkUY+eS8Diowo7Jsgvp6E8aJL+1iB7XFcPWkKs9lNyjgKJqZu4QJAM22ULfWKrNIqaBJaYDmQSupUkHR/WL5rQJtAuVo8Zg3+rBrtMTXfIHJpR0MNpMgRSsPK6pZ3n4i+VvC5WxKUzA==";

    protected  static String genSign(JSONObject reqObj)
    {
        String sign_type=reqObj.getString("sign_type");
        // // 生成待签名串
        String sign_src = genSignData(reqObj);
        System.out.println("待签名串:"+sign_src);

        if("MD5".equals(sign_type)){
            sign_src += "&key=" + TRADER_MD5_KEY;
            return signMD5(sign_src);
        }
        if("RSA".equals(sign_type)){
            return getSignRSA(sign_src);
        }
        return null;
    }
    


    private static String signMD5(String signSrc)
    {

        try
        {
            return Md5Algorithm.getInstance().md5Digest(
                    signSrc.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * RSA签名验证
     * 
     * @param reqObj
     * @return
     */
    public static String getSignRSA(String sign_src)
    {
        return RSAUtil.sign(prikeyvalue, sign_src);

    }


    /**
     * 生成待签名串
     * 
     * @param paramMap
     * @return
     */
    public static String genSignData(JSONObject jsonObject)
    {
        StringBuffer content = new StringBuffer();

        // 按照key做首字母升序排列
        List<String> keys = new ArrayList<String>(jsonObject.keySet());
        Collections.sort(keys, String.CASE_INSENSITIVE_ORDER);
        for (int i = 0; i < keys.size(); i++)
        {
            String key = (String) keys.get(i);
            // sign 和ip_client 不参与签名
            if ("sign".equals(key))
            {
                continue;
            }
            String value = (String) jsonObject.getString(key);
            // 空串不参与签名
            if (null==value||"".equals(value))
            {
                continue;
            }
            content.append((i == 0 ? "" : "&") + key + "=" + value);

        }
        String signSrc = content.toString();
        if (signSrc.startsWith("&"))
        {
            signSrc = signSrc.replaceFirst("&", "");
        }
        return signSrc;
    }

}
