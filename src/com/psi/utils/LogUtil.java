package com.psi.utils;


import org.apache.log4j.Logger;

public class LogUtil {
	  public static void main(String[] args) {
		   Logger logger = Logger.getLogger(LogUtil.class);//��ȡ��־��¼���������¼�������������־��Ϣ
		  try {

				// ��¼debug�������Ϣ
				logger.debug("This is debug message.");
				// ��¼info�������Ϣ
				logger.info("This is info message.");
				// ��¼error�������Ϣ
				logger.error("This is error message.");
				
		  } catch (IllegalArgumentException ex) {
		  logger.info(ex.getMessage());//ʹ��Logger�����debug��info���������־��Ϣ
		   }
		     }
}
