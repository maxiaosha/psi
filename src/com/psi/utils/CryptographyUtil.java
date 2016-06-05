package com.psi.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * ¼ÓÃÜ¹¤¾ß
 * @author ÔøÓî¿µ
 *
 */
public class CryptographyUtil {

	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}

}

