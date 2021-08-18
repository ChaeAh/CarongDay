<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
</head>
<style>
 img , button{ display: block; margin: 0px auto; }
 button {width: "100px"}

</style>
<script>
function selectBackBtn() {
	location.href ="index.jsp";
}

</script>
<body>

<a onclick="selectBackBtn()">
<img id="500" src="/resources/images/ERROR_500.png" style="cursor:pointer;">
</a>

</body>

</html>
