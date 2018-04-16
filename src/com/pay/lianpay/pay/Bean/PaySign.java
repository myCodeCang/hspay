package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 订单查询
 * @author duzl
 *
 */
public class PaySign implements Serializable{
    

    /**
     * 
     */
    private static final long serialVersionUID = -277690967006910640L;
    private String cardno;//银行卡号
    private String bankname;//银行名称
    private String bind_mob;//绑定手机号
    private String agreementno;//协议号
    private String bankcode;//银行编码
    private String agreement_s;//签约状态
    private String reg_date;//签约时间
    private String idtype;//证件类型
    private String idno;//证件号码
    private String cardtype;//卡类型
    public String getCardno()
    {
        return cardno;
    }
    public void setCardno(String cardno)
    {
        this.cardno = cardno;
    }
    public String getBankname()
    {
        return bankname;
    }
    public void setBankname(String bankname)
    {
        this.bankname = bankname;
    }
    public String getBind_mob()
    {
        return bind_mob;
    }
    public void setBind_mob(String bind_mob)
    {
        this.bind_mob = bind_mob;
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
    public String getAgreement_s()
    {
        return agreement_s;
    }
    public void setAgreement_s(String agreement_s)
    {
        this.agreement_s = agreement_s;
    }
    public String getReg_date()
    {
        return reg_date;
    }
    public void setReg_date(String reg_date)
    {
        this.reg_date = reg_date;
    }
    public String getIdtype()
    {
        return idtype;
    }
    public void setIdtype(String idtype)
    {
        this.idtype = idtype;
    }
    public String getIdno()
    {
        return idno;
    }
    public void setIdno(String idno)
    {
        this.idno = idno;
    }
    public String getCardtype()
    {
        return cardtype;
    }
    public void setCardtype(String cardtype)
    {
        this.cardtype = cardtype;
    }
    
    
    

}
