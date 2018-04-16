package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 
 * @author guoyx e-mail:guoyx@lianlian.com
 * @date:2013-5-20 下午01:15:37
 * @version :1.0
 *
 */
public class PayBillQuery implements Serializable{
    private static final long serialVersionUID = 1L;
    private String            oid_trader;
    private String            order_id;
    private String            order_dt;
    private String            oid_billno;
    private String            amt;
    private String            trade_state;
    private String            order_info;
    private String            settle_date;
    private String            ret_code;
    private String            ret_msg;
    private String            pay_type;
    private String            bankcode;
    private String            memo;                  // 查询备注
    private String            bank_name;             //银行名称
    private String            type_dc;// 0商户收款 1 商户付款 2 用户收款 3 个人用户提现
    private String            cardno;
    private String            col_custid;//收款用户号
    private String            oid_userno;//用户号

    public String getPay_type()
    {
        return pay_type;
    }

    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
    }

    public String getBankcode()
    {
        return bankcode;
    }

    public void setBankcode(String bankcode)
    {
        this.bankcode = bankcode;
    }

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

    public String getOrder_info()
    {
        return order_info;
    }

    public void setOrder_info(String order_info)
    {
        this.order_info = order_info;
    }

    public String getSettle_date()
    {
        return settle_date;
    }

    public void setSettle_date(String settle_date)
    {
        this.settle_date = settle_date;
    }

    public String getRet_code()
    {
        return ret_code;
    }

    public void setRet_code(String ret_code)
    {
        this.ret_code = ret_code;
    }

    public String getRet_msg()
    {
        return ret_msg;
    }

    public void setRet_msg(String ret_msg)
    {
        this.ret_msg = ret_msg;
    }

    public String getMemo()
    {
        return memo;
    }

    public void setMemo(String memo)
    {
        this.memo = memo;
    }

    public String getBank_name()
    {
        return bank_name;
    }

    public void setBank_name(String bank_name)
    {
        this.bank_name = bank_name;
    }

    public String getType_dc()
    {
        return type_dc;
    }

    public void setType_dc(String type_dc)
    {
        this.type_dc = type_dc;
    }

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	

	
    public String getCol_custid()
    {
        return col_custid;
    }

    public void setCol_custid(String col_custid)
    {
        this.col_custid = col_custid;
    }

    public String getOid_userno()
    {
        return oid_userno;
    }

    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }
    
	
    

}
