package com.psi.entity;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 用户实体类
	 * @author 陈培斌
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						//ID
	private String account;					//用户账号
	private String password;				//用户密码
	private String name;					//用户姓名
	private String idCard;					//用户身份证编号
	private String sex;						//用户性别
	private String age;						//用户性别
	private String phone;					//用户手机号
	private String email;					//用户邮箱
	private String address;					//用户地址
	private Role role;					//用户角色ID
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
}
