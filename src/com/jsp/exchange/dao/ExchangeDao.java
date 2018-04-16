package com.jsp.exchange.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.vo.CardCode;
import com.vo.CardOrder;
import com.vo.Order;
import com.vo.Participate;
import com.vo.SeventyCode;
import com.vo.SeventyOrder;

public class ExchangeDao {
	public List<Participate> getParticipate() {
		return Participate.dao.find("select * from participate");
	}

	public List<Participate> getPartici() {
		return Participate.dao.find("select * from participate p where p.codeid <30");
	}

	public List<Participate> getBanking() {
		return Participate.dao.find("select * from participate p where p.paytype =1");
	}
	public List<CardCode> getCardCode() {
		return CardCode.dao.find("SELECT * from cardcode");
	}

	public List<SeventyCode> getSeventyCode() {
		return SeventyCode.dao.find("SELECT * from seventycode");
	}

	public Page<Order> getOrder(int id, int page, String netstarttime, String netendtime, String netparticipate,
			String netstate, String netid) {
		StringBuffer sqlselect = new StringBuffer();
		StringBuffer sqlfrom = new StringBuffer();
		sqlselect.append("select o.orderid,o.p2_Order, o.CreateTime, p.payable AS pd_FrpId, o.p8_Url, ");
		sqlselect.append("o.p3_Amt, o.r1_Code, o.success, o.amount, o.deducted ");
		sqlfrom.append(" FROM orders o");
		sqlfrom.append(" LEFT JOIN participate p");
		sqlfrom.append(" on o.pd_FrpId=p.participate");
		sqlfrom.append(" where o.p1_MerId=? and o.lock=1");
		if (!netparticipate.equals("")) {
			sqlfrom.append(" and p.codeid=" + netparticipate);
		}
		if (!netstate.equals("")) {
			sqlfrom.append(" and o.r1_Code=" + netstate);
		}
		if (!netid.equals("")) {
			sqlfrom.append(" and (o.orderid like '%" + netid + "%'");
			sqlfrom.append(" OR o.p2_Order like '%" + netid + "%')");
		}
		if (!netstarttime.equals("") && !netendtime.equals("")) {
			sqlfrom.append(" and o.CreateTime BETWEEN '" + netstarttime + "' and '" + netendtime + "'");
		}
		sqlfrom.append(" ORDER BY o.CreateTime DESC");
		Page<Order> orderPage = Order.dao.paginate(page, 10, sqlselect.toString(), sqlfrom.toString(), id);
		return orderPage;
	}

	public Page<CardOrder> getCardOrder(int id, int page, String cardstarttime, String cardendtime,
			String cardparticipate, String cardstate, String cardid) {
		StringBuffer sqlselect = new StringBuffer();
		StringBuffer sqlfrom = new StringBuffer();
		sqlselect.append("select o.orderid,o.p2_Order, o.CreateTime, p.payable AS pd_FrpId, o.p8_Url,");
		sqlselect.append(" o.p3_Amt, o.r1_Code, o.success, o.amount, o.deducted");
		sqlfrom.append(" FROM cardorder o");
		sqlfrom.append(" LEFT JOIN participate p");
		sqlfrom.append(" on o.pd_FrpId=p.participate");
		sqlfrom.append(" where o.p1_MerId=? and o.lock=1");
		if (!cardparticipate.equals("")) {
			sqlfrom.append(" and p.codeid=" + cardparticipate);
		}
		if (!cardstate.equals("")) {
			sqlfrom.append(" and o.r1_Code=" + cardstate);
		}
		if (!cardid.equals("")) {
			sqlfrom.append(" and (o.orderid like '%" + cardid + "%'");
			sqlfrom.append(" OR o.p2_Order like '%" + cardid + "%')");
		}
		if (!cardstarttime.equals("") && !cardendtime.equals("")) {
			sqlfrom.append(" and o.CreateTime BETWEEN '" + cardstarttime + "' and '" + cardendtime + "'");
		}
		sqlfrom.append(" ORDER BY o.CreateTime DESC");
		Page<CardOrder> orderPage = CardOrder.dao.paginate(page, 10, sqlselect.toString(), sqlfrom.toString(), id);
		return orderPage;
	}

	public Page<SeventyOrder> getSeventyOrder(int id, int page, String cardstarttime, String cardendtime,
			String cardparticipate, String cardstate, String cardid) {
		StringBuffer sqlselect = new StringBuffer();
		StringBuffer sqlfrom = new StringBuffer();
		sqlselect.append("select o.orderid,o.p2_Order, o.CreateTime, p.payable AS pd_FrpId, o.p8_Url, o.p3_Amt,");
		sqlselect.append(" o.r1_Code, o.success, o.amount, o.deducted");
		sqlfrom.append(" FROM cardorder o");
		sqlfrom.append(" LEFT JOIN participate p");
		sqlfrom.append(" on o.pd_FrpId=p.participate");
		sqlfrom.append(" where o.p1_MerId=? and o.lock=1");
		if (!cardparticipate.equals("")) {
			sqlfrom.append(" and p.codeid=" + cardparticipate);
		}
		if (!cardstate.equals("")) {
			sqlfrom.append(" and o.r1_Code=" + cardstate);
		}
		if (!cardid.equals("")) {
			sqlfrom.append(" and o.orderid like '%" + cardid + "%'");
		}
		if (!cardstarttime.equals("") && !cardendtime.equals("")) {
			sqlfrom.append(" and o.CreateTime BETWEEN '" + cardstarttime + "' and '" + cardendtime + "'");
		}
		sqlfrom.append(" ORDER BY o.CreateTime DESC");
		Page<SeventyOrder> orderPage = SeventyOrder.dao.paginate(page, 10, sqlselect.toString(), sqlfrom.toString(), id);
		return orderPage;
	}

	public Record getOrdertotal(int id, Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String startime = format.format(date);
		String endtime = format.format(cal.getTime());
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(o.p3_Amt) AS amttote, SUM(o.amount) AS amounttote");
		sql.append(" FROM orders o");
		sql.append(" WHERE o.p1_MerId=" + id + " and o.lock=1 AND o.r1_Code=1");
		sql.append(" AND o.CreateTime BETWEEN '" + startime + "' AND '" + endtime + "'");
		return Db.findFirst(sql.toString());
	}
	

	public Record getOrdertotal(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(o.p3_Amt) AS amttote, SUM(o.amount) AS amounttote");
		sql.append(" FROM orders o");
		sql.append(" WHERE o.p1_MerId=" + id + " and o.lock=1 AND o.r1_Code=1");
		return Db.findFirst(sql.toString());
	}

	public Record getCardOrdertotal(int id, Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String startime = format.format(date);
		String endtime = format.format(cal.getTime());
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(o.p3_Amt) AS amttote, SUM(o.amount) AS amounttote");
		sql.append(" FROM cardorder o");
		sql.append(" WHERE o.p1_MerId=" + id + " and o.lock=1 AND o.r1_Code=1");
		sql.append(" AND o.CreateTime BETWEEN '" + endtime + "' AND '" + startime + "'");
		return Db.findFirst(sql.toString());
	}

	public Record getCardOrdertotal(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(o.p3_Amt) AS amttote, SUM(o.amount) AS amounttote");
		sql.append(" FROM cardorder o");
		sql.append(" WHERE o.p1_MerId=" + id + " and o.lock=1 AND o.r1_Code=1");
		return Db.findFirst(sql.toString());
	}
	public Record getRechOrdertotal(int id, Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String startime = format.format(date);
		String endtime = format.format(cal.getTime());
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(r.p3_Amt) AS amttote, SUM(r.amount) AS amounttote");
		sql.append(" FROM recharge r");
		sql.append(" WHERE r.p1_MerId=" + id + " and r.lock=1 AND r.r1_Code=1");
		sql.append(" AND r.CreateTime BETWEEN '" + endtime + "' AND '" + startime + "'");
		return Db.findFirst(sql.toString());
	}
	public Record getRechOrdertotal(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(r.p3_Amt) AS amttote, SUM(r.amount) AS amounttote");
		sql.append(" FROM recharge r");
		sql.append(" WHERE r.p1_MerId=" + id + " and r.lock=1 AND r.r1_Code=1");
		return Db.findFirst(sql.toString());
	}

	public Record getCircOrdertotal(int id, Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String startime = format.format(date);
		String endtime = format.format(cal.getTime());
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(c.amount) AS amttote, SUM(c.actual) AS amounttote");
		sql.append(" FROM circlip c");
		sql.append(" WHERE c.id=" + id + " AND c.result=2000");
		sql.append(" AND c.datetime BETWEEN '" + endtime + "' AND '" +  startime+ "'");
		return Db.findFirst(sql.toString());
	}

	public Record getCircOrdertotal(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS tote, SUM(c.amount) AS amttote, SUM(c.actual) AS amounttote");
		sql.append(" FROM circlip c");
		sql.append(" WHERE c.id=" + id + " AND c.result=2000");
		return Db.findFirst(sql.toString());
	}
	public List<Record> getSingOrder(String singid) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT s.*, c.payable");
		sql.append(" FROM singlecard s");
		sql.append(" LEFT JOIN cardcode c");
		sql.append(" ON s.cardcode=c.participate");
		sql.append(" where s.orderid='" + singid + "'");
		sql.append(" ORDER BY s.datetime DESC");
		List<Record> singlist = Db.find(sql.toString());
		return singlist;
	}
}
