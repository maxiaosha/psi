package com.psi.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;


/**
 * 发送邮件工具类
 * @author 曾宇康
 *
 */
public class MailUtil implements MailUser {
	private static Logger logger = Logger.getLogger(MailUtil.class);
	
	/**
	 * 描述： 发送邮件方法 
	 * 作者： 曾宇康
	 * 时间：16/06/12
	 * @param subject  邮件主题
	 * @param content  邮件内容
	 * @param tomail   发送人
	 */
	public static void sendMail(String subject, String content, String tomail) {
		try {
			
			Properties props = new Properties();
		
			props.put("mail.smtp.host", "smtp.mxhichina.com");
			props.put("mail.smtp.auth", "true");
		
			Session s = Session.getInstance(props);
			s.setDebug(true);
		
			MimeMessage message = new MimeMessage(s);
			InternetAddress from = new InternetAddress(ACCOUNT);
			message.setFrom(from);
			InternetAddress to = new InternetAddress(tomail);
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject(subject);
			message.setSentDate(new Date());

			message.setContent(content, "text/html;charset=utf-8");
			
			Transport transport = s.getTransport("smtp");
			transport.connect("smtp.mxhichina.com", ACCOUNT, PASSWORD);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.error("邮件发送失败");
			logger.debug(e.getMessage());
			logger.debug("邮件发送失败");
		}
	}
	
	/*public static void main(String[] args) {
		MailUtil.sendMail("测试2", "测试111123", "2512522383@qq.com");
	}*/
}
