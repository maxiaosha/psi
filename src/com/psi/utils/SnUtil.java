package com.psi.utils;

import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * ����������ʵ����
 * @author �����
 *
 */

public class SnUtil {
	public static String createSn(String s){
		SimpleDateFormat sdf=new SimpleDateFormat("yyMMddhhmmss");
		java.util.Date date=new java.util.Date();
		String str=sdf.format(date);
		s+=str;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 6; i++) {
            int a = Math.abs((new Random()).nextInt(57));// ����0~57�������
            if (a <= 9) {// ��0~9תΪchar��0~9
                sb.append((char) (a + 48));
            } else if (a < 33) {// ��10~33תΪchar��A~Z
                if((a + 55) == 79 || (a + 55) == 73){
                    sb.append((char) (a + 63));
                }else{
                    sb.append((char) (a + 55));
                }
            }
        }
		s+=sb;
		return s;
	}

}
