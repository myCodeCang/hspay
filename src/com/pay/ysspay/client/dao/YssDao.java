package com.pay.ysspay.client.dao;

import com.jfinal.plugin.activerecord.Db;

public class YssDao {

	public String getYsspayParticipate(String pd_FrpId){
		StringBuffer sql = new StringBuffer();
		sql.append("select p.ysspay_participate from participate p where p.participate = '"+pd_FrpId+"'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
