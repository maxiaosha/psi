package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.GoodsDao;
import com.psi.dao.GoodsStockDao;
import com.psi.dao.SaleBDao;
import com.psi.dao.SaleDao;
import com.psi.entity.Goods;
import com.psi.entity.GoodsStock;
import com.psi.entity.Sale;
import com.psi.entity.SaleB;
import com.psi.entity.Sale;
import com.psi.service.SaleService;
import com.psi.utils.DateTimeUtil;
import com.psi.utils.SerialNumberUtil;
import com.psi.utils.SnUtil;

/**
 * 销售单Service实现类
 * @author 曾宇康
 *
 */
@Service("saleService")
public class SaleServiceImpl implements SaleService {
	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleBDao saleBDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private GoodsStockDao goodsStockDao;
	
	
	@Override
	public Sale getById(String id) {
		return saleDao.getById(id);
	}

	@Override
	public int insert(Sale t) {
		return saleDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return saleDao.delete(id);
	}

	@Override
	public int modify(Sale t) {
		return saleDao.modify(t);
	}

	@Override
	public List<Sale> queryList(Map<String, Object> map) {
		return saleDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return saleDao.getTotal(map);
	}

	@Override
	public void insertSale(String remark, String[] goodsStockIds, String[] nums) throws Exception {
		 
		Sale sale = new Sale();
		sale.setId(SerialNumberUtil.getSerialNumber());
		sale.setSn(SnUtil.createSn("SA"));
		sale.setCreateTime(DateTimeUtil.getCurrentTime());
		sale.setRemark(remark);
		Double totalMoney = new Double(0);
		
		for (int i=0; i<goodsStockIds.length; i++) {
			GoodsStock goodsStock = goodsStockDao.getById(goodsStockIds[i]);
			Goods goods = goodsStock.getGoods();
			
			SaleB saleB = new SaleB();
			saleB.setId(SerialNumberUtil.getSerialNumber());
			saleB.setSale(sale);
			saleB.setGoodsStock(goodsStock);
			saleB.setNum(nums[i]);
			saleB.setReturnNum("0");
			
			Double numDou = Double.parseDouble(nums[i]);
			saleB.setGoodsMoney(numDou * goods.getSalePrice());
			totalMoney += saleB.getGoodsMoney();
			
			int num;
			num = Integer.parseInt(goods.getStock()) - Integer.parseInt(nums[i]);
			goods.setStock(num + "");
			
			num = Integer.parseInt(goodsStock.getNum()) - Integer.parseInt(nums[i]);
			goodsStock.setNum(num + "");

			try {
				if (saleBDao.insert(saleB) < 0) {
					throw new Exception("添加至第"+ i +"条销售商品记录发生错误！请重新操作！");
				}
				
				if (goodsStockDao.modify(goodsStock) < 0) {
					throw new Exception("添加至第"+ i +"条销售商品记录发生错误！请重新操作！");
				}
				
				if (goodsDao.modify(goods) < 0) {
					throw new Exception("添加至第"+ i +"条销售商品记录发生错误！请重新操作！");
				}				
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("添加至第"+ i +"条销售商品记录发生错误！请重新操作！");
			}
						
		}
		
		sale.setTotalMoney(totalMoney);
		
		try {
			if (saleDao.insert(sale) < 0) {
				throw new Exception("添加销售单记录失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("添加销售单记录失败！");
		}
	}

	@Override
	public Sale getBySn(String sn) {
		return saleDao.getBySn(sn);
	}

}
