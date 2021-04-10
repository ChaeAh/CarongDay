<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
<style>
	
</style>

<script>

$(document).ready(function() {
	$('#allCheck').click(function() {
		if($('#allCheck').prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		}else {
			$("input[type=checkbox]").prop("checked", false);
		}
		

	});
});


function fn_Register() {
	var f = document.frm;
	location.href="boardRegister.do";
/* 	f.action="boardRegister.do";
	f.submit(); */
}

function fn_Delete() {
	var f=document.frm;
	var data = $('#frm').serialize();
	var msg = confirm("정말 삭제하시겠습니까?");
	if(msg ==true) {
		var checkArr =new Array();
		$("input[type='checkBox']:checked").each(function() {
			checkArr.push($(this).attr("data-cartNum"));
		});
		alert(checkArr);		 
		$.ajax({
			url : "boardDelete.do",
			type : "post",
			datatype:"text",
			data : {chbox : checkArr },
			success : function(data) {
				if(data ==1) {
				alert("댓글 삭제완료!");
				  location.href = "boardList.do";
				}
			},
			error : function() {
				alert("삭제 실패");
			}
			
		});
	}else {
		return;
	}
	
}

function fn_excel() {
	var form = document.frm;
	form.action="boardExcelDown.do";
	form.submit();
}
function ajaxCall(method, url, request) {
	var returnData = new Object;
	$.ajax({
		method : method,
		url : url,
		dataType : 'json',
		data :  JSON.stringify(request),
		processData : true,
		contentType : 'application/json; charset=UTF-8',
		async : false, // default == true  == 동기 // false == 비동기
		success : function(data) {
			if(data ==1) {
				alert("삭제 성공");
			}else {
				alert("삭제 실패");
			}
			
		},
		error :function() {
			alert("실패작");
		}
	});
	return returnData;
};

function fn_selectLine(obj) {
	document.frm.idx.value =obj;
	$.ajax({
		url : 'boardUpdateReadCnt.do',
		type : "post",
		data : {idx : obj},
		success : function(data) {
			console.log("!!!"+data);
			if(data=="1") {
			//	alert("업데이트 성공");
				onSuccess(data);
	//			 location.href = "boardList.do";
			}
		},
		error : function() {
			alert("접근 실패");
		}
		
	});
	
	/* var str="";
	var tr= $(this);
	var tdArr = new Array();
	var td= tr.children();
	td.each(function(i){
		tdArr.push(td.eq(i).text());		//클릭된 행의 모든값을 한번에 가져오기 : text()
		)}; */
		/* alert(tdArr); */
}
function onSuccess(data) {
	var form = document.frm;
 //	var result = $('#idx').val();
	form.action="Detail.do";
	form.submit();
}


/* function fn_search() {
	var f= document.schfrm;
	var obj= f.serialize();
	
	if(schtext !=null) {
		$.ajax({
			url : 'boardSboard.do',
			data : {searchList: obj },
			success : function(data) {
				
			},
			error : function() {
				alert("접근 실패");
			}
			
		});
	}
} */

function chkword(obj, maxlength){
	 var strValue = obj.value;
     var strLen = strValue.length;
     var totalByte = 0;
     var len = 0;
     var oneChar = "";
     var str2 = "";

     for (var i = 0; i < strLen; i++) {
         oneChar = strValue.charAt(i);
         if (escape(oneChar).length > 4) {
             totalByte += 2;
         } else {
             totalByte++;
         }

         // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
         if (totalByte <= maxlength) {
             len = i + 1;
         }
     }

     // 넘어가는 글자는 자른다.
     if (totalByte > maxlength) {
         alert(maxlength + "자를 초과 입력 할 수 없습니다.");
         str2 = strValue.substr(0, len);
         obj.value = str2;
         chkword(obj, 4000);
     }

}

function fn_enter() {
	if(event.keyCode == 13) {
		fn_movePage('boardList.do','Y');
	}
}

function fn_search() {
	var srchtrg = $("#srchtrg option:selected").val();
	fn_movePage('boardList.do','Y');
}
</script>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<!-- wrapper -->
	<div class="wrapper">

	<!-- header -->
	<div class="header">
	
	</div>
	<!-- Container -->
	<div class="Container">
	${boardVO.srchKeyword }
	${boardVO.srchtrg }
	<div class="searchBox">
 	<form id="schfrm" name="schfrm" action="#" method="get">
 	<table align="center">
			<tr>
				<td>
				<%--  --%>
					<input type="hidden" name="curPage" value="${pagination.curPage}">
					<select  id="srchtrg" name="srchtrg" onchange="" >
					<option value="title" <c:if test="${ BoardVO.srchtrg eq 'title'}"> selected</c:if>>제목</option>
					<option value="contents" <c:if test="${BoardVO.srchtrg eq 'contents'}">selected</c:if>>내용</option>
					<!-- 	<option value="title">제목<option>
						<option value="contents" >내용</option> -->
					</select>
					<input type="text" id="srchKeyword" name="srchKeyword" value="${BoardVO.srchKeyword}">
					<input type="button" value="검색" onclick="fn_search(this)" onkeypress="fn_enter()">
				</td>
			</tr>
		</table>
	</form>
	</div>	
	
	<form:form commandName="BoardVO" id="frm" name="frm"> 
	<table width="700px" class="listTable" id="" name=""  summary="게시물입니다" border="1" cellspacing="0" cellpadding="5" align="center">
	<!-- <input type="hidden" id="idx" name="idx" value=""/> -->
	<thead>
	
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox" id="allCheck" name="allCheck" value="" /></td>
			<td>글번호</td>
			<td width="200px">제목</td>
			<td>조회수</td>
			<td width="200px">등록일시</td>
		
		
		</tr>
	<c:if test="${list.size() !=0 }">
			<c:forEach var="vo" items="${boardList}">
				<tr class="selectline">
				<td ><input type="checkbox" id="check" class="chBox" name="check" value="${vo.idx }"   data-cartNum="${vo.idx}" /></td>
				<td  onclick="fn_selectLine(${vo.idx})">${vo.idx }</td>
				<td onclick="fn_selectLine(${vo.idx})">${vo.title }</td>
				<td  onclick="fn_selectLine(${vo.idx})">${vo.readCnt }</td>
				<td  onclick="fn_selectLine(${vo.idx})">${vo.rgtDtm }</td>
				</tr>
			
		</c:forEach>
	</c:if>		
	<c:if test="${list.size() == 0 }">
		<tr>
			<td colspan="7" align="center">
				조회된 게시물이 없습니다.
			</td>
		</tr>
	</c:if>

		<tr>
			<td  colspan="7" align="right">
			<input type="button" class="button" value="등록" onclick="fn_movePage('boardRegister.do');">
			<input type="button" class="button" value="삭제" onclick="fn_Delete();">
			<input type="button" class="button" value="엑셀출력" onclick="fn_excel();"/>
 			</td>
		</tr>
	</tbody>
	</table>
	</form:form>
	</div>
	<!-- //Container -->
	    <!-- paging 시작 -->
	<%@ include file="/WEB-INF/jsp/board/boardPaging.jsp" %>
	<!-- paging 끝 -->	
	
	
	<!-- footer -->
	</div>
<!-- //wrapper -->
	<jsp:include page="../footer.jsp"/>
</body>
</html>