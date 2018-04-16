/**
 * 
 */
package com.pay.gopay.client.dao;

import com.jfinal.plugin.activerecord.Db;

/**
 * @author Administrator
 * 
 */
public class GopayDao {

	public String getGopayParticipate(String pd_FrpId) {
		StringBuffer sql = new StringBuffer();
		sql.append("select p.gopay_participate from participate p where p.participate = '"
				+ pd_FrpId + "'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
