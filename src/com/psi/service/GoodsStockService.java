package com.psi.service;

import com.psi.entity.GoodsStock;

/**
 * ��Ʒ��� Service��
 * @author ���
 *
 */
public interface GoodsStockService extends BaseService<GoodsStock> {
	/**
	 * ���ݿ���Ų�����Ʒ���
	 * @param sn
	 * @return
	 */
	GoodsStock getBySn(String sn);
}
