package com.psi.controller.mgr.supplier;

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

import com.psi.entity.Supplier;
import com.psi.service.SupplierService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * ��Ӧ�̹���Controller��
 * @author �����
 *
 */

@Controller
@RequestMapping("/mgr/supplier")
public class MgrSupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	/**
	 * ��Ӧ�̹���ҳ��
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("/manageSupplier")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "��Ӧ�̹���");
		mav.addObject("mainPage", "/WEB-INF/mgr/supplier/manageSupplier.jsp");
		
		return mav;
	}
	
	/**
	 * ��ҳ���ҹ�Ӧ�̼�¼
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
		List<Supplier> supplierList = supplierService.queryList(map);
		Long total = supplierService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for (Supplier supplier : supplierList) {
			jsonArray.add(supplier);
		}
		result.put("rows", jsonArray);
		result.put("page", PageUtil.toSize(limit));
		result.put("total", total);
		return result.toString();
		
		
	}
	
	/**
	 * ��ӹ�Ӧ�̼�¼
	 * @param supplier
	 * @return
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(Supplier supplier) throws Exception {
		if (supplier.getName() != null && !supplier.getName().trim().equals("")
				&& supplier.getLinkman() != null && !supplier.getLinkman().trim().equals("")
				&& supplier.getMail() != null && !supplier.getMail().trim().equals("") 
				&& supplier.getPhone() !=null && !supplier.getPhone().trim().equals("")) {
	
			supplier.setId(SerialNumberUtil.getSerialNumber());
			supplier.setName(supplier.getName().trim());
			supplier.setLinkman(supplier.getLinkman().trim());
			supplier.setMail(supplier.getMail().trim());
			supplier.setPhone(supplier.getPhone().trim());
		
			try {
				if (supplierService.insert(supplier) > 0) {
					return AjaxUtil.getStringMessage(1, "��ӹ�Ӧ�̼�¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "��ӹ�Ӧ�̼�¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "��ӹ�Ӧ�̼�¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д��Ӧ�̼�¼��Ϣ��", null);
		}		
		
	}
	
	/**
	 * �޸Ĺ�Ӧ�̼�¼
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String modify(Supplier supplier) throws Exception {
		if (supplier.getName() != null && !supplier.getName().trim().equals("")
				&& supplier.getLinkman() != null && !supplier.getLinkman().trim().equals("")
				&& supplier.getMail() != null && !supplier.getMail().trim().equals("") 
				&& supplier.getPhone() !=null && !supplier.getPhone().trim().equals("")) {
		
			if (supplierService.modify(supplier) > 0) {
				return AjaxUtil.getStringMessage(1, "�޸Ĺ�Ӧ�̼�¼�ɹ���", null);
			} else {
				return AjaxUtil.getStringMessage(0, "�޸Ĺ�Ӧ�̼�¼ʧ�ܣ�", null);
			}
		} else {
			return AjaxUtil.getStringMessage(0, "����ȷ��д��Ӧ�̼�¼��Ϣ��", null);
		}
	}
	
	/**
	 * ɾ����Ӧ�̼�¼
	 * 
	 */
	@RequestMapping(value = "/delete",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String delete(String ids) throws Exception {
		String[] idsStr = ids.split(",");
		int i = 0;
		for(;i<idsStr.length;i++){
			if (supplierService.delete(idsStr[i]) > 0){
				continue;
			} else {
				return  AjaxUtil.getStringMessage(0, "ɾ����" + i + "����¼ʱ����δ֪����", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "����¼ɾ���ɹ���", null);
	}	
}
