package com.admin.person.dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.vo.CardOrder;
import com.vo.Order;
import com.vo.Person;
import com.vo.SettlementAccount;

public class AdPersonDao {
	
	public Page<Person> getPerson(int pageNumber, int pageSize, String starttime, String endtime, String id, String iflock, String iflogin, String ifnet, int employeeid){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("SELECT p.*, e.name AS empname");
		frosql.append(" from person p");
		frosql.append(" LEFT JOIN employee_person ep");
		frosql.append(" ON p.id = ep.id");
		frosql.append(" LEFT JOIN employee e");
		frosql.append(" ON ep.employeeid = e.employeeid");
		if(employeeid==1){
			frosql.append(" where 1=1");
		}else{
			frosql.append(" WHERE p.id in (SELECT ep.id from employee_person ep WHERE ep.employeeid="+employeeid+")");
		}
		if(!id.equals("")){
			frosql.append(" and p.id="+id);
		}
		if(!iflock.equals("")){
			frosql.append(" and p.iflock="+iflock);
		}
		if(!iflogin.equals("")){
			frosql.append(" and p.iflogin="+iflogin);
		}
		if(!ifnet.equals("")){
			frosql.append(" and p.ifnet="+ifnet);
		}
		if(!starttime.equals("")&&!endtime.equals("")){
			frosql.append(" and p.time BETWEEN '"+starttime+"' and '"+endtime+"'");
		}
		frosql.append(" ORDER BY p.time DESC");
		Page<Person> orderPage = Person.dao.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Order> getNetPage(int pageNumber, int pageSize, String netstarttime, String netendtime, String netparticipate, String netstate, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select o.orderid, p.name as p1_MerId, o.p2_Order, o.p3_Amt, o.amount,");
		selsql.append(" o.p5_Pid, pa.payable as pd_FrpId, o.p8_Url, o.ip, o.r1_Code, o.success, o.CreateTime");
		frosql.append(" from orders o");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" on o.p1_MerId=p.id");
		frosql.append(" LEFT JOIN participate pa");
		frosql.append(" ON o.pd_FrpId=pa.participate");
		frosql.append(" where o.p1_MerId="+id);
		if(!netparticipate.equals("")){
			frosql.append(" and pa.codeid="+netparticipate);
		}
		if(!netstate.equals("")){
			frosql.append(" and o.r1_Code="+netstate);
		}
		if(!netstarttime.equals("")&&!netendtime.equals("")){
			frosql.append(" and o.CreateTime BETWEEN '"+netstarttime+"' and '"+netendtime+"'");
		}
		frosql.append(" ORDER BY o.CreateTime DESC");
		Page<Order> orderPage = Order.dao.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<CardOrder> getCardPage(int pageNumber, int pageSize, String cardstarttime, String cardendtime, String cardparticipate, String cardstate, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select o.orderid, p.name as p1_MerId, o.p2_Order, o.p3_Amt, o.amount,");
		selsql.append(" o.p5_Pid, pa.payable as pd_FrpId, o.p8_Url, o.ip, o.r1_Code, o.success, o.CreateTime");
		frosql.append(" from cardorder o");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" on o.p1_MerId=p.id");
		frosql.append(" LEFT JOIN participate pa");
		frosql.append(" ON o.pd_FrpId=pa.participate");
		frosql.append(" where o.p1_MerId="+id);
		if(!cardparticipate.equals("")){
			frosql.append(" and pa.codeid="+cardparticipate);
		}
		if(!cardstate.equals("")){
			frosql.append(" and o.r1_Code="+cardstate);
		}
		if(!cardstarttime.equals("")&&!cardendtime.equals("")){
			frosql.append(" and o.CreateTime BETWEEN '"+cardstarttime+"' and '"+cardendtime+"'");
		}
		frosql.append(" ORDER BY o.CreateTime DESC");
		Page<CardOrder> orderPage = CardOrder.dao.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Record> getRechargePage(int pageNumber, int pageSize, String rechstarttime, String rechendtime, String rechparticipate, String rechstate, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select p.payable as pd_FrpId, r.rechargeid, r.p3_Amt, r.CreateTime, r.amount, r.r1_Code, r.p1_MerId, pe.name");
		frosql.append(" FROM recharge r");
		frosql.append(" LEFT JOIN person pe");
		frosql.append(" on r.p1_MerId=pe.id");
		frosql.append(" LEFT JOIN participate p");
		frosql.append(" ON r.pd_FrpId=p.participate");
		frosql.append(" where pe.id="+id);
		if(!rechparticipate.equals("")){
			frosql.append(" and p.codeid="+rechparticipate);
		}
		if(!rechstate.equals("")){
			frosql.append(" and r.r1_Code="+rechstate);
		}
		if(!rechstarttime.equals("")&&!rechendtime.equals("")){
			frosql.append(" and r.CreateTime BETWEEN '"+rechstarttime+"' and '"+rechendtime+"'");
		}
		frosql.append(" ORDER BY r.CreateTime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Record> getCirclipPage(int pageNumber, int pageSize, String circstarttime, String circendtime, String circparticipate, String circstate, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select c.*, ca.payable AS payable, pe.name");
		frosql.append(" FROM circlip c");
		frosql.append(" LEFT JOIN person pe");
		frosql.append(" on c.id=pe.id");
		frosql.append(" LEFT JOIN cardcode ca");
		frosql.append(" ON c.cardcode=ca.participate");
		frosql.append(" where c.id="+id);
		if(!circparticipate.equals("")){
			frosql.append(" and ca.codeid="+circparticipate);
		}
		if(!circstate.equals("")){
			if(circstate.equals("3")){
				frosql.append(" and c.result!='2000' and c.result!='2001'");
			}
			frosql.append(" and c.result='"+circstate+"'");
		}
		if(!circstarttime.equals("")&&!circendtime.equals("")){
			frosql.append(" and c.datetime BETWEEN '"+circstarttime+"' and '"+circendtime+"'");
		}
		frosql.append(" ORDER BY c.datetime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Record> getRefundPage(int pageNumber, int pageSize, String refustarttime, String refuendtime, String refustate, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select r.*, pe.name, se.payable");
		frosql.append(" FROM refund r");
		frosql.append(" LEFT JOIN (select s.*, p.payable from settlement_account s ");
		frosql.append("            LEFT JOIN participate p");
		frosql.append("            ON s.codeid = p.codeid");
		frosql.append("            where s.id = "+id+") se");
		frosql.append(" on r.refund_types = se.account_types");
		frosql.append(" LEFT JOIN person pe");
		frosql.append(" on r.id=pe.id");
		frosql.append(" where r.id="+id);
		if(!refustate.equals("")){
			frosql.append(" and r.refund_state='"+refustate+"'");
		}
		if(!refustarttime.equals("")&&!refuendtime.equals("")){
			frosql.append(" and r.createtime BETWEEN '"+refustarttime+"' and '"+refuendtime+"'");
		}
		frosql.append(" ORDER BY r.createtime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Record> getLogPage(int pageNumber, int pageSize, String logstarttime, String logendtime, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select l.*, p.name");
		frosql.append(" from logrecord l");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" ON p.id = l.id");
		frosql.append(" where l.id="+id);
		if(!logstarttime.equals("")&&!logendtime.equals("")){
			frosql.append(" and l.landingtime BETWEEN '"+logstarttime+"' and '"+logendtime+"'");
		}
		frosql.append(" ORDER BY l.landingtime DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public Page<Record> getAddePage(int pageNumber, int pageSize, String addestarttime, String addeendtime, int id){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("SELECT a.*, p.name");
		frosql.append(" from addedamount a");
		frosql.append(" LEFT JOIN person p");
		frosql.append(" ON a.id = p.id");
		frosql.append(" where a.id="+id);
		if(!addestarttime.equals("")&&!addeendtime.equals("")){
			frosql.append(" and a.addedamount_time BETWEEN '"+addestarttime+"' and '"+addeendtime+"'");
		}
		frosql.append(" ORDER BY a.addedamount_time DESC");
		Page<Record> orderPage = Db.paginate(pageNumber, pageSize, selsql.toString(), frosql.toString());
		return orderPage;
	}
	
	public List<SettlementAccount> getSettlAccount(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select s.account_types, s.account_name, s.branch, s.account, s.codeid, s.branchsheng, s.branchshi");
		sql.append(" from settlement_account s");
		sql.append(" LEFT JOIN participate p");
		sql.append(" on s.codeid=p.codeid");
		sql.append(" where s.id=" + id);
		List<SettlementAccount> sett = SettlementAccount.dao.find(sql
				.toString());
		return sett;
	}
	
	public Page<Record> getEmpPage(int pageNum,int numPerPage,String empname){
		StringBuffer selsql = new StringBuffer();
		StringBuffer frosql = new StringBuffer();
		selsql.append("select e.*, p.name as powername");
		frosql.append(" from employee e");
		frosql.append(" LEFT JOIN power p");
		frosql.append(" on p.powerid = e.powerid");
		frosql.append(" where e.employeeid !=1 ");
		if(!empname.equals("")){
			frosql.append("and e.name LIKE '%"+empname+"%'");
		}
		frosql.append(" ORDER BY e.creationtime DESC");
		Page<Record> orderPage = Db.paginate(pageNum, numPerPage, selsql.toString(), frosql.toString());
		return orderPage;
	}
}
