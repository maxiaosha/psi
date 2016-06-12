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

import com.psi.entity.GoodsStock;
import com.psi.entity.ReturnSale;
import com.psi.entity.ReturnSaleB;
import com.psi.entity.Sale;
import com.psi.entity.SaleB;
import com.psi.service.GoodsStockService;
import com.psi.service.ReturnSaleBService;
import com.psi.service.ReturnSaleService;
import com.psi.service.SaleBService;
import com.psi.service.SaleService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 退货单管理Controller
 * @author 曾宇康
 *
 */
@Controller
@RequestMapping("/mgr/sale/returnsale")
public class MgrReturnSaleController {
	@Autowired
	private ReturnSaleService returnSaleService;
	@Autowired
	private ReturnSaleBService returnSaleBService;
	@Autowired
	private SaleService saleService;
	@Autowired
	private SaleBService saleBService;
	
	/**
	 * 退货单列表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/returnSaleList")
	public ModelAndView returnReturnSaleList() throws Exception {		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "退货单列表");
		mav.addObject("mainPage", "/WEB-INF/mgr/sale/returnsale/returnSaleList.jsp");
		
		return mav;
	}
	
	/**
	 * 退货列表页面
	 * @param limit
	 * @param offset
	 * @param searchReturnSaleSn
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, String searchReturnSaleSn,
			String searchStartTime, String searchEndTime, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("sn", searchReturnSaleSn);
		map.put("startTime", searchStartTime);
		map.put("endTime", searchEndTime);
		
		List<ReturnSale> returnSaleList = returnSaleService.queryList(map);
		Long total = returnSaleService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (ReturnSale returnSale : returnSaleList) {
			jsonArray.add(returnSale);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
	}
	
	/**
	 * 根据退货单ID得到退货单商品列表
	 * @param returnSaleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/returnSaleBList",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String returnSaleBList(String returnSaleId) throws Exception {
		if (returnSaleId == null) {
			return null;
		}		
		if (returnSaleId.trim().equals("")) {
			return null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returnSaleId", returnSaleId);

		List<ReturnSaleB> returnSaleBList = returnSaleBService.queryList(map);
		Long total = returnSaleBService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (ReturnSaleB returnSaleB : returnSaleBList) {
			Map<String, Object> returnSaleBMap = new HashMap<String, Object>();
			returnSaleBMap.put("saleSn", returnSaleB.getSaleB().getSale().getSn());
			returnSaleBMap.put("goodsName", returnSaleB.getSaleB().getGoodsStock().getGoods().getName());
			returnSaleBMap.put("num", returnSaleB.getNum());

			returnSaleBMap.put("goodsMoney", returnSaleB.getGoodsMoney());
			jsonArray.add(returnSaleBMap);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
		
	}
	

	
	/**
	 * 添加退货单页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addReturnSale")
	public ModelAndView addReturnSale() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		
		mav.addObject("title", "添加退货单");
		mav.addObject("mainPage", "/WEB-INF/mgr/sale/returnsale/addReturnSale.jsp");
		
		return mav;
	}
	
	/**
	 * 根据销售编号取得销售商品
	 * @param saleSn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getSaleB",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String getSaleB(String saleSn) throws Exception {
		Sale sale = saleService.getBySn(saleSn);
		JSONObject result = new JSONObject();	
		
		if (sale != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("saleId", sale.getId());
			map.put("flag", "1");
			List<SaleB> saleBList = saleBService.queryList(map);
					
			JSONArray jsonArray = new JSONArray();
			for (SaleB saleB : saleBList) {
				jsonArray.add(saleB);
			}
			
			result.put("hasSale", "1");
			result.put("rows", jsonArray);
		} else {
			result.put("hasSale", "0");
		}
		
		
		return result.toString();
	}
	
	/**
	 * 添加退货单记录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(HttpServletRequest request) throws Exception {
		String remark = request.getParameter("remark");
		String saleBIds[] = request.getParameterValues("saleBId");
		String nums[] = request.getParameterValues("num");
		
		try {
			returnSaleService.insertReturnSale(remark, saleBIds, nums);
			return AjaxUtil.getStringMessage(1, "添加退货单成功！", "returnSaleList");
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxUtil.getStringMessage(0, e.getMessage(), null);
		}		
	}
}
