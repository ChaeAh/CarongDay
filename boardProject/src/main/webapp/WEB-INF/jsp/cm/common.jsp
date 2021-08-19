<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- script -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/cm/cm.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/quickpager2.jquery.js"></script>

 <link rel="stylesheet" type="text/css" href="/resources/css/fix.css">
<script>
$(document).ready(function() {
	fn_FindUsrNm();
});

function fn_FindUsrNm() {
	var usrId = $('#usrId').val();
	$.ajax({
		type : 'post',
		data  : { usrId : usrId },
		dataType : 'json',
		url : 'umUsrNmInqAjax.do',
		success : function(data, status) {
			fnOnSuccessFindUsrNm(data);
		},
		error : function(request, status) {
			alert(request + "," +status );
			alert("조회하는데 실패하였습니다.");
		}
	});
}


</script>