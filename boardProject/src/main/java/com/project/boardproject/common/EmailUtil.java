package com.project.boardproject.common;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.project.boardproject.cm.web.CmController;

@Component
public class EmailUtil {

	@Autowired
	protected JavaMailSender mailSender;
 
	private static final Logger logger = LoggerFactory.getLogger(EmailUtil.class);

 public void SendMail(Email email) throws Exception {
		logger.debug("SendMail Method START==============================");
		Map<String,String> map = new HashMap<>();
		map.put("content", email.getContent());
		MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
       msg.setText(email.getContent());
  //      msg.setText("본문");
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getRecipients()));
		try {
			mailSender.send(msg);
		}catch(NullPointerException e) {
			e.printStackTrace();
 		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
