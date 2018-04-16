package com.jsp.settlement.dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.vo.Refund;
import com.vo.SettlementAccount;

public class SettlementDao {
	public List<SettlementAccount> getSettlAccount(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select s.account_types, s.account_name, s.branch, s.account, p.payable as codeid, s.branchsheng, s.branchshi ");
		sql.append(" from settlement_account s");
		sql.append(" LEFT JOIN participate p");
		sql.append(" on s.codeid=p.codeid");
		sql.append(" where s.id=" + id);
		List<SettlementAccount> sett = SettlementAccount.dao.find(sql
				.toString());
		return sett;
	}

	public boolean ifSettleAcount(int id, int account_types) {
		boolean too = false;
		StringBuffer sql = new StringBuffer();
		sql.append("select COUNT(*) from settlement_account s where s.id=" + id
				+ " and s.account_types=" + account_types);
		List<SettlementAccount> sett = SettlementAccount.dao.find(sql
				.toString());
		long count = Db.queryLong(sql.toString());
		if (count > 0) {
			too = true;
		}
		return too;
	}

	public boolean upSettleAcount(int id, int account_types,
			String account_name, String branch, String account, int codeid, String branchsheng, String branchshi) {
		int count = Db.update("update settlement_account set account_name='"
				+ account_name + "',branch='" + branch + "',account='"
				+ account + "',codeid='" + codeid + "',branchsheng='"+branchsheng+"',branchshi='"+branchshi+"' where id=" + id
				+ " and account_types=" + account_types);
		return count == 1;
	}

	public boolean inserSettleAcount(int id, int account_types,
			String account_name, String branch, String account, int codeid, String branchsheng,String branchshi) {
		boolean too = false;
		try {
			SettlementAccount sett = new SettlementAccount();
			sett.set("id", id);
			sett.set("account_types", account_types);
			sett.set("account_name", account_name);
			sett.set("branch", branch);
			sett.set("account", account);
			sett.set("codeid", codeid);
			sett.set("branchsheng", branchsheng);
			sett.set("branchshi", branchshi);
			too = sett.save();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return too;
	}

	public Page<Refund> getRefund(int id, int page, String refundstarttime,
			String refundendtime, String refundstate, String refundid,int another) {
		StringBuffer sqlselect = new StringBuffer();
		StringBuffer sqlfrom = new StringBuffer();
		sqlselect
				.append("SELECT r.*");
		sqlfrom.append(" from refund r");
		sqlfrom.append(" where r.id = " + id);
		if (another>0) {
			sqlfrom.append(" and r.refund_another=" + another);
		}
		if (!refundstate.equals("")) {
			sqlfrom.append(" and r.refund_state=" + refundstate);
		}
		if (!refundid.equals("")) {
			sqlfrom.append(" and r.refund_id like '%" + refundid + "%'");
		}
		if (!refundstarttime.equals("") && !refundendtime.equals("")) {
			sqlfrom.append(" and r.createtime BETWEEN '" + refundstarttime
					+ "' and '" + refundendtime + "'");
		}
		sqlfrom.append(" ORDER BY r.createtime DESC");
		Page<Refund> orderPage = null;
		try {
			orderPage = Refund.dao.paginate(page, 10, sqlselect.toString(),
					sqlfrom.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderPage;
	}

	public long numrefund(String starttime, String endtime) {
		StringBuffer sql = new StringBuffer();
		sql.append("select COUNT(*)");
		sql.append(" from refund r");
		sql.append(" where r.createtime BETWEEN '" + starttime + "' and '" + endtime + "'");
		long l = -1;
		try {
			l = Db.queryLong(sql.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}
}