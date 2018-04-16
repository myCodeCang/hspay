package com.pay.lianpay.pay.Bean;
/**
 * @Copyright: 连连银通电子支付有限公司
 * @Description: 加密字段
 * @author: liuwm
 * @date: 2015-8-9 下午4:39:21
 * @version: V1.0
 */
public class EncryptField {

	private String bind_mob; // 绑定手机号
	private String id_type; // 证件类型
	private String id_no; // 证件号码
	private String card_no; // 银行卡号
	private String acct_name; // 银行账号姓名
	private String no_agree; // 银通协议编号
	private String cvv2; // 信用卡CVV2
	private String vali_date; // 信用卡有效期
	
	private String ciphertext;//加密信息签名
	public String getBind_mob() {
		return bind_mob;
	}
	public void setBind_mob(String bind_mob) {
		this.bind_mob = bind_mob;
	}
	public String getId_type() {
		return id_type;
	}
	public void setId_type(String id_type) {
		this.id_type = id_type;
	}
	public String getId_no() {
		return id_no;
	}
	public void setId_no(String id_no) {
		this.id_no = id_no;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getAcct_name() {
		return acct_name;
	}
	public void setAcct_name(String acct_name) {
		this.acct_name = acct_name;
	}
	public String getNo_agree() {
		return no_agree;
	}
	public void setNo_agree(String no_agree) {
		this.no_agree = no_agree;
	}
	public String getCvv2() {
		return cvv2;
	}
	public void setCvv2(String cvv2) {
		this.cvv2 = cvv2;
	}
	public String getVali_date() {
		return vali_date;
	}
	public void setVali_date(String vali_date) {
		this.vali_date = vali_date;
	}
	public String getCiphertext() {
		return ciphertext;
	}
	public void setCiphertext(String ciphertext) {
		this.ciphertext = ciphertext;
	}
}
