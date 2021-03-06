package com.pay.lianpay.pay.Bean;

/**
 * 支付结果查询交易bean
 * @author guoyx e-mail:guoyx@lianlian.com
 * @date:2013-5-20 上午11:51:41
 * @version :1.0
 * 
 */
public class OrderQuery extends TranBaseBean{
    private static final long serialVersionUID = 1L;
    private String            oid_partner;
    private String            no_order;
    private String            dt_order;
    private String            oid_paybill;
    private String            result_pay;
    private String            money_order;
    private String            settle_date;
    private String            info_order;
    private String            req_ip;
    private String            pay_type;
    private String            bank_code;
    private String            memo; //新增字段
    private String            type_dc;
    
    

    public String getPay_type()
    {
        return pay_type;
    }
    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
    }

    public String getBank_code()
    {
        return bank_code;
    }

    public void setBank_code(String bank_code)
    {
        this.bank_code = bank_code;
    }

    public String getOid_partner()
    {
        return oid_partner;
    }

    public void setOid_partner(String oid_partner)
    {
        this.oid_partner = oid_partner;
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

    public String getResult_pay()
    {
        return result_pay;
    }

    public void setResult_pay(String result_pay)
    {
        this.result_pay = result_pay;
    }

    public String getMoney_order()
    {
        return money_order;
    }

    public void setMoney_order(String money_order)
    {
        this.money_order = money_order;
    }

    public String getSettle_date()
    {
        return settle_date;
    }

    public void setSettle_date(String settle_date)
    {
        this.settle_date = settle_date;
    }

    public String getInfo_order()
    {
        return info_order;
    }

    public void setInfo_order(String info_order)
    {
        this.info_order = info_order;
    }

    public String getReq_ip()
    {
        return req_ip;
    }

    public void setReq_ip(String req_ip)
    {
        this.req_ip = req_ip;
    }

    public String getMemo()
    {
        return memo;
    }

    public void setMemo(String memo)
    {
        this.memo = memo;
    }
    public String getType_dc()
    {
        return type_dc;
    }
    public void setType_dc(String type_dc)
    {
        this.type_dc = type_dc;
    }
    
    

    
    
    

}
