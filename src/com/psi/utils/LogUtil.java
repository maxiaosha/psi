package com.psi.utils;


import org.apache.log4j.Logger;

public class LogUtil {
	  public static void main(String[] args) {
		   Logger logger = Logger.getLogger(LogUtil.class);//获取日志记录器，这个记录器将负责控制日志信息
		  try {

				// 记录debug级别的信息
				logger.debug("This is debug message.");
				// 记录info级别的信息
				logger.info("This is info message.");
				// 记录error级别的信息
				logger.error("This is error message.");
				
		  } catch (IllegalArgumentException ex) {
		  logger.info(ex.getMessage());//使用Logger对象的debug、info方法输出日志信息
		   }
		     }
}
