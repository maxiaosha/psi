package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.UserDao;
import com.psi.entity.User;
import com.psi.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;

	@Override
	public User getById(String id) {
		return userDao.getById(id);
	}

	@Override
	public int insert(User t) {
		return userDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return userDao.delete(id);
	}

	@Override
	public int modify(User t) {
		return userDao.modify(t);
	}

	@Override
	public List<User> queryList(Map<String, Object> map) {
		return userDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}

}
