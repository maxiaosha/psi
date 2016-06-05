package com.psi.controller.mgr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * »ù±¾Controller
 * @author ÔøÓî¿µ
 *
 */
@Controller
@RequestMapping("/mgr/")
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "Ê×Ò³");
		mav.addObject("mainPage", "/WEB-INF/mgr/index.jsp");
		
		return mav;
	}
}
