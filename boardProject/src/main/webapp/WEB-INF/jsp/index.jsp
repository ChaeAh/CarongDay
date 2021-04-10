<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 
/*
 * 파일명 : Index.jsp
 * 용도    : 사용자 메인
 * 작성자 : mintchoco91
 * 변경일 : 2019/07/22
 */
 -->
<!DOCTYPE html>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<title>임시 메인페이지</title>
</head>
<style>
#container {
width : 1400px;
height : 200px; 
padding : 30px;
}
* {
  box-sizing: border-box;
}
body {
 font-family: Arial;
  padding: 10px;
  background: #f1f1f1;
  }
  
/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 75%;
}

/* Right column */
.rightcolumn {
  float: left;
  width: 25%;
  background-color: #f1f1f1;
  padding-left: 20px;
}

/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}

</style>
<script>


</script>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>TITLE</h2>
      <h5>Made 2019,</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Hello I'm Dream of leaving Company</p>
      <p>So, Cheer me up Please!</p>
    </div>
    <div class="card">
      <h2>TITLE HEADING</h2>
      <h5>Made 2019,</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>About Us</h2>
      <div class="fakeimg" style="height:100px;">Image</div>
      <p>Design By W3CSchool Thank you!</p>
      <p>I'm ChaeChae </p>
    </div>
    <div class="card">
      <h3>Popular Post</h3>
      <div class="fakeimg">여기다가 인기있는 게시물 쓸거임</div>
    </div>
    <div class="card">
      <h3>Follow Me</h3>
      <p>Some text..</p>
    </div>
  </div>
</div>


<div id="container">
	<!-- <a href="./kwboardInq.do">[기원]게시판이동</a><br/><br/>
	<a href="./chboard/chboardList.do">[채아]게시판이동</a><br/><br/> -->
	
	<%-- <c:if test="${not empty memberVO.userId}">
		<a href="pjsMember.do?userId=${memberVO.userId }">[임시]${memberVO.userId }</a>
		<a href="logout.do">로그아웃</a>
	</c:if>
	<c:if test="${empty memberVO.userId}">
		<a href="login.do">로그인</a>
	</c:if>
   --%>
   </div>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
