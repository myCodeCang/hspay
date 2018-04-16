package com.pay.lianpay.pay.Bean;


/**
 * 用户基础类
 * @author zhuqf
 * @date 2016-4-15 14:08:15
 * @version 1.0
 *
 */
public class UserBaseBean extends BaseLLwalletBean{

    private static final long serialVersionUID = -5309299206335853160L;
    /** 连连内部用户登录名 */
    private String            user_login;
    /** 连连生成的唯一用户号 */
    private String            oid_userno;
    /** 绑定手机号 */
    private String            mob_bind;
    /** 短信验证码 */
    private String            verify_code;
    /** 姓名 */
    private String            name_user;
    /** 证件类型 */
    private String            type_idcard;
    /** 证件号 */
    private String            no_idcard;
    /** 登录密码 */
    private String            pwd_login;
    /** 支付密码 */
    private String            pwd_pay;
    /** 绑定邮箱 */
    private String            eml_bind;
    /** 联系地址 */
    private String            addr_conn;
    /** 证件有效期 */
    private String            exp_idcard;
    /** 国籍 */
    private String            nation_user;
    /** 邮政编码 */
    private String            no_postcode;
    /** 操作标示  0 开户 1企业开户 2:找回企业支付密码|修改绑定手机号码 3:修改个人用户基本信息*/
    private String            flag_send;
    /** 实名认证 0 调用实名认证， 1 不调用实名认证*/
    private String            flag_auth;
    /**0 女 1 男 */
    private String            flg_sex;
    /** 0 V0未认证 1 V1实名认证 2 V2 实名认证+身份证认证*/
    private String            stat_user;
    /** 经营范围*/
    private String            busi_user;
    /** 省级地址*/
    public String             addr_pro;
    /** 市级地址*/
    public String             addr_city;
    /** 区级地址*/
    public String             addr_dist;
    /** 职业类别*/
    private String            oid_job;

    /** 企业注册类型*/
    private String            type_register;
    /** 营业执照类型*/
    private String            type_license;
    /** 行业类别*/
    private String            type_industry;
    /** 组织机构代码有效期*/
    private String            exp_orgcode;
    /** 开户行所在市编码*/
    private String            city_code;
    /** 开户支行名称*/
    private String            brabank_name;
    /** 银行账号*/
    private String            card_no;
    /** 所属银行编号*/
    private String            bank_code;
    /** 大额行号*/
    private String            prcptcd;
    /** 用户银行账号姓名*/
    private String            acct_name;
    /** 企业地址*/
    private String            addr_unit;
    /** 企业名称*/
    private String            name_unit;
    /** 营业执照号码*/
    private String            num_license;
    /** 营业执照有效期*/
    private String            exp_license;
    /** 组织机构代码*/
    private String            org_code;
    /** 身份证有效期类型*/
    private String            type_expidcard;
    /** 代理人 姓名*/
    private String name_agent;
    /** 代理人 身份证*/
    private String idno_agent;
    /** 代理人 有效期*/
    private String exp_idcard_agent;
    /** 代理人证件有效期类型*/
    private String type_agentexpidcard;
    /** 营业执照有效期类型*/
    private String type_explicense;
    /** 用户类型  0 个人用户  1单位用户*/
    private String type_user;

    public String getUser_login()
    {
        return user_login;
    }

    public void setUser_login(String user_login)
    {
        this.user_login = user_login;
    }

    public String getOid_userno()
    {
        return oid_userno;
    }

    public void setOid_userno(String oid_userno)
    {
        this.oid_userno = oid_userno;
    }

    public String getMob_bind()
    {
        return mob_bind;
    }

    public void setMob_bind(String mob_bind)
    {
        this.mob_bind = mob_bind;
    }

    public String getVerify_code()
    {
        return verify_code;
    }

    public void setVerify_code(String verify_code)
    {
        this.verify_code = verify_code;
    }

    public String getName_user()
    {
        return name_user;
    }

    public void setName_user(String name_user)
    {
        this.name_user = name_user;
    }

    public String getType_idcard()
    {
        return type_idcard;
    }

    public void setType_idcard(String type_idcard)
    {
        this.type_idcard = type_idcard;
    }

    public String getNo_idcard()
    {
        return no_idcard;
    }

    public void setNo_idcard(String no_idcard)
    {
        this.no_idcard = no_idcard;
    }

    public String getPwd_login()
    {
        return pwd_login;
    }

    public void setPwd_login(String pwd_login)
    {
        this.pwd_login = pwd_login;
    }

    public String getPwd_pay()
    {
        return pwd_pay;
    }

    public void setPwd_pay(String pwd_pay)
    {
        this.pwd_pay = pwd_pay;
    }

    public String getEml_bind()
    {
        return eml_bind;
    }

    public void setEml_bind(String eml_bind)
    {
        this.eml_bind = eml_bind;
    }

    public String getAddr_conn()
    {
        return addr_conn;
    }

    public void setAddr_conn(String addr_conn)
    {
        this.addr_conn = addr_conn;
    }

    public String getExp_idcard()
    {
        return exp_idcard;
    }

    public void setExp_idcard(String exp_idcard)
    {
        this.exp_idcard = exp_idcard;
    }

    public String getNation_user()
    {
        return nation_user;
    }

    public void setNation_user(String nation_user)
    {
        this.nation_user = nation_user;
    }

    public String getNo_postcode()
    {
        return no_postcode;
    }

    public void setNo_postcode(String no_postcode)
    {
        this.no_postcode = no_postcode;
    }

    public String getFlag_send()
    {
        return flag_send;
    }

    public void setFlag_send(String flag_send)
    {
        this.flag_send = flag_send;
    }

    public String getFlag_auth()
    {
        return flag_auth;
    }

    public void setFlag_auth(String flag_auth)
    {
        this.flag_auth = flag_auth;
    }

    public String getFlg_sex()
    {
        return flg_sex;
    }

    public void setFlg_sex(String flg_sex)
    {
        this.flg_sex = flg_sex;
    }

    public String getStat_user()
    {
        return stat_user;
    }

    public void setStat_user(String stat_user)
    {
        this.stat_user = stat_user;
    }

    public String getBusi_user()
    {
        return busi_user;
    }

    public void setBusi_user(String busi_user)
    {
        this.busi_user = busi_user;
    }

    public String getAddr_pro()
    {
        return addr_pro;
    }

    public void setAddr_pro(String addr_pro)
    {
        this.addr_pro = addr_pro;
    }

    public String getAddr_city()
    {
        return addr_city;
    }

    public void setAddr_city(String addr_city)
    {
        this.addr_city = addr_city;
    }

    public String getAddr_dist()
    {
        return addr_dist;
    }

    public void setAddr_dist(String addr_dist)
    {
        this.addr_dist = addr_dist;
    }

    public String getOid_job()
    {
        return oid_job;
    }

    public void setOid_job(String oid_job)
    {
        this.oid_job = oid_job;
    }

    public String getType_register()
    {
        return type_register;
    }

    public void setType_register(String type_register)
    {
        this.type_register = type_register;
    }

    public String getType_license()
    {
        return type_license;
    }

    public void setType_license(String type_license)
    {
        this.type_license = type_license;
    }

    public String getType_industry()
    {
        return type_industry;
    }

    public void setType_industry(String type_industry)
    {
        this.type_industry = type_industry;
    }

    public String getExp_orgcode()
    {
        return exp_orgcode;
    }

    public void setExp_orgcode(String exp_orgcode)
    {
        this.exp_orgcode = exp_orgcode;
    }

    public String getCity_code()
    {
        return city_code;
    }

    public void setCity_code(String city_code)
    {
        this.city_code = city_code;
    }

    public String getBrabank_name()
    {
        return brabank_name;
    }

    public void setBrabank_name(String brabank_name)
    {
        this.brabank_name = brabank_name;
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

    public String getPrcptcd()
    {
        return prcptcd;
    }

    public void setPrcptcd(String prcptcd)
    {
        this.prcptcd = prcptcd;
    }

    public String getAcct_name()
    {
        return acct_name;
    }

    public void setAcct_name(String acct_name)
    {
        this.acct_name = acct_name;
    }

    public String getAddr_unit()
    {
        return addr_unit;
    }

    public void setAddr_unit(String addr_unit)
    {
        this.addr_unit = addr_unit;
    }

    public String getName_unit()
    {
        return name_unit;
    }

    public void setName_unit(String name_unit)
    {
        this.name_unit = name_unit;
    }

    public String getNum_license()
    {
        return num_license;
    }

    public void setNum_license(String num_license)
    {
        this.num_license = num_license;
    }

    public String getExp_license()
    {
        return exp_license;
    }

    public void setExp_license(String exp_license)
    {
        this.exp_license = exp_license;
    }

    public String getOrg_code()
    {
        return org_code;
    }

    public void setOrg_code(String org_code)
    {
        this.org_code = org_code;
    }

    public String getType_expidcard()
    {
        return type_expidcard;
    }

    public void setType_expidcard(String type_expidcard)
    {
        this.type_expidcard = type_expidcard;
    }

    public String getName_agent()
    {
        return name_agent;
    }

    public void setName_agent(String name_agent)
    {
        this.name_agent = name_agent;
    }

    public String getIdno_agent()
    {
        return idno_agent;
    }

    public void setIdno_agent(String idno_agent)
    {
        this.idno_agent = idno_agent;
    }

    public String getExp_idcard_agent()
    {
        return exp_idcard_agent;
    }

    public void setExp_idcard_agent(String exp_idcard_agent)
    {
        this.exp_idcard_agent = exp_idcard_agent;
    }

    public String getType_agentexpidcard()
    {
        return type_agentexpidcard;
    }

    public void setType_agentexpidcard(String type_agentexpidcard)
    {
        this.type_agentexpidcard = type_agentexpidcard;
    }

    public String getType_explicense()
    {
        return type_explicense;
    }

    public void setType_explicense(String type_explicense)
    {
        this.type_explicense = type_explicense;
    }

    public String getType_user()
    {
        return type_user;
    }

    public void setType_user(String type_user)
    {
        this.type_user = type_user;
    }
    
    
    

}
