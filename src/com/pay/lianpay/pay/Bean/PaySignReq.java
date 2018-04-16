package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

public class PaySignReq implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 3695958352574358014L;
    private String            oid_cust;                                // 用户登录名
    private String            oid_userno;                              // 用户号
    private String            agreementno;                             // 签约协议编号
    private String            bankcode;                                // 银行编码
    private String            cardno;                                  // 签约银行账号
    private String            agreement_s;                             // 签约状态
    private String            offset;                                  // 查询偏移量
    private String            maxrecordes;                             // 每页记录数

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

    public String getAgreementno()
    {
        return agreementno;
    }

    public void setAgreementno(String agreementno)
    {
        this.agreementno = agreementno;
    }

    public String getBankcode()
    {
        return bankcode;
    }

    public void setBankcode(String bankcode)
    {
        this.bankcode = bankcode;
    }

    public String getCardno()
    {
        return cardno;
    }

    public void setCardno(String cardno)
    {
        this.cardno = cardno;
    }

    public String getAgreement_s()
    {
        return agreement_s;
    }

    public void setAgreement_s(String agreement_s)
    {
        this.agreement_s = agreement_s;
    }

    public String getOffset()
    {
        return offset;
    }

    public void setOffset(String offset)
    {
        this.offset = offset;
    }

    public String getMaxrecordes()
    {
        return maxrecordes;
    }

    public void setMaxrecordes(String maxrecordes)
    {
        this.maxrecordes = maxrecordes;
    }

}
