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
/* $(function(){
	
	//메뉴 차단 여부 확인
    
    var menu_v = $('#menu_v');
    var menu_v2 = $("#menu_v .snb > li > a");
    var menu_v3 = $("#menu_v .snb > li > ul");
    var menu_v3_1 = $("#menu_v .snb > li > ul > li > a");
    
    menu_v3.parents('li').addClass('plus');
    
    menu_v2.on("click", function(){
    	if(!menuBlckYn){
	        $(this).parent().toggleClass('on');
    	}else{
			$(this).removeClass('ov').mouseleave().focusout();
    	}
    });	    
    
    menu_v3_1.on("click", function(){
    	if(menuBlckYn){
	        $(this).removeClass('ov').mouseleave().focusout();
    	}
    });

}); */

/* menu Request */
function leftMnCalled(url, prgId, leftMnCd, mnRnk, blckYn){
	
	$("#leftMnCall #prgId").val(prgId);
	$("#leftMnCall #leftMnCd").val(leftMnCd);

	var splitUrl = url.split("=");
	var comUrl = null;
	if(splitUrl[1] != null)
		comUrl = splitUrl[1]; 
	
	
	document.leftMnCall.action = url;
	
	if(mnRnk.length == 4){	// 2단계 메뉴
		var forResult = 0;
		var menuRank = "";
		
			menuRank = "01";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0101";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0102";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0103";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "010301";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "010302";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "010303";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "010304";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0104";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0105";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0106";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0107";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0108";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0109";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0110";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
			menuRank = "0116";
			if(menuRank.length > 5 ){
				if(menuRank.substring(0,menuRank.length-2) == mnRnk)
					forResult++;
			}
		
		
	}
	
}



</script>