<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
  <link href="/resources/css/style.css" rel="stylesheet"/>

<title>글 상세 보기</title>
<style>

form {
    margin-left : 130px;
    margin-top : 80px;
}
  table {
    width: 80%;
    border-top: 1px solid #808080;
    border-collapse: collapse;
   display: table;
   clear:both; 
  }
  th, td {
    border-bottom: 1px solid #737373;
    padding: 10px;
    text-align: left;
  }
  
  th {
  background: #d3d3d3;
  }
  
  button {
  text-align:  right;
  }
</style>
</head>
<script>

/* 		var checkArr =new Array();
		$("input[type='checkBox']:checked").each(function() {
			checkArr.push($(this).attr("data-cartNum"));
		});
		alert(checkArr);		 
 */
 function fn_Delete() {
	var form = $('#frm').serialize();
	
	var msg = confirm("삭제를 누르시면 복구할수 없습니다. 삭제하시겠습니까?");
	if(msg ==true) {
		$.ajax({
			url : "boardDelete.do",
			type : "post",
			datatype:"json",
			data :  form,
			success : function(data) {
				if(data ==1) {
				  location.href = "boardList.do";
				}
			},
			error : function() {
				alert("삭제하는데 오류가 발생하였습니다.");
			}
			
		});
	}else {
		return;
	}
	
}
</script>
<body>
<!-- wrapper -->
<jsp:include page="../header.jsp"/>
	<!-- Container -->
	<div class="container">
	<div class="row">
 		<jsp:include page="/WEB-INF/jsp/leftMenu.jsp"/>
	<!-- contents -->
	 <div class="rightcolumn">
	    <div class="card">
	     <div class="container managergrounp" id="container" name="container" >
            <h3>글 상세조회 <span class="txt_small">(이메일 뉴스레터를 발송할 대상 수신자 목록을 선택하세요.)</span> </h3>
            <hr>

	<form:form commandName="BoardVO" id="frm" name="frm" >
	<input type="hidden" id="title" name="title" value="${vo.title}"/>
	<input type="hidden" id="rgtId" name="rgtId" value="${vo.rgtId}"/>
	<input type="hidden" id="rgtDtm" name="rgtDtm" value="${vo.rgtDtm}"/>
<%--  	<input type="hidden" id="contents" name="contents" value="${vo.contents}"/> --%>
	<input type="hidden" id="boardId" name="boardId" value="${vo.boardId}"/>
	<input type="hidden" id="scrYn" name="scrYn" value="${vo.scrYn}"/>
	<input type="hidden" id="scrPw" name="scrPw" value="${vo.scrPw}"/>
	<input type="hidden" id="idx" name="idx" value="${vo.idx}"/>
	<input type="hidden" id="readCnt" name="readCnt" value="${vo.readCnt}"/>
	<table>
			<col width="15%">
			<col width="75%">
		<tbody>
		<tr>
			<th scope="col" >제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td>${vo.rgtId }</td>
		</tr>
		<tr>
			<th scope="col">내용</th>
			<td >${vo.contents }</td>
		</tr>
		<tr>
			<th scope="col">첨부파일</th>
			<td ></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;">
				<input type="button"class="button"  id="" name="" value="목록으로"  onclick="fn_movePage('boardList.do')"/>
				<c:if test="${vo.rgtId eq usrId}">
					<input type="button" class="button" id="" name="" value="수정"  onclick="fn_movePage('boardUpdList.do','Y');"/>
					<input type="button" class="button" value="삭제" onclick="fn_Delete();">
				</c:if>
			</td>
		</tr>
		<!-- Paging -->
	</tbody>
	</table>
	</form:form>
	<!-- //contents -->
	  </div>
	</div>
	</div>
	<!-- //Container -->
	</div>
	</div>
	<!-- // header -->
	
	<jsp:include page="../footer.jsp"/>
<!-- //wrapper -->
</body>

</html>