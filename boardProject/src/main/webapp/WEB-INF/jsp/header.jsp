<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
 font-family: a타이틀고딕1;
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
width:80%;
height:160px;
padding-left:30px;
padding-right:30px;
margin-left:100px;
margin-right:100px;
margin-top : 50px;
  overflow: hidden;
}
.logintab li{float: right; list-style: none; margin-right:10px; text-decoration: none;}
.logintab li::after{padding-left:10px;content:"|"}
.logintab li:first-child::after{content:"" }
.logintab li a {text-decoration: none;}
/* .logintab .loginMsg a:hover {
font-family: bold;
} */

div#navilogo{
margin-bottom:-30px;
margin-left : 15px;
margin-right:15px;
float:left;
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
  font-family: a타이틀고딕2;
padding-right : 20px;
padding-left :20px;
margin-right :4px;

    }
 .header {
  padding: 30px;
  text-align: center;
  background: white;
}
 


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
<div class="header" >
	
	<div id="topbar">
		<div id="loginbar">
			<ul class="logintab">
				<c:if test="${not empty sessionScope.userid}">
					<li class="loginMsg"><a href="logout.do">로그아웃</a></li>
					<li class="loginMsg"><a href="pjsMember.do">${sessionScope.userid }</a></li>
				</c:if>
				<c:if test="${empty sessionScope.userid}">
					<li class="loginMsg"><a href="login.do">로그인</a></li>
					<li class="loginMsg"><a href="pjsMemberRegister.do">회원가입</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div id="navibar">
		<div id="navilogi">
			<a href="../index.do">
				<img id="studylogo" src="/resources/images/studylogo.png" style="height:60px;border:2px; margin: 20px;">
			</a>
		</div>
		<div id="navicategory">
			<ul class="categorytab">
				<li class="category"><a href="">INDEX</a></li>
			<!-- 	<li class="category"><a href="./boardInq.do" >기원</a></li> -->
				<li class="category"><a href="../boardList.do" >게시판</a></li>
				<li class="category"  style="float:right; "><a href="" >더보기</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>