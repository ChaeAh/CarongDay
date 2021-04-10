<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project[Spring]</title>

<style type="text/css">

#layer_fixed
{
    height:35px;
    width:100%;
    color: #555;
    font-size:12px;
    position:fixed;
    z-index:999;
    top:0px;
    left:0px;
    -webkit-box-shadow: 0 1px 2px 0 #777;
    box-shadow: 0 1px 2px 0 #777;
    background-color:#ccc;
}

div#topbar{
width:100%;
margin:5px;
}
div#loginbar{
width:90%;
padding-left:15px;
padding-right:15px;
margin-left: 5px;
}
div#navibar{
width:700px;
height:100px;
padding-left:10px;
padding-right:30px;
margin-left:10px;
margin-right:auto;
}
.logintab li{float: right; list-style: none; margin-right:10px}
.logintab li::after{padding-left:10px;content:"|"}
.logintab li:first-child::after{content:""}
div#navilogo{
margin-bottom:-30px;
margin-left : 15px;
margin-right:0px;
float:left;
}
.categorytab li{float:left; list-style:none}
</style>
</head>
<body>
<div id="topbar">
	<div id="loginbar">
		<ul class="logintab">
			<c:if test="${not empty sessionScope.userid}">
				<li><a href="logout.do">로그아웃</a></li>
				<li><a href="pjsMember.do">${sessionScope.userid }</a></li>
			</c:if>
			<c:if test="${empty sessionScope.userid}">
				<li><a href="login.do">로그인</a></li>
				<li><a href="pjsMemberRegister.do">회원가입</a></li>
			</c:if>
		</ul>
	</div>
</div>
<%-- <div id="navibar">
	<div id="navilogi">
		<a href="index.do">
			<img id="studylogo" src="${pageContext.request.contextPath}/resources/images/studylogo.png" style="height:60px;border:2px;">
		</a>
	</div> --%>
	<!-- <div id="navicategory">
		<ul class="categorytab">
			<li><a href="./boardInq.do" style="padding-left:10px;padding-right:10px;">자유게시판</a></li>
			<li><a href="./chboard/chboardList.do" style="padding-left:10px;padding-right:10px;">[CH]게시판</a></li>
			<li><a href="" style="padding-left:10px;padding-right:10px;">카테고리3</a></li>
			<li><a href="" style="padding-left:10px;padding-right:10px;">카테고리4</a></li>
			<li><a href="" style="padding-left:10px;padding-right:10px;">카테고리5</a></li>
			<li><a href="" style="padding-left:10px;padding-right:10px;">카테고리6</a></li>
		</ul>
	</div> -->
</div>