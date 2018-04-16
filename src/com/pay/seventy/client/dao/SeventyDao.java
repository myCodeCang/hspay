package com.pay.seventy.client.dao;

import com.jfinal.plugin.activerecord.Db;

public class SeventyDao {

	public String getSeventyParticipate(String pd_FrpId){
		StringBuffer sql = new StringBuffer();
		sql.append("select p.seventy_participate from participate p where p.participate = '"+pd_FrpId+"'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
