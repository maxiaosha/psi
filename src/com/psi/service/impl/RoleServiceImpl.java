package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.RoleDao;
import com.psi.entity.Role;
import com.psi.service.RoleService;

@Service("RoleService")
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleDao roleDao;

	@Override
	public Role getById(String id) {
		return roleDao.getById(id);
	}

	@Override
	public int insert(Role t) {
		return roleDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return roleDao.delete(id);
	}

	@Override
	public int modify(Role t) {
		return roleDao.modify(t);
	}

	@Override
	public List<Role> queryList(Map<String, Object> map) {
		return roleDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return roleDao.getTotal(map);
	}

}
