package com.psi.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * ���ܹ���
 * @author ���
 *
 */
public class CryptographyUtil {

	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}

}

