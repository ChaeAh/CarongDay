<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp" %>
  <link href="/resources/css/style.css" rel="stylesheet"/>
  <title>글 목록</title>
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/common.css"/> -->
<style>

#container {
width : 100%;
height : 800px; 
padding : 30px;
}
* {
font-family: "Nanum Gothic", sans-serif;
  box-sizing: border-box;
}
body {
 font-family: Arial;
  padding: 10px;
  background: #f1f1f1;
  }
  
/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 15%;
  margin-bottom : 50px; 
}

/* Right column */
.rightcolumn {
  float: left;
  width: 85%;
  background-color: #f1f1f1;
  padding-left: 20px;
  
}

/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}

ul.mylist, ol.mylist {
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 250px;
    width: 100%;
}

ul.mylist li, ol.mylist li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
}
ul.mylist li:last-child,
ol.mylist li:last-child {
    border-bottom: 0px;
}
ul.mylist li:before,
ol.mylist li:before {
    content: ">";
    display: inline-block;
    vertical-align: middle;
    padding: 0px 5px 6px 0px;
}


ul.mylist li,
ol.mylist li {
    -webkit-transition: background-color 0.3s linear;
    -moz-transition: background-color 0.3s linear;
    -ms-transition: background-color 0.3s linear;
    -o-transition: background-color 0.3s linear;
    transition: background-color 0.3s linear;
}
  
ul.mylist li:hover,
ol.mylist li:hover {
    background-color: #f6f6f6;
}
    a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }


</style>

<script>

/* 초기화 */
$(document).ready(function() {
	
	fnSelectBoardListPage();
	
});


/* 페이징 목록 조회 */
function fnSelectBoardListPage() {

	//$('#curPage').val(curPage);
//	alert(pageNo);
	var form = document.listForm;
	//유효성검사
	//
	
	fnSelectBoardListPageCallBack();
}

function fnSelectBoardListPageCallBack() {
	var form = $('#form[name=listForm]').serialize();


	if(${pagination.curPage} === undefined) {
		$('#curPage').val("1");
	}else {
	$('#curPage').val(${pagination.curPage});
	}
	
	$.ajax({
		type : 'post',
		data  : {
			curPage : $('#curPage').val()
			},
		dataType : 'json',
		url : 'boardListInqAjax.do',
		success : function(data, status) {
			fnOnSuccessBoardList(data);
		
		},
		error : function(request, status) {
			alert("조회하는데 실패하였습니다.");
		}
	});
}

function fnOnSuccessBoardList(data) {
	var htmltext = "";
	var  pagination = "";
	var pageIndex = data.pagination.curPage;
	var pageSize = data.pagination.pageSize;
	var startNumb = (pageIndex * pageSize) - pageSize +1;
	var pagetext = "";
	//alert(pageIndex + "," + pageSize + "," + startNumb);
	$('#totCnt').val(data.resultList.length);
	
	if(data.resultList.length == 0) {
		htmltext += "<tr>";
		htmltext += "<td class =\'tc'\ colspans=5>조회된 결과가 없습니다.</td>";
		htmltext += "</tr>";
	} else {
		for(var i=0; i<data.resultList.length; i++) {
			var boardVO = data.resultList[i];
			var numb = startNumb + i; //	가장 최근것부터 1++
			
			htmltext += "<tr>";
			htmltext +=  "<td>" + ((pageSize * (pageIndex - 1)) + i + 1) + "</td>"; // 번호
		
			htmltext += "<td style='text-align:left;'> <a href=\"javascript:fnInqBoardWrtDtl('"+boardVO.idx + "');\">" + boardVO.title + "</td>";
			htmltext += "<td>" + boardVO.rgtId + "</td>";
			htmltext += "<td >" + boardVO.rgtDtm + "</td>";
			htmltext += "<td>" + boardVO.readCnt + "</td>";
			htmltext += "</tr>";
		}
			
	        pagination += "<div class='pagination'>";
	        pagination += "<a href='#' onClick=fn_paging(" + data.pagination.curRange + ");><span class=\"arrow radius-right\"> ≪ </span></a>";
	        pagination += "<a href='#' onClick=fn_paging(" + data.pagination.prevPage + "); ><span class=\"arrow radius-left\">＜ </span></a>";
	        for (var i =data.pagination.startPage; i <= data.pagination.endPage; i++) {
	            if (i == data.pagination.curPage) {
	                pagination += "<span style=\'font-weight: bold;\'><a href='#'  onClick=fn_paging(" + i + "); class='num_box txt_point'>[" + i + "]</a></span>";
	            } else {
	                pagination += "<a href='#'  onClick=fn_paging(" + i + "); class='num_box'>[" + i + "]</a>";
	            }
	        }  
	        pagination += "<a href='#' onClick=fn_paging("  + data.pagination.nextPage + ");> <span class=\"arrow radius-right\"> ＞</span></a>";
	        pagination += "<a href='#' onClick=fn_paging("  + data.pagination.pageCnt + ");> <span class=\"arrow radius-left\"> ≫ </span></a>";
	        pagination += "</div>";
	        
	        $("#pagination").html(pagination); 
		
		
	}
	
	// onmouseover=\"this.style.backgroud=\'#FFFFE0\'\"
	$("#csNromanTbl > tbody").html(htmltext);

	
}


function fn_paging(curPage) {
		location.href = "/boardList.do?curPage=" + curPage;
}


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

function fnInqBoardWrtDtl(obj) {
	//document.frm.idx.value = obj;
	$.ajax({
		url : 'boardUpdateReadCnt.do',
		type : "post",
		data : {idx : obj},
		success : function(data) {
			console.log("!!!"+data);
			if(data=="1") {
			//	alert("업데이트 성공");
				onSuccess(obj);
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
function onSuccess(obj) {
	var form = document.listForm;
 //	var result = $('#idx').val();
   	form.idx.value = obj;
	form.action="boardInqWrtDtl.do";
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
<jsp:include page="../header.jsp"/>
<!-- wrapper -->
<div class="container">
<div class="row">
	<jsp:include page="/WEB-INF/jsp/leftMenu.jsp"/>
  	  <div class="rightcolumn">
	    <div class="card">
 			<div class="container managergrounp" id="container" name="container" >
            <h3>글 목록 <span class="txt_small">(이메일 뉴스레터를 발송할 대상 수신자 목록을 선택하세요.)</span> </h3>
            <hr>
          <!--   <a class="btn" href="#" target="_blank">신규등록 <span class="btn_txt_small">▶</span></a>
            <a class="btn" href="#" target="_blank">단일화 <span class="btn_txt_small">▶</span></a>
            <a class="btn" href="#" target="_blank">분리 <span class="btn_txt_small">▶</span></a>
            <a class="btn" href="#" target="_blank">다운로드 <span class="btn_txt_small">▶</span></a>
            <a class="btn" href="#" target="_blank">삭제 <span class="btn_txt_small">▶</span></a>
            <a class="btn" href="#" target="_blank">업로드 <span class="btn_txt_small">▶</span></a> -->

            <div class="right">
            	<div class="searchBox">
 					<form id="schfrm" name="schfrm" action="#" method="get">
					<input type="hidden" name="curPage" value="${pagination.curPage}">
					<select  id="srchtrg" name="srchtrg" onchange="" >
						<option value="title" <c:if test="${ BoardVO.srchtrg eq 'title'}"> selected</c:if>>제목</option>
						<option value="contents" <c:if test="${BoardVO.srchtrg eq 'contents'}">selected</c:if>>내용</option>
					</select>
					<input type="text" id="srchKeyword" name="srchKeyword" value="${boardVO.srchKeyword }">
					<a href="" onclick="fn_search(this)" onkeypress="fn_enter()"> <img src="/resources/images/etc/clipboard_search.png"></a>
				</form>
	</div>	
              <!--   <select class="select_btn">
                    <option value="">10개씩 보기</option>    
                </select> -->
            </div>
	<form:form commandName="BoardVO" id="listForm" name="listForm"> 
			<input type="hidden" name="curPage" id="curPage" value="">
			<input type="hidden" name="idx" id="idx" >
			<input type="hidden" name="totalCnt" id="totalCnt">
			
            <table class="bbsList" id="csNromanTbl" >
                <caption>이메일 수신자 그룹관리 (이메일 뉴스레터를 발송할 대상 수신자 목록을 선택하세요.)</caption>           
                <thead class="head">
                    <tr>
                        <th><a class="checkbox" href="" ></a></th> 
       <!--                  <th>번호</th> -->
                        <th style="width:60%">제목</th>   
                        <th>작성자</th>   
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>    
                </thead>
                <tbody class="body">
                  <tr >
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
                  </tr>
                </tbody>
                <tfoot class="foot">
                    <tr>
                        <td colspan="9">
                       		  <!-- START : 페이징 -->
							<div class="pagination" id="pagination">
			                </div>
	                          <!-- END : 페이징 -->
                        </td>
                    </tr> 
                </tfoot>
            </table>
             
        </form:form>
        	
            <div class="btn_wrap">
            	<input type="button" class="button" value="등록" onclick="fn_movePage('boardRegister.do');">
				<input type="button" class="button" value="삭제" onclick="fn_Delete();">
				<input type="button" class="button" value="엑셀출력" onclick="fn_excel();"/>
              <!--   <a class="btn_org" href="javascript:;"><span class="txt_white">수신자 그룹 등록</span></a> -->
            </div>
        </div>
        </div>
        </div></div>
        	
        </div>
	<!-- header -->

	
	
	<!-- footer -->
<!-- //wrapper -->
	<jsp:include page="../footer.jsp"/>
</body>
</html>