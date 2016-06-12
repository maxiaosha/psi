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
 * �����ʼ�������
 * @author ���
 *
 */
public class MailUtil implements MailUser {
	private static Logger logger = Logger.getLogger(MailUtil.class);
	
	/**
	 * ������ �����ʼ����� 
	 * ���ߣ� ���
	 * ʱ�䣺16/06/12
	 * @param subject  �ʼ�����
	 * @param content  �ʼ�����
	 * @param tomail   ������
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
			logger.error("�ʼ�����ʧ��");
			logger.debug(e.getMessage());
			logger.debug("�ʼ�����ʧ��");
		}
	}
	
	/*public static void main(String[] args) {
		MailUtil.sendMail("����2", "����111123", "2512522383@qq.com");
	}*/
}
