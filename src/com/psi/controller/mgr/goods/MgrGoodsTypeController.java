package com.psi.controller.mgr.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mgr/goods")
public class MgrGoodsTypeController {

	@RequestMapping("/manageGoodsType")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "商品类别管理");
		mav.addObject("mainPage", "/WEB-INF/mgr/goods/manageGoodsType.jsp");
		
		return mav;
	}
}
