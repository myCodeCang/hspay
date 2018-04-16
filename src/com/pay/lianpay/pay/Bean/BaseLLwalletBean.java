package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 钱包基础类
 * @author duzl
 * Dec 6, 2013 2:57:55 PM
 * @version :1.0
 */
public class BaseLLwalletBean implements Serializable{

    private static final long serialVersionUID = 1L;

    /** 商户号 */
    private String            oid_partner;
    /** 用户编号 */
    private String            user_id;
    /** 签名方式 */
    private String            sign_type;
    /** 签名 */
    private String            sign;
    private String            ret_code;
    private String            ret_msg;
    /** 版本号 */
    private String            api_version;
    /** 平台标识 */
    private String            platform;
    /** 授权码 */
    private String            token;
    private String            flag_chn;
    private String            mac_request;
    private String            machine_id;
    private String            imei_request;
    private String            imsi_request;
    private String            transcode;
    private String            ver_app;
    private String            correlationID; //唯一记录编号
    /** 操作标示 1 短信验证标示 */
    private String             flag_check;
    /**风控参数 */
    private String            risk_item;

    public String getOid_partner()
    {
        return oid_partner;
    }

    public void setOid_partner(String oid_partner)
    {
        this.oid_partner = oid_partner;
    }

    public String getUser_id()
    {
        return user_id;
    }

    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }

    public String getSign_type()
    {
        return sign_type;
    }

    public void setSign_type(String sign_type)
    {
        this.sign_type = sign_type;
    }

    public String getSign()
    {
        return sign;
    }

    public void setSign(String sign)
    {
        this.sign = sign;
    }

    public String getRet_code()
    {
        return ret_code;
    }

    public void setRet_code(String ret_code)
    {
        this.ret_code = ret_code;
    }

    public String getRet_msg()
    {
        return ret_msg;
    }

    public void setRet_msg(String ret_msg)
    {
        this.ret_msg = ret_msg;
    }

    public String getApi_version()
    {
        return api_version;
    }

    public void setApi_version(String api_version)
    {
        this.api_version = api_version;
    }

    public String getPlatform()
    {
        return platform;
    }

    public void setPlatform(String platform)
    {
        this.platform = platform;
    }

    public String getFlag_chn()
    {
        return flag_chn;
    }

    public void setFlag_chn(String flag_chn)
    {
        this.flag_chn = flag_chn;
    }

    public String getMac_request()
    {
        return mac_request;
    }

    public void setMac_request(String mac_request)
    {
        this.mac_request = mac_request;
    }

    public String getMachine_id()
    {
        return machine_id;
    }

    public void setMachine_id(String machine_id)
    {
        this.machine_id = machine_id;
    }

    public String getImei_request()
    {
        return imei_request;
    }

    public void setImei_request(String imei_request)
    {
        this.imei_request = imei_request;
    }

    public String getImsi_request()
    {
        return imsi_request;
    }

    public void setImsi_request(String imsi_request)
    {
        this.imsi_request = imsi_request;
    }

    public String getTranscode()
    {
        return transcode;
    }

    public void setTranscode(String transcode)
    {
        this.transcode = transcode;
    }

    public String getVer_app()
    {
        return ver_app;
    }

    public void setVer_app(String ver_app)
    {
        this.ver_app = ver_app;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getCorrelationID()
    {
        return correlationID;
    }

    public void setCorrelationID(String correlationID)
    {
        this.correlationID = correlationID;
    }

    public String getFlag_check()
    {
        return flag_check;
    }

    public void setFlag_check(String flag_check)
    {
        this.flag_check = flag_check;
    }

    public String getRisk_item()
    {
        return risk_item;
    }

    public void setRisk_item(String risk_item)
    {
        this.risk_item = risk_item;
    }
    
    
    
    

}
