package com.psi.utils;

import com.psi.entity.Goods;
import com.psi.entity.GoodsType;
import com.psi.entity.Supplier;
import com.psi.entity.User;


/**
 * 后台验证工具
 * @author 陈培斌
 *
 */
public class ValidateUtil {
	
	public static boolean validateUser(User user){
		//账户验证
		if(user.getAccount() == null || user.getAddress().equals("")){
			return false;
		}
		
		//用户角色验证
		if(user.getRole() == null || user.getRole().equals("")){
			return false;
		}
		
		//用户姓名验证
		if(user.getName() == null || user.getName().equals("")){
			return false;
		}
		
		//用户身份证验证
		String s1 = "(^\\d{18}$)|(^\\d{15}$)";
		if(user.getIdCard() == null || user.getIdCard().equals("") || !user.getIdCard().matches(s1)){
			return false;
		}
		
		//用户性别验证
		if(user.getSex() == null || user.getSex().equals("")){
			return false;
		}
		
		//用户年龄验证
		if(user.getAge() == null || user.getAge().equals("")){
			return false;
		}
		
		//手机验证
		String s = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		if(user.getPhone() == null || user.getPhone().equals("") || !user.getPhone().matches(s)){
			return false;
		}
		
		//邮箱验证
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		if(user.getEmail() == null || !user.getEmail().equals("") || !user.getEmail().matches(regex)){
			return false;
		}
		
		return true;
	
	}
	
	public static boolean validateSupplier(Supplier supplier){
		//供应商姓名验证
		if(supplier.getName() == null || supplier.getName().equals("")){
			return false;
		}
		
		//供应商联系人验证
		if(supplier.getLinkman() == null || supplier.getLinkman().equals("")){
			return false;
		}
		
		//供应商邮箱验证
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		if(supplier.getMail() == null || supplier.getMail().equals("") || !supplier.getMail().matches(regex)){
			return false;
		}
		
		//供应商手机验证
		String s = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		if(supplier.getPhone() == null || supplier.getPhone().equals("") || supplier.getPhone().matches(s)){
			return false;
		}
		
		//供应商地址验证
		if(supplier.getAddress() == null || supplier.getAddress().equals("")){
			return false;
		}
		return true;
	}
	public static boolean validateGoods(Goods goods){
		//商品名验证
		if(goods.getName() == null || goods.getName().equals("")){
			return false;
		}
		
		//商品类别验证
		if(goods.getGoodsTypeId() == null || goods.getGoodsTypeId().equals("")){
			return false;
		}
		
		//供应商验证
		if(goods.getSupplier() == null || goods.getSupplier().equals("")){
			return false;
		}
		
		//商品进价验证
		String s1="^((//d+//.//d*[1-9]//d*)|(//d*[1-9]//d*//.//d+)|(//d*[1-9]//d*))$";
		if(goods.getPurchasePrice() == null || goods.getPurchasePrice().equals("") || !goods.getPurchasePrice().toString().matches(s1)){
			return false;
		}
		
		//商品售价验证
		if(goods.getSalePrice() == null || goods.getSalePrice().equals("") || !goods.getSalePrice().toString().matches(s1)){
			return false;
		}
			
		return true;
		
	}
	public static boolean validateGoodsType(GoodsType goodstype){
		//商品类别名称验证
		if(goodstype.getName() == null || goodstype.getName().equals("")){
			return false;
		}
		
		//商品排序优先级验证
		if(goodstype.getSort_priority() == null || goodstype.getSort_priority().equals("")){
			return false;
		}
		
		return true;
	}
	
}
