package com.pay.lianpay.pay.Bean;

import java.io.File;
import java.io.Serializable;

/**
 * 
 * @title 钱包认证实体类
 * @package com.yintong.llwallet.domain
 * @description TODO
 * @author <a href="zhuqf@yintong.com.cn">zhuqf</a>
 * @date 2016-7-7 下午3:09:02
 * @version 1.0
 */
public class UserAuthBean implements Serializable{

    private static final long serialVersionUID = 1L;
    private String correlationID;
    /** 商户号 */
    private String oid_partner;
    /** 用户号 */
    private String user_id;
    private String oid_userno;
    /** 用户认证状态 */
    private String check_auth;
    /** 签名 */
    private String sign;
    /** 签名方式 */
    private String sign_type;
    /** 用户状态 */
    private String stat_auth;
    /** 返回码 */
    private String ret_code;
    /** 返回信息 */
    private String ret_msg;
    /** 年剩余支付额度 */
    private String amt_year;
    /** 月剩余支付额度 */
    private String amt_month;
    /** 日剩余支付额度 */
    private String amt_day;
    /** 单笔可用额度 */
    private String amt_single;
    /** 身份证正面 */
    private File front_card;
    /** 身份证反面 */
    private File back_card;
    /** 代理人身份证正面照片 */
    private File front_agent;
    /** 代理人身份证反面照片 */
    private File back_agent;
    /** 营业执照复印件 */
    private File copy_license;
    /** 组织机构代码复印件 */
    private File copy_org;
    /** 银行开户许可证 */
    private File bank_openlicense;
    /** 代理人身份证正面 */
    private File agent_front_card;
    /** 代理人身份证反面 */
    private File agent_back_card;
    /** 用户类型（1-个人用户，2-企业用户，3-电子用户） */
    private String user_type;
    /** 营业执照类型 */
    private String type_license;
    private String risk_item;
    
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
    public String getCheck_auth()
    {
        return check_auth;
    }
    public void setCheck_auth(String check_auth)
    {
        this.check_auth = check_auth;
    }
    public String getSign()
    {
        return sign;
    }
    public void setSign(String sign)
    {
        this.sign = sign;
    }
    public String getSign_type()
    {
        return sign_type;
    }
    public void setSign_type(String sign_type)
    {
        this.sign_type = sign_type;
    }
    public String getStat_auth()
    {
        return stat_auth;
    }
    public void setStat_auth(String stat_auth)
    {
        this.stat_auth = stat_auth;
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
    public String getAmt_year()
    {
        return amt_year;
    }
    public void setAmt_year(String amt_year)
    {
        this.amt_year = amt_year;
    }
    public String getAmt_month()
    {
        return amt_month;
    }
    public void setAmt_month(String amt_month)
    {
        this.amt_month = amt_month;
    }
    public String getAmt_day()
    {
        return amt_day;
    }
    public void setAmt_day(String amt_day)
    {
        this.amt_day = amt_day;
    }
    public String getAmt_single()
    {
        return amt_single;
    }
    public void setAmt_single(String amt_single)
    {
        this.amt_single = amt_single;
    }
    public String getOid_userno()
    {
        return oid_userno;
    }
    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }
    public String getCorrelationID()
    {
        return correlationID;
    }
    public void setCorrelationID(String correlationID)
    {
        this.correlationID = correlationID;
    }
    public File getFront_card()
    {
        return front_card;
    }
    public void setFront_card(File front_card)
    {
        this.front_card = front_card;
    }
    public File getBack_card()
    {
        return back_card;
    }
    public void setBack_card(File back_card)
    {
        this.back_card = back_card;
    }
    public File getFront_agent()
    {
        return front_agent;
    }
    public void setFront_agent(File front_agent)
    {
        this.front_agent = front_agent;
    }
    public File getBack_agent()
    {
        return back_agent;
    }
    public void setBack_agent(File back_agent)
    {
        this.back_agent = back_agent;
    }
    public File getCopy_license()
    {
        return copy_license;
    }
    public void setCopy_license(File copy_license)
    {
        this.copy_license = copy_license;
    }
    public File getCopy_org()
    {
        return copy_org;
    }
    public void setCopy_org(File copy_org)
    {
        this.copy_org = copy_org;
    }
    public File getBank_openlicense()
    {
        return bank_openlicense;
    }
    public void setBank_openlicense(File bank_openlicense)
    {
        this.bank_openlicense = bank_openlicense;
    }
    public String getUser_type()
    {
        return user_type;
    }
    public void setUser_type(String user_type)
    {
        this.user_type = user_type;
    }
    public String getType_license()
    {
        return type_license;
    }
    public void setType_license(String type_license)
    {
        this.type_license = type_license;
    }
    public File getAgent_front_card() {
        return agent_front_card;
    }
    public void setAgent_front_card(File agent_front_card) {
        this.agent_front_card = agent_front_card;
    }
    public File getAgent_back_card() {
        return agent_back_card;
    }
    public void setAgent_back_card(File agent_back_card) {
        this.agent_back_card = agent_back_card;
    }
    public String getRisk_item() {
        return risk_item;
    }
    public void setRisk_item(String risk_item) {
        this.risk_item = risk_item;
    }
    
}
