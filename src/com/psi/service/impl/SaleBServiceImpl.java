package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.SaleBDao;
import com.psi.entity.SaleB;
import com.psi.service.SaleBService;

/**
 * 销售单商品Service实现类
 * @author 曾宇康
 *
 */
@Service("saleBService")
public class SaleBServiceImpl implements SaleBService {
	@Autowired
	private SaleBDao saleBDao;
	
	@Override
	public SaleB getById(String id) {
		return saleBDao.getById(id);
	}

	@Override
	public int insert(SaleB t) {
		return saleBDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return saleBDao.delete(id);
	}

	@Override
	public int modify(SaleB t) {
		return saleBDao.modify(t);
	}

	@Override
	public List<SaleB> queryList(Map<String, Object> map) {
		return saleBDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return saleBDao.getTotal(map);
	}


}
