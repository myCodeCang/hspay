/** 
 * Project Name:hspay 
 * File Name:SeventyCard.java 
 * Package Name:com.vo 
 * Date:2017年3月21日上午9:59:43 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.vo;

import com.jfinal.plugin.activerecord.Model;

/**
 * @author Administrator
 * 
 */
public class SeventyCard extends Model<SeventyCard> {
	public static final SeventyCard dao = new SeventyCard();

	public SeventyCard getOrderId(String orderid) {
		String sql = "select * from `seventycard` where id = ? ";
		return findFirst(sql, orderid);
	}
}
