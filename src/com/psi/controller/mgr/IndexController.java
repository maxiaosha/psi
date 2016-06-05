package com.psi.controller.mgr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * ����Controller
 * @author ���
 *
 */
@Controller
@RequestMapping("/mgr/")
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "��ҳ");
		mav.addObject("mainPage", "/WEB-INF/mgr/index.jsp");
		
		return mav;
	}
}
