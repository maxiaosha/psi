package com.psi.utils;

/**
 * 分页工具类
 * @author 曾宇康
 *
 */
public class PageUtil {
	public static int pageSize = 10;			// 显示条数
	
	public static int toStart(String page) {	// 页码-mysql数据库查询start
		return (Integer.parseInt(page==null ? "0" : page));
	}
	
	public static int toSize(String size) {
		return Integer.parseInt(size);
	}
	
	public static int toPage(String page) {		// 实际页码
		return Integer.parseInt(page==null ? "1" : page);
	}
	
	public static int toPageCount(int total) {	// 总页数
		if (total % pageSize == 0) {
			return total / pageSize;
		} else {
			return total / pageSize + 1;
		}
	}
}
