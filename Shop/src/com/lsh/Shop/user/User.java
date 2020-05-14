package com.lsh.Shop.user;

public class User {
	private String id;
	private String password;
	private String name;
	private String address;
	private String number;
	private int grade;
	private int have_money;
	private int spend_money;
	private int pk;
	
	
	
	
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getHave_money() {
		return have_money;
	}
	public void setHave_money(int have_money) {
		this.have_money = have_money;
	}
	public int getSpend_money() {
		return spend_money;
	}
	public void setSpend_money(int spend_money) {
		this.spend_money = spend_money;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
}

