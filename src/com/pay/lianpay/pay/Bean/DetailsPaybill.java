package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

public class DetailsPaybill implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public String             oid_biz;               // 业务类型
    public String             date_acct;             // 账务日期
    public String             amt_bal;               // 交易后余额
    public String             flag_dc;               // 资金存取标识
    public String             amt_inoccur;           // 收款金额
    public String             amt_outoccur;          // 付款金额
    public String             dt_billtrans;          // 交易时间
    public String             memo;                  // 备注
    
    public String getOid_biz()
    {
        return oid_biz;
    }
    public void setOid_biz(String oidBiz)
    {
        oid_biz = oidBiz;
    }
    public String getDate_acct()
    {
        return date_acct;
    }
    public void setDate_acct(String dateAcct)
    {
        date_acct = dateAcct;
    }
    public String getAmt_bal()
    {
        return amt_bal;
    }
    public void setAmt_bal(String amtBal)
    {
        amt_bal = amtBal;
    }
    public String getFlag_dc()
    {
        return flag_dc;
    }
    public void setFlag_dc(String flagDc)
    {
        flag_dc = flagDc;
    }
    public String getAmt_inoccur()
    {
        return amt_inoccur;
    }
    public void setAmt_inoccur(String amtInoccur)
    {
        amt_inoccur = amtInoccur;
    }
    public String getAmt_outoccur()
    {
        return amt_outoccur;
    }
    public void setAmt_outoccur(String amtOutoccur)
    {
        amt_outoccur = amtOutoccur;
    }
    public String getDt_billtrans()
    {
        return dt_billtrans;
    }
    public void setDt_billtrans(String dtBilltrans)
    {
        dt_billtrans = dtBilltrans;
    }
    public String getMemo()
    {
        return memo;
    }
    public void setMemo(String memo)
    {
        this.memo = memo;
    }

}
