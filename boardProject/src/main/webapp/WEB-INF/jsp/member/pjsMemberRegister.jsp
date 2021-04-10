<%@ page language="java"     pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
<script type="text/javascript">
	function memberSave(){
		var userId =document.getElementById("userId").value;
		var pw=document.getElementById("pw").value;
		var name = document.getElementById("name").value;
		var email1 = document.getElementById("email1").value;
		if(userId==""){
			alert("아이디를 입력해주세요");
		} else if(pw==""){
			alert("패스워드를 입력해주세요");
		} else if(name==""){
			alert("이름을 입력해 주세요");
		} else {
			document.register.submit();
		} 
	}
</script>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="wrapper">
	<!-- header -->
	<div class="header">
	
	</div>
	<form:form name="register" action="register.do" method="post" modelAttribute="memberVO" onKeyPress="if(event.keyCode==13){memberSave();}">
		<table align="center" border=1px>
			<tr>
				<tr>
					<td>아이디</td>
					<td><form:input path="userId" placeholder="아이디 입력" /></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><form:password path="pw" placeholder="비밀번호 입력"/></td>
				</tr>
				<tr>	
					<td>이름</td>
					<td><form:input path="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>email 주소</td>
					<td><form:input path="email1"/></td>
				</tr>
		</table>
		<br/>
		<table align="center">
			<tr>
				<td align="center"><input type="button" value="저장" onClick = "memberSave()" onKeyPress="if(event.keyCode == 13){ memberSave(); }"></td>
			</tr>
			<c:if test="${not empty resultMessage}">
				<tr>
					<td ><font color=red>${resultMessage }</font></td>
				</tr>
			</c:if>
		</table>
	</form:form>

</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>