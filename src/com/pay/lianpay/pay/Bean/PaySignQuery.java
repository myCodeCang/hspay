package com.pay.lianpay.pay.Bean;

import java.io.Serializable;
import java.util.List;

public class PaySignQuery implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 2525641601062922262L;
    private String            ret_code;                                //返回码
    private String            ret_msg;                                 //返回信息
    private String            oid_cust;                                //用户登录名
    private String            oid_userno;                              //用户号
    private String            count;                                   //总记录数
    private List<PaySign>     agreement_list;//查询集合

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

    public String getOid_cust()
    {
        return oid_cust;
    }

    public void setOid_cust(String oid_cust)
    {
        this.oid_cust = oid_cust;
    }

    public String getOid_userno()
    {
        return oid_userno;
    }

    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }

    public String getCount()
    {
        return count;
    }

    public void setCount(String count)
    {
        this.count = count;
    }

    public List<PaySign> getAgreement_list()
    {
        return agreement_list;
    }

    public void setAgreement_list(List<PaySign> agreement_list)
    {
        this.agreement_list = agreement_list;
    }

}
