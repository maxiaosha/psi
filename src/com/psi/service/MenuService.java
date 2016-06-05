package com.psi.service;

import java.util.List;

import com.psi.entity.Menu;

/**
 * 菜单 Service层
 * @author 曾宇康
 *
 */
public interface MenuService extends BaseService<Menu> {

	
	/**
	 * 根据父ID查找菜单记录
	 * @param parentId
	 * @return
	 */
	List<Menu> selectMenuByParentId(String parentId);
	
}
