<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>

<style>
.wrapper {
	 width: 1400px;
  margin: 0 auto;
  
}
	.Container {
	width : 1400px;
height : 500px; 
padding : 30px;
	}

	.listTable {
	text-align: center;
	}
	.wrapper {
	width: 1400px;
  margin: 0 auto;
  }
.button {
    background-color: white;
    border:  none;
    font-family: a타이틀고딕3;
    text-decoration: none;
    padding: 10px 10px;
    margin: 1px;
     border-top-left-radius:20px;
 border-top-right-radius:20px;
 border-bottom-right-radius:20px;
 border-bottom-left-radius:20px;
 background: #b7c7e5;
 }
.button:hover {
   background: #93A9D1;
   color : white;
}
#msgContent {
text-align: center;
}
</style>
<body>
<script type="text/javascript">

$(document).ready(function() {

	$('#scrYn').click(function() {
 	if($('#scrYn').prop("checked")) {
 		$('#scrPw').attr("disabled", false);
	}else {
		$('#scrPw').attr("disabled", true);
		$('#scrPw').val("");
	} 
	});
	
	$('#scrPw').keypress(function (event) { 
		if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { 
			event.preventDefault(); 
			} 
		});


});

function fn_Register() {
	var f= document.frm;
	
	if($('#title').val() == '') {
	    alert("아이디를 입력하세요");
	    $('#title').focus();
	    return;
	}
		if($('#rgtId').val() == '') {
	    alert("글쓴이를 입력하세요");
	    $('#rgtId').focus();
	    return;
	}
	if($('#contents').val() == '') {
	    alert("내용을 입력하세요");
	    $('#contents').focus();
	    return;
	}
	f.action="boardInsert.do";
	f.submit();
}

</script>
<!-- wrapper -->
<jsp:include page="../header.jsp"/>
	<!-- Container -->
	<div class="wrapper">
	<!-- contents -->
	<div id="msgContent" >
	<c:choose>
	    <c:when test="${flag == '등록'}">
	    <h1>등록 페이지</h1>
		</c:when>
		<c:otherwise>
	    <h1>수정 페이지</h1>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="Container">
	<form:form commandName="BoardVO" id="frm" name="frm" method="post" >
	<c:choose>
		<c:when test="${not empty BoardVO.idx }">
			<input type="hidden" id="idx" name="idx" value="${BoardVO.idx }"/>
		</c:when>
	</c:choose>
	<input type="hidden" id="boardId" name="boardId" value="free"/>
	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	<!-- form:input path= "" id랑 name을 맞춰준다 -->
	<table width="700px;" id="insertTable" name="insertTable"  summary="게시물입니다" border="1" cellspacing="0" align="center">
		<thead>
		<colgroup>
			<col width="40%">
			<col width="20%">
			<col width="30%">
			<col width="20%">
		</colgroup>
		</thead>
		<tbody>
		<tr>
			<th scope="col" >제목</th>
			<td><input type="text" id="title" name="title" maxlength="100" size="50" value="${BoardVO.title }"/></td>
		<%-- 	<td><form:input path="title" maxlength="100" size="50"/></td> --%>
			<th scope="col">작성자</th>
				<td><input type="text" id="rgtId" name="rgtId"  value="${userid }" readonly="readonly"/></td>
	<%-- 		<td><form:input path="rgtId"   /></td> --%>
		</tr>
		<tr>
			<td colspan="4">
				<span style="padding: 10px; padding-left: 20px;"><strong>비밀글</strong>	<span>
			<c:choose>
				<c:when test="${BoardVO.scrYn eq 'N' || BoardVO.scrYn eq '' || BoardVO.scrYn == null }">
					<input type="checkBox" id="scrYn" name="scrYn" value="Y" />
					<span style="padding: 10px;">비밀번호</span>
					<input type="password" id="scrPw" name="scrPw"maxlength="4" disabled="disabled" />
				</c:when>
				<c:otherwise>
					<input name="scrYn" id="scrYn"  type="checkbox"  value="Y" checked="checked" >
					<span style="padding: 10px;">비밀번호</span>
					<input type="password" id="scrPw" name="scrPw" value="${BoardVO.scrPw }" maxlength="4"  />
				</c:otherwise>
			</c:choose>
			
		
			</td>
		</tr>
		<tr>
			<th scope="col">내용</th>
			<td colspan="3"><textarea  cols="74" rows="20" id="contents" name="contents" style="overflow-y:scroll">${BoardVO.contents } </textarea></td>
		</tr>
		<tr>
			<th scope="col">첨부파일</th>
			<td colspan="3"><input type="file" id="attachFile" name="attachFile"  value="" /></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right">
			 <c:if test="${flag == '등록'}">
				<input type="button" class="button" id="" name="" value="등록"  onclick="fn_movePage('boardInsert.do','Y')"/>
			</c:if>
			<c:if test="${flag == '수정' }">
				<input type="button" class="button" id="" name="" value="수정"  onclick="fn_movePage('boardUpdBoard.do','Y');"/>
	  	  </c:if>
				<input type="button" class="button" id="" name="" value="취소"  onclick="history.back()"/>
			</td>
		</tr>
		<!-- Paging -->
	</tbody>
	</table>
	</form:form>
	</div>
	<!-- //Container -->
	</div>
	<!-- // header -->
	
	<jsp:include page="../footer.jsp"/>
<!-- //wrapper -->
</body>
</html>