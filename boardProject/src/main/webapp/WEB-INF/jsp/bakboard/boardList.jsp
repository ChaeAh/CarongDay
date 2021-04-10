<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/header.jsp" %>

<div class="layer_fixed">
<style>
	.Container {
		margin: 0 auto;
		padding :0;
		overflow: hidden;		
	}
	.listTable {
	text-align: center;
	}
	.wrapper {
	 width: 800px;
  margin: 0 auto;
  border: 1px solid #aaa;
  
}
  .header {
  padding:40px 10px;
  text-align: center;
  background: #eee;
  margin-bottom: 20px;
}
.footer {
  text-align: center;
  border-top: 1px solid #aaa;
  margin: 20px 20px 0;
  font-size: 12px;
}
tr:hover {
background-color: #fffcde;
cursor :pointer;}

}
</style>
	<table align="center" class="listTable" border="1" cellspacing="0" cellpadding="5" align="center">
		<tr style="background-color:#eee;text-align:center">
			<td style="width:40px;">선택</td>
			<td style="width:60px;">글번호</td>
			<td style="width:600px;">제목</td>
			<td style="width:60px;">글쓴이</td>
			<td style="width:60px;">작성일</td>
		 	<td style="width:40px;">조회</td>
			<!-- <td>첨부파일</td>-->
		</tr>
		
		<c:forEach var="boardVOArr" items="${boardVOArr}">
			<tr onmouseover="this.style.background='#E0ECF8'" onmouseout="this.style.background='white'">
				<td style="width:40px;text-align:center"><input type="checkbox" name="idx" value="${boardVOArr.idx}"></td>
				<td style="width:60px;text-align:center;cursor:hand;" onclick="fn_movePage('boardDetail.do?idx=${boardVOArr.idx}')">${boardVOArr.idx}</td>
				<td style="width:600px;cursor:hand" onclick="fn_movePage('boardDetail.do?idx=${boardVOArr.idx}')">${boardVOArr.title}</td>
				<td style="width:60px;text-align:center";cursor:hand" onclick="fn_movePage('boardDetail.do?idx=${boardVOArr.idx}')">${boardVOArr.rgtId}</td>
				<td style="width:60px;text-align:center";cursor:hand" onclick="fn_movePage('boardDetail.do?idx=${boardVOArr.idx}')">${boardVOArr.rgtDtm}</td>
				<td style="width:40px;text-align:center;cursor:hand" onclick="fn_movePage('boardDetail.do?idx=${boardVOArr.idx}')">${boardVOArr.readCnt}</td>
				<!-- <td>첨부파일</td> -->
			</tr>
		</c:forEach>
	</table>
	
	<br/>
	
	<form id="frm" action="#" method="get">
		<table align="center">
			<tr>
				<td>
					<input type="hidden" name="curPage" value="${pagination.curPage}">
					<input type="text" name="srchKeyword" value="${boardVO.srchKeyword}">
					<input type="button" value="검색" onclick="fn_movePage('boardInq.do','Y')">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- //Container -->
	<br/>
	
	<table align="center">
		<tr>
			<td><input type="button" value="글쓰기" onclick="fn_movePage('boardWritePage.do');"></td>
			<td><input type="button" value="삭제" onclick="fn_delboard();"></td>			
		</tr>
	</table>
	
	
    <!-- paging 시작 -->
	<%@ include file="/WEB-INF/jsp/board/boardPaging.jsp" %>
	<!-- paging 끝 -->	
                
	</div>
	<%@include file="/WEB-INF/jsp/cm/footer.jsp" %>

<script>
	function fn_delboard(){
		var idx = "";
		var idxArray = new Array();
		$("input[name=idx]:checked").each(function() { 
			idx = $(this).val();
			idxArray.push(idx);
		});

		if(idxArray.length == 0){
			alert("삭제 할 게시물을 선택 해 주세요");
			return false;
		}else{			
	        if(confirm("해당 게시물을 삭제 하시겠습니까?")) {}else{
	            return false;
	        }
		}
		
		$.ajax({
		    type: "POST",
		    url: "./boardDelete.do",
            dataType : "TEXT",            
		    data: "idxArray=" + idxArray,
		    success: function(data){
			    if(data == "success"){
				    alert("게시물이 삭제 되었습니다.");
			    	location.reload();
			    }else{
			    	alert("삭제 실패하였습니다. 로그를 확인해보세요.");
				}
		    },

		    error: function (request, status, error){    
			    alert("ajax 실패");
		    }
		  });
	}
</script>