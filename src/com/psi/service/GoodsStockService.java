package com.psi.service;

import com.psi.entity.GoodsStock;

/**
 * 商品库存 Service层
 * @author 曾宇康
 *
 */
public interface GoodsStockService extends BaseService<GoodsStock> {
	/**
	 * 根据库存编号查找商品库存
	 * @param sn
	 * @return
	 */
	GoodsStock getBySn(String sn);
}
