package com.admin.net.controller;

import java.util.List;

import com.admin.net.service.AdNetService;
import com.admin.statistics.service.AdStatisticsService;
import com.interceptor.AdLoginSeInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jsp.exchange.service.ExchangeService;
import com.vo.Asynchronous;
import com.vo.Employees;
import com.vo.Order;
import com.vo.Participate;
import com.vo.Person;

@Before(AdLoginSeInterceptor.class)
public class AdNetController extends Controller {
	public void index() {
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String netstarttime = "";
		String netendtime = "";
		String netparticipate = "";
		String netstate = "";
		String netorderid = "";
		String netname = "";
		String netlock = "";
		if (!getPara("netstarttime").equals("")) {
			netstarttime = getPara("netstarttime");
		}
		if (!getPara("netendtime").equals("")) {
			netendtime = getPara("netendtime");
		}
		if (!getPara("netparticipate").equals("0")) {
			netparticipate = getPara("netparticipate");
		}
		if (!getPara("netstate").equals("0")) {
			netstate = getPara("netstate");
		}
		if (!getPara("netorderid").equals("")) {
			netorderid = getPara("netorderid");
		}
		if (!getPara("netname").equals("")) {
			netname = getPara("netname");
		}
		if (!getPara("netlock").equals("0")) {
			netlock = getPara("netlock");
		}
		Employees emp = getSessionAttr("adminsession");
		setAttr("netstarttime", netstarttime);
		setAttr("netendtime", netendtime);
		setAttr("netparticipate", netparticipate);
		setAttr("netstate", netstate);
		setAttr("netorderid", netorderid);
		setAttr("netname", netname);
		setAttr("netlock", netlock);
		Page<Order> orderpage = AdNetService.service.getNetPage(pageNum,
				numPerPage, netstarttime, netendtime, netparticipate, netstate,
				netorderid, netname, netlock, emp.getInt("employeeid"));
		setAttr("pageNum", orderpage.getPageNumber());
		setAttr("numPerPage", orderpage.getPageSize());
		setAttr("totalCount", orderpage.getTotalRow());
		setAttr("pageNumShown", orderpage.getTotalPage());
		setAttr("orderlist", orderpage.getList());
		setAttr("partici", ExchangeService.exchangeService.getBanking());
		List<Record> netstatis = AdStatisticsService.service.getStatistiNet(netstarttime,netendtime,emp.getInt("employeeid"));
		setAttr("netstatis", netstatis.get(0));
		renderJsp("/WEB-INF/admin/jsp/net.jsp");
	}

	public void showNet() {
		String netorderid = getPara("netorderid");
		Order order = Order.dao.findById(netorderid);
		Person per = Person.dao.findById(order.getInt("p1_MerId"));
		List<Participate> particiList = ExchangeService.exchangeService
				.getPartici();
		String pdname = "";
		for (Participate partic : particiList) {
			if (partic.getStr("participate").equals(order.getStr("pd_FrpId"))) {
				pdname = partic.get("payable");
				break;
			}
		}
		Asynchronous asynchronous = Asynchronous.dao.findById(netorderid);
		setAttr("pdname", pdname);
		setAttr("netname", per.get("name"));
		setAttr("netorder", order);
		setAttr("asynchronous", asynchronous);
		renderJsp("/WEB-INF/admin/jsp/net/showNet.jsp");
	}

	public void netDeduction() {
		try {
			String netorderid = getPara("netorderid");
			boolean boo = AdNetService.service.netdeduction(netorderid);
			if (boo) {
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav4\", \"forwardUrl\":\"\", \"rel\":\"nav4\"}");
			} else {
				renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			}
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}

	public void netDeductions() {
		try {
			String[] netlist = getParaValues("netlist");
			for (String netid : netlist) {
				AdNetService.service.netdeduction(netid);
			}
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav4\", \"forwardUrl\":\"\", \"rel\":\"nav4\"}");
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}

	public void netRecovery() {
		try {
			String netorderid = getPara("netorderid");
			boolean boo = AdNetService.service.netRecovery(netorderid);
			if (boo) {
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav4\", \"forwardUrl\":\"\", \"rel\":\"nav4\"}");
			} else {
				renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			}
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}
	public void netDelete(){
		try {
			String[] netlist = getParaValues("netlist");
			for (String netid : netlist) {
				AdNetService.service.netDelete(netid);
			}
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav4\", \"forwardUrl\":\"\", \"rel\":\"nav4\"}");
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}
}
