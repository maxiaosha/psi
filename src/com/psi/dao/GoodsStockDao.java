package com.psi.dao;

import com.psi.entity.GoodsStock;

/**
 * ��Ʒ��� Dao��
 * @author ���
 *
 */
public interface GoodsStockDao extends BaseDao<GoodsStock> {

	/**
	 * ���ݿ���Ų�����Ʒ���
	 * @param sn
	 * @return
	 */
	GoodsStock getBySn(String sn);
}
