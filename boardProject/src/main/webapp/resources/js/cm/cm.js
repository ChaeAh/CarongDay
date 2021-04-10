/*****************************************************************
 * 파일명 : cm.js
 * 용도 : 공통 함수 정리
 *****************************************************************/



 /*****************************************************************
 * 명칭 : fn_movePage
 * 용도 : submit or 페이지 이동시 사용. 폼 아이디는 frm 설정해야함.
 * 예시 : fn_movePage("write.do","Y") or fn_movePage("list.do");
 *****************************************************************/
  function fn_movePage(actionUrl,submitYn ="N",confirmMsg = "") {
	  	if(confirmMsg != ""){
	        if(confirm(confirmMsg)) {}else{
	            return false;
	        }
	  	}
	  
		if(submitYn == "N"){
			location.replace(actionUrl);
		}else{
			$("#frm").attr("action", actionUrl);
			$("#frm").submit();
		}
		return true;
	}
  
  //validate, paging, 그 외 공통함수들 필요함.
  
  function ajaxCallSr(method, url, request) {
	  var returnData = new Object;
	  $.ajax({
		  method : method,
		  url : url,
		  dataType : 'json',
		  data : JSON.stringify(request),
		  async : false,
		  contentType : 'application/json; charset=UTF-8',
		  success : function(data) {
			  returnData= data;
		  },
	  });
	  return returnData;
	  
  }