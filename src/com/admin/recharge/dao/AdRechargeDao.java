package com.admin.recharge.dao;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.vo.Recharge;

public class AdRechargeDao {

	public Page<Record> getRechPage(int pageNumber, int pageSize, String rechstarttime, String rechendtime, String rechparticipate, String rechstate, String rechid, String rechname, int employeeid){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("SELECT r.*, p.name, pa.payable");
		frosql.append(" from recharge r");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" ON p.id = r.p1_MerId");
		frosql.append(" LEFT JOIN participate pa");
		frosql.append(" ON r.pd_FrpId = pa.participate");
		if(employeeid==1){
			frosql.append(" where 1=1");
		}else{
			frosql.append(" WHERE p.id in (SELECT ep.id from employee_person ep WHERE ep.employeeid="+employeeid+")");
		}
		if(!rechparticipate.equals("")){
			frosql.append(" and pa.codeid="+rechparticipate);
		}
		if(!rechid.equals("")){
			frosql.append(" and r.rechargeid like '%"+rechid+"%'");
		}
		if(!rechname.equals("")){
			frosql.append(" and p.name like '%"+rechname+"%'");
		}
		if(!rechstate.equals("")){
			frosql.append(" and r.r1_Code="+rechstate);
		}
		if(!rechstarttime.equals("")){
			frosql.append(" and r.CreateTime >= '"+rechstarttime+"'");
		}
		if(!rechendtime.equals("")){
			frosql.append(" and r.CreateTime <= '"+rechendtime+"'");
		}
		frosql.append(" ORDER BY r.CreateTime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	public boolean netDelete(String netorderid){
		boolean boo = false;
		Recharge order = Recharge.dao.findById(netorderid);
		int r1_Code = order.getInt("r1_Code");
		if(r1_Code>2){
		    boo= order.delete();
		}
		return boo;
	}
}
