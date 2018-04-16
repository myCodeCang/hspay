package com.pay.lianpay.pay.Bean;

import java.util.List;


/**
 * 支付明细类
 * @author zhuqf
 * @date 2016-4-15 14:53:34
 * @version 1.0
 *
 */
public class PaymentDetailsBean extends BaseLLwalletBean{

    private static final long   serialVersionUID = 1L;

    public String               token;                 // 授权码
    public String               oid_userno;            // 用户号
    public String               offset;                // 查询偏移量
    public String               maxrecodes;            // 每页记录数
    public String               jno_acct;              // 账户流水号
    public String               dt_start;              // 开始时间
    public String               de_end;                // 结束时间
    public String               countno;               // 记录总条数

    public List<DetailsPaybill> paybillList;

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getOid_userno()
    {
        return oid_userno;
    }

    public void setOid_userno(String oidUserno)
    {
        oid_userno = oidUserno;
    }

    public String getOffset()
    {
        return offset;
    }

    public void setOffset(String offset)
    {
        this.offset = offset;
    }

    public String getMaxrecodes()
    {
        return maxrecodes;
    }

    public void setMaxrecodes(String maxrecodes)
    {
        this.maxrecodes = maxrecodes;
    }

    public String getJno_acct()
    {
        return jno_acct;
    }

    public void setJno_acct(String jnoAcct)
    {
        jno_acct = jnoAcct;
    }

    public String getDt_start()
    {
        return dt_start;
    }

    public void setDt_start(String dtStart)
    {
        dt_start = dtStart;
    }

    public String getDe_end()
    {
        return de_end;
    }

    public void setDe_end(String deEnd)
    {
        de_end = deEnd;
    }

    public String getCountno()
    {
        return countno;
    }

    public void setCountno(String countno)
    {
        this.countno = countno;
    }

    public List<DetailsPaybill> getPaybillList()
    {
        return paybillList;
    }

    public void setPaybillList(List<DetailsPaybill> paybillList)
    {
        this.paybillList = paybillList;
    }

}
