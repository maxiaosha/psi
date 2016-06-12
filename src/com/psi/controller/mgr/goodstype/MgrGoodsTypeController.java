package com.psi.controller.mgr.goodstype;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mgr/goods/goodstype")
public class MgrGoodsTypeController {

	@RequestMapping("/manageGoodsType")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "商品类别管理");
		mav.addObject("mainPage", "/WEB-INF/mgr/goods/goodstype/manageGoodsType.jsp");
		//mav.addObject("baseUrl", "/mgr/goodstype/manageGoodsType");
		
		return mav;
	}
}
