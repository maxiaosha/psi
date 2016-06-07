package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.ReplenishDao;
import com.psi.entity.Replenish;
import com.psi.service.ReplenishService;

/**
 * 进货表Service实现类
 * @author Administrator
 *
 */
@Service("replenishService")
public class ReplenishServiceImpl implements ReplenishService {
	@Autowired
	private ReplenishDao replenishDao;
	
	@Override
	public Replenish getById(String id) {
		return replenishDao.getById(id);
	}

	@Override
	public int insert(Replenish t) {
		return replenishDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return replenishDao.delete(id);
	}

	@Override
	public int modify(Replenish t) {
		return replenishDao.modify(t);
	}

	@Override
	public List<Replenish> queryList(Map<String, Object> map) {
		return replenishDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return replenishDao.getTotal(map);
	}

}
