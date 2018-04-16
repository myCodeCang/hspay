package com.config;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import com.vo.Balance;

public class ThreadsTimer extends TimerTask {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("计时器运行中"+new Date()+"START");
		StringBuffer sql = new StringBuffer();
		sql.append("select b.*");
		sql.append(" from balance b");
		List<Balance> balance = Balance.dao.find(sql.toString());
		for(Balance ba:balance){
			if(ba.getInt("settlementauthority")==2){
				BigDecimal newamount = ba.getBigDecimal("newamount");
				BigDecimal settlement = ba.getBigDecimal("settlement");
				ba.set("settlement", settlement.add(newamount));
				ba.set("newamount", 0);
				ba.update();
			}
		}
		System.out.println("计时器运行中"+new Date()+"END");
	}
}
