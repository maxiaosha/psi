package com.psi.controller.mgr.goods;

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

import com.psi.entity.Goods;
import com.psi.entity.Supplier;
import com.psi.service.GoodsService;
import com.psi.service.SupplierService;
import com.psi.utils.AjaxUtil;
import com.psi.utils.PageUtil;
import com.psi.utils.SerialNumberUtil;
import com.psi.utils.SnUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * ��Ʒ��Ϣ����Controller��
 * @author ���
 *
 */
@Controller
@RequestMapping("/mgr/goods/goods")
public class MgrGoodsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private SupplierService supplierService;
	
	/**
	 * ��Ʒ����ҳ��
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageGoods")
	public ModelAndView manageGoods() throws Exception {
		List<Supplier> supplierList = supplierService.queryList(null);
		//List<Goods> goodsList = goodsService.queryList(null);
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("title", "��Ʒ��Ϣ����");
		mav.addObject("mainPage", "/WEB-INF/mgr/goods/goods/manageGoods.jsp");
		//mav.addObject("baseUrl", "/mgr/goods/manageGoods");
		mav.addObject("supplierList", supplierList);
		//mav.addObject("goodsList", goodsList);
		
		return mav;
	}
	

	/**
	 * ��ҳ������Ʒ��¼
	 * @param limit
	 * @param offset
	 * @param searchGoodsSn
	 * @param searchGoodsName
	 * @param searchGoodsTypeId
	 * @param searchSupplierId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list",  method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String list(String limit, String offset, String searchGoodsSn,
			String searchGoodsName, String searchGoodsTypeId, String searchSupplierId, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageUtil.toStart(offset));
		map.put("size", PageUtil.toSize(limit));
		map.put("sn", searchGoodsSn);
		map.put("name", searchGoodsName);
		map.put("goodsTypeId", searchGoodsTypeId);
		map.put("supplierId", searchSupplierId);
		List<Goods> goodsList = goodsService.queryList(map);
		Long total = goodsService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (Goods goods : goodsList) {
			jsonArray.add(goods);
		}
		result.put("rows", jsonArray);

		result.put("total", total);
		
		return result.toString();
	}
	
	/**
	 * �����Ʒ��¼
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String add(Goods goods) throws Exception {
			try {
				goods.setId(SerialNumberUtil.getSerialNumber());
				goods.setSn(SnUtil.createSn("GD"));
				goods.setStock("0");
				if (goodsService.insert(goods) > 0) {
					return AjaxUtil.getStringMessage(1, "�����Ʒ��¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "�����Ʒ��¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "�����Ʒ��¼ʧ�ܣ�", null);
			}
	
	}
	
	/**
	 * �޸���Ʒ��¼
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String modify(Goods goods) throws Exception {
			try {	
				if (goodsService.modify(goods) > 0) {
					return AjaxUtil.getStringMessage(1, "�޸���Ʒ��¼�ɹ���", null);
				} else {
					return AjaxUtil.getStringMessage(0, "�޸���Ʒ��¼ʧ�ܣ�", null);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return AjaxUtil.getStringMessage(0, "�޸���Ʒ��¼ʧ�ܣ�", null);
			}
	}
	
	@RequestMapping(value = "/delete",  method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public String delete(String ids) throws Exception {
		String[] idsStr = ids.split(",");
		int i = 0;
		for(;i<idsStr.length;i++){
			if (goodsService.delete(idsStr[i]) > 0){
				continue;
			} else {
				return  AjaxUtil.getStringMessage(0, "ɾ����" + i + "����¼ʱ����δ֪����", null);
			}
		}
		return AjaxUtil.getStringMessage(1, i + "����¼ɾ���ɹ���", null);
	}
}
