package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.GoodsStockDao;
import com.psi.entity.GoodsStock;
import com.psi.service.GoodsStockService;

/**
 * 商品库存Service实现类
 * @author 曾宇康
 *
 */
@Service("goodsStockService")
public class GoodsStockServiceImpl implements GoodsStockService {
	@Autowired
	private GoodsStockDao goodsStockDao;
	
	@Override
	public GoodsStock getById(String id) {
		return goodsStockDao.getById(id);
	}

	@Override
	public int insert(GoodsStock t) {
		return goodsStockDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return goodsStockDao.delete(id);
	}

	@Override
	public int modify(GoodsStock t) {
		return goodsStockDao.modify(t);
	}

	@Override
	public List<GoodsStock> queryList(Map<String, Object> map) {
		return goodsStockDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return goodsStockDao.getTotal(map);
	}

	@Override
	public GoodsStock getBySn(String sn) {
		return goodsStockDao.getBySn(sn);
	}

}
