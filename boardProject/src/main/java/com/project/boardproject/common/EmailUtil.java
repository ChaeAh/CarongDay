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

/***
 * @ClassName : EmailUtil.java
 * @Description :  이메일 관련 유틸 클래스
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.07.14   김채아      최초생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */


@Component
public class EmailUtil {

	@Autowired
	protected JavaMailSender mailSender;
 
	private static final Logger logger = LoggerFactory.getLogger(EmailUtil.class);

 public String SendMail(Email email) throws Exception {
		logger.debug("SendMail Method START==============================");
		String SuccYn = "N";
		Map<String,String> map = new HashMap<>();
		map.put("content", email.getContent());
		MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
       msg.setText(email.getContent());
  //      msg.setText("본문");
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getRecipients()));
		try {
			mailSender.send(msg);
			SuccYn = "Y";
		}catch(NullPointerException e) {
			e.printStackTrace();
 		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return SuccYn;
	}
	
	
}
