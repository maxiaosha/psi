package com.psi.entity;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * �û�ʵ����
	 * @author �����
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						//ID
	private String account;					//�û��˺�
	private String password;				//�û�����
	private String name;					//�û�����
	private String idCard;					//�û����֤���
	private String sex;						//�û��Ա�
	private String age;						//�û��Ա�
	private String phone;					//�û��ֻ���
	private String email;					//�û�����
	private String address;					//�û���ַ
	private Role role;					//�û���ɫID
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
