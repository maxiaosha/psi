/*package com.psi.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.news.entity.Admin;
import com.news.service.AdminService;




*//**
 * �Զ���Realm
 * @author ���
 *
 *//*
public class MyRealm extends AuthorizingRealm{
	@Autowired
	private AdminService adminService;
	
	*//**
	 * Ϊ����ǰ��¼���û������ɫ��Ȩ
	 *//*
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}

	*//**
	 * ��֤��ǰ��¼���û�
	 *//*
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String name=(String)token.getPrincipal();
		Admin admin = adminService.getAdmin(name);
		if(admin!=null){
			SecurityUtils.getSubject().getSession().setAttribute("currentAdmin", admin); // ��ǰ����Ա��Ϣ�浽session��
			AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(admin.getName(),admin.getPassword(),"xx");
			return authcInfo;
		}else{
			return null;				
		}
	}

}*/
