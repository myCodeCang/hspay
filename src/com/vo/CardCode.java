package com.vo;

import com.jfinal.plugin.activerecord.Model;

public class CardCode extends Model<CardCode> {
	public static final CardCode dao = new CardCode();
	
	public CardCode getCardSeventy(String seventy){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from cardcode c where c.seventy_participate = '"+seventy+"'");
		return findFirst(sql.toString());
	}
	public CardCode getParticipate(String participate){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from cardcode c where c.participate = '"+participate+"'");
		return findFirst(sql.toString());
	}
}
