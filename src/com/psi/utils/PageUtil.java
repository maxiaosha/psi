package com.psi.utils;

/**
 * ��ҳ������
 * @author ���
 *
 */
public class PageUtil {
	public static int pageSize = 10;			// ��ʾ����
	
	public static int toStart(String page) {	// ҳ��-mysql���ݿ��ѯstart
		return (Integer.parseInt(page==null ? "0" : page));
	}
	
	public static int toSize(String size) {
		return Integer.parseInt(size);
	}
	
	public static int toPage(String page) {		// ʵ��ҳ��
		return Integer.parseInt(page==null ? "1" : page);
	}
	
	public static int toPageCount(int total) {	// ��ҳ��
		if (total % pageSize == 0) {
			return total / pageSize;
		} else {
			return total / pageSize + 1;
		}
	}
}
