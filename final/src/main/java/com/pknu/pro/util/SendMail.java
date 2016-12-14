package com.pknu.pro.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class SendMail {
	private final String FROM = "testconyca@naver.com";
	private String to;
	private String subject;
	private String content;
	
	public SendMail() {}
	public SendMail(String to, String subject, String content) {
		
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String sendMail(){
		String result ="Y";
		Properties properties = new Properties();
		properties.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
		
		//설정
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth = new SMTPAuthenticatior();
			Session session = Session.getInstance(properties, auth);
			session.setDebug(true);
			MimeMessage msg = new MimeMessage(session);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(FROM);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg);
		    System.out.println("send!!");
		}catch (Exception e){
			e.printStackTrace();
			System.out.println("SendMail error!!");
			result="N";
		}
		
		return result;
	}
	
	
}
