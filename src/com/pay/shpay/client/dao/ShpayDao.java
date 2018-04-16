package com.pay.shpay.client.dao;

import com.jfinal.plugin.activerecord.Db;

public class ShpayDao {

	public String getShpayParticipate(String pd_FrpId){
		StringBuffer sql = new StringBuffer();
		sql.append("select p.shpay_participate from participate p where p.participate = '"+pd_FrpId+"'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
