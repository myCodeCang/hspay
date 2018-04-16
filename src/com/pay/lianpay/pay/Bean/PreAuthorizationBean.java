package com.pay.lianpay.pay.Bean;


/**
 * 预授权类
 * @author zhuqf
 * @date 2015-5-5 17:09:55
 * @version 1.0
 *
 */
public class PreAuthorizationBean extends BankCardPayBean{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    /** 商户号 */
    private String oid_trader;
    /** 商户订单号 */
    private String order_id;
    /** 商户订单=日期 */
    private String order_dt;
    /** 支付单号 */
    private String oid_billno;
    /** 订单金额 (单位：里) */
    private String amt;
    /** 交易状态 */
    private String trade_state;
    /** 银行编码 */
    private String bankcode;
    /** 预授权卡号 */
    private String cardno;
    private String dt_prevalid;//预授权有效期：yyyyMMddHHmmss
    public String getOid_trader()
    {
        return oid_trader;
    }
    public void setOid_trader(String oid_trader)
    {
        this.oid_trader = oid_trader;
    }
    public String getOrder_id()
    {
        return order_id;
    }
    public void setOrder_id(String order_id)
    {
        this.order_id = order_id;
    }
    public String getOrder_dt()
    {
        return order_dt;
    }
    public void setOrder_dt(String order_dt)
    {
        this.order_dt = order_dt;
    }
    public String getOid_billno()
    {
        return oid_billno;
    }
    public void setOid_billno(String oid_billno)
    {
        this.oid_billno = oid_billno;
    }
    public String getAmt()
    {
        return amt;
    }
    public void setAmt(String amt)
    {
        this.amt = amt;
    }
    public String getTrade_state()
    {
        return trade_state;
    }
    public void setTrade_state(String trade_state)
    {
        this.trade_state = trade_state;
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
	public String getDt_prevalid() {
		return dt_prevalid;
	}
	public void setDt_prevalid(String dt_prevalid) {
		this.dt_prevalid = dt_prevalid;
	}
}
