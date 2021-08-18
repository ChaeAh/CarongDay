<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<%@include file="/WEB-INF/jsp/cm/common.jsp"%>
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script type="text/javascript">

$(document).ready(function () {
	$('#usrId').focus();
	
/* 	$('#password').keydown(function(key){
		if(key.keyCode == 13) {
			memberLogin();
		}
	}); */
	
});
	function memberLogin() {
		var form = $('#usrAcntVO').serialize();
		
		var usrId = $('#usrId').val();
		var usrPw = $('#usrPw').val();
		
		if(usrId != null && usrId != "") {
			if(  usrPw != null && usrPw != "") {
				$.ajax({
					url : "loginCheck.do",
					type : "post",
					datatype : "json",
					data : form,
					async : true,
					success : function(obj) {
						if(obj ==0){
							location.href = "boardList.do";
						}else if(obj == 1) {
							$('#error_next_box').css("display","block");
							$('#error_next_box').html("비밀번호가 일치하지 않습니다.");
						}else if(obj == 2) {
							$('#error_next_box').css("display","block");
							$('#error_next_box').html("아이디 또는 비밀번호가 일치하지 않습니다.");
						}else if(obj == 3) {
							$('#error_next_box').css("display","block");
							$('#error_next_box').html("휴면 계정입니다.");
						}else if(obj == 4) {
							$('#error_next_box').css("display","block");
							$('#error_next_box').html("이메일이 인증되지 않았습니다.");
						}
						
					//	memberLogin_Callback(data);
					},
					error:function(request,status,error){
					 // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 }

				});
				
			}else {
				alert("비밀번호를 입력해주세요.");
				$('#usrPw').focus();
				return;
			}
			
		}else {
			alert("아이디를 입력해주세요.");
			$('#usrId').focus();
			return;
		}
	}
	
	function enterKey() {
		if(window.event.keyCode == 13) {
			memberLogin();
		}
	}
	
	function memberLogin_Callback(obj) {
/*
 0 : 로그인 성공
 1:  비밀번호 불일치
 2: 정보 없음
 3 : 사용여부 N
 4 : 이메일 인증 N
 5, 6 : 비밀번호가 3개월이상 만료 또는 빔리번호 초기화 (이페이지로 들어오지 않음)
 
*/

	
	}
</script>
</head>
<style>
.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

.form .register-form {
	display: none;
}

body {
	/*   background: #76b852; /* fallback for old browsers */
	/* background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F); */
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
 <%
    String clientId = "9iK41XPuMNKiA_HdjHl_";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8808/member/naverCallback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    apiURL += "&auth_type=reprompt";
    session.setAttribute("state", state);
 %>
<body>
	<jsp:include page="../header.jsp"/>

	
	<div class="login-page">
		<div class="form">
			<form:form id="usrAcntVO" name="usrAcntform" class="login-form" action = "">
				<input type="text" placeholder="ID" name="usrId" id="usrId" />
				<input type="password" placeholder="password" name="usrPw" id="usrPw"  onkeyup="enterKey();"/>
				<button type="button" onClick="memberLogin()" id="loginBtn" >login</button>
				<br />
				<span  id="error_next_box"   class="error_next_box" style="display:none; text-align: left;"></span>
				<br />
				<div id="naverIdLogin" align="center">
				  <a href="<%=apiURL%>"><img height="42"  width="270" src="/resources/images/main/loginBtn.png"/></a>
					<br />
				</div>
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
					width="270" />
				</a>
				<p class="message">
					Not registered? <a href="/pjsMemberRegister.do">Create an
						account</a>
				</p>
			</form:form>
	<!-- 		<input type="button" onclick="fn_NLogin();" value="로그인"> -->
			<c:if test="${not empty resultMessage}">
			</c:if>
		</div>
	</div>
	<br />
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->

	<!-- 네이버아디디로로그인 초기화 Script -->
	<script>
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('8e984f12524b7f8bc7ff6b287c131a08');
		// 카카오 로그인 버튼을 생성합니다.
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : '/index.do',
						success : function(res) {
							alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
							alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
							console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
							console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
							console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
							// res.properties.nickname으로도 접근 가능 )
							console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
						}
					})
				},

				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};
	</script>

	<form id="frm" name="frm">
		<input type="hidden" id="userId" name="userId" value="${email}" />
	</form>
</body>
</html>

