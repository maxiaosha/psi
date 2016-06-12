package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.ReturnSaleBDao;
import com.psi.entity.ReturnSaleB;
import com.psi.service.ReturnSaleBService;

/**
 * 退货单商品Service实现类
 * @author 曾宇康
 *
 */
@Service("returnSaleBService")
public class ReturnSaleBServiceImpl implements ReturnSaleBService {
	@Autowired
	private ReturnSaleBDao returnSaleBDao;
	
	@Override
	public ReturnSaleB getById(String id) {
		return returnSaleBDao.getById(id);
	}

	@Override
	public int insert(ReturnSaleB t) {
		return returnSaleBDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return returnSaleBDao.delete(id);
	}

	@Override
	public int modify(ReturnSaleB t) {
		return returnSaleBDao.modify(t);
	}

	@Override
	public List<ReturnSaleB> queryList(Map<String, Object> map) {
		return returnSaleBDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return returnSaleBDao.getTotal(map);
	}

}
