package com.admin.refund.dao;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class AdRefundDao {

	public Page<Record> getRefundPage(int pageNumber, int pageSize, String refustarttime, String refuendtime, String refustate,String refuid,String refuname,String settlementauthority,String refundanother){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select r.*, pe.name, se.payable");
		frosql.append(" FROM refund r");
		frosql.append(" LEFT JOIN (select s.*, p.payable from settlement_account s ");
		frosql.append("            LEFT JOIN participate p");
		frosql.append("            ON s.codeid = p.codeid) se");
		frosql.append(" on r.refund_types = se.account_types and se.id=r.id");
		frosql.append(" LEFT JOIN person pe");
		frosql.append(" on r.id=pe.id");
		frosql.append(" where 1=1");
		if(!refustate.equals("")){
			frosql.append(" and r.refund_state="+refustate);
		}
		if(!refuid.equals("")){
			frosql.append(" and r.refund_id like '%"+refuid+"%'");
		}
		if(!refuname.equals("")){
			frosql.append(" and pe.name like '%"+refuname+"%'");
		}
		if(!settlementauthority.equals("")){
			frosql.append(" and r.settlementauthority="+settlementauthority);
		}
		if(!refundanother.equals("")){
			frosql.append(" and r.refund_another="+refundanother);
		}
		if(!refustarttime.equals("")&&!refuendtime.equals("")){
			frosql.append(" and r.createtime BETWEEN '"+refustarttime+"' and '"+refuendtime+"'");
		}
		frosql.append(" ORDER BY r.createtime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
}
