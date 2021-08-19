<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel ="shortcut icon"  href ="/resources/images/favicon.ico" type="image/x-icon" />

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR|ZCOOL+QingKe+HuangYou');
 */
* {
	margin:0;
	padding:0;
	color:#000;
	/* //font-family: 'ZCOOL QingKe HuangYou', cursive; */
	box-sizing: border-box;
	font-family: "Nanum Gothic", sans-serif;
}

/* .fn-font {
font-family: "Nanum Gothic", sans-serif;
} */

ul {
	list-style: none;
}

a {
	text-decoration: none;
	outline: none;
}

.container {
	width:1440px;
	margin:0 auto;
	 
}

header {
	width:100%;
	height:80px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	 
}

header > h2 {
	margin-left:20px;
}

header > nav {
	width:600px;
	height:100%;

}

header ul {
	width:100%;
	height: 100%;
	display: flex;
	justify-content: space-between;

}

header ul > li {
	font-size:20px;
	height: 100%;
	display: flex;
	align-items: center;
    font-size : 15px;
}

.logintab li{float: right; list-style: none; margin-right:10px; text-decoration: none;}
.logintab li::after{padding-left:10px;content:"|"}
.logintab li:first-child::after{content:"" }
.logintab li a {text-decoration: none;}
/* .logintab .loginMsg a:hover {
font-family: bold;
} */

.joinjoin{
margin-bottom:-10px;
margin-left : 17px;
margin-right:15px;
float:right;
}

.join_login, .join_join {
padding-right :15px;
padding-left : 5px;
font-size: 12px;
}
/* div#navicategory {
float:right;
}
.categorytab li{float:left; list-style:none} */
.categorytab  {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color:  white;
  border-top :  2px solid #e7e8ea;
  border-bottom : 2px solid #e7e8ea;
   border-top-left-radius:20px;
 border-top-right-radius:20px;
 border-bottom-right-radius:20px;
 border-bottom-left-radius:20px;
  display: block;
  text-align: center;
  
  
  
}
#navicategory {
width :100%;
}
.categorytab li a {
	color: black; 
	-webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
   font-family: Dotum,'돋움',Helvetica,sans-serif;
padding-right : 20px;
padding-left :20px;
margin-right :4px;

    }
 .header {
  padding: 3px;
  text-align: center;
  background: white;
}
 
.loginMsg {
    cursor: pointer;}

.category {
  float: left;
}

.category a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.category a:hover {
font-weight: bold;
} 
 
</style>
</head>
<script>



</script>
<body>
<div class="container">
		<div class="joinjoin">
					<c:if test="${not empty sessionScope.usrId}">
						<span class="join_login"><span class="htmlUsrNm"></span>님 환영합니다.
						<a><span onClick="fn_logOut()">LOGOUT</span></a>
						</span>
					</c:if>
					<c:if test="${empty sessionScope.usrId }">
					<span class="join_join"><a href="pjsMember.do">JOIN</a></span>
					<span class="join_login"><a href="login.do">	${usrId} LOGIN</a></span>
					</c:if>
				</div>
		 <form id="loginForm" >
		 
		 </form>
		<header>
			<a href="/index.jsp">
				<img id="studylogo" src="/resources/images/CHAE.png" style="width:100px; height : 100px;"> 
			</a>
			<nav>
				<ul>
					<li><a href="#">Introduce</a></li>
					<li><a href="">About</a></li>
					<li><a href="">Dev tools</a></li>
					<li><a href="">Support</a></li>
				</ul>
			</nav>
 	 </header>
	</div>
</body>
</html>