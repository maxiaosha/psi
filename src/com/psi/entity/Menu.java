package com.psi.entity;

import java.io.Serializable;
import java.util.List;

/**
 * �˵�ʵ����
 * @author ���
 *
 */
public class Menu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;				// �˵�ID
	private String level;			// �˵�����
	private Menu parentMenu;		// ��ID
	private String name;			// �˵�����
	private String url;				// �˵�URL
	private String orderFlag;		// �������ȼ�
	private String icon;			// �˵�ͼ��-class
	private Role role;	// Ȩ��
	
	private String parentName;		// �����˵�����-�����ݿ�ʵ������
	private List<Menu> childList;	// �Ӽ��˵�List-�����ݿ�ʵ������
	private String key;				// �ؼ���-�˵�����Ƿ��ڵ�ǰҳ��
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	public Menu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOrderFlag() {
		return orderFlag;
	}
	public void setOrderFlag(String orderFlag) {
		this.orderFlag = orderFlag;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public List<Menu> getChildList() {
		return childList;
	}
	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}
	
	public String getKey() {
		String str[] = url.split("/");
		key = str[str.length - 1];
		return key;
	}

}
