<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">
div#bottombar{
width:100%;
margin-top : 300px;
padding:10px;
height:150px;
background-color:#D8D8D8;
}
.footer {
    width:100%;
    height: 180px;
    bottom: 0;
     border-top: 1px solid #e7e8ea;
	height:150px;
    display: block;
    width: 1500px;;
    font-size: 14px;
    line-height: 18px;
      text-align: left;
    background-color : white;
}
.ft-wrapper {
    padding-left: 10%;
    padding-right: 10%;
}
.ft-p {
    float: left;
    padding-top: 30px;
}

.ft-img {
    float: right;
    padding-top: 50px;
   }
   .footer_ul {
     list-style: none;
   }
.footer_ul li {
    float: left;
    padding-right: 10px;
    text-decoration: none;
}
.footer_ul li a { 
text-decoration: none;}

@media screen and (max-width: 800px) {
  .footer {
     padding: 0;
    width: 100%;
  }
}

/* .footer_zone {
    border-top: 1px solid #e7e8ea;
	height:150px;
    display: block;
    width: 1168px;
    font-size: 14px;
    line-height: 18px;
    margin: 0;
    padding: 0;
}
.footer_zone .footer_menu {
margin: 0 auto;
    padding-bottom: 30px;
    width: 1168px;
}

. footer_m {
   float: left;
    text-align: left;
}
.footer_m li {
    float: left;
    list-style: none;
    margin-top: 9px;
    }
 */
.bottombar a{color:#bbb; text-decoration:none;}
.bottombar a:hover{color:blue; text-decoration:underline;}

.groupinfo li{display:block; list-style:none; color:#bbb;padding-inline;margin-left:-20px}
div#infotab{
width:100%;
}
</style>


<body>
<!-- <div class="footer_zone" >
	<div class="footer_menu">
		 Copyright © CSB 2019 All Rights Reserved.
		<div class="footer_m">
			<ul>
			<li>
			 -CONNECT WITH US
			</li>
			</ul>
		</div>
	
	</div>
 </div> -->
 <div class="footer">
  <div class="ft-wrapper">
        <div class="ft-p">
            <p style="padding: 15px 0;">경기도 성남시 분당구 야탑/서현
            <br>
            Copyright © CSB 2019 All Rights Reserved. / Design by Chae</p>
        </div>
        <div class="ft-img">
            <ul class="footer_ul">
            	<li><a href= "" >About US</a></li>
            </ul>
        </div>
    </div>
     </div>
<!-- <div id="bottombar" class="bottombar">
	<div id="locationbar">
		<span style="padding-bottom: 50px;"> Copyright © CSB 2019 All Rights Reserved.</span>
	</div>
	-CONNECT WITH US
	<div id="infotab">
		<ul class="groupinfo">
			<li>방장명: 영차</li>
			<li>스터디 장소: 경기도 성남시 분당구 야탑/서현</li>
			<li>이메일: [임시]test@test.test</li>
		</ul>
	</div>
</div> -->
</body>
</html>