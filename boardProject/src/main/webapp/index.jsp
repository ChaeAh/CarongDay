<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/cm/common.jsp"%>
<!DOCTYPE html>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>Carong Day</title>
</head>
<style>

html {
margin : 0;
height : 100%
overflow : hidden;
}
#container {
width : 100%;
height : 600px; 
padding : 30px;
}
* {
font-family: "Nanum Gothic", sans-serif;
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
  width: 15%;
  margin-bottom : 50px; 
}

/* Right column */
.rightcolumn {
  float: left;
  width: 85%;
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
    margin-bottom: 20px;
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

.firstMenu {
    font-size: 14px;
}
ul.mylist, ol.mylist {
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 250px;
    width: 100%;
}

ul.mylist li, ol.mylist li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
}
ul.mylist li:last-child,
ol.mylist li:last-child {
    border-bottom: 0px;
}
ul.mylist li:before,
ol.mylist li:before {
    content: ">";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 6px 0px;
}


ul.mylist li,
ol.mylist li {
    -webkit-transition: background-color 0.3s linear;
    -moz-transition: background-color 0.3s linear;
    -ms-transition: background-color 0.3s linear;
    -o-transition: background-color 0.3s linear;
    transition: background-color 0.3s linear;
}
  
ul.mylist li:hover,
ol.mylist li:hover {
    background-color: #f6f6f6;
}
    a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }


</style>
<script>


</script>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<body>
<div class="container">
	<div class="row">
	<jsp:include page="/WEB-INF/jsp/leftMenu.jsp"/>
 
	  <div class="rightcolumn">
	    <div class="card">
	      <h2>목록열기</h2>
	      <div class="fakeimg" style="height:auto;">Image</div>
	    </div>
	  </div>
	</div>
  </div>
</body>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</html>
