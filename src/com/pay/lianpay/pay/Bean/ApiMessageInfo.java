package com.pay.lianpay.pay.Bean;
import java.io.Serializable;

/**
 * 短信发送实体
 * @author shmily
 * @date Feb 21, 2011 9:22:15 AM
 */
public class ApiMessageInfo implements Serializable
{
	private static final long serialVersionUID = 1L;
	public String id_msg;//消息ID
	public String oid_userlogin;//用户登录名
	public String cd_smscd;//验证码
	public String pwd_login;//登录密码
	public String pwd_pay;//支付密码
	public String amt_charge;//充值金额
	public String amt_outacct;//提现金额
	public String amt_balcur;//账户余额
	public String user_mobile;//商户手机号码
	public String cust_mobile;//客户手机号码
	public String mb_send;//发送手机号
	public String oid_chargebill;//充值单号
	public String oid_cashbill;//提现单号
	public String message_busi;//业务信息-支付宝充值码,淘宝订单号,卡密,
	public String flag_seng;//发送标志(0: 发送 1: 重发)
	public String content_with;//跟发内容
	public String uid_cli;//客户商品标识(QQ号码，一卡通号码，淘宝订单号,游戏帐号)
	public String oid_goodsorder;//商品订单号
	public String money_order;//交易金额
	public String fee_order;//平台手续费
	public String price_unit;//商品面值
	public String amt_order;//交易数量
	public String oid_biz;//业务编号
	public String oid_app;//应用编号
	public String oid_product;//产品编号
	public String oid_goodsitem;//商品编号
	public String jno_svr;//第三方订单号
	public String name_goodsitem;//商品名称
	public String oid_oper;//操作员号
	
	public String template;//发送模版
	
	public String getId_msg() {
		return id_msg;
	}
	public void setId_msg(String id_msg) {
		this.id_msg = id_msg;
	}
	public String getOid_userlogin() {
		return oid_userlogin;
	}
	public void setOid_userlogin(String oid_userlogin) {
		this.oid_userlogin = oid_userlogin;
	}
	public String getCd_smscd() {
		return cd_smscd;
	}
	public void setCd_smscd(String cd_smscd) {
		this.cd_smscd = cd_smscd;
	}
	public String getPwd_login() {
		return pwd_login;
	}
	public void setPwd_login(String pwd_login) {
		this.pwd_login = pwd_login;
	}
	public String getPwd_pay() {
		return pwd_pay;
	}
	public void setPwd_pay(String pwd_pay) {
		this.pwd_pay = pwd_pay;
	}
	public String getAmt_charge() {
		return amt_charge;
	}
	public void setAmt_charge(String amt_charge) {
		this.amt_charge = amt_charge;
	}
	public String getAmt_outacct() {
		return amt_outacct;
	}
	public void setAmt_outacct(String amt_outacct) {
		this.amt_outacct = amt_outacct;
	}
	public String getAmt_balcur() {
		return amt_balcur;
	}
	public void setAmt_balcur(String amt_balcur) {
		this.amt_balcur = amt_balcur;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	public String getMb_send() {
		return mb_send;
	}
	public void setMb_send(String mb_send) {
		this.mb_send = mb_send;
	}
	public String getOid_chargebill() {
		return oid_chargebill;
	}
	public void setOid_chargebill(String oid_chargebill) {
		this.oid_chargebill = oid_chargebill;
	}
	public String getOid_cashbill() {
		return oid_cashbill;
	}
	public void setOid_cashbill(String oid_cashbill) {
		this.oid_cashbill = oid_cashbill;
	}
	public String getMessage_busi() {
		return message_busi;
	}
	public void setMessage_busi(String message_busi) {
		this.message_busi = message_busi;
	}
	public String getFlag_seng() {
		return flag_seng;
	}
	public void setFlag_seng(String flag_seng) {
		this.flag_seng = flag_seng;
	}
	public String getContent_with() {
		return content_with;
	}
	public void setContent_with(String content_with) {
		this.content_with = content_with;
	}
	public String getUid_cli() {
		return uid_cli;
	}
	public void setUid_cli(String uid_cli) {
		this.uid_cli = uid_cli;
	}
	public String getOid_goodsorder() {
		return oid_goodsorder;
	}
	public void setOid_goodsorder(String oid_goodsorder) {
		this.oid_goodsorder = oid_goodsorder;
	}
	public String getMoney_order() {
		return money_order;
	}
	public void setMoney_order(String money_order) {
		this.money_order = money_order;
	}
	public String getFee_order() {
		return fee_order;
	}
	public void setFee_order(String fee_order) {
		this.fee_order = fee_order;
	}
	public String getPrice_unit() {
		return price_unit;
	}
	public void setPrice_unit(String price_unit) {
		this.price_unit = price_unit;
	}
	public String getAmt_order() {
		return amt_order;
	}
	public void setAmt_order(String amt_order) {
		this.amt_order = amt_order;
	}
	public String getOid_biz() {
		return oid_biz;
	}
	public void setOid_biz(String oid_biz) {
		this.oid_biz = oid_biz;
	}
	public String getOid_app() {
		return oid_app;
	}
	public void setOid_app(String oid_app) {
		this.oid_app = oid_app;
	}
	public String getOid_product() {
		return oid_product;
	}
	public void setOid_product(String oid_product) {
		this.oid_product = oid_product;
	}
	public String getOid_goodsitem() {
		return oid_goodsitem;
	}
	public void setOid_goodsitem(String oid_goodsitem) {
		this.oid_goodsitem = oid_goodsitem;
	}
	public String getJno_svr() {
		return jno_svr;
	}
	public void setJno_svr(String jno_svr) {
		this.jno_svr = jno_svr;
	}
	public String getName_goodsitem() {
		return name_goodsitem;
	}
	public void setName_goodsitem(String name_goodsitem) {
		this.name_goodsitem = name_goodsitem;
	}
	public String getOid_oper() {
		return oid_oper;
	}
	public void setOid_oper(String oid_oper) {
		this.oid_oper = oid_oper;
	}
        public String getTemplate()
        {
           return template;
        }
        public void setTemplate(String template)
        {
          this.template = template;
        }
	
	
}
