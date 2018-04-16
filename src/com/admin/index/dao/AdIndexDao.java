package com.admin.index.dao;

import java.util.List;

import com.vo.Navigation;

public class AdIndexDao {
	public List<Navigation> getNavi(int powerId){
		StringBuffer sql = new StringBuffer();
		sql.append("select n.*");
		sql.append(" from navigation n");
		sql.append(" where n.navid in (");
		sql.append(" SELECT pn.navid from powerid_navid pn");
		sql.append(" where pn.powerid="+powerId+")");
		List<Navigation> list = Navigation.dao.find(sql.toString());
		return list;
	}
}
