package com.admin.power.dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class AdPowerDao {
	public Page<Record> getPowerPage(int pageNumber, int pageSize , String powerid){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select *");
		frosql.append("from power p");
		frosql.append(" where 1=1");
		if(!powerid.equals("")){
			frosql.append(" and p.powerid="+powerid);
		}
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public List<Record> getPowerNavid(int powerid){
		StringBuffer sql = new StringBuffer();
		sql.append("select n.*, p.navid as checked");
		sql.append(" from navigation n");
		sql.append(" LEFT JOIN powerid_navid p");
		sql.append(" on n.navid = p.navid and p.powerid="+powerid);
		sql.append(" ORDER BY n.navid");
		return Db.find(sql.toString());
	}
}
