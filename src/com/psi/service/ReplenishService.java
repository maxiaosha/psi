package com.psi.service;

import com.psi.entity.Replenish;

/**
 * ������Service��
 * @author ���
 *
 */
public interface ReplenishService extends BaseService<Replenish> {

	/**
	 * ��Ӳɹ���
	 * @param remark
	 * @param goodsId
	 * @param nums
	 * @return
	 * @throws Exception 
	 */
	void insertReplenish(String remark, String[] goodsIds,String[] productionDates, String[] nums) throws Exception;
}
