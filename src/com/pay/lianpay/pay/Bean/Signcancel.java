package com.pay.lianpay.pay.Bean;

public class Signcancel extends TranBaseBean{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public String             agreementno;          // 签约协议号
    public String             oid_userno;           // 用户号
    private String            pay_type;             // 支付方式

    public String getAgreementno()
    {
        return agreementno;
    }

    public void setAgreementno(String agreementno)
    {
        this.agreementno = agreementno;
    }

    public String getOid_userno()
    {
        return oid_userno;
    }

    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }

    public String getPay_type()
    {
        return pay_type;
    }

    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
    }

}
