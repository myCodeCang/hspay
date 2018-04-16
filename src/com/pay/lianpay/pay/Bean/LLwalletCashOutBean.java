package com.pay.lianpay.pay.Bean;
/**
*
*
* @auther duzl
* @date 2017-6-1 下午2:42:58
* @verison 1.0
**/
public class LLwalletCashOutBean  extends TranBaseBean{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private String            oid_userno;            // 用户唯一编号
    private String            user_login;            // 连连钱包标识+商户号+登录名，最后对这几个参数做加密
    private String            oid_acctno;            // 账户号
    private String            no_order;             // 商户流水号
    private String            dt_order;             // 订单时间
    private String            money_order;          // 提现金额
    private String            pwd_pay;               // 提现金额
    private String            card_no;              // 银行账号
    private String            acct_name;            // 用户银行账号姓名(默认用户的姓名)
    private String            province_code;        // 开户行所在省编码
    private String            city_code;            // 开户行所在市编码
    private String            brabank_name;         // 开户支行名称
    private String            info_order;           // 订单描述
    private String            notify_url;           // 提现结构服务器异步通知地址
    private String            prcptcd;              // 大额行号（若传，则省市支行可不传，且大额行号已此为准）
    private String            ip_addr;               // 请求ip地址
    private String            balance;               // 余额
    private String            freeze_balance;        // 冻结资金
    private String no_agree;//协议号
    private String fee_data;//手续费数据
    private String fee_oid_paybill;
    private String cashout_oid_paybill;
    /** 到账方式。1-实时到账；2-普通到账(默认)；3-次日到账 */
    private String paytime_type;
    public String getOid_userno()
    {
        return oid_userno;
    }
    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }
    public String getUser_login()
    {
        return user_login;
    }
    public void setUser_login(String user_login)
    {
        this.user_login = user_login;
    }
    public String getOid_acctno()
    {
        return oid_acctno;
    }
    public void setOid_acctno(String oid_acctno)
    {
        this.oid_acctno = oid_acctno;
    }
    public String getNo_order()
    {
        return no_order;
    }
    public void setNo_order(String no_order)
    {
        this.no_order = no_order;
    }
    public String getDt_order()
    {
        return dt_order;
    }
    public void setDt_order(String dt_order)
    {
        this.dt_order = dt_order;
    }
    public String getMoney_order()
    {
        return money_order;
    }
    public void setMoney_order(String money_order)
    {
        this.money_order = money_order;
    }
    public String getPwd_pay()
    {
        return pwd_pay;
    }
    public void setPwd_pay(String pwd_pay)
    {
        this.pwd_pay = pwd_pay;
    }
    public String getCard_no()
    {
        return card_no;
    }
    public void setCard_no(String card_no)
    {
        this.card_no = card_no;
    }
    public String getAcct_name()
    {
        return acct_name;
    }
    public void setAcct_name(String acct_name)
    {
        this.acct_name = acct_name;
    }
    public String getProvince_code()
    {
        return province_code;
    }
    public void setProvince_code(String province_code)
    {
        this.province_code = province_code;
    }
    public String getCity_code()
    {
        return city_code;
    }
    public void setCity_code(String city_code)
    {
        this.city_code = city_code;
    }
    public String getBrabank_name()
    {
        return brabank_name;
    }
    public void setBrabank_name(String brabank_name)
    {
        this.brabank_name = brabank_name;
    }
    public String getInfo_order()
    {
        return info_order;
    }
    public void setInfo_order(String info_order)
    {
        this.info_order = info_order;
    }
    public String getNotify_url()
    {
        return notify_url;
    }
    public void setNotify_url(String notify_url)
    {
        this.notify_url = notify_url;
    }
    public String getPrcptcd()
    {
        return prcptcd;
    }
    public void setPrcptcd(String prcptcd)
    {
        this.prcptcd = prcptcd;
    }
    public String getIp_addr()
    {
        return ip_addr;
    }
    public void setIp_addr(String ip_addr)
    {
        this.ip_addr = ip_addr;
    }
    public String getBalance()
    {
        return balance;
    }
    public void setBalance(String balance)
    {
        this.balance = balance;
    }
    public String getFreeze_balance()
    {
        return freeze_balance;
    }
    public void setFreeze_balance(String freeze_balance)
    {
        this.freeze_balance = freeze_balance;
    }
    public String getNo_agree()
    {
        return no_agree;
    }
    public void setNo_agree(String no_agree)
    {
        this.no_agree = no_agree;
    }
    public String getFee_data()
    {
        return fee_data;
    }
    public void setFee_data(String fee_data)
    {
        this.fee_data = fee_data;
    }
    public String getFee_oid_paybill()
    {
        return fee_oid_paybill;
    }
    public void setFee_oid_paybill(String fee_oid_paybill)
    {
        this.fee_oid_paybill = fee_oid_paybill;
    }
    public String getCashout_oid_paybill()
    {
        return cashout_oid_paybill;
    }
    public void setCashout_oid_paybill(String cashout_oid_paybill)
    {
        this.cashout_oid_paybill = cashout_oid_paybill;
    }
    public String getPaytime_type()
    {
        return paytime_type;
    }
    public void setPaytime_type(String paytime_type)
    {
        this.paytime_type = paytime_type;
    }
    
    

}
