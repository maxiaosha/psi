package com.psi.service;

import com.psi.entity.Sale;

/**
 * ���۵�Service��
 * @author ���
 *
 */
public interface SaleService extends BaseService<Sale> {

	/**
	 * �������۵�
	 * @param remark
	 * @param goodsStockSns
	 * @param nums
	 * @throws Exception 
	 */
	void insertSale(String remark, String[] goodsStockIds, String[] nums) throws Exception;
	

	/**
	 * �������۵����ȡ�����۵�
	 * @param sn
	 * @return
	 */
	Sale getBySn(String sn);
}
