package com.psi.dao;

import com.psi.entity.Sale;

/**
 * 销售单Dao层
 * @author 曾宇康
 *
 */
public interface SaleDao extends BaseDao<Sale> {

	/**
	 * 根据销售单编号取得销售单
	 * @param sn
	 * @return
	 */
	Sale getBySn(String sn);
}
