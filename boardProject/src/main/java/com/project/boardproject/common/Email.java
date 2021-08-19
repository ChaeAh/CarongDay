package com.project.boardproject.common;

/***
 * @ClassName : Email.java
 * @Description : 이메일 관련 VO
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


public class Email {
	private String subject;
	private String content;
	private String recipients;
	
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
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
}
