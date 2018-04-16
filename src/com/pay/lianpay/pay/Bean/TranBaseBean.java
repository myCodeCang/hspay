package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 交易基础bean
 * @author guoyx e-mail:guoyx@lianlian.com
 * @date:2013-5-20 上午11:48:10
 * @version :1.0
 *
 */
public class TranBaseBean implements Serializable{
    private static final long serialVersionUID = 1L;
    /** 商户号 */
    protected String          oid_partner;
    /** 用户编号 */
    protected String          user_id;
    protected String          ret_code;
    protected String          ret_msg;
    protected String          sign_type;
    protected String          sign;
    protected String          correlationID;
    /**风控参数 */
    protected String          risk_item;
    protected String          token;
    protected String          api_version;

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

    public String getCorrelationID()
    {
        return correlationID;
    }

    public void setCorrelationID(String correlationID)
    {
        this.correlationID = correlationID;
    }

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

    public String getRisk_item()
    {
        return risk_item;
    }

    public void setRisk_item(String risk_item)
    {
        this.risk_item = risk_item;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getApi_version()
    {
        return api_version;
    }

    public void setApi_version(String api_version)
    {
        this.api_version = api_version;
    }
    
    

}
