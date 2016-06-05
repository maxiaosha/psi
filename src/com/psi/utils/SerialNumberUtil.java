package com.psi.utils;

import java.util.UUID;

/**
 * ID����Util
 * @author ���
 *
 */
public class SerialNumberUtil {
	public static String getSerialNumber(){
		 return UUID.randomUUID().toString().replace("-", "");
	}
	public static String getSerialNumber(String str){
		return UUID.fromString(str).toString().replace("-", "");
	}
	public static String getSerialNumber(byte[] bytes){
		return UUID.nameUUIDFromBytes(bytes).toString().replace("-", "");
	}
}
