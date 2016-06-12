package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.GoodsDao;
import com.psi.dao.GoodsStockDao;
import com.psi.dao.ReplenishBDao;
import com.psi.dao.ReplenishDao;
import com.psi.entity.Goods;
import com.psi.entity.GoodsStock;
import com.psi.entity.Replenish;
import com.psi.entity.ReplenishB;
import com.psi.service.ReplenishService;
import com.psi.utils.DateTimeUtil;
import com.psi.utils.SerialNumberUtil;
import com.psi.utils.SnUtil;

/**
 * 进货表Service实现类
 * @author Administrator
 *
 */
@Service("replenishService")
public class ReplenishServiceImpl implements ReplenishService {
	@Autowired
	private ReplenishDao replenishDao;
	@Autowired
	private ReplenishBDao replenishBDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private GoodsStockDao goodsStockDao;
	
	@Override
	public Replenish getById(String id) {
		return replenishDao.getById(id);
	}

	@Override
	public int insert(Replenish t) {
		return replenishDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return replenishDao.delete(id);
	}

	@Override
	public int modify(Replenish t) {
		return replenishDao.modify(t);
	}

	@Override
	public List<Replenish> queryList(Map<String, Object> map) {
		return replenishDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return replenishDao.getTotal(map);
	}

	@Override
	public void insertReplenish(String remark, String[] goodsIds, String[] productionDates, String[] nums) throws Exception {
		
		Replenish replenish = new Replenish();
		replenish.setId(SerialNumberUtil.getSerialNumber());
		replenish.setSn(SnUtil.createSn("RE"));
		replenish.setCreateTime(DateTimeUtil.getCurrentTime());
		replenish.setRemark(remark);
		Double totalMoney = new Double(0);
		
		for (int i=0; i<goodsIds.length; i++) {
			Goods goods = goodsDao.getById(goodsIds[i]);
			
			ReplenishB replenishB = new ReplenishB();
			replenishB.setId(SerialNumberUtil.getSerialNumber());
			replenishB.setReplenish(replenish);
			replenishB.setGoods(goods);
			replenishB.setSupplier(goods.getSupplier());
			replenishB.setProductionDate(productionDates[i]);
			replenishB.setNum(nums[i]);
			
			Double numDou = Double.parseDouble(nums[i]);
			replenishB.setGoodsMoney(numDou * goods.getPurchasePrice());
			totalMoney += replenishB.getGoodsMoney();
			
			GoodsStock goodsStock = new GoodsStock();
			goodsStock.setId(SerialNumberUtil.getSerialNumber());
			goodsStock.setSn(SnUtil.createSn("GS"));
			goodsStock.setGoods(goods);
			goodsStock.setReplenishB(replenishB);
			goodsStock.setNum(nums[i]);
			goodsStock.setProductionDate(productionDates[i]);
			
			int num;
			if (goods.getStock() != null) {
				num = Integer.parseInt(goods.getStock()) + Integer.parseInt(nums[i]);
				goods.setStock(num + "");
			} else {
				num = Integer.parseInt(nums[i]);
				goods.setStock(num + "");				
			}
			try {
				if (replenishBDao.insert(replenishB) < 0) {
					throw new Exception("添加至第"+ i +"条进货商品记录发生错误！请重新操作！");
				}
				
				if (goodsStockDao.insert(goodsStock) < 0) {
					throw new Exception("添加至第"+ i +"条进货商品记录发生错误！请重新操作！");
				}
				
				if (goodsDao.modify(goods) < 0) {
					throw new Exception("添加至第"+ i +"条进货商品记录发生错误！请重新操作！");
				}				
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("添加至第"+ i +"条进货商品记录发生错误！请重新操作！");
			}
						
		}
		
		replenish.setTotalMoney(totalMoney);
		
		try {
			if (replenishDao.insert(replenish) < 0) {
				throw new Exception("添加采购单记录失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("添加采购单记录失败！");
		}
	}

}
