package com.jsp.login.dao;

import java.util.List;

import com.vo.Person;

public class LoginDao {
	public Person login(String email, String password){
		String sql="select p.address, p.contacts, p.email, p.herolist, p.huge, p.id, p.idcard, p.name,"
				+ " p.phone, p.qq, p.webName, p.website,p.iflogin,p.iflock,p.ifnet from person p where p.email = '"+email+"' and p.password = '"+password+"'";
		return Person.dao.findFirst(sql);
	}
	
	public Person getPerson(String email){
		List<Person> persons = Person.dao.find("select p.address, p.contacts, p.email, p.herolist, p.huge, p.id, p.idcard, p.name, p.phone, p.qq, p.webName, p.website from person p where p.email = '"+email+"'");
		return persons.get(0);
	}
	
	public boolean Logrecord(com.vo.Logrecord log){
		boolean boo = log.save();
		return boo;
	}
}
