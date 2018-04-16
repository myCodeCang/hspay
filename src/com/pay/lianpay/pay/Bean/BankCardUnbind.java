package com.pay.lianpay.pay.Bean;

public class BankCardUnbind extends TranBaseBean{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public String             oid_partner;          // 商户编号
    public String             user_id;              // 用户ID
    public String             card_no;              // 解绑卡号
    public String             no_agree;             // 银行卡签约唯一编号
    public String             platform;              // 台来源标识
    private String            pay_type;         // 2：快捷支付（默认） D：认证支付
    private String            pwd_pay;//支付密码

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

    public String getCard_no()
    {
        return card_no;
    }

    public void setCard_no(String card_no)
    {
        this.card_no = card_no;
    }

    public String getNo_agree()
    {
        return no_agree;
    }

    public void setNo_agree(String no_agree)
    {
        this.no_agree = no_agree;
    }

    public String getPlatform()
    {
        return platform;
    }

    public void setPlatform(String platform)
    {
        this.platform = platform;
    }

    public String getPay_type()
    {
        return pay_type;
    }

    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
    }

    public String getPwd_pay()
    {
        return pwd_pay;
    }

    public void setPwd_pay(String pwd_pay)
    {
        this.pwd_pay = pwd_pay;
    }
    


}
