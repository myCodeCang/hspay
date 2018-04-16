/** 
 * Project Name:hspay 
 * File Name:SeventyCode.java 
 * Package Name:com.vo 
 * Date:2017年3月21日上午9:42:53 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.vo;

import com.jfinal.plugin.activerecord.Model;

/**
 * @author Administrator
 * 
 */
public class SeventyCode extends Model<SeventyCode> {
	public static final SeventyCode dao = new SeventyCode();
	
	public SeventyCode getParticipate(String participate){
		String sql="select * from `seventycode` where participate = ? limit 1";
		return findFirst(sql,participate);
	}
}
