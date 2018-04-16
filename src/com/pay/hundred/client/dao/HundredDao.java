/** 
 * Project Name:hspay 
 * File Name:HundredDao.java 
 * Package Name:com.pay.hundred.client.dao 
 * Date:2017年4月9日下午3:19:20 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.pay.hundred.client.dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.vo.CardCode;
import com.vo.Payment;

/**
 * 101卡
 * 
 * @author Administrator
 * 
 */
public class HundredDao {

	public String getHundredParticipate(String pd_FrpId) {
		StringBuffer sql = new StringBuffer();
		sql.append("select p.hundred_participate from participate p where p.participate = '" + pd_FrpId + "'");
		return Db.queryStr(sql.toString());
	}

	public List<Payment> eqPayment(String id){
		return Payment.dao.find("select * from payment p where p.id='"+id+"'");
	}
	
	public String getParticipate(String participate){
		List<CardCode> list = CardCode.dao.find("select c.participate from cardcode c, participate p where c.codeid = p.codeid and p.participate = '"+participate+"'");
		return list.get(0).getStr("participate");
	}
	
	public Record getRate(String cardcode, int id){
		StringBuffer sql = new StringBuffer();
		sql.append("select r.*, c.rate");
		sql.append(" from rate r, cardcode c");
		sql.append(" where c.participate = '"+cardcode+"' and r.id="+id);
		return Db.findFirst(sql.toString());
	}
	
	public List<String> getSingResult(String orderid){
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT s.result");
		sql.append(" from singlecard s");
		sql.append(" where s.orderid='"+orderid+"'");
		return Db.query(sql.toString());
	}
}
