/**
 * 
 */
package com.pay.lianpay.pay.Bean;

import java.util.List;

/**
 * @author Administrator
 *
 */
public class BankCardSignQuery extends TranBaseBean{
    private static final long serialVersionUID = 1L;

    // 请求参数
    private String            oid_partner;          // 商户编号
    private String            user_id;              // 用户编号
    private String            no_agree;             // 签约编号
    private String            card_no;              // 签约银行卡号
    private String            offset;               // 查询偏移量
    private String            flag_kyc;             // 签约用户认证标志0：通过 1：未通过
    private String            maxrecordes;          // 每页记录数

    private String            platform;              // 平台来源标示
    // 结果参数
    private String            count;                // 总记录条数
    private List<Agreement>   agreement_list;       // 结果集
    private String            flag_reg;             //注册标识 0非注册 1注册
    private String            pay_type;         // 2：快捷支付（默认） D：认证支付
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

    public String getNo_agree()
    {
        return no_agree;
    }

    public void setNo_agree(String no_agree)
    {
        this.no_agree = no_agree;
    }

    public String getCard_no()
    {
        return card_no;
    }

    public void setCard_no(String card_no)
    {
        this.card_no = card_no;
    }

    public String getOffset()
    {
        return offset;
    }

    public void setOffset(String offset)
    {
        this.offset = offset;
    }

    public String getCount()
    {
        return count;
    }

    public void setCount(String count)
    {
        this.count = count;
    }

    public List<Agreement> getAgreement_list()
    {
        return agreement_list;
    }

    public void setAgreement_list(List<Agreement> agreement_list)
    {
        this.agreement_list = agreement_list;
    }

    public String getFlag_kyc()
    {
        return flag_kyc;
    }

    public void setFlag_kyc(String flag_kyc)
    {
        this.flag_kyc = flag_kyc;
    }

    public String getMaxrecordes()
    {
        return maxrecordes;
    }

    public void setMaxrecordes(String maxrecordes)
    {
        this.maxrecordes = maxrecordes;
    }

    public String getPlatform()
    {
        return platform;
    }

    public void setPlatform(String platform)
    {
        this.platform = platform;
    }

    public String getFlag_reg()
    {
        return flag_reg;
    }

    public void setFlag_reg(String flag_reg)
    {
        this.flag_reg = flag_reg;
    }

    public String getPay_type()
    {
        return pay_type;
    }

    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
    }
    

}
