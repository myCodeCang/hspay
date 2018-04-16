package com.admin.gateway.controller;

import com.admin.gateway.service.AdGatewayService;
import com.interceptor.AdLoginSeInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.vo.Gateway;

@Before(AdLoginSeInterceptor.class)
public class AdGatewayController extends Controller {

	public void index() {
		setAttr("gatewaylist", AdGatewayService.service.getGateway());
		renderJsp("/WEB-INF/admin/jsp/gateway.jsp");
	}

	public void upGateway() {
		try {
			int gateway_id = getParaToInt("gateway_id");
			String gateway_merid = getPara("gateway_merid");
			String gateway_channelid = getPara("gateway_channelid");
			String gateway_key = getPara("gateway_key");
			Gateway gateway = Gateway.dao.findById(gateway_id);
			gateway.set("gateway_merid", gateway_merid);
			gateway.set("gateway_key", gateway_key);
			gateway.set("gateway_channelid", gateway_channelid);
			boolean boo = gateway.update();
			if (boo) {
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav22\", \"forwardUrl\":\"\", \"rel\":\"nav22\"}");
			} else {
				renderJson("{\"statusCode\":\"300\", \"message\":\"删除失败\"}");
			}
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"删除失败\"}");
			e.printStackTrace();
		}
	}
}
