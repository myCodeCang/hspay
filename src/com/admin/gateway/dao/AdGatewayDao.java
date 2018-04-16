package com.admin.gateway.dao;

import java.util.List;

import com.vo.Gateway;

public class AdGatewayDao {
	
	public List<Gateway> getGateway(){
		List<Gateway> gatewaylist = Gateway.dao.find("select * from gateway");
		return gatewaylist;
	}
}
