package com.admin.login.dao;

import java.util.List;

import com.vo.Employees;

public class AdLoginDao {
	public boolean login(String account, String password){
		boolean boo = false;
		List<Employees> employees = Employees.dao.find("select p.account from employee p where p.account = '"+account+"' and p.password = '"+password+"' and p.iflock=1");
		if(employees.size()>0){
			boo = true;
		}
		return boo;
	}
	public Employees getEmployees(String account){
		List<Employees> employees = Employees.dao.find("select e.employeeid, e.powerid, e.phone, e.address, e.creationtime, e.email, e.account, e.iflock, e.name from employee e where e.account='"+account+"'");
		return employees.get(0);
	}
}
