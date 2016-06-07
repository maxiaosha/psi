package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.ReplenishBDao;
import com.psi.entity.Replenish;
import com.psi.entity.ReplenishB;
import com.psi.service.ReplenishBService;

/**
 * 进货表体Service实现类
 * @author 曾宇康
 *
 */
@Service("replenishBService")
public class ReplenishBServiceImpl implements ReplenishBService {
	@Autowired
	private ReplenishBDao replenishBDao;

	@Override
	public ReplenishB getById(String id) {
		return replenishBDao.getById(id);
	}

	@Override
	public int insert(ReplenishB t) {
		return replenishBDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return replenishBDao.delete(id);
	}

	@Override
	public int modify(ReplenishB t) {
		return replenishBDao.modify(t);
	}

	@Override
	public List<ReplenishB> queryList(Map<String, Object> map) {
		return replenishBDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return replenishBDao.getTotal(map);
	}
	
	

}
