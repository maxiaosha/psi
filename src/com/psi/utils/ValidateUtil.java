package com.psi.utils;

import com.psi.entity.Goods;
import com.psi.entity.GoodsType;
import com.psi.entity.Supplier;
import com.psi.entity.User;


/**
 * ��̨��֤����
 * @author �����
 *
 */
public class ValidateUtil {
	
	public static boolean validateUser(User user){
		//�˻���֤
		if(user.getAccount() == null || user.getAddress().equals("")){
			return false;
		}
		
		//�û���ɫ��֤
		if(user.getRole() == null || user.getRole().equals("")){
			return false;
		}
		
		//�û�������֤
		if(user.getName() == null || user.getName().equals("")){
			return false;
		}
		
		//�û����֤��֤
		String s1 = "(^\\d{18}$)|(^\\d{15}$)";
		if(user.getIdCard() == null || user.getIdCard().equals("") || !user.getIdCard().matches(s1)){
			return false;
		}
		
		//�û��Ա���֤
		if(user.getSex() == null || user.getSex().equals("")){
			return false;
		}
		
		//�û�������֤
		if(user.getAge() == null || user.getAge().equals("")){
			return false;
		}
		
		//�ֻ���֤
		String s = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		if(user.getPhone() == null || user.getPhone().equals("") || !user.getPhone().matches(s)){
			return false;
		}
		
		//������֤
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		if(user.getEmail() == null || !user.getEmail().equals("") || !user.getEmail().matches(regex)){
			return false;
		}
		
		return true;
	
	}
	
	public static boolean validateSupplier(Supplier supplier){
		//��Ӧ��������֤
		if(supplier.getName() == null || supplier.getName().equals("")){
			return false;
		}
		
		//��Ӧ����ϵ����֤
		if(supplier.getLinkman() == null || supplier.getLinkman().equals("")){
			return false;
		}
		
		//��Ӧ��������֤
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		if(supplier.getMail() == null || supplier.getMail().equals("") || !supplier.getMail().matches(regex)){
			return false;
		}
		
		//��Ӧ���ֻ���֤
		String s = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		if(supplier.getPhone() == null || supplier.getPhone().equals("") || supplier.getPhone().matches(s)){
			return false;
		}
		
		//��Ӧ�̵�ַ��֤
		if(supplier.getAddress() == null || supplier.getAddress().equals("")){
			return false;
		}
		return true;
	}
	public static boolean validateGoods(Goods goods){
		//��Ʒ����֤
		if(goods.getName() == null || goods.getName().equals("")){
			return false;
		}
		
		//��Ʒ�����֤
		if(goods.getGoodsTypeId() == null || goods.getGoodsTypeId().equals("")){
			return false;
		}
		
		//��Ӧ����֤
		if(goods.getSupplier() == null || goods.getSupplier().equals("")){
			return false;
		}
		
		//��Ʒ������֤
		String s1="^((//d+//.//d*[1-9]//d*)|(//d*[1-9]//d*//.//d+)|(//d*[1-9]//d*))$";
		if(goods.getPurchasePrice() == null || goods.getPurchasePrice().equals("") || !goods.getPurchasePrice().toString().matches(s1)){
			return false;
		}
		
		//��Ʒ�ۼ���֤
		if(goods.getSalePrice() == null || goods.getSalePrice().equals("") || !goods.getSalePrice().toString().matches(s1)){
			return false;
		}
			
		return true;
		
	}
	public static boolean validateGoodsType(GoodsType goodstype){
		//��Ʒ���������֤
		if(goodstype.getName() == null || goodstype.getName().equals("")){
			return false;
		}
		
		//��Ʒ�������ȼ���֤
		if(goodstype.getSort_priority() == null || goodstype.getSort_priority().equals("")){
			return false;
		}
		
		return true;
	}
	
}
