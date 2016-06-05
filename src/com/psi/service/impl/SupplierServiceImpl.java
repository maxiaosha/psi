package com.psi.service.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.SupplierDao;
import com.psi.entity.Supplier;
import com.psi.service.SupplierService;

/**
 * 供应商service实现类
 * @author 陈培斌
 *
 */
@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	private SupplierDao supplierDao;

	@Override
	public Supplier getById(String id) {
		return supplierDao.getById(id);
	}

	@Override
	public int insert(Supplier t) {
		return supplierDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return supplierDao.delete(id);
	}

	@Override
	public int modify(Supplier t) {
		return supplierDao.modify(t);
	}

	@Override
	public List<Supplier> queryList(Map<String, Object> map) {
		return supplierDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return supplierDao.getTotal(map);
	}

}
