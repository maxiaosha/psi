package com.psi.service;

import com.psi.entity.ReturnSale;

/**
 * �˻���Service��
 * @author ���
 *
 */
public interface ReturnSaleService extends BaseService<ReturnSale> {
	/**
	 * �����˻���
	 * @param remark
	 * @param saleBIds
	 * @param nums
	 * @throws Exception 
	 */
	void insertReturnSale(String remark, String[] saleBIds, String[] nums) throws Exception;
}
