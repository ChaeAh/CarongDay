<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/header.jsp" %>

<div class="layer_fixed">
	<c:choose>
		<c:when test="${boardVO.idx==''}">
			<h1 align="center">등록페이지</h1>
		</c:when>
		<c:otherwise>
			<h1 align="center">수정페이지</h1>
		</c:otherwise>
	</c:choose>
		
	<br />
	<form:form id="frm" action="#" method="post" modelAttribute="boardVO">
		<table align="center" border=1px>
		<form:hidden path="idx" style="width:300px" readonly = "true"/>
		<form:hidden path="boardId" style="width:300px" readonly = "true"/>
			<tr>
				<td style="background-color:#E0E6F8;text-align:center">작성자</td>
				<td><form:input path="rgtId" style="width:640px" value="master" readonly = "true"/></td>
			</tr>		
			<tr>
				<td style="background-color:#E0E6F8;text-align:center">제목</td>
				<td><form:input path="title" style="width:640px"/></td>
			</tr>	
			<tr>
				<td style="background-color:#E0E6F8;text-align:center">내용</td>
				<td colspan="3"><form:textarea path="contents"
						style="width:640px; height:300px"/>
					</textarea></td>
			</tr>
			<!-- 
			<tr>
				<td>첨부파일</td>
				<td><input type="file"></td>
			</tr>
			-->
		</table>
	</form:form>
	<br />
	<br />

	<table align="center">
		<tr>
			<td>
			
				<c:choose>
					<c:when test="${boardVO.idx==''}">
						<input type="button" value="등록"
							onclick="fn_movePage('boardWrite.do','Y','해당 게시물을 등록 하시겠습니까?');">
					</c:when>
					<c:otherwise>
						<input type="button" value="수정"
							onclick="fn_movePage('boardModify.do','Y','해당 게시물을 수정 하시겠습니까?');">
					</c:otherwise>
				</c:choose>
	

				
			</td>
			<td><input type="button" value="취소"
				onclick="fn_movePage('boardInq.do');"></td>
		</tr>
	</table>
	
</div>
<%@include file="/WEB-INF/jsp/cm/footer.jsp" %>

