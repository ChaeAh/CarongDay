package com.project.boardproject.common;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.boardproject.um.service.UmUsrService;
import com.project.boardproject.um.service.UsrAcntVO;
import com.project.boardproject.um.service.impl.UmUsrServiceImpl;

public class LoginSessionManager implements HttpSessionBindingListener {

	private static final Logger logger = LoggerFactory.getLogger(LoginSessionManager.class);

	private static LoginSessionManager loginSessionManager = null;
	
	
	//로그인 한 접속자를 담는 해시테이블
	// 해시테이블 : 원하는 값을 바로바로 찾을 수 있는 장점
	private static  Hashtable sessionVO = new Hashtable<>();
	
	// 기본 생성자 사용 불가능 private
	private LoginSessionManager() {
		
	}
	
	//singLetion pattern
	public static synchronized LoginSessionManager getInstance() {
		if(loginSessionManager == null) {
			loginSessionManager = new LoginSessionManager();
		}
		return loginSessionManager;
	}
	
	
// 세션이 연결될 때마다 호출되는 메소드
//	 HashTable에 세션과 접속자 아이디 저장
//	 HttpSession #setAttribute(name, value) setAttribute 메소드 호출시에 name이 처음으로 바인딩 되는 것이면 자동 호출
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
			logger.debug("LoginSession is START");
			sessionVO.put(event.getSession(), event.getName());
			logger.debug(event.getName() + " is Login");
			logger.debug("Total Login User:" + getUserCount());
			
	}

//	 입력받은 아이디를 해시테이블에서 삭제
//	 사용자 아이디를 받음
	public void removeSession(String usrId) {
		Enumeration e = sessionVO.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession) e.nextElement();
			if(sessionVO.get(session).equals(usrId)) {
				System.out.println(usrId + "여기 안타니!");
//				세션이 비워질때 HttpSessionBindListener를 구현하는 클래스의 valueUnbound() 함수 호출
				session.invalidate();
			}
		}
	}
	
	public boolean isUsing(String usrId) {
		System.out.println(usrId + " isUsing usrId");
		System.out.println(sessionVO.containsValue("usrId") + "sUsing ");
		return sessionVO.containsValue(usrId);
	}
	
	public boolean isValid(UsrAcntVO usrAcntVO, UmUsrService service) throws Exception {
		if(service.loginProcess(usrAcntVO) == 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
//	 로그인을 완료한 사용자 아이디를 세션에 저장
	public void setSession(HttpSession session, UsrAcntVO usrAcntVO, UmUsrService service) {
		session.setAttribute("usrId", usrAcntVO.getUsrId());
	}
	
	public int getUserCount() {
		return sessionVO.size();
	}
	
//	 현재 접속중인 모든 사용자 아이디 출력
	public void printLoginUsers() {
		Enumeration e = sessionVO.keys();
		HttpSession session = null;
		int count= 0;
		while(e.hasMoreElements()) {
			session = (HttpSession) e.nextElement();
			logger.debug("printLoginUsers :" +session.getAttribute("usrId"));
			logger.info((++count) +". login user : " + sessionVO.get(session));
		}
 	}
	
	
//	 현재 접속중인 모든 사용자 리스트 리턴
	public Collection getUsers() {
		Collection col = sessionVO.values();
		return col;
	}
	
//	 기존 로그인된 계정이 있을 경우 로그아웃 처리 후 세션 설정
	public boolean loginManaging(UsrAcntVO usrAcntVO, HttpSession session, UmUsrService service) throws Exception {
		logger.debug("========================LoginManaging START");
		
		if(!isValid(usrAcntVO, service)) {
			return false;	// 로그인 실패
		}
		
		logger.debug("========================LoginManaging DEBUG START");
		logger.info("로그인 시도하려는 사용자 : " + usrAcntVO.getUsrId());
		printLoginUsers();
		logger.debug("========================LoginManaging DEBUG END");
		
		if(isUsing(usrAcntVO.getUsrId())) {
			removeSession(usrAcntVO.getUsrId());
		}
		
//		자신의 세션에 로그인 메니저 넣기
		setSession(session, usrAcntVO, service);
		String sessionValue = "";
		Enumeration e = session.getAttributeNames();
		while(e.hasMoreElements()) {
			sessionValue = (String) e.nextElement();
			logger.debug( sessionValue + " = " + session.getAttribute("usrId").hashCode());
			logger.debug(session.getId() +"ddd" + session.getAttribute("usrId"));
		}
		return true;
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		sessionVO.remove(event.getSession());
	}
	
	
	
}
