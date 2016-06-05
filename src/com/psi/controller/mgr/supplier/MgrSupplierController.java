package com.psi.controller.mgr.supplier;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mgr/supplier")
public class MgrSupplierController {

	
	@RequestMapping("/manageSupplier")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "供应商管理");
		mav.addObject("mainPage", "/WEB-INF/mgr/supplier/manageSupplier.jsp");
		
		return mav;
	}
}
