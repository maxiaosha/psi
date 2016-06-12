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
 * 角色管理Controller层
 * @author 陈培斌
 *
 */

@Controller
@RequestMapping("/mgr/user/role")
public class MgrRoleController {
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 角色管理界面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageRole")
	public ModelAndView managerRole() throws Exception{
		List<Role> roleList = roleService.queryList(null);

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "角色管理");
		mav.addObject("mainPage", "/WEB-INF/mgr/user/role/manageRole.jsp");

		mav.addObject("roleList", roleList);
		
		return mav;
		
	}
	
	/**
	 * 分页查找角色记录
	 * @param offsets
	 * @param limit
	 * @param page
	 * @return 
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET,produces = "application/json; charset=utf-8")
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
	 * 添加角色记录
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST,produces = "application/json;charset=utf-8")
	 @ResponseBody
	 public String add(Role role) throws Exception {
		if (role.getName() != null && !role.getName().trim().equals("")
				&& role.getPermission() != null && !role.getPermission().trim().equals("") ) {
			role.setId(SerialNumberUtil.getSerialNumber());
			role.setName(role.getName().trim());
			role.setPermission(role.getPermission().trim());
			try {
				if (roleService.insert(role) > 0) {
					return AjaxUtil.getStringMessage(1, "添加角色记录成功！", null);
				} else {
					return AjaxUtil.getStringMessage(0, "添加角色记录失败！", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "添加角色记录失败！", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "请正确填写角色记录信息！", null);
		}	
		
	}
	
	/**
	 * 修改角色记录
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
				return AjaxUtil.getStringMessage(1, "修改角色记录成功！", null);
			} else {
				return AjaxUtil.getStringMessage(0, "修改角色记录失败！", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "请正确填写角色记录信息！", null);
		}
		
	}
	/**
	 * 删除角色记录
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
				return  AjaxUtil.getStringMessage(0, "删除至" + i + "条记录时发生未知错误！", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "条记录删除成功！", null);
	}
}
