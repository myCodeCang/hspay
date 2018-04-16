package com.pay.lianpay.pay.Bean;

/**
 * 退款类
 * @author duzl
 *
 */
public class OrderRefund  extends TranBaseBean{

    /**
     * 
     */
    private static final long serialVersionUID = -2848659090330507845L;
    
    //请求参数
    private String oid_partner;//商户编号
    private String no_refund;//商户退款流水号
    private String dt_refund;//商户退款时间
    private String money_refund;//退款金额
    private String no_order;//原商户订单号
    private String dt_order;//原商户订单时间
    private String oid_paybill;//原连连银通支付单号
    private String notify_url;//服务器异步通知地址
    
    //结果参数
    private String oid_refundno;//银通退款流水号
    private String sta_refund;//退款状态
    private String settle_date;//退货成功时返回
    
    private String req_ip;//请求IP
    public String getOid_partner()
    {
        return oid_partner;
    }
    public void setOid_partner(String oid_partner)
    {
        this.oid_partner = oid_partner;
    }
    public String getNo_refund()
    {
        return no_refund;
    }
    public void setNo_refund(String no_refund)
    {
        this.no_refund = no_refund;
    }
    public String getDt_refund()
    {
        return dt_refund;
    }
    public void setDt_refund(String dt_refund)
    {
        this.dt_refund = dt_refund;
    }
    public String getMoney_refund()
    {
        return money_refund;
    }
    public void setMoney_refund(String money_refund)
    {
        this.money_refund = money_refund;
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
    public String getNotify_url()
    {
        return notify_url;
    }
    public void setNotify_url(String notify_url)
    {
        this.notify_url = notify_url;
    }
    public String getOid_refundno()
    {
        return oid_refundno;
    }
    public void setOid_refundno(String oid_refundno)
    {
        this.oid_refundno = oid_refundno;
    }
    public String getSta_refund()
    {
        return sta_refund;
    }
    public void setSta_refund(String sta_refund)
    {
        this.sta_refund = sta_refund;
    }
    public String getReq_ip()
    {
        return req_ip;
    }
    public void setReq_ip(String req_ip)
    {
        this.req_ip = req_ip;
    }
    public String getSettle_date()
    {
        return settle_date;
    }
    public void setSettle_date(String settle_date)
    {
        this.settle_date = settle_date;
    }
    
    
    
    
    

}
