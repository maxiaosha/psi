package com.psi.dao;

import java.util.List;

import com.psi.entity.Menu;

/**
 * �˵� Dao��
 * @author ���
 *
 */
public interface MenuDao extends BaseDao<Menu> {
	
	/**
	 * ���ݸ�ID���Ҳ˵���¼
	 * @param parentId
	 * @return
	 */
	List<Menu> selectMenuByParentId(String parentId);
	
	
}
