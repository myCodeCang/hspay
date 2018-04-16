package com.pay.lianpay.pay.Bean;
/**
*
*
* @auther duzl
* @date 2017-6-1 下午1:15:20
* @verison 1.0
**/
public class LLWalletTraderPayBean  extends TranBaseBean{
    
    private static final long serialVersionUID = 1L;

    /** 商户业务类型 */
    private String            busi_partner;
    /** 转账金额 */
    private String            money_order;
    /** 订单附加信息 */
    private String            info_order;
    /** 支付来源 */
    private String            proc_src;
    /** 通知地址 */
    private String            notify_url;
    /** 收款方用户号 */
    private String            col_userid;
    /** 商品名称 */
    private String            name_goods;
    /**商户唯一订单号 */
    private String            no_order;           
    /**  商户订单时间*/
    private String            dt_order;           
    /** 连连钱包支付单号*/
    private String            oid_paybill; 
    /** 付款方商户号*/
    private String            pay_oidpartner;
    /** 是否记账*/
    private String           flag_account;
    /** 订单有效期*/
    private String            valid_order;//订单有效期
    
    public String getBusi_partner()
    {
        return busi_partner;
    }
    public void setBusi_partner(String busi_partner)
    {
        this.busi_partner = busi_partner;
    }
    public String getMoney_order()
    {
        return money_order;
    }
    public void setMoney_order(String money_order)
    {
        this.money_order = money_order;
    }
    public String getInfo_order()
    {
        return info_order;
    }
    public void setInfo_order(String info_order)
    {
        this.info_order = info_order;
    }
    public String getProc_src()
    {
        return proc_src;
    }
    public void setProc_src(String proc_src)
    {
        this.proc_src = proc_src;
    }
    public String getNotify_url()
    {
        return notify_url;
    }
    public void setNotify_url(String notify_url)
    {
        this.notify_url = notify_url;
    }
    public String getCol_userid()
    {
        return col_userid;
    }
    public void setCol_userid(String col_userid)
    {
        this.col_userid = col_userid;
    }
    public String getName_goods()
    {
        return name_goods;
    }
    public void setName_goods(String name_goods)
    {
        this.name_goods = name_goods;
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
    public String getOid_paybill()
    {
        return oid_paybill;
    }
    public void setOid_paybill(String oid_paybill)
    {
        this.oid_paybill = oid_paybill;
    }
    public String getPay_oidpartner()
    {
        return pay_oidpartner;
    }
    public void setPay_oidpartner(String pay_oidpartner)
    {
        this.pay_oidpartner = pay_oidpartner;
    }
    public String getFlag_account()
    {
        return flag_account;
    }
    public void setFlag_account(String flag_account)
    {
        this.flag_account = flag_account;
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
