package com.psi.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Json ¥¶¿Ì¿‡
 * @author ‘¯”Óøµ
 *
 */
public class JsonUtil {
	private Map<String,Object> map = new HashMap<String,Object>();
	public JsonUtil(Integer status,String message,Object object){
		setMap(status,message,object);
	}
	public JsonUtil(Integer status,String message,String data){
		setMap(status,message,new String(data));
	}
	public JsonUtil(Integer status,String message){
		setMap(status,message,new Object());
	}
	private void setMap(Integer status,String message,Object object){
		map.put("status", status);
		map.put("message", message != null ? message : new String());
		map.put("data", object != null ? object : new Object());
	}
	public JSONObject toJSON(){
		return JSONObject.fromObject(map);
	}
	public static Object toObject(JSONObject jsonObject){
		return JSONObject.toBean(jsonObject);
	}
	public static String toJSON(List<?> list){
		return JSONArray.fromObject(list).toString();
	}
	public static Object toObject(JSONArray jsonArray){
		return JSONArray.toArray(jsonArray);
	}
}