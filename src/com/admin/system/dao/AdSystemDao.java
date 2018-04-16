package com.admin.system.dao;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class AdSystemDao {

	public Page<Record> getSystemQQPage(int pageNumber, int pageSize){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("SELECT *");
		frosql.append(" FROM system_qq s");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
}
