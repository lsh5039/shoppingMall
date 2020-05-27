package com.lsh.Shop.product;

public class CartVO {
	private int pk;
	private String name;
	private int grade;
	private int haveMoney;
	private int cart_pk;
	private int user_pk;
	private int p_num;
	private String p_name;
	private String image;
	
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getHaveMoney() {
		return haveMoney;
	}
	public void setHaveMoney(int haveMoney) {
		this.haveMoney = haveMoney;
	}
	public int getCart_pk() {
		return cart_pk;
	}
	public void setCart_pk(int cart_pk) {
		this.cart_pk = cart_pk;
	}
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	
	
	
}
