package com.psi.service;

import com.psi.entity.Replenish;

/**
 * 进货表Service层
 * @author 曾宇康
 *
 */
public interface ReplenishService extends BaseService<Replenish> {

	/**
	 * 添加采购单
	 * @param remark
	 * @param goodsId
	 * @param nums
	 * @return
	 * @throws Exception 
	 */
	void insertReplenish(String remark, String[] goodsIds,String[] productionDates, String[] nums) throws Exception;
}
