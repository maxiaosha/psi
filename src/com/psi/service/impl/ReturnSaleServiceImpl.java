package com.psi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psi.dao.GoodsDao;
import com.psi.dao.GoodsStockDao;
import com.psi.dao.ReturnSaleBDao;
import com.psi.dao.ReturnSaleDao;
import com.psi.dao.SaleBDao;
import com.psi.dao.SaleDao;
import com.psi.entity.Goods;
import com.psi.entity.GoodsStock;
import com.psi.entity.ReturnSale;
import com.psi.entity.ReturnSaleB;
import com.psi.entity.Sale;
import com.psi.entity.SaleB;
import com.psi.service.ReturnSaleService;
import com.psi.utils.DateTimeUtil;
import com.psi.utils.SerialNumberUtil;
import com.psi.utils.SnUtil;

/**
 * 退货单Service实现类
 * @author 曾宇康
 *
 */
@Service("returnSaleService")
public class ReturnSaleServiceImpl implements ReturnSaleService {
	@Autowired
	private ReturnSaleDao returnSaleDao;
	@Autowired
	private ReturnSaleBDao returnSaleBDao;
	@Autowired
	private SaleBDao saleBDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private GoodsStockDao goodsStockDao;
	
	@Override
	public ReturnSale getById(String id) {
		return returnSaleDao.getById(id);
	}

	@Override
	public int insert(ReturnSale t) {
		return returnSaleDao.insert(t);
	}

	@Override
	public int delete(String id) {
		return returnSaleDao.delete(id);
	}

	@Override
	public int modify(ReturnSale t) {
		return returnSaleDao.modify(t);
	}

	@Override
	public List<ReturnSale> queryList(Map<String, Object> map) {
		return returnSaleDao.queryList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return returnSaleDao.getTotal(map);
	}

	@Override
	public void insertReturnSale(String remark, String[] saleBIds, String[] nums) throws Exception {
		 
		ReturnSale returnSale = new ReturnSale();
		returnSale.setId(SerialNumberUtil.getSerialNumber());
		returnSale.setSn(SnUtil.createSn("SA"));
		returnSale.setCreateTime(DateTimeUtil.getCurrentTime());
		returnSale.setRemark(remark);
		Double totalMoney = new Double(0);
		
		for (int i=0; i<saleBIds.length; i++) {
			SaleB saleB = saleBDao.getById(saleBIds[i]);
			GoodsStock goodsStock = saleB.getGoodsStock();
			Goods goods = goodsStock.getGoods();
			
			ReturnSaleB returnSaleB = new ReturnSaleB();
			returnSaleB.setId(SerialNumberUtil.getSerialNumber());
			returnSaleB.setReturnSaleId(returnSale.getId());
			returnSaleB.setSaleB(saleB);
			returnSaleB.setNum(nums[i]);

			
			Double numDou = Double.parseDouble(nums[i]);
			returnSaleB.setGoodsMoney(numDou * goods.getPurchasePrice());
			totalMoney += returnSaleB.getGoodsMoney();
			
			int num;
			num = Integer.parseInt(goods.getStock()) + Integer.parseInt(nums[i]);
			goods.setStock(num + "");
			
			num = Integer.parseInt(goodsStock.getNum()) + Integer.parseInt(nums[i]);
			goodsStock.setNum(num + "");
			
			int returnNum;
			if (saleB.getReturnNum() != null) {
				returnNum = Integer.parseInt(saleB.getReturnNum()) + Integer.parseInt(nums[i]);
				saleB.setReturnNum(returnNum + "");
			} else {
				returnNum = 0 + Integer.parseInt(nums[i]);
				saleB.setReturnNum(returnNum + "");
			}

			try {
				if (returnSaleBDao.insert(returnSaleB) < 0) {
					throw new Exception("添加至第"+ i +"条退货商品记录发生错误！请重新操作！");
				}
				if (saleBDao.modify(saleB) < 0) {
					throw new Exception("添加至第"+ i +"条退货商品记录发生错误！请重新操作！");
				}
				
				if (goodsStockDao.modify(goodsStock) < 0) {
					throw new Exception("添加至第"+ i +"条退货商品记录发生错误！请重新操作！");
				}
				
				if (goodsDao.modify(goods) < 0) {
					throw new Exception("添加至第"+ i +"条退货商品记录发生错误！请重新操作！");
				}				
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("添加至第"+ i +"条退货商品记录发生错误！请重新操作！");
			}
						
		}
		
		returnSale.setTotalMoney(totalMoney);
		
		try {
			if (returnSaleDao.insert(returnSale) < 0) {
				throw new Exception("添加退货单记录失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("添加退货单记录失败！");
		}	
	}

}
