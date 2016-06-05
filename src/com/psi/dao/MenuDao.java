package com.psi.dao;

import java.util.List;

import com.psi.entity.Menu;

/**
 * 菜单 Dao层
 * @author 曾宇康
 *
 */
public interface MenuDao extends BaseDao<Menu> {
	
	/**
	 * 根据父ID查找菜单记录
	 * @param parentId
	 * @return
	 */
	List<Menu> selectMenuByParentId(String parentId);
	
	
}
