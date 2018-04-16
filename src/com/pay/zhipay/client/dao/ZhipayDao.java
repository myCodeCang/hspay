/**
 * 
 */
package com.pay.zhipay.client.dao;

import com.jfinal.plugin.activerecord.Db;

/**
 * @author 春春
 *
 */
public class ZhipayDao {

	public String getZhipayParticipate(String pd_FrpId){
		StringBuffer sql = new StringBuffer();
		sql.append("select p.zhipay_participate from participate p where p.participate = '"+pd_FrpId+"'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
