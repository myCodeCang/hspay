package com.admin.index.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.admin.index.service.AdIndexService;
import com.admin.statistics.service.AdStatisticsService;
import com.interceptor.AdLoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.pay.yeepay.server.Configuration;
import com.vo.Employees;
import com.vo.Navigation;

@Before(AdLoginInterceptor.class)
public class AdIndexController extends Controller {
	public void index() {
		Employees employee = getSessionAttr("adminsession");
		List<Navigation> navlist = AdIndexService.service.getNavi(employee.getInt("powerid"));
		List<Record> carstatis = AdStatisticsService.service.getStatistiCard("", "", employee.getInt("employeeid"));
		List<Record> netstatis = AdStatisticsService.service.getStatistiNet("", "", employee.getInt("employeeid"));
		List<Record> circlipstatis = AdStatisticsService.service.getStatistiCirclip("", "",
				employee.getInt("employeeid"));
		List<Record> rechargestatis = AdStatisticsService.service.getStatistiRecharge("", "",
				employee.getInt("employeeid"));
		List<Record> refundstatis = AdStatisticsService.service.getStatistiRefund("", "",
				employee.getInt("employeeid"));
		setAttr("carstatis", carstatis.get(0));
		setAttr("netstatis", netstatis.get(0));
		setAttr("circlipstatis", circlipstatis.get(0));
		setAttr("rechargestatis", rechargestatis.get(0));
		setAttr("refundstatis", refundstatis.get(0));
		setAttr("navlist", navlist);
		setAttr("employee", employee);
		renderJsp("/WEB-INF/admin/index.jsp");
	}

	public void getRefundcount() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) FROM refund r WHERE r.refund_state=2");
		long l = Db.queryLong(sql.toString());
		renderJson(l);
	}

	public void getStatistics() {
		try {
			long quot = 30;
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			String[] nettime = new String[(int) quot];
			BigDecimal[] p3_Amt = new BigDecimal[(int) quot];
			BigDecimal[] amount = new BigDecimal[(int) quot];
			BigDecimal[] deducted = new BigDecimal[(int) quot];
			Record net = null;
			Calendar theCa = Calendar.getInstance();
			theCa.setTime(new Date());
			theCa.add(Calendar.DATE, -30);
			Date date = theCa.getTime();
			String startime = ft.format(date);
			Employees emp = getSessionAttr("adminsession");
			for (int i = 1; i <= quot; i++) {
				String endtime = ft.format(ft.parse(startime).getTime() + 24 * 60 * 60 * 1000);
				nettime[i - 1] = "'" + startime + "'";
				net = AdStatisticsService.service.getStatistiNet(startime, endtime, emp.getInt("employeeid")).get(0);
				startime = endtime;
				if (net.get("p3_Amt") == null) {
					p3_Amt[i - 1] = new BigDecimal("0");
				} else {
					p3_Amt[i - 1] = net.getBigDecimal("p3_Amt");
				}
				if (net.get("amount") == null) {
					amount[i - 1] = new BigDecimal("0");
				} else {
					amount[i - 1] = net.getBigDecimal("amount");
				}
				if (net.get("deducted") == null) {
					deducted[i - 1] = new BigDecimal("0");
				} else {
					deducted[i - 1] = net.getBigDecimal("deducted");
				}
			}
			setAttr("nettime", nettime);
			setAttr("p3_Amt", p3_Amt);
			setAttr("amount", amount);
			setAttr("deducted", deducted);
			renderJsp("/WEB-INF/admin/jsp/getStatistics.jsp");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			String adminurl = Configuration.getInstance().getValue("adminurl");
			redirect(adminurl);
			e.printStackTrace();
		}
	}
}