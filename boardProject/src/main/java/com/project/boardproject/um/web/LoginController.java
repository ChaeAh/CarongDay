package com.project.boardproject.um.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.boardproject.um.service.UmUsrService;
import com.project.boardproject.um.service.UsrAcntVO;
import com.project.boardproject.um.service.UsrAcntVO;

@Controller
public class LoginController {

	@Autowired
	private UmUsrService umusrService;

	@RequestMapping("loginCheck")
	public String loginCheck(UsrAcntVO usrAcntVO, HttpSession session, Model model) {
		int pwCheck = umusrService.loginCheck(usrAcntVO);

		if (pwCheck == 0) {
			session.setAttribute("userid", usrAcntVO.getUsrId());
			System.out.println("로그인 성공");
			return "index";
		} else {
			model.addAttribute("resultMessage", "아이디/비밀번호를 확인해주세요");
			if (pwCheck == 1) {
				System.out.println("비밀번호 불일치");
				return "member/login";
			} else {
				System.out.println("존재하지 않는 아이디");
				return "member/login";
			}
		}
	}

	@RequestMapping("login")
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	@RequestMapping(value="member/callback", method =RequestMethod.GET)
	public String Callback(HttpSession session) {
		return "member/callback";
	}
	
	@RequestMapping(value="loginSession.do")
	public String loginSession(HttpSession session, @RequestParam(value="email") String email ,@RequestParam(value="name") String name) throws Exception {
		String tmpEmail[] = email.split("@");
		String email1 = tmpEmail[0];
		String email2 =tmpEmail[1];
		UsrAcntVO vo = new UsrAcntVO();
		/*vo.setUserId(email1);
		vo.setEmail1(email1);
		vo.setEmail2(email2);
		vo.setName(name);*/
//		umusrService.naverRgtUsr(vo);
		
		session.setAttribute("userid", email1);
		return "index";
	}

	@RequestMapping(value="naverLogin")
	public String naverLogin() {
		return "member/naverLogin";
	}
	
	@RequestMapping(value="member/naverCallback", method=RequestMethod.GET)
	public String naverCallback(HttpSession session) {
		return "member/naverCallback";
	}
	
	@RequestMapping(value="naverCallbackAfter" ,  method=RequestMethod.GET)
	public String naverCallbackAfter(HttpSession session, @RequestParam(value="access_token") String token,
			@RequestParam(value="refresh_token") String refreshtoken) throws Exception {
		String apiurl = "https://openapi.naver.com/v1/nid/me";
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		 URL url = new URL(apiurl);

		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", header);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
		 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		 while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
		}
		br.close();
		
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(res.toString());
		JSONObject jsonObj = (JSONObject)obj;
		JSONObject resObj = (JSONObject)jsonObj.get("response");
		 
		//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
		//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
		String naverCode = (String)resObj.get("id");
		String email = (String)resObj.get("email");
		String name = (String)resObj.get("name");
		String nickName = (String)resObj.get("nickname");
		
		System.out.println(naverCode);
		System.out.println(email);
		System.out.println(name);
		System.out.println(nickName);
		return "member/naverCallback";
	}
}
