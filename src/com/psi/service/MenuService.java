package com.psi.service;

import java.util.List;

import com.psi.entity.Menu;

/**
 * �˵� Service��
 * @author ���
 *
 */
public interface MenuService extends BaseService<Menu> {

	
	/**
	 * ���ݸ�ID���Ҳ˵���¼
	 * @param parentId
	 * @return
	 */
	List<Menu> selectMenuByParentId(String parentId);
	
}
