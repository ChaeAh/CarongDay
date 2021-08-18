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
}

.fn-font {
	font-family: 'Noto Sans KR', sans-serif;
}

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
}


/* * {
/*    font-family: "Roboto", sans-serif;
 }
#topbar{
text-align : center;
width:100%;
}
#loginbar{
width:100%;
padding-left:15px;
padding-right:15px;
margin-left: 5px;
margin-right: 5px;
}
#navibar{
width:100%;
height : 150px;
/* padding-left:30px;
padding-right:30px;
margin-left:100px;
margin-right:100px;
margin-top : 50px;  */
/*  overflow: hidden;

}

#logo {
width:100%;
/* float : left; */
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
<body>
<div class="container">
		<div class="joinjoin">
					<span class="join_join"><a href="pjsMember.do">JOIN</a></span>
					<c:if test="${not empty sessionScope.userid}">
					</c:if>
				
					<span class="join_login"><a href="login.do">	${usrId} LOGIN</a></span>
				</div>
		<header>
		
			
			<a href="/index.jsp">
				<img id="studylogo" src="/resources/images/CHAE.png" style="width:100px; height : 100px;"> 
				<!-- style="height:120px;border:2px; margin: 20px;" -->
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
<%-- <div class="header" >
	
	<div id="topbar">
		<div id="loginbar">
			<div id="logo">
			<a href="/index.jsp">
				<img id="studylogo" src="/resources/images/CHAE.png" style="width:100px; height : 80px;"> 
				<!-- style="height:120px;border:2px; margin: 20px;" -->
			</a>
			</div>
			<ul class="logintab">
				<c:if test="${not empty sessionScope.userid}">
					<li class="loginMsg"><a href="logout.do">로그아웃</a></li>
					<li class="loginMsg"><a href="pjsMember.do">${sessionScope.userid }</a></li>
				</c:if>
				<c:if test="${empty sessionScope.userid}">
					<li class="loginMsg"><a href="login.do">LOGIN</a></li>
					<li class="loginMsg"><a href="pjsMember.do">JOIN</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- <div id="navibar">
		<div id="navilogo">
			<a href="/index.jsp">
				<img id="studylogo" src="/resources/images/CHAE.png" style="width:100px; height : 100px;"> 
				
				style="height:120px;border:2px; margin: 20px;"
			</a>
		</div> -->
		<div id="navicategory">
			<ul class="categorytab">
				<!-- <li class="category"><a href="">INDEX</a></li>
				<li class="category"><a href="./boardInq.do" >기원</a></li>
				<li class="category"><a href="../boardList.do" >게시판</a></li>
				<li class="category"  style="float:right; "><a href="" >더 보기</a></li> -->
			</ul>
		</div>
	</div> --%>
</body>
</html>