package com.psi.controller.mgr.system;

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

import com.psi.entity.Menu;
import com.psi.service.MenuService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * �˵����� Controller ��
 * @author ���
 *
 */

@Controller
@RequestMapping("/mgr/system/menu")
public class MgrMenuController {
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * �˵�����ҳ��
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageMenu")
	public ModelAndView manageMenu() throws Exception {
		List<Menu> menuList = menuService.queryList(null);

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "�˵�����");
		mav.addObject("mainPage", "/WEB-INF/mgr/system/menu/manageMenu.jsp");
		mav.addObject("menuList", menuList);
		
		return mav;
	}
	
	/**
	 * ��ҳ���Ҳ˵���¼
	 * @param offsets
	 * @param limit
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		List<Menu> menuList = menuService.queryList(map);
		Long total = menuService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Menu menu : menuList) {
			if(menu.getAuthorization().equals("1")) {
				menu.setAuthorization("����Ա");
			} else {
				menu.setAuthorization("��ͨԱ��");
			}
			jsonArray.add(menu);
		}
		result.put("rows", jsonArray);
		result.put("total", total);
		
		return result.toString();
	}
	
	/**
	 * ��Ӳ˵���¼
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(Menu menu) throws Exception {
		if (menu.getUrl() != null && !menu.getUrl().trim().equals("")
				&& menu.getName() != null && !menu.getName().trim().equals("")
				&& menu.getOrderFlag() != null && !menu.getOrderFlag().trim().equals("") 
				&& menu.getOrderFlag().trim().length() <= 2) {
			if (menu.getParentId() != null && !menu.getParentId().trim().equals("")) {
				Menu menutemp = menuService.getById(menu.getParentId());
				menu.setLevel((Integer.parseInt(menutemp.getLevel()) + 1) + "");
			} else {
				menu.setLevel("1");
			}
		
			menu.setId(SerialNumberUtil.getSerialNumber());
			menu.setName(menu.getName().trim());
			menu.setUrl(menu.getUrl().trim());
			menu.setParentId(menu.getParentId().trim());	
			menu.setOrderFlag(menu.getOrderFlag().trim());
			try {
				if (menuService.insert(menu) > 0) {
					return AjaxUtil.getStringMessage(1, "��Ӳ˵���¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "��Ӳ˵���¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "��Ӳ˵���¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д�˵���¼��Ϣ��", null);
		}		
	}
	
	/**
	 * �޸Ĳ˵���¼
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String modify(Menu menu) throws Exception {
		if (menu.getUrl() != null && !menu.getUrl().trim().equals("")
				&& menu.getName() != null && !menu.getName().trim().equals("")
				&& menu.getOrderFlag() != null && !menu.getOrderFlag().trim().equals("") 
				&& menu.getOrderFlag().trim().length() <= 2 && !menu.getId().equals(menu.getParentId())) {
		
			if (!menu.getParentId().trim().equals("")) {
				Menu menutemp = menuService.getById(menu.getParentId());
				menu.setLevel((Integer.parseInt(menutemp.getLevel()) + 1) + "");
			} else {
				menu.setLevel("1");
			}
			
			try {
				if (menuService.modify(menu) > 0) {
					return AjaxUtil.getStringMessage(1, "�޸Ĳ˵���¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "�޸Ĳ˵���¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "�޸Ĳ˵���¼ʧ�ܣ�", null);
			}
			
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д�˵���¼��Ϣ��", null);
		}
	}
	
	@RequestMapping(value = "/delete",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String delete(String ids) throws Exception {
		String[] idsStr = ids.split(",");
		int i = 0;
		for(;i<idsStr.length;i++){
			if (menuService.delete(idsStr[i]) > 0){
				continue;
			} else {
				return  AjaxUtil.getStringMessage(0, "ɾ����" + i + "����¼ʱ����δ֪����", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "����¼ɾ���ɹ���", null);
	}
    
}
