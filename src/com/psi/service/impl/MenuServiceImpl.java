package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.MenuDao;
import com.psi.entity.Menu;
import com.psi.service.MenuService;

/**
 * 菜单Service实现类
 * @author 曾宇康
 *
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;
	
	@Override
	public Menu getById(String id) {
		return menuDao.getById(id);
	}

	@Override
	public int insert(Menu t) {
		return menuDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return menuDao.delete(id);
	}

	@Override
	public int modify(Menu t) {
		return menuDao.modify(t);
	}

	@Override
	public List<Menu> queryList(Map<String, Object> map) {
		return menuDao.queryList(map);
	}
	
	@Override
	public Long getTotal(Map<String, Object> map) {
		return menuDao.getTotal(map);
	}

	@Override
	public List<Menu> selectMenuByParentId(String parentId) {
		return menuDao.selectMenuByParentId(parentId);
	}

	
}
