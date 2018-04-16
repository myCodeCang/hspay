package com.admin.net.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.admin.net.dao.AdNetDao;
import com.vo.Balance;
import com.vo.Order;

public class AdNetService extends AdNetDao {
	public static AdNetService service = new AdNetService();
	
	public boolean netdeduction(String netorderid){
		boolean boo = false;
		Order order = Order.dao.findById(netorderid);
		int r1_Code = order.getInt("r1_Code");
		if(r1_Code==1){
			int p1_MerId = order.getInt("p1_MerId");
			BigDecimal amount = order.getBigDecimal("amount");
			BigDecimal deducted = order.getBigDecimal("deducted");
			Balance balance = Balance.dao.findById(p1_MerId);
			balance.set("amount", balance.getBigDecimal("amount").subtract(amount));
			balance.set("netamount", balance.getBigDecimal("netamount").subtract(amount));
			balance.set("deductednet", balance.getBigDecimal("deductednet").subtract(deducted));
			Date netdate = order.getTimestamp("CreateTime");
			if(balance.getInt("settlementauthority")==2){
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				String netda = formatter.format(netdate);
				String da = formatter.format(date);
				if(netda.equals(da)){
					balance.set("newamount", balance.getBigDecimal("newamount").subtract(amount));
				}else{
					balance.set("settlement", balance.getBigDecimal("settlement").subtract(amount));
				}
			}else if(balance.getInt("settlementauthority")==1){
				balance.set("settlement", balance.getBigDecimal("settlement").subtract(amount));
			}
			order.set("lock", 2);
			boo = order.update() && balance.update();
		}
		return boo;
	}
	
	public boolean netRecovery(String netorderid){
		boolean boo = false;
		Order order = Order.dao.findById(netorderid);
		int r1_Code = order.getInt("r1_Code");
		if(r1_Code==1){
			int p1_MerId = order.getInt("p1_MerId");
			BigDecimal amount = order.getBigDecimal("amount");
			BigDecimal deducted = order.getBigDecimal("deducted");
			Balance balance = Balance.dao.findById(p1_MerId);
			balance.set("amount", balance.getBigDecimal("amount").add(amount));
			balance.set("netamount", balance.getBigDecimal("netamount").add(amount));
			balance.set("deductednet", balance.getBigDecimal("deductednet").add(deducted));
			Date netdate = order.getTimestamp("CreateTime");
			if(balance.getInt("settlementauthority")==2){
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				String netda = formatter.format(netdate);
				String da = formatter.format(date);
				if(netda.equals(da)){
					balance.set("newamount", balance.getBigDecimal("newamount").add(amount));
				}else{
					balance.set("settlement", balance.getBigDecimal("settlement").add(amount));
				}
			}else if(balance.getInt("settlementauthority")==1){
				balance.set("settlement", balance.getBigDecimal("settlement").add(amount));
			}
			order.set("lock", 1);
			boo = order.update() && balance.update();
		}
		return boo;
	}
	public boolean netDelete(String netorderid){
		boolean boo = false;
		Order order = Order.dao.findById(netorderid);
		int r1_Code = order.getInt("r1_Code");
		if(r1_Code>2){
		    boo= order.delete();
		}
		return boo;
	}
}
