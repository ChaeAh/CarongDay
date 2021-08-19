<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@include file="/WEB-INF/jsp/cm/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>left Menu</title>
</head>
<script>

function fnOnSuccessFindUsrNm(data) {
	$(".htmlUsrNm").html(data.usrNm);
}
</script>
<body>
		<input type="hidden" id="usrId" value="${usrId}"/>
 	 <div class="leftcolumn">
 		 <div class="card">
		  	<b><span class="htmlUsrNm"></span></b><br><br>
		  	<p class="firstMenu">
		  	<img src="/resources/images/etc/clipboard_write.png" style="height:13px" >  <a href="../boardRegister.do" >글쓰기</a> / 관리</p>
 		 </div>
	    <div class="card">
	      <h2><img src="/resources/images/etc/clipboard_setting.png" style="height:20px" > Setting</h2>
	       <ul class="mylist">
			    <li><a href="../boardList.do" >글목록</a></li>
			    <li><a href="../boardList.do" >카테고리 목록</a></li>
		    </ul>
	    </div>
	    <div class="card">
	    <h2><img src="/resources/images/etc/clipboard_activity.png" style="height:20px" > Activity </h2>
	    <ul class="mylist">
		    <li>블로그 이웃 00명</li>
		    <li>글 보내기</li>
		    <li>글 스크랩 00회</li>
	    </ul>
	    </div>
	     <div class="card">
	   		 <span>TODAY 00 TOTAL 000</span>
	    </div>
  </div>
</body>
</html>