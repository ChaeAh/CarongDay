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
	function memberLogin() {
		var log = document.loginform;
		log.action = "loginCheck.do";
		var userId = document.getElementById("userId").value;
		var pw = document.getElementById("pw").value;
		if (userId == "") {
			alert("아이디를 입력하세요");
		} else if (pw == "") {
			alert("비밀번호를 입력하세요");
		} else {
			log.submit();
		}
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

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
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
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<br />
	<br />
	<div></div>
	<div class="login-page">
		<div class="form">
			<form:form name="loginform" method="post"
				onKeyPress="if(event.keyCode==13){memberLogin();}"
				class="login-form">
				<input type="text" placeholder="ID" name="userId" id="userId" />
				<input type="password" placeholder="password" name="pw" id="pw" />
				<button onClick="memberLogin()"
					onKeyPress="if(event.keyCode==13){memberLogin();}">login</button>
				<br />
				<br />
				<div id="naverIdLogin" align="center"></div>
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
					width="300" />
				</a>
				<p class="message">
					Not registered? <a href="/pjsMemberRegister.do">Create an
						account</a>
				</p>
			</form:form>
			<input type="button" onclick="fn_NLogin();" value="로그인">
			<c:if test="${not empty resultMessage}">
				<font color=red>${resultMessage }</font>
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

