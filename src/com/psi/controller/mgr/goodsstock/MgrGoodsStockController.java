package com.psi.controller.mgr.goodsstock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psi.entity.Goods;
import com.psi.entity.GoodsStock;
import com.psi.entity.ReplenishB;
import com.psi.entity.Supplier;
import com.psi.service.GoodsService;
import com.psi.service.GoodsStockService;
import com.psi.service.SupplierService;
import com.psi.utils.PageUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 商品库存管理Controller类
 * @author 曾宇康
 *
 */
@Controller
@RequestMapping("/mgr/goods/goodsstock")
public class MgrGoodsStockController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsStockService goodsStockService;
	@Autowired
	private SupplierService supplierService;
	
	
	/**
	 * 商品库存管理页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageGoodsStock")
	public ModelAndView manageGoods() throws Exception {
		List<Supplier> supplierList = supplierService.queryList(null);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "商品库存管理");
		mav.addObject("mainPage", "/WEB-INF/mgr/goods/goodsstock/manageGoodsStock.jsp");
		//mav.addObject("baseUrl", "/mgr/goodsstock/manageGoodsStock");
		mav.addObject("supplierList", supplierList);
		
		
		return mav;
	}
	
	/**
	 * 分页查找商品记录
	 * @param limit
	 * @param offset
	 * @param searchGoodsSn
	 * @param searchGoodsName
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, String searchGoodsSn,
			String searchGoodsName,  HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("sn", searchGoodsSn);
		map.put("name", searchGoodsName);
		
		List<Goods> goodsList = goodsService.queryList(map);
		Long total = goodsService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Goods goods : goodsList) {
			jsonArray.add(goods);
		}
		result.put("rows", jsonArray);

		result.put("total", total);
		
		return result.toString();
	}
	
	/**
	 * 根据得到商品库存列表
	 * @param replenishId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/stockList",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String stockList(String goodsId) throws Exception {
		if (goodsId == null) {
			return null;
		}
		if (goodsId.trim().equals("")) {
			return null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goodsId", goodsId);

		List<GoodsStock> goodsStockList = goodsStockService.queryList(map);
		Long total = goodsStockService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (GoodsStock goodsStock : goodsStockList) {
			jsonArray.add(goodsStock);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
		
	}
	
}
