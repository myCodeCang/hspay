package com.admin.net.dao;

import com.jfinal.plugin.activerecord.Page;
import com.vo.Order;

public class AdNetDao {
	public Page<Order> getNetPage(int pageNumber, int pageSize, String netstarttime, String netendtime, String netparticipate, String netstate, String netorderid, String netname, String netlock, int employeeid){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select o.orderid, p.name as p1_MerId, o.p2_Order, o.p3_Amt, o.amount,o.p1_MerId as merid,");
		selsql.append(" o.p5_Pid, pa.payable as pd_FrpId, o.p8_Url, o.ip, o.r1_Code, o.success, o.CreateTime, o.lock");
		frosql.append(" from orders o");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" on o.p1_MerId=p.id");
		frosql.append(" LEFT JOIN participate pa");
		frosql.append(" ON o.pd_FrpId=pa.participate");
		if(employeeid==1){
			frosql.append(" where 1=1");
		}else{
			frosql.append(" WHERE p.id in (SELECT ep.id from employee_person ep WHERE ep.employeeid="+employeeid+")");
		}
		if(!netparticipate.equals("")){
			frosql.append(" and pa.codeid="+netparticipate);
		}
		if(!netstate.equals("")){
			frosql.append(" and o.r1_Code="+netstate);
		}
		if(!netorderid.equals("")){
			frosql.append(" and o.orderid like '%"+netorderid+"%'");
		}
		if(!netname.equals("")){
			frosql.append(" and p.name like '%"+netname+"%'");
		}
		if(!netlock.equals("")){
			frosql.append(" and o.lock="+netlock);
		}
		if(!netstarttime.equals("")){
			frosql.append(" and o.CreateTime >= '"+netstarttime+"'");
		}
		if(!netendtime.equals("")){
			frosql.append(" and o.CreateTime <='"+netendtime+"'");
		}
		frosql.append(" ORDER BY o.CreateTime DESC");
		Page<Order> orderPage = Order.dao.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
}
