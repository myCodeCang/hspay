package com.jsp.exchange.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.interceptor.LoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jsp.exchange.service.ExchangeService;
import com.pay.cardyee.client.service.CardyeeService;
import com.vo.CardOrder;
import com.vo.Order;
import com.vo.Person;

@Before(LoginInterceptor.class)
public class ExchangeController extends Controller {
	public void index(){
		Person person = getSessionAttr("session");
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		setAttr("ordertotal", ExchangeService.exchangeService.getOrdertotal(person.getInt("id"), new Date()));
		setAttr("cardordertotal", ExchangeService.exchangeService.getCardOrdertotal(person.getInt("id"), new Date()));
		renderJsp("/WEB-INF/jsp/exchange1.jsp");
	}
	
	public void getNet(){
		int page = getParaToInt("page",1);
		page=page<1?1:page;
		String netstarttime = "";
		String netendtime = "";
		String netparticipate = "";
		String netstate = "";
		String netid = "";
		if(!getPara("netstarttime").equals("")){
			netstarttime = getPara("netstarttime");
		}
		if(!getPara("netendtime").equals("")){
			netendtime = getPara("netendtime");
		}
		if(!getPara("netparticipate").equals("0")){
			netparticipate = getPara("netparticipate");
		}
		if(!getPara("netstate").equals("0")){
			netstate = getPara("netstate");
		}
		if(!getPara("netid").equals("")){
			netid = getPara("netid");
		}
		Person per = getSessionAttr("session");
		Page<Order> orderPage = ExchangeService.exchangeService.getOrder(per.getInt("id"), page, netstarttime, netendtime, netparticipate, netstate, netid);
		List<Order> orderList = orderPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(orderPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}
	
	public void getCard(){
		int page = getParaToInt("cardpages");
		page=page<1?1:page;
		String cardstarttime = "";
		String cardendtime = "";
		String cardparticipate = "";
		String cardstate = "";
		String cardid = "";
		if(!getPara("cardstarttime").equals("")){
			cardstarttime = getPara("cardstarttime");
		}
		if(!getPara("cardendtime").equals("")){
			cardendtime = getPara("cardendtime");
		}
		if(!getPara("cardparticipate").equals("0")){
			cardparticipate = getPara("cardparticipate");
		}
		if(!getPara("cardstate").equals("0")){
			cardstate = getPara("cardstate");
		}
		if(!getPara("cardid").equals("")){
			cardid = getPara("cardid");
		}
		Person per = getSessionAttr("session");
		Page<CardOrder> CardPage = ExchangeService.exchangeService.getCardOrder(per.getInt("id"), page, cardstarttime, cardendtime, cardparticipate, cardstate, cardid);
		List<CardOrder> orderList = CardPage.getList();
		List list = new ArrayList();
		list.add(orderList);
		list.add(CardPage.getTotalPage());
		String json = JsonKit.listToJson(list, 3);
		renderJson(json);
	}
	
	public void getSing(){
		String singid = getPara("singid");
		List<Record> singlist = ExchangeService.exchangeService.getSingOrder(singid);
		String json = JsonKit.listToJson(singlist, 3);
		renderJson(json);
	}
	
	public void cardReturn(){
		String orderid = getPara("orderid");
		try {
			CardyeeService.service.asynchronous(orderid);
			renderText("通知成功！");
		} catch (Exception e) {
			renderText("通知失败！");
			e.printStackTrace();
		}
	}
}