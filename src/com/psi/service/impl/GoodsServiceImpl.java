package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.GoodsDao;
import com.psi.entity.Goods;
import com.psi.service.GoodsService;

/**
 * ��ƷServiceʵ����
 * @author ���
 *
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public Goods getById(String id) {
		return goodsDao.getById(id);
	}

	@Override
	public int insert(Goods t) {
		return goodsDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return goodsDao.delete(id);
	}

	@Override
	public int modify(Goods t) {
		return goodsDao.modify(t);
	}

	@Override
	public List<Goods> queryList(Map<String, Object> map) {
		return goodsDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return goodsDao.getTotal(map);
	}

}
