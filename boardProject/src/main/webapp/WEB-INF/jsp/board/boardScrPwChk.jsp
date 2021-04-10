<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>비밀글확인페이지</title>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
<script>

function fn_enter() {
	if(event.keyCode == 13) {
		fn_PwConfrim();
	}
}

function fn_PwConfrim() {
	if($('#scrPw').val() == '' || $('#scrPw').val() == null) {
		return;
	}
 	var f= document.frm;
	var idxTrg =f.idx.value;
	var scrPwTrg =f.scrPw.value;
 	$.ajax({
		url : "boardScrPwChkConfirm.do",
		type : "post",
		datatype : "text",
		data  : {idx : idxTrg, scrPw : scrPwTrg },
		success :function(data){
			if(data==1 ){
				onSuccess();
			}else {
				alert("비밀번호가 맞지 않습니다");
			}
		},
		error : function() {
			alert("실패");
		}
		
	});
 
}

function onSuccess() {
	fn_movePage("Detail.do?flag='T'", 'Y');
}

</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- Container -->
	<div class="Container">
	<!-- contents -->
	<form:form commandName="BoardVO" id="frm" name="frm" >
	<input type="hidden" id="title" name="title" value="${vo.title }"/>
	<input type="hidden" id="rgtId" name="rgtId" value="${vo.rgtId }"/>
	<input type="hidden" id="rgtDtm" name="rgtDtm" value="${vo.rgtDtm }"/>
	<input type="hidden" id="contents" name="contents" value="${vo.contents }"/>
	<input type="hidden" id="boardId" name="boardId" value="${vo.boardId }"/>
	<input type="hidden" id="scrYn" name="scrYn" value="${vo.scrYn }"/>
	<input type="hidden" id="idx" name="idx" value="${vo.idx }"/>
	<input type="hidden" id="readCnt" name="readCnt" value="${vo.readCnt }"/><%-- 
	<input type="text" id="srchKeyword" name="srchKeyword" value="${vo.srchKeyword }"/>
	<input type="text" id="srchtrg" name="srchtrg" value="${vo.srchtrg }"/> --%>
	<table width="700px;" id="frm" name="frm"  summary="비밀글확인"  cellspacing="0" cellpadding="5" align="center">
		<thead>
		<colgroup>
			<col width="50%">
			<col width="50%">
		</colgroup>
		</thead>
		<tbody>
		<tr>
			<th scope="col" >비밀번호를 입력해 주세요</th>
			<td>
			<input type="password" id="scrPw" name="scrPw" onkeypress="fn_enter()"/>
			
			<input type="button" onclick="fn_PwConfrim()" value="확인" />
			</td>
		</tr>
	</tbody>
	</table>
	</form:form>
	<!-- //contents -->
	</div>
	<!-- //Container -->
	
	<!-- // header -->
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>