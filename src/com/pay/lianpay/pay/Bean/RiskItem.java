package com.pay.lianpay.pay.Bean;

import java.io.Serializable;

/**
 * 请求分控参数
 * @author duzl
 * Nov 12, 2013 10:25:30 AM
 * @version :1.0
 */
public class RiskItem implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private String user_info_bind_phone;//用户绑定手机
    private String user_info_dt_register;//用户注册时间
    private String risk_state;//风险等级
    
    private String request_imei;
    private String request_imsi;
    private String request_ip;
    
    
    //2014-03-17 新增字段
    private String user_info_mercht_userno;//用户唯一标识
    private String user_info_mercht_userlogin;//用户登陆名
    private String user_info_full_name;//*客户姓名
    private String user_info_id_type ;//客户证件类型
    private String user_info_id_no;//
    private String user_info_identify_state;//
    private String user_info_identify_type;//
    private String user_info_register_ip;//
    private String user_info_addr_province;//
    private String user_info_addr_city;//
    private String user_info_addr_district;//
    private String user_info_addr_street;//
    private String user_info_phone;//
    private String user_info_phone_area_code;//
    private String user_info_phone_county_code;//
    private String verify_type;//*验证方式  1、短信验证 2、密码 3、其他 4、无验证
    private String verify_phoneno;//*验证手机号
    private String verify_dt;//验证时间
    private String delivery_addr_full;//
    private String delivery_addr_province;//
    private String delivery_addr_city;//
    private String delivery_addr_district;//
    private String delivery_addr_street;//
    private String delivery_full_name;//
    private String delivery_phone;//收货人联系电话
    private String delivery_mail;//收货人邮箱
    
    
    private String frms_ware_category;//商品条目
    private String frms_dt_request;
    private String frms_ip_addr;//*用户支付请求IP
    private String frms_imei;//
    private String frms_sim_id;//
    private String frms_mechine_id;//机器编码
    private String frms_mac_addr;//Mac地址
    private String frms_cpu;//cpu信息
    private String frms_disk;//磁盘信息
    private String frms_version;//版本号
    //add by kristain 2015/04/08  商旅行业风控字段
  	private String frms_client_chnl;// 业务来源
  	private String frms_is_real_name;// 是否实名
  	private String type_pay;// 支付类型
  	
  	private String logistics_mode;//物流方式 1:邮局平邮；2:普通快递；3:特快专递；4:物流货运公司；5:物流配送公司6:国际快递7:航运快运8:海运
  	private String delivery_cycle;//发货时间 12h: 12小时内；24h:24小时内；48h:48小时内；72h:72小时内；Other:3天后
    
    public String getUser_info_bind_phone()
    {
        return user_info_bind_phone;
    }
    public void setUser_info_bind_phone(String user_info_bind_phone)
    {
        this.user_info_bind_phone = user_info_bind_phone;
    }
    public String getUser_info_dt_register()
    {
        return user_info_dt_register;
    }
    public void setUser_info_dt_register(String user_info_dt_register)
    {
        this.user_info_dt_register = user_info_dt_register;
    }
    public String getRisk_state()
    {
        return risk_state;
    }
    public void setRisk_state(String risk_state)
    {
        this.risk_state = risk_state;
    }
    public String getFrms_ware_category()
    {
        return frms_ware_category;
    }
    public void setFrms_ware_category(String frms_ware_category)
    {
        this.frms_ware_category = frms_ware_category;
    }
    public String getRequest_imei()
    {
        return request_imei;
    }
    public void setRequest_imei(String request_imei)
    {
        this.request_imei = request_imei;
    }
    public String getRequest_imsi()
    {
        return request_imsi;
    }
    public void setRequest_imsi(String request_imsi)
    {
        this.request_imsi = request_imsi;
    }
    public String getRequest_ip()
    {
        return request_ip;
    }
    public void setRequest_ip(String request_ip)
    {
        this.request_ip = request_ip;
    }
    public String getUser_info_mercht_userno()
    {
        return user_info_mercht_userno;
    }
    public void setUser_info_mercht_userno(String user_info_mercht_userno)
    {
        this.user_info_mercht_userno = user_info_mercht_userno;
    }
    public String getUser_info_mercht_userlogin()
    {
        return user_info_mercht_userlogin;
    }
    public void setUser_info_mercht_userlogin(String user_info_mercht_userlogin)
    {
        this.user_info_mercht_userlogin = user_info_mercht_userlogin;
    }
    public String getUser_info_full_name()
    {
        return user_info_full_name;
    }
    public void setUser_info_full_name(String user_info_full_name)
    {
        this.user_info_full_name = user_info_full_name;
    }
    public String getUser_info_id_type()
    {
        return user_info_id_type;
    }
    public void setUser_info_id_type(String user_info_id_type)
    {
        this.user_info_id_type = user_info_id_type;
    }
    public String getUser_info_id_no()
    {
        return user_info_id_no;
    }
    public void setUser_info_id_no(String user_info_id_no)
    {
        this.user_info_id_no = user_info_id_no;
    }
    public String getUser_info_identify_state()
    {
        return user_info_identify_state;
    }
    public void setUser_info_identify_state(String user_info_identify_state)
    {
        this.user_info_identify_state = user_info_identify_state;
    }
    public String getUser_info_identify_type()
    {
        return user_info_identify_type;
    }
    public void setUser_info_identify_type(String user_info_identify_type)
    {
        this.user_info_identify_type = user_info_identify_type;
    }
    public String getUser_info_register_ip()
    {
        return user_info_register_ip;
    }
    public void setUser_info_register_ip(String user_info_register_ip)
    {
        this.user_info_register_ip = user_info_register_ip;
    }
    public String getUser_info_addr_province()
    {
        return user_info_addr_province;
    }
    public void setUser_info_addr_province(String user_info_addr_province)
    {
        this.user_info_addr_province = user_info_addr_province;
    }
    public String getUser_info_addr_city()
    {
        return user_info_addr_city;
    }
    public void setUser_info_addr_city(String user_info_addr_city)
    {
        this.user_info_addr_city = user_info_addr_city;
    }
    public String getUser_info_addr_district()
    {
        return user_info_addr_district;
    }
    public void setUser_info_addr_district(String user_info_addr_district)
    {
        this.user_info_addr_district = user_info_addr_district;
    }
    public String getUser_info_addr_street()
    {
        return user_info_addr_street;
    }
    public void setUser_info_addr_street(String user_info_addr_street)
    {
        this.user_info_addr_street = user_info_addr_street;
    }
    public String getUser_info_phone()
    {
        return user_info_phone;
    }
    public void setUser_info_phone(String user_info_phone)
    {
        this.user_info_phone = user_info_phone;
    }
    public String getUser_info_phone_area_code()
    {
        return user_info_phone_area_code;
    }
    public void setUser_info_phone_area_code(String user_info_phone_area_code)
    {
        this.user_info_phone_area_code = user_info_phone_area_code;
    }
    public String getUser_info_phone_county_code()
    {
        return user_info_phone_county_code;
    }
    public void setUser_info_phone_county_code(String user_info_phone_county_code)
    {
        this.user_info_phone_county_code = user_info_phone_county_code;
    }
    public String getVerify_type()
    {
        return verify_type;
    }
    public void setVerify_type(String verify_type)
    {
        this.verify_type = verify_type;
    }
    public String getVerify_phoneno()
    {
        return verify_phoneno;
    }
    public void setVerify_phoneno(String verify_phoneno)
    {
        this.verify_phoneno = verify_phoneno;
    }
    public String getVerify_dt()
    {
        return verify_dt;
    }
    public void setVerify_dt(String verify_dt)
    {
        this.verify_dt = verify_dt;
    }
    public String getDelivery_addr_full()
    {
        return delivery_addr_full;
    }
    public void setDelivery_addr_full(String delivery_addr_full)
    {
        this.delivery_addr_full = delivery_addr_full;
    }
    public String getDelivery_addr_province()
    {
        return delivery_addr_province;
    }
    public void setDelivery_addr_province(String delivery_addr_province)
    {
        this.delivery_addr_province = delivery_addr_province;
    }
    public String getDelivery_addr_city()
    {
        return delivery_addr_city;
    }
    public void setDelivery_addr_city(String delivery_addr_city)
    {
        this.delivery_addr_city = delivery_addr_city;
    }
    public String getDelivery_addr_district()
    {
        return delivery_addr_district;
    }
    public void setDelivery_addr_district(String delivery_addr_district)
    {
        this.delivery_addr_district = delivery_addr_district;
    }
    public String getDelivery_addr_street()
    {
        return delivery_addr_street;
    }
    public void setDelivery_addr_street(String delivery_addr_street)
    {
        this.delivery_addr_street = delivery_addr_street;
    }
    public String getDelivery_full_name()
    {
        return delivery_full_name;
    }
    public void setDelivery_full_name(String delivery_full_name)
    {
        this.delivery_full_name = delivery_full_name;
    }
    public String getDelivery_phone()
    {
        return delivery_phone;
    }
    public void setDelivery_phone(String delivery_phone)
    {
        this.delivery_phone = delivery_phone;
    }
    public String getDelivery_mail()
    {
        return delivery_mail;
    }
    public void setDelivery_mail(String delivery_mail)
    {
        this.delivery_mail = delivery_mail;
    }
    public String getFrms_dt_request()
    {
        return frms_dt_request;
    }
    public void setFrms_dt_request(String frms_dt_request)
    {
        this.frms_dt_request = frms_dt_request;
    }
    public String getFrms_ip_addr()
    {
        return frms_ip_addr;
    }
    public void setFrms_ip_addr(String frms_ip_addr)
    {
        this.frms_ip_addr = frms_ip_addr;
    }
    public String getFrms_imei()
    {
        return frms_imei;
    }
    public void setFrms_imei(String frms_imei)
    {
        this.frms_imei = frms_imei;
    }
    public String getFrms_sim_id()
    {
        return frms_sim_id;
    }
    public void setFrms_sim_id(String frms_sim_id)
    {
        this.frms_sim_id = frms_sim_id;
    }
    public String getFrms_mechine_id()
    {
        return frms_mechine_id;
    }
    public void setFrms_mechine_id(String frms_mechine_id)
    {
        this.frms_mechine_id = frms_mechine_id;
    }
    public String getFrms_mac_addr()
    {
        return frms_mac_addr;
    }
    public void setFrms_mac_addr(String frms_mac_addr)
    {
        this.frms_mac_addr = frms_mac_addr;
    }
    public String getFrms_cpu()
    {
        return frms_cpu;
    }
    public void setFrms_cpu(String frms_cpu)
    {
        this.frms_cpu = frms_cpu;
    }
    public String getFrms_disk()
    {
        return frms_disk;
    }
    public void setFrms_disk(String frms_disk)
    {
        this.frms_disk = frms_disk;
    }
    public String getFrms_version()
    {
        return frms_version;
    }
    public void setFrms_version(String frms_version)
    {
        this.frms_version = frms_version;
    }
	public String getFrms_client_chnl() {
		return frms_client_chnl;
	}
	public void setFrms_client_chnl(String frms_client_chnl) {
		this.frms_client_chnl = frms_client_chnl;
	}
	public String getFrms_is_real_name() {
		return frms_is_real_name;
	}
	public void setFrms_is_real_name(String frms_is_real_name) {
		this.frms_is_real_name = frms_is_real_name;
	}
	public String getType_pay() {
		return type_pay;
	}
	public void setType_pay(String type_pay) {
		this.type_pay = type_pay;
	}
	public String getLogistics_mode() {
		return logistics_mode;
	}
	public void setLogistics_mode(String logistics_mode) {
		this.logistics_mode = logistics_mode;
	}
	public String getDelivery_cycle() {
		return delivery_cycle;
	}
	public void setDelivery_cycle(String delivery_cycle) {
		this.delivery_cycle = delivery_cycle;
	}
}
