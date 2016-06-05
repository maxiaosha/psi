package com.psi.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * ¥ÌŒÛController¿‡
 * @author ‘¯”Óøµ
 *
 */
@Controller
public class ErrorController {

	@RequestMapping("/404")
	public ModelAndView error_404() {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("error", "404");
		return mav;
	}
	
	@RequestMapping("/500")
	public ModelAndView error_500() {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("error", "500");
		return mav;
	}
}
