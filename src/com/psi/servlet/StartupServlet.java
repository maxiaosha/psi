package com.psi.servlet;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.psi.entity.Menu;
import com.psi.service.MenuService;


public class StartupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MenuService menuService;
	
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		menuService = (MenuService) context.getBean("menuService");
		ServletContext application = this.getServletContext();
		
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
	}
}
