/**
 * 
 */
package com.pay.jdpay.client.dao;

import com.jfinal.plugin.activerecord.Db;

/**
 * @author Administrator
 * 
 */
public class JdpayDao {

	public String getJdpayParticipate(String pd_FrpId) {
		StringBuffer sql = new StringBuffer();
		sql.append("select p.jdpay_participate from participate p where p.participate = '"
				+ pd_FrpId + "'");
		String bankId = Db.queryStr(sql.toString());
		return bankId;
	}
}
