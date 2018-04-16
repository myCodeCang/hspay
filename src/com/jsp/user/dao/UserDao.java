package com.jsp.user.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.jfinal.plugin.activerecord.Db;
import com.vo.Balance;
import com.vo.Logrecord;
import com.vo.Order;
import com.vo.Payment;
import com.vo.Person;
import com.vo.Rate;

public class UserDao {
	public List<Logrecord> getLogrecords(int id){
		return Logrecord.dao.find("SELECT * FROM logrecord l where l.id="+id+" ORDER BY l.exittime DESC");
	}
	
	public List<Balance> getBalance(int id){
		return Balance.dao.find("select * from balance b where b.id = "+id);
	}
	
	public List<Rate> getRate(int id){
		return Rate.dao.find("select * from rate r where r.id = "+id);
	}
	
	public List<Payment> getPaymList(int id){
		return Payment.dao.find("select p.id, p.key from payment p where p.id="+id);
	}
	
	public boolean getPaymentboo(int id, String payment){
		boolean boo = false;
		List<Payment> payList=  Payment.dao.find("select * from payment p where p.id="+id+" and p.payment='"+payment+"'");
		if(payList.size()>0){
			boo = true;
		}
		return boo;
	}
	
	public boolean getPasswordboo(int id, String password){
		boolean boo = false;
		List<Person> personList=  Person.dao.find("select p.email from person p where p.id="+id+" and p.password='"+password+"'");
		if(personList.size()>0){
			boo = true;
		}
		return boo;
	}
	
	public Map<String,String> getOrdersStatistics(int id){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,String> map=new HashMap<String,String>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		for(int i=7;i>=0;i--) {
			calendar.add(Calendar.DAY_OF_MONTH, -1);
			String sday=sdf.format(calendar.getTime());
			String sql="SELECT date_format(o.CreateTime, '%Y-%m-%d') as CreateTime,IFNULL(COUNT(orderid),0) as totalcount,"; 
			sql+=" IFNULL(sum(p3_Amt),0.000) as totalnum from orders o ";
			sql+=" where o.r1_Code = 1 and o.lock=1 and date_format(o.CreateTime, '%Y-%m-%d')='"+sday+"'";
			if(id>0)
				sql+=" and o.p1_MerId = " + id;
			sql+=" group by date_format(o.CreateTime, '%Y-%m-%d') ";
			Order o=Order.dao.findFirst(sql);
			if(o!=null)
				map.put(sday, o.getLong("totalcount")+","+o.getBigDecimal("totalnum").floatValue());
			else
				map.put(sday, "0,0");
		}
		Map<String,String> sortedMap = new TreeMap<String,String>(new Comparator<String>() {  
	        public int compare(String key1, String key2) {  
	            return key1.compareTo(key2); 
	        }});  
	    sortedMap.putAll(map); 
		return sortedMap;
	}
	public Long getOrdersTotal(int id){
		String sql="SELECT COUNT(*) from orders o where o.r1_Code = 1 and o.lock=1 ";
		if(id>0)
		sql+=" and o.p1_MerId = " + id;
		Long cou = Db.queryLong(sql);
		return cou;
	}
	public Long getOrdersCount(int id){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String startime = ft.format(date);
		String endtime = ft.format(date.getTime() + 24 * 60 * 60 * 1000);
		String sql="SELECT COUNT(*) from orders o where o.r1_Code = 1";
		sql+=" and o.CreateTime BETWEEN '"+startime+"' and '"+endtime+"'";
		if(id>0)
		sql+=" and o.p1_MerId = " + id;
		Long cou = Db.queryLong(sql);
		return cou;
	}
	

	public Order getOrdersNum(int id){
		String sql=" select IFNULL(SUM(IF(pd_FrpId='alipay' || pd_FrpId='weixin',count_,0)),0) AS saoma,";
		sql+=" IFNULL(SUM(IF(pd_FrpId='alipaywap' || pd_FrpId='wxwap',count_,0)),0) AS wapnum,";
		sql+=" IFNULL(SUM(IF(pd_FrpId!='alipaywap' && pd_FrpId!='wxwap' && pd_FrpId!='alipay' && pd_FrpId!='weixin',count_,0)),0) AS banknum,";
		sql+=" (select IFNULL(count(1),0) from cardorder where p1_MerId="+id+" and r1_Code=1) as cardnum";
		sql+="  from (select o.pd_FrpId,count(o.orderid) as count_ from orders o";
		sql+="  where o.r1_Code=1 and o.lock=1 and o.p1_MerId="+id+" group by o.pd_FrpId) tt";
		return Order.dao.findFirst(sql);
	}
	
	public Long getCardOrdersCount(int id){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String startime = ft.format(date);
		String endtime = ft.format(date.getTime() + 24 * 60 * 60 * 1000);
		String sql="SELECT COUNT(*) from cardorder o where o.r1_Code = 1";
		sql+=" and o.CreateTime BETWEEN '"+startime+"' and '"+endtime+"'";
		sql+=" and o.p1_MerId = " + id;
		Long cou = Db.queryLong(sql);
		return cou;
	}

	public Long getCirclipCount(int id){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String startime = ft.format(date);
		String endtime = ft.format(date.getTime() + 24 * 60 * 60 * 1000);
		String sql="SELECT COUNT(*) from circlip c where c.result=2000";
		sql+=" and c.datetime BETWEEN '"+startime+"' and '"+endtime+"'";
		sql+=" and c.id = " + id;
		Long cou = Db.queryLong(sql);
		return cou;
	}
	
	public Long getRechargeCount(int id){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String startime = ft.format(date);
		String endtime = ft.format(date.getTime() + 24 * 60 * 60 * 1000);
		String sql="SELECT COUNT(*) from recharge r where r.r1_Code=1 ";
		sql+=" and r.CreateTime BETWEEN '"+startime+"' and '"+endtime+"'";
		sql+=" and r.p1_MerId = " + id;
		Long cou = Db.queryLong(sql);
		return cou;
	}
}
