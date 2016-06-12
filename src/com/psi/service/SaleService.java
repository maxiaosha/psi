package com.psi.service;

import com.psi.entity.Sale;

/**
 * 销售单Service层
 * @author 曾宇康
 *
 */
public interface SaleService extends BaseService<Sale> {

	/**
	 * 新增销售单
	 * @param remark
	 * @param goodsStockSns
	 * @param nums
	 * @throws Exception 
	 */
	void insertSale(String remark, String[] goodsStockIds, String[] nums) throws Exception;
	

	/**
	 * 根据销售单编号取得销售单
	 * @param sn
	 * @return
	 */
	Sale getBySn(String sn);
}
