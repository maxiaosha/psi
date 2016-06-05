package com.psi.controller.mgr.goods.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * �ɹ�������Controller
 * @author ���
 *
 */
@Controller
@RequestMapping("/mgr/goods/purchase")
public class MgrPurchaseController {

	/**
	 * ��Ӳɹ���ҳ��
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addPurchase")
	public ModelAndView addPurchase() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "��Ӳɹ���");
		mav.addObject("mainPage", "/WEB-INF/mgr/goods/purchase/addPurchase.jsp");
		
		return mav;
	}
	
	/**
	 * ��Ӳɹ�����¼
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add() throws Exception {
		return null;
	}
	
}
