package com.admin.refund.controller;

import java.math.BigDecimal;

import com.admin.refund.service.AdRefundService;
import com.interceptor.AdLoginSeInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jsp.exchange.service.ExchangeService;
import com.vo.Balance;
import com.vo.Person;
import com.vo.Refund;

@Before(AdLoginSeInterceptor.class)
public class AdRefundController extends Controller {
	
	public void index(){
		int pageNum = getParaToInt("pageNum");
		int numPerPage = getParaToInt("numPerPage");
		String refustarttime = "";
		String refuendtime = "";
		String refustate = "";
		String refuid = "";
		String refuname = "";
		String settlementauthority = "";
		String refundanother="";
		if(!getPara("refustarttime").equals("")){
			refustarttime = getPara("refustarttime");
		}
		if(!getPara("refuendtime").equals("")){
			refuendtime = getPara("refuendtime");
		}
		if(!getPara("refustate").equals("0")){
			refustate = getPara("refustate");
		}
		if(!getPara("refuid").equals("")){
			refuid = getPara("refuid");
		}
		if(!getPara("refuname").equals("")){
			refuname = getPara("refuname");
		}
		if(!getPara("settlementauthority").equals("0")){
			settlementauthority = getPara("settlementauthority");
		}
		if(!getPara("refundanother").equals("0")){
			refundanother = getPara("refundanother");
		}
		setAttr("refustarttime", refustarttime);
		setAttr("refuendtime", refuendtime);
		setAttr("refustate", refustate);
		setAttr("refuid", refuid);
		setAttr("refuname", refuname);
		setAttr("settlementauthority", settlementauthority);
		setAttr("refundanother", refundanother);
		Page<Record> refundPage = AdRefundService.serivce.getRefundPage(pageNum, numPerPage, refustarttime, refuendtime, refustate, refuid, refuname, settlementauthority,refundanother);
		setAttr("pageNum", refundPage.getPageNumber());
		setAttr("numPerPage", refundPage.getPageSize());
		setAttr("totalCount", refundPage.getTotalRow());
		setAttr("pageNumShown", refundPage.getTotalPage());
		setAttr("orderlist", refundPage.getList());
		setAttr("cardcode", ExchangeService.exchangeService.getCardCode());
		renderJsp("/WEB-INF/admin/jsp/refund.jsp");
	}
	
	public void showRefund(){
		String refuid = getPara("refuid");
		Refund refund = Refund.dao.findById(refuid);
		Person per = Person.dao.findById(refund.getInt("id"));
		setAttr("refuname", per.get("name"));
		setAttr("refund", refund);
		renderJsp("/WEB-INF/admin/jsp/refund/showRefund.jsp");
	}
	
	public void upRefund(){
		try {
		    String refund_id = getPara("refund_id");
		    Refund refund = Refund.dao.findById(refund_id);
    		if(refund.getInt("refund_state")==2){
    			String explain = getPara("explain");
    			int refund_state = getParaToInt("refund_state");
    			
    			Balance balance = Balance.dao.findById(refund.getInt("id"));
    			BigDecimal refund_amount = refund.getBigDecimal("refund_amount");
    			BigDecimal amount = balance.getBigDecimal("amount");
    			BigDecimal waitamount = balance.getBigDecimal("waitamount");
    			if(refund_state==1){
    				balance.set("amount", amount.subtract(refund_amount));
    				balance.set("waitamount", waitamount.subtract(refund_amount));
    				balance.set("refundamout", balance.getBigDecimal("refundamout").add(refund_amount));
    			}else if(refund_state==3){
    				balance.set("waitamount", waitamount.subtract(refund_amount));
    				balance.set("settlement", balance.getBigDecimal("settlement").add(refund_amount));
    			}
    			balance.update();
    			refund.set("refund_state", refund_state);
    			refund.set("explain", explain);
    			refund.update();
    			renderJson("{\"statusCode\":\"200\", \"message\":\"操作成功\", \"navTabId\":\"nav7\", \"forwardUrl\":\"\", \"rel\":\"nav7\", \"callbackType\":\"closeCurrent\"}");
		    }else{
		        renderJson("{\"statusCode\":\"300\", \"message\":\"订单已经处理，请不要重新\"}");
		    }
		} catch (Exception e) {
			renderJson("{\"statusCode\":\"300\", \"message\":\"操作失败\"}");
			e.printStackTrace();
		}
	}
}
