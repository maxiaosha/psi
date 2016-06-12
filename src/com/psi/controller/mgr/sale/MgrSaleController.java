package com.psi.controller.mgr.sale;

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
import com.psi.entity.Sale;
import com.psi.entity.SaleB;
import com.psi.entity.Supplier;
import com.psi.service.GoodsService;
import com.psi.service.GoodsStockService;
import com.psi.service.SaleBService;
import com.psi.service.SaleService;
import com.psi.service.SupplierService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 销售单管理Controller
 * @author 曾宇康
 *
 */
@Controller
@RequestMapping("/mgr/sale/sale")
public class MgrSaleController {
	@Autowired
	private GoodsStockService goodsStockService;
	@Autowired
	private SaleService saleService;
	@Autowired
	private SaleBService saleBService;
	
	/**
	 * 销售单列表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saleList")
	public ModelAndView saleList() throws Exception {		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "销售单列表");
		mav.addObject("mainPage", "/WEB-INF/mgr/sale/sale/saleList.jsp");

		
		return mav;
	}
	
	/**
	 * 销售列表页面
	 * @param limit
	 * @param offset
	 * @param searchSaleSn
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, String searchSaleSn,
			String searchStartTime, String searchEndTime, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("sn", searchSaleSn);
		map.put("startTime", searchStartTime);
		map.put("endTime", searchEndTime);
		
		List<Sale> saleList = saleService.queryList(map);
		Long total = saleService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Sale sale : saleList) {
			jsonArray.add(sale);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
	}
	
	/**
	 * 根据得到销售单商品列表
	 * @param saleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saleBList",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String saleBList(String saleId) throws Exception {
		if (saleId == null) {
			return null;
		}		
		if (saleId.trim().equals("")) {
			return null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleId", saleId);

		List<SaleB> saleBList = saleBService.queryList(map);
		Long total = saleBService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (SaleB saleB : saleBList) {
			Map<String, Object> saleBMap = new HashMap<String, Object>();
			saleBMap.put("goodsStockSn", saleB.getGoodsStock().getSn());
			saleBMap.put("replenishSn", saleB.getGoodsStock().getReplenishB().getReplenish().getSn());
			saleBMap.put("goodsSn", saleB.getGoodsStock().getGoods().getSn());
			saleBMap.put("goodsName", saleB.getGoodsStock().getGoods().getName());
			saleBMap.put("num", saleB.getNum());
			if (saleB.getReturnNum() != null) {
				saleBMap.put("returnNum", saleB.getReturnNum());
			} else {
				saleBMap.put("returnNum", "0");
			}
			saleBMap.put("goodsMoney", saleB.getGoodsMoney());
			jsonArray.add(saleBMap);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
		
	}
	

	
	/**
	 * 添加销售单页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addSale")
	public ModelAndView addSale() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		
		mav.addObject("title", "添加销售单");
		mav.addObject("mainPage", "/WEB-INF/mgr/sale/sale/addSale.jsp");
		
		return mav;
	}
	
	/**
	 * 根据库存编号取得商品库存
	 * @param goodsStockSn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getGoodsStock",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String getGoodsStock(String goodsStockSn) throws Exception {
		GoodsStock goodsStock = goodsStockService.getBySn(goodsStockSn);
		JSONObject result = new JSONObject();
		if (goodsStock != null) {	
			result.put("goodsStock", goodsStock);
		}
		result.put("isIn", "1");
		return result.toString();
	}
	
	/**
	 * 添加销售单记录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(HttpServletRequest request) throws Exception {
		String remark = request.getParameter("remark");
		String goodsStockIds[] = request.getParameterValues("goodsStockId");
		String nums[] = request.getParameterValues("num");
		
		try {
			saleService.insertSale(remark, goodsStockIds, nums);
			return AjaxUtil.getStringMessage(1, "添加销售单成功！", "saleList");
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxUtil.getStringMessage(0, e.getMessage(), null);
		}		
	}
}
