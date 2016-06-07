package com.psi.controller.mgr.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psi.entity.Role;
import com.psi.service.RoleService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;

/**
 * ��ɫ����Controller��
 * @author �����
 *
 */

@Controller
@RequestMapping("/mgr/user/role")
public class MgrRoleController {
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * ��ɫ�������
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageRole")
	public ModelAndView managerRole() throws Exception{
		List<Role> roleList = roleService.queryList(null);

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "��ɫ����");
		mav.addObject("mainPage", "/WEB-INF/mgr/admin/manageRole.jsp");
		mav.addObject("roleList", roleList);
		
		return mav;
		
	}
	
	/**
	 * ��ҳ���ҽ�ɫ��¼
	 * @param offsets
	 * @param limit
	 * @param page
	 * @return 
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET,produces = "application/json; character=utf-8")
	@ResponseBody
	public String list(String limit,String offset,HttpServletRequest request)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		List<Role> roleList = roleService.queryList(map);
		Long total = roleService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Role role : roleList) {
			jsonArray.add(role);
		}
		result.put("rows", jsonArray);
		result.put("page", PageUtil.toSize(limit));
		result.put("total", total);
		
		return result.toString();
		
	}
	
	/**
	 * ��ӽ�ɫ��¼
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST,produces = "application/json;character=utf-8")
	 @ResponseBody
	 public String add(Role role) throws Exception {
		if (role.getName() != null && !role.getName().trim().equals("")
				&& role.getPermission() != null && !role.getPermission().trim().equals("") ) {
			role.setId(SerialNumberUtil.getSerialNumber());
			role.setName(role.getName().trim());
			role.setPermission(role.getPermission().trim());
			try {
				if (roleService.insert(role) > 0) {
					return AjaxUtil.getStringMessage(1, "��ӽ�ɫ��¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "��ӽ�ɫ��¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "��ӽ�ɫ��¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д��ɫ��¼��Ϣ��", null);
		}	
		
	}
	
	/**
	 * �޸Ľ�ɫ��¼
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String modify(Role role) throws Exception {
		if (role.getName() != null && !role.getName().trim().equals("")
				&& role.getPermission() != null && !role.getPermission().trim().equals("") ) {
		
			if (roleService.modify(role) > 0) {
				return AjaxUtil.getStringMessage(1, "�޸Ľ�ɫ��¼�ɹ���", null);
			} else {
				return AjaxUtil.getStringMessage(0, "�޸Ľ�ɫ��¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д��ɫ��¼��Ϣ��", null);
		}
		
	}
	/**
	 * ɾ����ɫ��¼
	 */
	@RequestMapping(value = "/delete",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String delete(String ids) throws Exception {
		String[] idsStr = ids.split(",");
		int i = 0;
		for(;i<idsStr.length;i++){
			if (roleService.delete(idsStr[i]) > 0){
				continue;
			} else {
				return  AjaxUtil.getStringMessage(0, "ɾ����" + i + "����¼ʱ����δ֪����", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "����¼ɾ���ɹ���", null);
	}
}
