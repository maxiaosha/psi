package com.psi.utils;

import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * 编号生成类
 * @author 陈培斌
 *
 */

public class SnUtil {
	public static String createSn(String s){
		SimpleDateFormat sdf=new SimpleDateFormat("yyMMddhhmmss");
		java.util.Date date=new java.util.Date();
		String str=sdf.format(date);
		s+=str;
       StringBuffer buffer = new StringBuffer("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");   
        StringBuffer sb = new StringBuffer();   
        Random random = new Random();   
        int range = buffer.length();   
        for (int i = 0; i < 6; i ++) {   
            sb.append(buffer.charAt(random.nextInt(range)));   
        }
        s+=sb;
		return s;
	}

}
