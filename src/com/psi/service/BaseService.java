package com.psi.service;

import java.util.List;
import java.util.Map;

/**
 * ����Service
 * @author ���
 *
 * @param <T>
 */
public interface BaseService<T> {
	/**
	 * ����idȡ�ü�¼
	 * @param id
	 * @return
	 */
	T getById(String id);
	
	/**
	 * ����һ����¼
	 * @param t
	 * @return
	 */
	int insert(T t);
	
	/**
	 * ����idɾ����¼
	 * @param id
	 * @return
	 */
	int delete(String id);
	
	/**
	 * �޸ļ�¼
	 * @param t
	 * @return
	 */
	int modify(T t);
	
	/**
	 * ��ҳ���Ҽ�¼
	 * @param map
	 * @return
	 */
	List<T> queryList(Map<String, Object> map);
	
	/**
	 * ��������ȡ�ü�¼����
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);
}
