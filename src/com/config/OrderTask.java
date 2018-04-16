/**
 * 
 */
package com.config;

import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import org.apache.commons.lang.math.NumberUtils;

import com.pay.yeepay.client.service.YeepayService;
import com.vo.Asynchronous;

/**
 * @author Administrator
 * 
 */
public class OrderTask extends TimerTask {

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.util.TimerTask#run()
	 */
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("OrderTask定时器通知运行" + new Date() + "[START]");
		StringBuffer sql = new StringBuffer();
		sql.append("select o.orderid,o.r1_Code,o.success,a.number,a.relust from `orders` o left join `asynchronous` a on a.orderid=o.orderid ");
		sql.append(" where (a.relust is null  or a.relust='') and (a.number < 5 or a.number is null or a.number='') and o.r1_Code=1");
		sql.append(" order by a.number,o.orderid limit 5 ");
		List<Asynchronous> alist = Asynchronous.dao.find(sql.toString());
		for (Asynchronous a : alist) {
			String r6_Order = a.getStr("orderid");
			System.out.println(r6_Order + "=========定时器通知开始==========");
			boolean boo = YeepayService.service.asynchronous(r6_Order);
			if (boo) {
				a.set("relust", "success");
			}
			a.set("number", NumberUtils.toInt(a.get("number",0).toString(),0) + 1);
			a.update();
		}
		System.out.println("OrderTask定时器通知运行" + new Date() + "[END]");
	}

}
