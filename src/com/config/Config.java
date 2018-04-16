package com.config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

import com.admin.caifutong.controller.AdCaifutongController;
import com.admin.card.controller.AdCardController;
import com.admin.circlip.controller.AdCirclipController;
import com.admin.dynamic.controller.AdDynamicController;
import com.admin.employee.controller.AdEmployeeController;
import com.admin.gateway.controller.AdGatewayController;
import com.admin.index.controller.AdIndexController;
import com.admin.login.controller.AdLoginController;
import com.admin.net.controller.AdNetController;
import com.admin.person.controller.AdPersonController;
import com.admin.phonerecharge.controller.AdPhoneRechargeController;
import com.admin.power.controller.AdPowerController;
import com.admin.recharge.controller.AdRechargeController;
import com.admin.refund.controller.AdRefundController;
import com.admin.statistics.controller.AdStatisticsController;
import com.admin.system.controller.AdSystemController;
import com.admin.transfer.controller.AdTransferController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.jsp.indexController;
import com.jsp.dynamic.controller.DynamicController;
import com.jsp.exchange.controller.ExchangeController;
import com.jsp.indexcard.controller.IndexCardController;
import com.jsp.login.controller.LoginController;
import com.jsp.payment.controller.PaymentController;
import com.jsp.phonerecharge.controller.PhoneRechargeController;
import com.jsp.register.controller.Register;
import com.jsp.safetysecurity.controller.SafetySecurityController;
import com.jsp.settlement.controller.SettlementController;
import com.jsp.statement.controller.StatementController;
import com.jsp.transfer.controller.TransferController;
import com.jsp.user.controller.MemberController;
import com.jsp.user.controller.MemberTwoController;
import com.jsp.user.controller.UserController;
import com.pay.Payeasy;
import com.pay.Payone;
import com.pay.hspay;
import com.pay.alipay.client.controller.Alipay;
import com.pay.alipay.client.controller.Alipay2;
import com.pay.allinpay.client.controller.Allinpay;
import com.pay.baopay.client.controller.Baopay;
import com.pay.caifutong.client.controller.CaiFuTong;
import com.pay.cardyee.client.controller.Cardyee;
import com.pay.dinpay.client.controller.Ddpay;
import com.pay.dinpay.client.controller.Dinpay;
import com.pay.ease.client.controller.Ease;
import com.pay.ecpss.client.controller.Ecpss;
import com.pay.fastmoney.client.controller.FastMoney;
import com.pay.gopay.client.controller.Gopay;
import com.pay.hundred.client.controller.Hundred;
import com.pay.hundred.client.controller.HundredCard;
import com.pay.hundred.client.controller.Paydo;
import com.pay.ips.client.controller.IpsController;
import com.pay.jdpay.client.controller.Jdpay;
import com.pay.mzfpay.client.controller.Mzfpay;
import com.pay.seventy.client.controller.Seventy;
import com.pay.shpay.client.controller.Shpay;
import com.pay.w95epay.client.controller.W95epay;
import com.pay.wapalipay.client.controller.WapAlipay;
import com.pay.yeepay.client.controller.Yeepay;
import com.pay.yeepay.server.Configuration;
import com.pay.ysspay.client.controller.Ysspay;
import com.pay.zhipay.client.controller.Zhipay;
import com.vo.Addedamount;
import com.vo.Asynchronous;
import com.vo.Balance;
import com.vo.Caifutong;
import com.vo.CaifutongOrder;
import com.vo.CardCode;
import com.vo.CardOrder;
import com.vo.Circlip;
import com.vo.Dynamic;
import com.vo.Employee_Person;
import com.vo.Employees;
import com.vo.Gateway;
import com.vo.Logrecord;
import com.vo.Navigation;
import com.vo.Onlineorder;
import com.vo.Order;
import com.vo.Participate;
import com.vo.Payment;
import com.vo.Person;
import com.vo.PersonGateway;
import com.vo.Power;
import com.vo.Powerid_Navid;
import com.vo.Rate;
import com.vo.Recharge;
import com.vo.Refund;
import com.vo.SettlementAccount;
import com.vo.SeventyCard;
import com.vo.SeventyCode;
import com.vo.SeventyOrder;
import com.vo.SingleCard;
import com.vo.System_interface;
import com.vo.System_qq;
import com.vo.Systemss;
import com.vo.Transfer;

public class Config extends JFinalConfig {
	private Timer timer = null;
	private Timer orderTimer = null;

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
//		boolean boo2 = new Backstage().getMac("52-54-00-2A-B3-9E");
//		boolean boo1 = new Backstage().getMac("00-0C-29-7F-6D-E6");
//		if (boo1 || boo2) {
//			loadPropertyFile("a_little_config.txt");
//			System.out.println("授权通过");
//		} else {
//			System.out.println("授权失败");
//		}
		loadPropertyFile("a_little_config.txt");
		me.setViewType(ViewType.JSP);
		me.setDevMode(true);
		me.setError401View("/error.html");
		me.setError403View("/error.html");
		me.setError404View("/error.html");
		me.setError500View("/error.html");
	}

	@Override
	public void configRoute(Routes me) {
		String adminurl = Configuration.getInstance().getValue("adminurl");
		String neturl = Configuration.getInstance().getValue("neturl");
		String cardurl = Configuration.getInstance().getValue("cardurl");
		String hundredurl = Configuration.getInstance().getValue("hundredurl");
		String hundredy = Configuration.getInstance().getValue("hundredy");
		me.add("/", indexController.class);
		me.add("/register", Register.class);
		me.add("/user", UserController.class);
		me.add("/member", MemberController.class);
		me.add("/mtwo", MemberTwoController.class);
		me.add("/login", LoginController.class);
		me.add("/dynamic", DynamicController.class);
		me.add("/safetysecurity", SafetySecurityController.class);
		me.add("/indexcard", IndexCardController.class);
		me.add("/exchange", ExchangeController.class);
		me.add(neturl, hspay.class);
		me.add("/yeepay", Yeepay.class);
		me.add("/fastmoney", FastMoney.class);
		me.add("/baopay", Baopay.class);
		me.add("/caifutong", CaiFuTong.class);
		me.add("/alipay", Alipay.class);
		me.add("/dinpay", Dinpay.class);
		me.add("/ddpay", Ddpay.class);
		me.add("/ease", Ease.class);
		me.add("/allinpay", Allinpay.class);
		me.add("/wapalipay", WapAlipay.class);
		me.add("/ecpss", Ecpss.class);
		me.add("/ips", IpsController.class);
		me.add("/w95epay", W95epay.class);
		me.add(cardurl, Cardyee.class);
		me.add("/statement", StatementController.class);
		me.add("/payment", PaymentController.class);
		me.add("/settlement", SettlementController.class);
		me.add("/phonerecharge", PhoneRechargeController.class);
		me.add("/transfer", TransferController.class);
		me.add(hundredurl, HundredCard.class);
		me.add(hundredy, Hundred.class);
		me.add("/paydo", Paydo.class);
		me.add("/payone", Payone.class);
		me.add("/payeasy", Payeasy.class);
		me.add("/shpay", Shpay.class);
		me.add("/jdpay", Jdpay.class);
		me.add("/mzfpay", Mzfpay.class);
		me.add("/gopay", Gopay.class);
		me.add("/zhipay", Zhipay.class);
		me.add("/ysspay", Ysspay.class);
		me.add("/alipay2", Alipay2.class);
		me.add("/seventypay", Seventy.class);
		me.add(adminurl, AdIndexController.class);
		me.add(adminurl + "/login", AdLoginController.class);
		me.add(adminurl + "/net", AdNetController.class);
		me.add(adminurl + "/card", AdCardController.class);
		me.add(adminurl + "/dynamic", AdDynamicController.class);
		me.add(adminurl + "/person", AdPersonController.class);
		me.add(adminurl + "/employee", AdEmployeeController.class);
		me.add(adminurl + "/power", AdPowerController.class);
		me.add(adminurl + "/refund", AdRefundController.class);
		me.add(adminurl + "/statistics", AdStatisticsController.class);
		me.add(adminurl + "/recharge", AdRechargeController.class);
		me.add(adminurl + "/circlip", AdCirclipController.class);
		me.add(adminurl + "/gateway", AdGatewayController.class);
		me.add(adminurl + "/caifutong", AdCaifutongController.class);
		me.add(adminurl + "/system", AdSystemController.class);
		me.add(adminurl + "/phonerecharge", AdPhoneRechargeController.class);
		me.add(adminurl + "/transfer", AdTransferController.class);
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		C3p0Plugin cp = new C3p0Plugin(getProperty("jdbcUrl"),
				getProperty("user"), getProperty("password").trim());
		System.out.println(getProperty("jdbcUrl") + ";" + getProperty("user")
				+ ";" + getProperty("password"));
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		me.add(arp);
		arp.addMapping("person", "id", Person.class);
		arp.addMapping("payment", "id", Payment.class);
		arp.addMapping("balance", "id", Balance.class);
		arp.addMapping("logrecord", "logid", Logrecord.class);
		arp.addMapping("participate", "codeid", Participate.class);
		arp.addMapping("orders", "orderid", Order.class);
		arp.addMapping("cardorder", "orderid", CardOrder.class);
		arp.addMapping("singlecard", "orderno", SingleCard.class);
		arp.addMapping("cardcode", "codeid", CardCode.class);
		arp.addMapping("employee", "employeeid", Employees.class);
		arp.addMapping("power", "powerid", Power.class);
		arp.addMapping("navigation", "navid", Navigation.class);
		arp.addMapping("powerid_navid", Powerid_Navid.class);
		arp.addMapping("dynamic", "dynamicid", Dynamic.class);
		arp.addMapping("rate", "id", Rate.class);
		arp.addMapping("recharge", "rechargeid", Recharge.class);
		arp.addMapping("circlip", "circlipid", Circlip.class);
		arp.addMapping("settlement_account", SettlementAccount.class);
		arp.addMapping("refund", "refund_id", Refund.class);
		arp.addMapping("gateway", "gateway_id", Gateway.class);
		arp.addMapping("person_gateway", "id", PersonGateway.class);
		arp.addMapping("addedamount", "addedamount_id", Addedamount.class);
		arp.addMapping("employee_person", "id", Employee_Person.class);
		arp.addMapping("caifutong", "id", Caifutong.class);
		arp.addMapping("caifutongorder", "sp_billno", CaifutongOrder.class);
		arp.addMapping("system", "system_id", Systemss.class);
		arp.addMapping("system_interface", "system_interface_id",
				System_interface.class);
		arp.addMapping("system_qq", "qq_id", System_qq.class);
		arp.addMapping("onlineorder", "sporder_id", Onlineorder.class);
		arp.addMapping("transfer", "transfer_id", Transfer.class);
		arp.addMapping("asynchronous", "orderid", Asynchronous.class);
		arp.addMapping("seventycode", "codeid", SeventyCode.class);
		arp.addMapping("seventyorders", "orderid", SeventyOrder.class);
		arp.addMapping("seventycard", "id", SeventyCard.class);
	}

	@Override
	public void configInterceptor(Interceptors me) {

	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub

	}

	/**
	 * Call back after JFinal start
	 */
	public void afterJFinalStart() {
		// 一天的毫秒数
		final long daySpan = 24 * 60 * 60 * 1000;

		// 规定的每天时间00:00:00运行
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd '00:00:00'");
		// 首次运行时间
		Date startTime = null;
		try {
			startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf
					.format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 如果今天的已经过了 首次运行时间就改为明天
		if (System.currentTimeMillis() > startTime.getTime()) {
			startTime = new Date(startTime.getTime() + daySpan);
		}
		ThreadsTimer threatimer = new ThreadsTimer();
		timer = new Timer();
		System.out.println("计时器开启");
		timer.scheduleAtFixedRate(threatimer, startTime, daySpan);
		orderTimer=new Timer();
		orderTimer.scheduleAtFixedRate(new OrderTask(), 60000, 120 * 1000);
		// new Backstage().setEmp();
	}

	/**
	 * Call back before JFinal stop
	 */
	public void beforeJFinalStop() {
		if(timer!=null)
			timer.cancel();
		if(orderTimer!=null)
			orderTimer.cancel();
		System.out.println("计时器关闭");
		// new Backstage().exit();
	}
}
