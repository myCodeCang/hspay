package com.pay.lianpay.pay.Bean;

/**
 * 银行卡校验
 * @author duzl
 * Oct 18, 2013 11:07:50 AM
 * @version :1.0
 */
public class BankCardCheckBean extends TranBaseBean{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private String oid_partner;//商户编号
    private String card_no;//银行卡号
    private String bank_code;//所属银行编号
    private String bank_name;//所属银行名称
    private String card_type;//2-储蓄卡  3-信用卡
    /*
     *新增支持查询银行限额功能
	 *请求参数新增：api_version、pay_type、flag_amt_limit
	 *响应参数新增：single_amt、day_amt、month_amt
	 *
     */
    private String api_version;//版本号
    private String pay_type;//支付方式 2：快捷支付 D：认证支付
    private String flag_amt_limit;//是否查询限额标识 0:不查询 1：查询
    private String single_amt;//单笔限额
    private String day_amt;//单日限额
    private String month_amt;//单月限额
    private String payload;//加密数据
    private String encrypt;// 加密字段
    private String card_key;//卡号唯一hash 值

    public String getOid_partner()
    {
        return oid_partner;
    }
    public void setOid_partner(String oid_partner)
    {
        this.oid_partner = oid_partner;
    }
    public String getCard_no()
    {
        return card_no;
    }
    public void setCard_no(String card_no)
    {
        this.card_no = card_no;
    }
    public String getBank_code()
    {
        return bank_code;
    }
    public void setBank_code(String bank_code)
    {
        this.bank_code = bank_code;
    }
    public String getBank_name()
    {
        return bank_name;
    }
    public void setBank_name(String bank_name)
    {
        this.bank_name = bank_name;
    }
    public String getCard_type()
    {
        return card_type;
    }
    public void setCard_type(String card_type)
    {
        this.card_type = card_type;
    }
	public String getApi_version() {
		return api_version;
	}
	public void setApi_version(String api_version) {
		this.api_version = api_version;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getFlag_amt_limit() {
		return flag_amt_limit;
	}
	public void setFlag_amt_limit(String flag_amt_limit) {
		this.flag_amt_limit = flag_amt_limit;
	}
	public String getSingle_amt() {
		return single_amt;
	}
	public void setSingle_amt(String single_amt) {
		this.single_amt = single_amt;
	}
	public String getDay_amt() {
		return day_amt;
	}
	public void setDay_amt(String day_amt) {
		this.day_amt = day_amt;
	}
	public String getMonth_amt() {
		return month_amt;
	}
	public void setMonth_amt(String month_amt) {
		this.month_amt = month_amt;
	}
    public String getPayload()
    {
        return payload;
    }
    public void setPayload(String payload)
    {
        this.payload = payload;
    }
    public String getEncrypt()
    {
        return encrypt;
    }
    public void setEncrypt(String encrypt)
    {
        this.encrypt = encrypt;
    }
    public String getCard_key()
    {
        return card_key;
    }
    public void setCard_key(String card_key)
    {
        this.card_key = card_key;
    }
    
	
	
    
    
    

}
