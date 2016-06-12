package com.psi.dao;

import com.psi.entity.GoodsStock;

/**
 * 商品库存 Dao层
 * @author 曾宇康
 *
 */
public interface GoodsStockDao extends BaseDao<GoodsStock> {

	/**
	 * 根据库存编号查找商品库存
	 * @param sn
	 * @return
	 */
	GoodsStock getBySn(String sn);
}
