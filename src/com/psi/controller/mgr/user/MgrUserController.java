package com.psi.controller.mgr.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psi.utils.CryptographyUtil;
import com.psi.entity.Role;
import com.psi.entity.User;
import com.psi.service.RoleService;
import com.psi.service.UserService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;

/**
 * �û�����Controller��
 * @author �����
 *
 */



@Controller
@RequestMapping("/mgr/user")
public class MgrUserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	/**
	 * �û�����ҳ��
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/manageUser")
	public ModelAndView index() throws Exception{
		
		List<User> userList = userService.queryList(null);
		List<Role> roleList = roleService.queryList(null);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title","�û�����");
		mav.addObject("mainPage","/WEB-INF/mgr/user/manageUser.jsp");
		mav.addObject("roleList", roleList);
		mav.addObject("userList", userList);
		return mav;
		
	}
	
	/**
	 * ��ҳ�����û���¼
	 * @param offsets
	 * @param limit
	 * @param searchId
	 * @param searchUserName
	 * @param searchUserSex
	 * @param searchRoleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8" )
	@ResponseBody
	public String list(String limit, String offset, String searchAccount, String searchUserName, String searchUserSex, String searchRoleId, HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("account", searchAccount);
		map.put("name", searchUserName);
		map.put("sex", searchUserSex);
		map.put("roleId",searchRoleId);
		List<User> userList = userService.queryList(map);
		Long total = userService.getTotal(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for (User user : userList) {
			jsonArray.add(user);
		}
		result.put("rows", jsonArray);
		//result.put("page", PageUtil.toSize(limit));
		result.put("total", total);
		return result.toString();
	}
	
	/**
	 * ����û���¼
	 * @param user
	 * @return
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(User user) throws Exception{
		if(user.getAccount() != null && !user.getAccount().trim().equals("")
				&& user.getName() != null && !user.getName().trim().equals("")
				&& user.getIdCard() != null && !user.getIdCard().trim().equals("")
				&& user.getSex() != null && !user.getSex().trim().equals("")
				&& user.getRole() != null && !user.getRole().equals("")
				&& user.getAge() != null && !user.getAge().trim().equals("")
				){
			user.setId(SerialNumberUtil.getSerialNumber());
			user.setAccount(user.getAccount().trim());
			user.setName(user.getName().trim());
			user.setIdCard(user.getIdCard().trim());
			String idCard = user.getIdCard();
			String password = idCard.substring(idCard.length()-8, idCard.length());
			user.setPassword(CryptographyUtil.md5(password, "zcll"));
			user.setSex(user.getSex().trim());
			user.setAge(user.getAge().trim());
			user.setPhone(user.getPhone().trim());
			user.setEmail(user.getEmail().trim());
			user.setAddress(user.getAddress().trim());
			user.setRole(user.getRole());
			try {
				if (userService.insert(user) > 0) {
					return AjaxUtil.getStringMessage(1, "����û���¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "����û���¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "����û���¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д�û���¼��Ϣ��", null);
		}		
	}
	
	/**
	 * �޸��û���¼
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String modify(User user) throws Exception {
		if(user.getAccount() != null && !user.getAccount().trim().equals("")
				&& user.getName() != null && !user.getName().trim().equals("")
				&& user.getIdCard() != null && !user.getIdCard().trim().equals("")
				&& user.getSex() != null && !user.getSex().trim().equals("")
				&& user.getRole() != null && !user.getRole().equals("")
				&& user.getAge() != null && !user.getAge().trim().equals("")){
			//user.setPassword(CryptographyUtil.md5(user.getPassword(), "zcll"));
	
			if (userService.modify(user) > 0) {
				return AjaxUtil.getStringMessage(1, "�޸��û���¼�ɹ���", null);
			} else {
				return AjaxUtil.getStringMessage(0, "�޸��û���¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д�û���¼��Ϣ��", null);
		}
	}
	
	/**
	 * ɾ���û���¼
	 * 
	 */
	@RequestMapping(value = "/delete",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String delete(String ids) throws Exception {
		String[] idsStr = ids.split(",");
		int i = 0;
		for(;i<idsStr.length;i++){
			if (userService.delete(idsStr[i]) > 0){
				continue;
			} else {
				return  AjaxUtil.getStringMessage(0, "ɾ����" + i + "����¼ʱ����δ֪����", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "����¼ɾ���ɹ���", null);
	}	
	
	/**
	 * ��������
	 */
	@RequestMapping(value = "/modifyPassword", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String modifyPassword(HttpSession session, String password) throws Exception {
		User user = (User) session.getAttribute("currentUser");
		user.setPassword(CryptographyUtil.md5(password, "zcll"));
		if (userService.modify(user) > 0) {
			return  AjaxUtil.getStringMessage(1, "�޸�����ɹ���",null);
		} else {
			return  AjaxUtil.getStringMessage(1, "�޸�����ʧ�ܣ�",null);
		}
	}
}
