package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

public class CardBean implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private String            cardno;                // 卡号
    private String            bankname;              // 银行名称
    private String            bind_mob;              // 绑定手机号
    private String            agreementno;           // 协议号
    private String            bankcode;              // 银行编码
    private String            agreement_s;           // 签约状态
    private String            reg_date;              // 签约时间
    private String            idtype;                // 证件类型
    private String            idno;                  // 证件号码
    private String            cardtype;              // 卡类型
    private String            flag_sync;             // 同步标识
    
    private String            vali_date;             
    private String            cvv2;             

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

    public String getFlag_sync()
    {
        return flag_sync;
    }

    public void setFlag_sync(String flag_sync)
    {
        this.flag_sync = flag_sync;
    }

	public String getVali_date() {
		return vali_date;
	}

	public void setVali_date(String vali_date) {
		this.vali_date = vali_date;
	}

	public String getCvv2() {
		return cvv2;
	}

	public void setCvv2(String cvv2) {
		this.cvv2 = cvv2;
	}

}
