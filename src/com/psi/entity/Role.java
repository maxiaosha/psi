package com.psi.entity;

import java.io.Serializable;

public class Role implements Serializable {


	private static final long serialVersionUID = 1L;
	
	/**
	 * ��ɫʵ����
	 * @author �����
	 * 
	 */
	
	private String id;
	private String name;
	private String permission;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	

}
