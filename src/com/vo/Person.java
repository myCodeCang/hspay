package com.vo;

import com.jfinal.plugin.activerecord.Model;

public class Person extends Model<Person> {
	public static final Person dao = new Person();
	
	private int id;
	private String email;
	private String password;
	private String webName;
	private String website;
	private int herolist;
	private int huge;
	private String name;
	private String contacts;
	private String idcard;
	private String address;
	private String phone;
	private String qq;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWebName() {
		return webName;
	}
	public void setWebName(String webName) {
		this.webName = webName;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getHerolist() {
		return herolist;
	}
	public void setHerolist(int herolist) {
		this.herolist = herolist;
	}
	public int getHuge() {
		return huge;
	}
	public void setHuge(int huge) {
		this.huge = huge;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	
}