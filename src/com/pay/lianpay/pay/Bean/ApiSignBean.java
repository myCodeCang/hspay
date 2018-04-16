package com.pay.lianpay.pay.Bean;

import java.io.Serializable;
import java.util.List;

/**
 * API 签约类
 * @author duzl
 * Aug 26, 2013 3:41:42 PM
 * @version :1.0
 */
public class ApiSignBean implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    public String oid_userno;//用户号
    public String oid_cust;//用户登录名
    public String bankcode;//银行编码
    public String cust_name;//客户姓名
    public String cardno;//卡号
    public String acctname;//银行账号姓名
    public String bind_mob;//绑定手机号
    public String validate;//有效期
    public String cvv2;//信用卡CVV2
    public String idtype;//证件类型
    public String idno;//证件号码
    public String pay_chnl;//支付发生渠道
    public String pay_type;//支付方式
    
    
    //返回代码
    public String ret_code;//返回码
    public String ret_msg;//返回信息
    public String agreementno;//协议编号
    
    
    public String agreement_s;// 签约状态
    public String offset;
    public String maxrecordes;
    
    public String count;//返回字段
    
    public String flag_kyc;//签约标识 0通过 1不通过
    
    //新增字段
    public String oid_trader;//签约商户号
    public String sign_type;//签约用户标识
    
    public String oid_chnl;//金融渠道
    public String correlationID;
    private List<CardBean> agreement_list;
    
    public String getOid_userno()
    {
        return oid_userno;
    }
    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }
    public String getOid_cust()
    {
        return oid_cust;
    }
    public void setOid_cust(String oid_cust)
    {
        this.oid_cust = oid_cust;
    }
    public String getBankcode()
    {
        return bankcode;
    }
    public void setBankcode(String bankcode)
    {
        this.bankcode = bankcode;
    }
    public String getCust_name()
    {
        return cust_name;
    }
    public void setCust_name(String cust_name)
    {
        this.cust_name = cust_name;
    }
    public String getCardno()
    {
        return cardno;
    }
    public void setCardno(String cardno)
    {
        this.cardno = cardno;
    }
    public String getAcctname()
    {
        return acctname;
    }
    public void setAcctname(String acctname)
    {
        this.acctname = acctname;
    }
    public String getBind_mob()
    {
        return bind_mob;
    }
    public void setBind_mob(String bind_mob)
    {
        this.bind_mob = bind_mob;
    }
    public String getValidate()
    {
        return validate;
    }
    public void setValidate(String validate)
    {
        this.validate = validate;
    }
    public String getCvv2()
    {
        return cvv2;
    }
    public void setCvv2(String cvv2)
    {
        this.cvv2 = cvv2;
    }
    public String getIdtype()
    {
        return idtype;
    }
    public void setIdtype(String idtype)
    {
        this.idtype = idtype;
    }
    public String getIdno()
    {
        return idno;
    }
    public void setIdno(String idno)
    {
        this.idno = idno;
    }
    public String getPay_chnl()
    {
        return pay_chnl;
    }
    public void setPay_chnl(String pay_chnl)
    {
        this.pay_chnl = pay_chnl;
    }
    public String getPay_type()
    {
        return pay_type;
    }
    public void setPay_type(String pay_type)
    {
        this.pay_type = pay_type;
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
    public String getAgreementno()
    {
        return agreementno;
    }
    public void setAgreementno(String agreementno)
    {
        this.agreementno = agreementno;
    }
    public String getAgreement_s()
    {
        return agreement_s;
    }
    public void setAgreement_s(String agreement_s)
    {
        this.agreement_s = agreement_s;
    }
    public String getOffset()
    {
        return offset;
    }
    public void setOffset(String offset)
    {
        this.offset = offset;
    }
    public String getMaxrecordes()
    {
        return maxrecordes;
    }
    public void setMaxrecordes(String maxrecordes)
    {
        this.maxrecordes = maxrecordes;
    }
    public String getCount()
    {
        return count;
    }
    public void setCount(String count)
    {
        this.count = count;
    }
    public List<CardBean> getAgreement_list()
    {
        return agreement_list;
    }
    public void setAgreement_list(List<CardBean> agreement_list)
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
    public String getOid_trader()
    {
        return oid_trader;
    }
    public void setOid_trader(String oid_trader)
    {
        this.oid_trader = oid_trader;
    }
    public String getSign_type()
    {
        return sign_type;
    }
    public void setSign_type(String sign_type)
    {
        this.sign_type = sign_type;
    }
    public String getOid_chnl()
    {
        return oid_chnl;
    }
    public void setOid_chnl(String oid_chnl)
    {
        this.oid_chnl = oid_chnl;
    }
	public String getCorrelationID() {
		return correlationID;
	}
	public void setCorrelationID(String correlationID) {
		this.correlationID = correlationID;
	}
    
    
    
    

}
