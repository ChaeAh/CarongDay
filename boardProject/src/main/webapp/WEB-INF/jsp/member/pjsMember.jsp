<%@page import="com.project.boardproject.cm.service.CmVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/WEB-INF/jsp/cm/common.jsp" %>
    <!-- 공통으로 사용되는 taglib 선언 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>멤버 상세조회</title>
<!--     <link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"> -->
<!-- common.css의 경우 추후 디자인 분리 작업이 진행 될 경우 협의 후 참조 여부 결정이 필요합니다. -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

<style>
#htmlText, #htmlIdChkText {
font-size: 10px;
color: red;
}

</style>
<link rel="shortcut icon" href="/images/favicon.png">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function fnDaumPostCode() {
new daum.Postcode({
	oncomplete : function(data){
	    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('postCode').value = data.zonecode;
        document.getElementById("roadAdr").value = roadAddr;
        document.getElementById("jibunAdr").value = data.jibunAddress;
        
        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
        if(roadAddr !== ''){
            document.getElementById("extraAdr").value = extraRoadAddr;
        } else {
            document.getElementById("extraAdr").value = '';
        }

        var guideTextBox = document.getElementById("guide");
        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        if(data.autoRoadAddress) {
            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            guideTextBox.style.display = 'block';

        } else if(data.autoJibunAddress) {
            var expJibunAddr = data.autoJibunAddress;
            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            guideTextBox.style.display = 'block';
        } else {
            guideTextBox.innerHTML = '';
            guideTextBox.style.display = 'none';
        }
        
        console.log(data.address);
        console.log(data.addressType);
        console.log(data.userSelectedType);
        console.log(data.roadAddress);
        console.log(data.jibunAddress);
        console.log(data.buildingCode);
        console.log(data.sido);
        console.log(data.sigungu);
        console.log(data.sigunguCode);
        console.log(data.roadnameCode);
        console.log(data.bcode);
        console.log(data.bname);
        console.log(data.sido);
      
         document.getElementById("bdMgtSn").value = data.buildingCode;
         document.getElementById("adrType").value = data.addressType;
        document.getElementById("usrSelType").value =data.userSelectedType; 
        document.getElementById("selYn").value =data.noSelected;
      	document.getElementById("bdMgtNm").value = data.buildingName; 
        document.getElementById("sigunguSn").value =data.sigunguCode;
         document.getElementById("sigungu").value = data.sigungu;
        document.getElementById("roadNm").value= data.roadname; 
      	document.getElementById("bdNm").value = data.bname;
        document.getElementById("roadSn").value = data.roadnameCode;
        document.getElementById("bdSn").value = data.bcode;
        document.getElementById("bdNm1").value =data.bname1;
        document.getElementById("bdNm2").value = data.bname2;
        document.getElementById("hNm").value =data.hname; 
        document.getElementById("sido").value = data.sido;  
         
  
    }
}).open();
}

function fnEmailAuth() {
	var id=$('#usrId').val();
	
	if(id == "" || id == null) {
		alert("아이디를 입력하세요");
		return;
	}
	
	$('#htmlText').html("이메일이 전송되었습니다.");
	var form = $('#usrAcntVO').serialize();

	$.ajax({
			url : "/um/usrEmailAuth.do",
			type : "post",
			datatype : "json",
			data : form,
			success : function(data) {
				if(data =="EmailSuccess") {
				fnEmailAuth_SuccessCallBack(data);
				}
			}
		});
		
	
}

function fnEmailAuth_SuccessCallBack(obj) {
	var html = "";
	html += '<input type="text" value="" id="EmailAuthNum"/>';
	html += '&nbsp;<input type="button" name="finAuth" id="finAuth" onclick="fnFinAuth()" value="인증번호 입력">';
	$('#inputEmailNum').html(html);
	
}

	 function fnChkId() {
		var form = $('#usrAcntVO').serialize();
		
	   	if(!isAlphaNum($('#usrId').val())) {
	  		alert("영문과 숫자를 조합하셔야 합니다.");
	  		$('#usrId').focus();
	  		return;
	  	} 
	   	
	   	if($('#usrId').val().length <4 || $('#usrId').val().length > 16) {
	   		alert("아이디는 4자 이상 16자 이하로 작성하셔야 합니다.");
	   		$('#usrId').focus();
	   		return;
	   	}
	   	
	   	
		if( $('#usrId').val() != null && $('#usrId').val() !="") {
		$.ajax({
			url : "/um/umUsrChkId.do",
			type : "post",
			datatype : "json",
			data : form,
			success : function(data) {
				if(data =="1") {
					$('#htmlIdChkText').html("사용가능한 아이디입니다.");
					$('#idUseChk').val("OK");
					$('#usrPw').focus();
				}else if(data == "2") {
					$('#htmlIdChkText').html("중복된 아이디입니다.");
					$('#usrId').focus();
					return;
				}
			}
		});
		}else {
			alert("아이디를 입력해주세요.");
			  $('#usrId').focus();
			  return;
		}
		
	} 

	function fnRgt() {
		var form= document.usrAcntForm;
		
		form.action ="/um/usrAcntRgt.do";
		form.submit();
		form.action= "";
	}
	
</script>
<body>
<!-- START : HEADER -->
<header id="hd">
    <!-- START : HEADER TOP -->
    <div class="hdTop">
        <!-- START : HEADER TOP CONTAINER -->
        <div class="innerContainer">
            <!-- START : 다국어 버튼 영역 -->
       
            <!-- END : 다국어 버튼 영역 -->

            <!-- START : 사이트 내 전체검색 영역 -->
       
            <!-- END : 사이트 내 전체검색 영역 -->
        </div>
        <!-- END : HEADER TOP CONTAINER -->
    </div>
    <!-- END : HEADER TOP -->

    <!-- START : HEADER WRAP -->
    <div class="hdWrap" id="top_menu">
		<!-- START : HEADER WRAP CONTAINER -->
        <div class="innerContainer" id="topmenu">
			<h1 id="logo"><a href="#" onclick="javascript:goToMain();"><img src="/images/logo.png" alt=""></a></h1>
            <!-- START : GNB -->
            <nav id="gnb">
				<h2 id="topmenuNm" class="hidden"></h2>
				
</nav>

<!-- 메뉴3단계 E3.ul 체크 변수--> 

<ul>
	<!-- for start : 1단계 메뉴  -->
		<!-- S1.li -->
		<li>
			<!-- 1단계 메뉴 현출 -->
		 	<a id="top1m01" href="#_"></a> 
			<!-- S2.div -->
			<div class="gnbSubWrap gnbSub1">
			</div>
			</li></ul>
	</header>								  
    <!-- END : HEADER WRAP -->
	<form id="headerMn" name="headerMn" action="/cs/CsBltnWrt.do" method="post" onsubmit="return false;"></form>      
<!-- END : HEADER -->
	<!-- END : top호출 -->

    <!-- START : CONATINER -->
    <div id="container">
        <!-- START : side navigation호출 -->

<!-- END : side navigation호출 -->
<%@include file="../cm/sideNav.jsp" %>
	<!-- 	
     
			<!-- END : 첨부파일 FORM -->
        	
            <!-- START : 네비게이션 호출 -->
<div class="breadclumbs">
    <ul>
        <li>홈</li>
        <li>고객센터</li>
        <li class="current">공지사항</li>
    </ul>
</div>
			<!-- END : 네비게이션 호출 -->
            <!-- START : PAGE CONTENT -->
            <form id="usrAcntVO" name="usrAcntForm" action="/um/usrAcntRgt.do" method="post" onsubmit="return false;">
            <input type="hidden" id="bdMgtSn" name="bdMgtSn" value=""/>
            <input type="hidden" id="adrType" name="adrType" value=""/>
            <input type="hidden" id="usrSelType" name="usrSelType" value=""/>
            <input type="hidden" id="selYn" name="selYn" value=""/>
            <input type="hidden" id="bdMgtNm" name="bdMgtNm" value=""/>
            <input type="hidden" id="sido" name="sido" value=""/>
            <input type="hidden" id="sigungu" name="sigungu" value=""/>
            <input type="hidden" id="sigunguSn" name="sigunguSn" value=""/>
            <input type="hidden" id="roadSn" name="roadSn" value=""/>
            <input type="hidden" id="bdSn" name="bdSn" value=""/>
            <input type="hidden" id="roadNm" name="roadNm" value=""/>
            <input type="hidden" id="bdNm" name="bdNm" value=""/>
            <input type="hidden" id="bdNm1" name="bdNm1" value=""/>
            <input type="hidden" id="bdNm2" name="bdNm2" value=""/>
            <input type="hidden" id="hNm" name="hNm" value=""/>
            <input type="hidden" id="idUseChk" name="idUseChk" />
            <div class="pageContent">
                <h2 class="pgTitle">기본정보</h2>
				<!-- START : 공지사항 상세조회 -->
				<div class="tblForm">
                    <table>
                        <caption>회원가입 폼</caption>
                        <colgroup>
	                        <col style="width: 15%;">
	                        <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><label>아이디</label></th>
                                <td class="fwB"><input type="text" name="usrId" id="usrId" value=""/>
                                <a href="#none" title="아이디중복확인(새창으로 열기)" onclick="fnChkId();" ><input type="button"  value="아이디중복확인"></a>
                                <span id="htmlIdChkText"></span><br> (영문+숫자, 4~16자)	</td>
                            </tr>
                            <tr>
                                <th><label>비밀번호</label></th>
                                    <td class="fwB"><input type="password" name="usrPw" id="usrPw"/></td>
                            </tr>
                            <tr>
                                <th><label>비밀번호 확인</label></th>
                                   <td class="fwB"><input type="password" name="usrPwConfirm" id="usrPwConfirm"/></td>
                            </tr>
                            <tr>
                                <th><label>이름</label></th>
                              <td class="fwB"><input type="text" name="usrNm" id="usrNm"/>
                            </tr>
                             <tr>
                                <th><label>주소</label></th>
                                    <td class="fwB">
                                <p>  <input type="text" name="postCode" id="postCode" placeholder="우편번호"  style="width:68px;"/>
                                    <input type="button" onclick="fnDaumPostCode()" value="우편번호 찾기"/><br></p>  
                                    <input type="text" name="roadAdr" id="roadAdr" placeholder="도로명주소" style="width:280px;"/><br>
                                 	 <input type="text" name="jibunAdr" id="jibunAdr" placeholder="지번주소" style="width:280px;"/>
                                 	 	 <input type="text" name="extraAdr" id="extraAdr" placeholder="" style="width:68px;"/>
                     			       <span id="guide" style="color:#999;display:none"></span>
                                 	 <input type="text" name="dtlAdr" id="dtlAdr" placeholder="상세주소" style="width:120px;"/>
                                 
                                 </tr>
                              <tr>
                                <th><label>휴대전화</label></th>
					             <td class="fwB"><div class="frmDiv">
                                    <select name="usrTel1" id ="usrTel1" >
												<c:forEach var="vo" items="${telList}">
										 				<option value="${vo.gnrCdNm}"> <c:out value="${vo.gnrCdNm}"/> 
										 				</option> 
 											   </c:forEach> 
 									 </select>
 									 -<input type="text" name="usrTel2" id="usrTel2"/> - 	<input type="text" name="usrTel3" id="usrTel3"/>
                                </div> 
                                 </tr>
                          <tr>
                                <th><label>이메일</label></th>
                                <td class="fwB"><input type="text" name="usrEmail1" id="usrEmail1"/> @ 
                                     <select name="usrEmail2" id ="usrEmail2" >
											 	<c:forEach var="vo" items="${emailList}">
														<option value="<c:out value='${vo.gnrCdNm}'/>"><c:out value='${vo.gnrCdNm}'/></option>
 											   </c:forEach>  
 									 </select>   
                                     <input type="button" name="EmailAuth" id="EmailAuth" onclick="fnEmailAuth()" value="이메일 인증">
								 	 <span id="htmlText"></span>
                                     <p id="inputEmailNum"></p>
                                 </tr>
                        </tbody>
                    </table>
                </div>
                <!-- END : 공지사항 상세조회 -->
                </form>
                <!-- START : 메인버튼 -->
                <div class="formBtn">
                    <input type="button" name="button" onclick="javacript:fnRgt();" value="확인"/>
                </div>
                <!-- END : 메인버튼 -->
            </div>
            <!-- END : PAGE CONTENT -->
        </section>
        <!-- END : CONTENT -->
    </div>
    <!-- END : CONATINER -->
    
    <!-- START : footer호출 -->
	<script type="text/javaScript" defer="defer">
//하단 팝업 호출
function fn_popUp(url, height, width) {
    windowOpen(url, 'bottomCmP', height, width, 'yes');
}
</script>

<!-- END : FOOTER -->
	<!-- END : footer호출 -->
</div>
<!-- END : WRAP -->
<form id="tempF" action="/cs/CsBltnWrtRpt.do" method="post" target="CsNfcMttrListDtlInqRpt"><input type="hidden" name="bltnbordId" value="0000001">
<input type="hidden" name="bltnId" value="000000120210202000001">
<input type="hidden" name="inqType" value=""><input type="hidden" name="srchKeywd" value="">
<input type="hidden" name="pageIndex" value="1"><input type="hidden" name="inqOrder" value="">
</form>
</body>
								
</body>