package com.psi.controller.mgr.replenish;

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
import com.psi.entity.Replenish;
import com.psi.entity.ReplenishB;
import com.psi.entity.Supplier;
import com.psi.service.GoodsService;
import com.psi.service.ReplenishBService;
import com.psi.service.ReplenishService;
import com.psi.service.SupplierService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.DateTimeUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;
import com.psi.utils.SnUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 采购单管理Controller
 * @author 曾宇康
 *
 */
@Controller
@RequestMapping("/mgr/replenish")
public class MgrReplenishController {
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private ReplenishService replenishService;
	@Autowired
	private ReplenishBService replenishBService;

	/**
	 * 采购单列表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/replenishList")
	public ModelAndView replenishList() throws Exception {		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "采购单列表");
		mav.addObject("mainPage", "/WEB-INF/mgr/replenish/replenishList.jsp");
		//mav.addObject("baseUrl", "/mgr/replenish/manageGoods");
		
		return mav;
	}
	
	/**
	 * 采购单列表数据
	 * @param limit
	 * @param offset
	 * @param searchReplenishSn
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, String searchReplenishSn,
			String searchStartTime, String searchEndTime, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("sn", searchReplenishSn);
		map.put("startTime", searchStartTime);
		map.put("endTime", searchEndTime);
		List<Replenish> replenishList = replenishService.queryList(map);
		Long total = replenishService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Replenish replenish : replenishList) {
			jsonArray.add(replenish);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
	}
	
	/**
	 * 根据得到采购单商品列表
	 * @param replenishId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/replenishBList",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String replenishBList(String replenishId) throws Exception {
		if (replenishId == null) {
			return null;
		}		
		if (replenishId.trim().equals("")) {
			return null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replenishId", replenishId);

		List<ReplenishB> replenishBList = replenishBService.queryList(map);
		Long total = replenishBService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (ReplenishB replenishB : replenishBList) {
			jsonArray.add(replenishB);
		}
		
		result.put("rows", jsonArray);
		result.put("total", total);		
		return result.toString();
		
	}
	
	
	
	/**
	 * 添加采购单页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addReplenish")
	public ModelAndView addReplenish() throws Exception {
		List<Supplier> supplierList = supplierService.queryList(null);
		ModelAndView mav = new ModelAndView("main");
		
		mav.addObject("title", "添加采购单");
		mav.addObject("mainPage", "/WEB-INF/mgr/replenish/addReplenish.jsp");
		mav.addObject("baseUrl", "/mgr/replenish/addReplenish");
		
		mav.addObject("supplierList", supplierList);
	
		return mav;
	}
	
	/**
	 * 添加采购单记录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(HttpServletRequest request) throws Exception {
		String remark = request.getParameter("remark");
		String goodsIds[] = request.getParameterValues("goodsId");
		String productionDates[] = request.getParameterValues("productionDate");
		String nums[] = request.getParameterValues("num");
		
		try {
			replenishService.insertReplenish(remark, goodsIds, productionDates, nums);
			return AjaxUtil.getStringMessage(1, "添加采购单成功！", "replenishList");
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxUtil.getStringMessage(0, e.getMessage(), null);
		}
		
		
	}
}
