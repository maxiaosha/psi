package com.psi.controller.mgr.system;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.psi.entity.Menu;
import com.psi.service.MenuService;

/**
 * 系统管理Controller
 * @author 曾宇康
 *
 */
@Controller
@RequestMapping("/mgr/system/")
public class MgrSystemController {
	@Autowired
	private MenuService menuService;
	
	/**
	 * 刷新系统缓存
	 * @param request
	 * @return
	 */
	@RequestMapping("/refresh")
	public ModelAndView refresh(HttpServletRequest request) {
		ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
		
		List<Menu> list1 = menuService.selectMenuByParentId("");
		for (Menu menu1 : list1) {
			List<Menu> list2 = menuService.selectMenuByParentId(menu1.getId());
			menu1.setChildList(list2);
				
			for (Menu menu2 : list2) {
				List<Menu> list3 = menuService.selectMenuByParentId(menu2.getId());
				menu2.setChildList(list3);
			}
		}
		
		application.setAttribute("list", list1);
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "首页");
		mav.addObject("mainPage", "/WEB-INF/mgr/index.jsp");
		
		return mav;
	}

	@RequestMapping("/icons")
	public ModelAndView icons() throws Exception {
		ModelAndView mav = new ModelAndView("main");

		mav.addObject("mainPage", "/WEB-INF/mgr/system/icons.jsp");
		
		return mav;
	}
}
