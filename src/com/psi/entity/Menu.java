package com.psi.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 菜单实体类
 * @author 曾宇康
 *
 */
public class Menu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;				// 菜单ID
	private String level;			// 菜单层数
	private Menu parentMenu;		// 父ID
	private String name;			// 菜单名称
	private String url;				// 菜单URL
	private String orderFlag;		// 排序优先级
	private String icon;			// 菜单图标-class
	private Role role;	// 权限
	
	private String parentName;		// 父级菜单名称-非数据库实际属性
	private List<Menu> childList;	// 子级菜单List-非数据库实际属性
	private String key;				// 关键字-菜单辨别是否在当前页面
	
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
