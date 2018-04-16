package com.pay.lianpay.pay.Bean;
/**
*
*
* @auther duzl
* @date 2017-6-1 下午2:38:41
* @verison 1.0
**/
public class LLWalletBalancePayBean  extends TranBaseBean{
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    /**
     * 请求参数
     */
    private String            user_login;           // 用户名
    private String            busi_partner;         // 商户业务类型
    private String            no_order;             // 商户唯一订单号
    private String            dt_order;             // 商户订单时间
    private String            name_goods;           // 商品名称
    private String            money_order;          // 交易金额
    private String            info_order;           // 订单附加信息
    private String            notify_url;           // 服务器异步通知地址

    /**
     * 返回参数
     */
    private String            oid_paybill;           // 连连钱包支付单号
    private String            name_user;             // 用户姓名
    private String            balance;               // 账户可用余额
    private String            freeze_balance;        // 账户冻结余额
    
    private String            pwd_pay;//支付密码
    private String            col_oidpartner;        //收款方商户号
    private String            verify_code;           //验证码
    private String            mob_bind;//绑定手机号码
    private String            shareing_data; //分帐数据
    private String            secured_partner;//担保商户号
    private String            buyer_confirm_valid;//买方确认有效期
    private String            seller_send_valid;//卖方发货有效期
    private String            col_userid; //收款方用户
    private String            valid_order;//订单有效期
    
    
    
    

    public String getOid_paybill()
    {
        return oid_paybill;
    }

    public void setOid_paybill(String oidPaybill)
    {
        oid_paybill = oidPaybill;
    }

    public String getName_user()
    {
        return name_user;
    }

    public void setName_user(String nameUser)
    {
        name_user = nameUser;
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

    public void setFreeze_balance(String freezeBalance)
    {
        freeze_balance = freezeBalance;
    }

    public String getUser_login()
    {
        return user_login;
    }

    public void setUser_login(String userLogin)
    {
        user_login = userLogin;
    }

    public String getBusi_partner()
    {
        return busi_partner;
    }

    public void setBusi_partner(String busiPartner)
    {
        busi_partner = busiPartner;
    }

    public String getNo_order()
    {
        return no_order;
    }

    public void setNo_order(String noOrder)
    {
        no_order = noOrder;
    }

    public String getDt_order()
    {
        return dt_order;
    }

    public void setDt_order(String dtOrder)
    {
        dt_order = dtOrder;
    }

    public String getName_goods()
    {
        return name_goods;
    }

    public void setName_goods(String nameGoods)
    {
        name_goods = nameGoods;
    }

    public String getMoney_order()
    {
        return money_order;
    }

    public void setMoney_order(String moneyOrder)
    {
        money_order = moneyOrder;
    }

    public String getInfo_order()
    {
        return info_order;
    }

    public void setInfo_order(String infoOrder)
    {
        info_order = infoOrder;
    }

    public String getNotify_url()
    {
        return notify_url;
    }

    public void setNotify_url(String notifyUrl)
    {
        notify_url = notifyUrl;
    }
    

    public String getPwd_pay()
    {
        return pwd_pay;
    }

    public void setPwd_pay(String pwd_pay)
    {
        this.pwd_pay = pwd_pay;
    }

    public String getCol_oidpartner()
    {
        return col_oidpartner;
    }

    public void setCol_oidpartner(String col_oidpartner)
    {
        this.col_oidpartner = col_oidpartner;
    }

    public String getVerify_code()
    {
        return verify_code;
    }

    public void setVerify_code(String verify_code)
    {
        this.verify_code = verify_code;
    }

    public String getMob_bind()
    {
        return mob_bind;
    }

    public void setMob_bind(String mob_bind)
    {
        this.mob_bind = mob_bind;
    }

    public String getShareing_data()
    {
        return shareing_data;
    }

    public void setShareing_data(String shareing_data)
    {
        this.shareing_data = shareing_data;
    }

    public String getSecured_partner()
    {
        return secured_partner;
    }

    public void setSecured_partner(String secured_partner)
    {
        this.secured_partner = secured_partner;
    }

    public String getBuyer_confirm_valid()
    {
        return buyer_confirm_valid;
    }

    public void setBuyer_confirm_valid(String buyer_confirm_valid)
    {
        this.buyer_confirm_valid = buyer_confirm_valid;
    }

    public String getSeller_send_valid()
    {
        return seller_send_valid;
    }

    public void setSeller_send_valid(String seller_send_valid)
    {
        this.seller_send_valid = seller_send_valid;
    }

    public String getCol_userid()
    {
        return col_userid;
    }

    public void setCol_userid(String col_userid)
    {
        this.col_userid = col_userid;
    }

    public String getValid_order()
    {
        return valid_order;
    }

    public void setValid_order(String valid_order)
    {
        this.valid_order = valid_order;
    }
    
    
    
}
