package com.admin.power.controller;

import java.util.List;
import com.admin.power.service.AdPowerService;
import com.interceptor.AdLoginSeInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.vo.Power;
import com.vo.Powerid_Navid;

@Before(AdLoginSeInterceptor.class)
public class AdPowerController extends Controller {
	public void index(){
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String powerid = "";
		if(!getPara("powerid").equals("")){
			powerid = getPara("powerid");
		}
		setAttr("powerid", powerid);
		Page<Record> powerPage = AdPowerService.service.getPowerPage(pageNum, numPerPage, powerid);
		setAttr("pageNum", powerPage.getPageNumber());
		setAttr("numPerPage", powerPage.getPageSize());
		setAttr("totalCount", powerPage.getTotalRow());
		setAttr("pageNumShown", powerPage.getTotalPage());
		setAttr("powerlist", powerPage.getList());
		renderJsp("/WEB-INF/admin/jsp/power.jsp");
	}
	
	public void showAddPower(){
		renderJsp("/WEB-INF/admin/jsp/power/addPower.jsp");
	}
	
	public void addPower(){
		String name = getPara("name");
		String explain = getPara("explain");
		if(name.equals("")&&explain.equals("")){
			renderJson("{\"statusCode\":\"300\", \"message\":\"名称或说明没有填写\"}");
		}else{
			try {
				Power power = new Power();
				power.set("name", name);
				power.set("explain", explain);
				power.save();
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav15\", \"forwardUrl\":\"\", \"rel\":\"nav15\", \"callbackType\":\"closeCurrent\"}");
			} catch (Exception e) {
				renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
				e.printStackTrace();
			}
		}
	}
	
	public void delPower(){
		int powerid = 0;
		try {
			powerid = getParaToInt("powerid");
			if(powerid==1){
				renderJson("{\"statusCode\":\"300\", \"message\":\"删除失败\"}");
			}else{
				Power.dao.deleteById(powerid);
				Db.update("DELETE FROM powerid_navid WHERE powerid="+powerid);
				renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav15\", \"forwardUrl\":\"\", \"rel\":\"nav15\"}");
			}
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"删除失败\"}");
			e.printStackTrace();
		}
	}
	
	public void showEmpower(){
		int powerid = getParaToInt("powerid");
		List<Record> navlist = AdPowerService.service.getPowerNavid(powerid);
		setAttr("navlist", navlist);
		setAttr("powerid", powerid);
		renderJsp("/WEB-INF/admin/jsp/power/empower.jsp");
	}
	
	public void upPowerNav(){
		try {
			String[] empjson = getParaValues("empjson");
			int powerid = getParaToInt("powerid");
			Db.update("DELETE FROM powerid_navid WHERE powerid="+powerid);
			Powerid_Navid powernav = null;
			for(String emp : empjson){
				powernav = new Powerid_Navid();
				powernav.set("powerid", powerid);
				powernav.set("navid", emp);
				powernav.save();
			}
			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav15\", \"forwardUrl\":\"\", \"rel\":\"nav15\", \"callbackType\":\"closeCurrent\"}");
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"301\", \"message\":\"系统错误\"}");
			e.printStackTrace();
		}
		
	}
}