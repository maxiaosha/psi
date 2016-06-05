package com.psi.service;

import java.util.List;
import java.util.Map;

/**
 * 基本Service
 * @author 曾宇康
 *
 * @param <T>
 */
public interface BaseService<T> {
	/**
	 * 根据id取得记录
	 * @param id
	 * @return
	 */
	T getById(String id);
	
	/**
	 * 插入一条记录
	 * @param t
	 * @return
	 */
	int insert(T t);
	
	/**
	 * 根据id删除记录
	 * @param id
	 * @return
	 */
	int delete(String id);
	
	/**
	 * 修改记录
	 * @param t
	 * @return
	 */
	int modify(T t);
	
	/**
	 * 分页查找记录
	 * @param map
	 * @return
	 */
	List<T> queryList(Map<String, Object> map);
	
	/**
	 * 根据条件取得记录总数
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);
}
