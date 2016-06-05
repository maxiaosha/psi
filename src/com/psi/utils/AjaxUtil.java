package com.psi.utils;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

/**
 * Ajax Util
 * @author ÔøÓî¿µ
 *
 */
public class AjaxUtil {
	public static boolean isAjax(HttpServletRequest request){
		 	String requestType = request.getHeader("X-Requested-With");
		    if (requestType != null && requestType.equals("XMLHttpRequest")) {
		        return true;
		    } else {
		        return false;
		    }
	}
	public static JSONObject getObjectMessage(Integer status,String message,Object data){
		return new JsonUtil(status,message,data).toJSON();
	}
	public static String getStringMessage(Integer status,String message,Object data){
		return new JsonUtil(status,message,data).toJSON().toString();
	}
}
