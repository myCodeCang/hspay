package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 银行卡签约信息结果集合
 *
 */
public class Agreement implements Serializable{
    

    /**
     * 
     */
    private static final long serialVersionUID = -277690967006910640L;
    
    private String no_agree;
	private String card_no;
	private String bank_code;
	private String bank_name;
	private String card_type;
	private String bind_mobile;
	
	public String getNo_agree() {
		return no_agree;
	}
	public void setNo_agree(String no_agree) {
		this.no_agree = no_agree;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getBind_mobile() {
		return bind_mobile;
	}
	public void setBind_mobile(String bind_mobile) {
		this.bind_mobile = bind_mobile;
	}
}
