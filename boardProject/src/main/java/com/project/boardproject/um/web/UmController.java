package com.project.boardproject.um.web;

import java.security.SecureRandom;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.boardproject.cm.service.CmService;
import com.project.boardproject.cm.service.CmVO;
import com.project.boardproject.cm.web.CmController;
import com.project.boardproject.common.Email;
import com.project.boardproject.common.EmailUtil;
import com.project.boardproject.um.service.UmUsrService;
import com.project.boardproject.um.service.UsrAcntVO;

/***
 * @ClassName : UmController.java
 * @Description :  사용자 Controller
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.07.XX   김채아      최초생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */


@Controller
public class UmController {

	@Autowired
	private UmUsrService umUsrService;

	@Autowired
	private CmService cmService;
	
	@Autowired
	private EmailUtil emailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(UmController.class);

	
	@RequestMapping("pjsMemberRegister")
	public String memberRegister(@ModelAttribute UsrAcntVO UsrAcntVO, Model model) throws Exception {
		return "member/pjsMemberRegister";
	}
	
	@RequestMapping("/um/usrAcntRgt.do")
	public String usrAcntRgt(@ModelAttribute UsrAcntVO usrAcntVO, Model model, HttpServletRequest request) throws Exception {
		logger.debug("=================usrAcntRgt START=================");
		logger.info("파라미터 여부, usrAcntVO = {}" , usrAcntVO) ;
		System.out.println(usrAcntVO.toString());
		int result = umUsrService.insertUsrAcnt(usrAcntVO);
		// int result 값으로 확인
		// result>0 -> 유저 회원가입 성공 else 유저 회원가입 실패
			System.out.println("success값");
			String message= "";
			String moveUrl ="";
		if(result >0) {
			message = " Success";
			moveUrl ="member/pjsMember";
		}else {
			message = "Fail";
			moveUrl ="";
		}
		model.addAttribute("message", message);
		
		return moveUrl;
	}
	
	@ResponseBody 
	@RequestMapping("/um/usrEmailAuth.do")
	public String usrEmailAuth(@ModelAttribute UsrAcntVO usrAcntVO, Model model, HttpServletRequest request) throws Exception {
		logger.debug("usrEmailAuth START=======================================");
		String emailAddress= usrAcntVO.getUsrEmail1() + "@" +usrAcntVO.getUsrEmail2();
		System.out.println(emailAddress);
		SecureRandom random = new SecureRandom();
		int rn=0;
		String abc= "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		String authNum = "";
		String emailMsg = "EmailFail";
		
		for(int i=0; i<6; i++) {
			rn= random.nextInt(abc.length()-1);
			if(rn+1 < abc.length())
				authNum +=abc.substring(rn, rn+1);
		}
		usrAcntVO.setAuthNum(authNum);
		
		Email email = new Email();
		email.setContent("인증번호를 입력해주세요 : " + authNum);
		email.setSubject("채채쓰의 인증번호");
		email.setRecipients(emailAddress);
		String SuccYn = emailSender.SendMail(email);
		logger.debug("compl>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		//인증번호, 아이디 DB INSERT
	//	umUsrService.insertUsrAcnt(usrAcntVO);
		if("Y".equals(SuccYn)) {
			usrAcntVO.setEmailAuthYn("N");
			umUsrService.insertUsrEmailSuc(usrAcntVO);
			emailMsg = "EmailSuccess";
		}
		System.out.println("Return 될 메시지 :" + emailMsg);
		return emailMsg;
	}
	
	@ResponseBody 
	@RequestMapping("/um/usrEmailFinAuth.do")
	public int usrEmailFinAuth(@RequestParam Map<String, Object> param, Model model, HttpServletRequest request) throws Exception {
		logger.debug("usrEmailFinAuth START=======================================");
		
		String emailAuthNum = (String) param.get("emailAuthNum");
		String usrId= (String) param.get("usrId");
		
		int result = umUsrService.umUsrEmailFinAuth(emailAuthNum,usrId);
		/*if(result == 0) {
			emailMsg = "EmailSuccess";
		}*/
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/um/umUsrChkId.do")
	public int umUsrChkId(@ModelAttribute UsrAcntVO usrAcntVO, Model model, HttpServletRequest request) throws Exception {
		logger.debug("umUsrChkId START");
		int cnt = umUsrService.umUsrChkId(usrAcntVO);
		
		return cnt;
	}
	
	
	@RequestMapping("register")
	public String pjsboardRegister(UsrAcntVO usrAcntVO, Model model) {
	/*	int result = memberService.memberRegister(UsrAcntVO);
		if (result == 0) {
			System.out.println("홰원가입 성공");
			return "index";
		} else {
			System.out.println("회원가입 실패");
			model.addAttribute("resultMessage","이미 있는 아이디입니다.");
			return "member/pjsMemberRegister";
		}*/
		return "";
	}
	
	@RequestMapping("pjsMember")
	public String memberInfo(UsrAcntVO UsrAcntVO, Model model, HttpSession session) {
		
		String[] cmId = {"CHAE001","CHAE002"};
		
		//전화번호 
		List<CmVO> telList = cmService.selCmCode2(cmId[0]);
		model.addAttribute("telList", telList);
		
		//이메일
		List<CmVO> emailList = cmService.selCmCode2(cmId[1]);
		
		model.addAttribute("emailList", emailList);
		
		System.out.println("pjsMember START!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	
		
	/*	String userId=(String)session.getAttribute("usrId");
		UsrAcntVO=memberService.getMember(userId);
		model.addAttribute("UsrAcntVO", UsrAcntVO);*/
		return "member/tempregister";
	}
	
	@RequestMapping("memberModify")
	public String memberModify(UsrAcntVO UsrAcntVO, Model model, HttpSession session) {
//		UsrAcntVO.setUserId((String)session.getAttribute("usrId"));
	/*	int result = memberService.memberModify(UsrAcntVO);
		if(result==0) {
			System.out.println("회원수정 성공");
			model.addAttribute("resultMessage", "정보가 수정되었습니다.");
			return "member/pjsMember";
		}
		else {
			model.addAttribute("resultMessage", "비밀번호가 일치하지 않습니다.");
			System.out.println("회원수정 실패");
			return "member/pjsMember";
		}*/
		return "";
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(Model model, HttpSession session) {
		String userId=(String)session.getAttribute("userid");
		session.invalidate();
		int result = umUsrService.memberDelete(userId);
		return "index";
	}
}
