/** 
 * Project Name:hspay 
 * File Name:SeventyOrder.java 
 * Package Name:com.vo 
 * Date:2017年3月21日上午9:43:51 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.vo;

import com.jfinal.plugin.activerecord.Model;

/**
 * @author Administrator
 * 
 */
public class SeventyOrder extends Model<SeventyOrder> {
	public static final SeventyOrder dao = new SeventyOrder();
	public SeventyOrder getOrderId(String orderid) {
		String sql = "select * from `seventyorders` where orderid = ? ";
		return findFirst(sql, orderid);
	}
}
