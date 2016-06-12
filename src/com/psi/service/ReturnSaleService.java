package com.psi.service;

import com.psi.entity.ReturnSale;

/**
 * 退货单Service层
 * @author 曾宇康
 *
 */
public interface ReturnSaleService extends BaseService<ReturnSale> {
	/**
	 * 新增退货单
	 * @param remark
	 * @param saleBIds
	 * @param nums
	 * @throws Exception 
	 */
	void insertReturnSale(String remark, String[] saleBIds, String[] nums) throws Exception;
}
