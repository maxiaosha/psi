package com.psi.dao;

import com.psi.entity.Sale;

/**
 * ���۵�Dao��
 * @author ���
 *
 */
public interface SaleDao extends BaseDao<Sale> {

	/**
	 * �������۵����ȡ�����۵�
	 * @param sn
	 * @return
	 */
	Sale getBySn(String sn);
}
