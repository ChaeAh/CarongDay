<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cm/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

 function fnChkId(obj) {
	var form = $('#usrAcntVO').serialize();
	
   	if(obj.length <4 || obj.length > 16) {
   	 	$('#error_next_box_usr_id').show();
   		$('#error_next_box_usr_id').html("아이디는 4자 이상 16자 이하로 작성하셔야 합니다.");
//   	 	$('#error_next_box_usr_id').css("display","block");
   		$('#usrId').focus();
   		return;
   	}else {
   		$('#error_next_box_usr_id').empty();
   	}
   	if(!isAlphaNum(obj)) {
  	$('#error_next_box_usr_id').css("display","block");
  	$('#error_next_box_usr_id').html("영문과 숫자를 조합하셔야 합니다.");
  		$('#usrId').focus();
  		return;
  	}else {
 		$('#error_next_box_usr_id').empty();
  	}
   	
	if( obj != null && obj !="") {
		$.ajax({
			url : "/um/umUsrChkId.do",
			type : "post",
			datatype : "json",
			data : form,
			success : function(data) {
				if(data =="1") {
				  	$('#error_next_box_usr_id').css("display","block");
				  	$('#error_next_box_usr_id').html("사용가능한 아이디입니다.");
					$('#idUseChk').val("OK");
				}else if(data == "2") {
				  	$('#error_next_box_usr_id').css("display","block");
				  	$('#error_next_box_usr_id').html("중복된 아이디입니다.");
					$('#usrId').focus();
					return;
				}
			}
		});
	}else {
	  	$('#error_next_box_usr_id').css("display","block");
	  	$('#error_next_box_usr_id').html("필수 정보입니다.");
		$('#usrId').focus();
		return;
	}
	

	
 } 
	 
	 function fnChkPw(obj, fg) {
	 if(obj != null && obj != "" && fg !="" && fg !=null) {
			 
		 if(fg == 'pw1'){
			if( !isLenInputCheck(obj,fg) ){return;}
			
			if(!isContinueRepitCheck(obj)) { 
				 $('#error_next_box_usr_pw').css("display","block");
	  	  		 $('#error_next_box_usr_pw').html("비밀번호는 연속되거나 반복된 문자열을 사용하실 수 없습니다.");
				return;
			}
			 if($('#usrId').val() == $('#usrPw').val()) {
				 $('#error_next_box_usr_pw').css("display","block");
	  	  		 $('#error_next_box_usr_pw').html("아이디와 비밀번호를 같게 할 수 없습니다.");
	  	  		 return;
			 }
		 }else if(fg == 'pw2'){
				if( !isLenInputCheck(obj,fg) ){return;}
				
				if(!isContinueRepitCheck(obj)) { 
					 $('#error_next_box_usr_pw_conf').css("display","block");
		  	  		 $('#error_next_box_usr_pw_conf').html("비밀번호 확인은 연속되거나 반복된 문자열을 사용하실 수 없습니다.");
					return;
				}
		 }
		 if(fg == 'pw2' && !isNull(obj)) {
			 
			 if($('#usrPw').val() != $('#usrPwConf').val()){
				 $('#error_next_box_usr_pw_conf').css("display","block");
	  	  		 $('#error_next_box_usr_pw_conf').html("비밀번호와 비밀번호 확인이 같지 않습니다.");
	  	  		 return;
			 }
		 
			 if($('#usrId').val() == $('#usrPwConf').val()) {
				 $('#error_next_box_usr_pw_conf').css("display","block");
	  	  		 $('#error_next_box_usr_pw_conf').html("아이디와 비밀번호 확인을 같게 할 수 없습니다.");
	  	  		 return;
			 }
		 }
		 
		 }
	 }
	 

	function fnRgt() {
		var form= document.usrAcntForm;
		if($('#idUseChk').val() != "OK") {
			return;
		}
		
		form.action ="/um/usrAcntRgt.do";
		form.submit();
		form.action= "";
	}
	
	function fnChkName(obj) {
		if(isNull(obj)) {
			 $('#error_next_box_usr_nm').css("display","block");
  	  		 $('#error_next_box_usr_nm').html("필수 입력정보입니다");
  	  		 return;
		}
		if(!isKorean(obj)) {
			 $('#error_next_box_usr_nm').css("display","block");
  	  		 $('#error_next_box_usr_nm').html("이름은 한글만 입력 가능 합니다");
			return;
		}
		 $('#error_next_box_usr_nm').css("display","");
	}
	
	function fnChkTel(obj) {
		if(obj != null && obj != ""){
			if(!isNum(obj)){
				$('#error_next_box_usr_tel').css("display","block");
	 	  		 $('#error_next_box_usr_tel').html("전화번호는 숫자만 입력 가능 합니다");
				return;
			}
		}
		 $('#error_next_box_usr_tel').css("display","");
		
	}
	
	function fnShow() {
		$('#error_next_box_usr_email').css("display","block");
	/* 	if($('#idUseChk').val() != "OK") {
			$('#error_next_box_usr_email').html("필수 입력 항목이 있습니다");
			$('#usrId').focus();
			return;
		} */
		
	}
	
	function fnEmailAuth() {
		var id=$('#usrId').val();
		var form = $('#usrAcntVO').serialize();
		var usrEmail1 = $('usrEmail1').val();
/* 		
		if(isNull(usrEmail1)) {
			alert("이메일 아이디는 필수 입력 정보입니다.");
			usrEmail1.focus();
			return;
		}
		 */
		$.ajax({
				url : "/um/usrEmailAuth.do",
				type : "post",
				datatype : "json",
				data : form,
				success : function(data) {
					if(data =="EmailSuccess") {
						alert("인증번호가 발송되었습니다.");
				//	$('#error_next_box_usr_email').html("인증번호가 발송 되었습니다.");
	
					fnEmailAuth_SuccessCallBack(data);
					}else if(data == "EmailFail") {
						alert("이메일 전송이 실패되었습니다.");
						return;
					}
				}
			});
			
		
	}

	function fnEmailAuth_SuccessCallBack(obj) {
	/* 	var html = "";
		html += '<input type="text" value="" id="EmailAuthNum"/>';
		html += '&nbsp;<input type="button" name="finAuth" id="finAuth" onclick="fnFinAuth()" value="인증번호 입력">'; */
		//$('#').html(html);
		$('#inputEmailNum').css("display","block");
		$('#emailAuthNum').attr("disabled", false);
		$('#emailAuthNum').focus();
	}
	
	function fnFinAuth() {
		$.ajax({
				url : "/um/usrEmailFinAuth.do",
				type : "post",
				datatype : "json",
				data : { 
					emailAuthNum : $('#emailAuthNum').val(),
					usrId : $('#usrId').val()
				},
				success : function(data) {
					if(data =="0") {
						fnFinAuth_SuccessCallBack();
					}else if(data == "1") {
						alert("인증번호가 틀립니다. 다시 입력해 주세요.");
						$('#emailAuthNum').focus();
						return;
					}
				}
			});
	} 
	
	function fnFinAuth_SuccessCallBack() {
		$('#finAuth').css("display","none");
		$('#error_next_box_usr_email_auth_num').css("display","block");
		$('#error_next_box_usr_email_auth_num').html("정상적으로 인증되었습니다.");
		$("input[name=emailAuthNum]").attr("readonly", true);
	}
	
	$('#usrEmail1').focusout(function() {
		$('#error_next_box_usr_email').css("display","");
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<br />
	<br />
	<div class="login-page">
	<div class="form">
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
            <input type="hidden" id="roadAdr" name="roadAdr" >
            <input type="hidden" id="jibunAdr" name="jibunAdr" >
            <input type="hidden" id="extraAdr" name="extraAdr"/>
				<!--wrapper  -->				
				<div id="wrapper">
					<!--content  -->
					<div id="content">
					
                <h2 class="join_title">WITH JOIN</h2>
					<div>
						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_1">
							<input type="text" name="usrId" id="usrId" class="int" maxlength="16" onkeyup = "fnChkId(this.value);" />
							<span id="error_next_box_usr_id" class="error_next_box"></span>
						</span>
					</div>
					
					<div>
						<h3 class="join_title">
							<label for="pw">비밀번호</label>
						
						</h3>
						<span class="box int_1">
					<input type="password" name="usrPw" id="usrPw" class="int" maxlength="20" onkeyup = "fnChkPw(this.value,'pw1')"/>
						<span id="error_next_box_usr_pw" class="error_next_box"></span>
						</span>
					</div>
					
					<div>
						<h3 class="join_title">
							<label for="pw">비밀번호 확인</label>
						</h3>
						<span class="box int_1">
					<input type="password" name="usrPwConf" id="usrPwConf" class="int" maxlength="20" onkeyup = "fnChkPw(this.value,'pw2')"/>
						<span id="error_next_box_usr_pw_conf"   class="error_next_box"></span>
						</span>
					</div>
					
					<div>
						<h3 class="join_title">
							<label for="name">이름</label>
						</h3>
						<span class="box int_1">
							<input type="text" name="usrNm" id="usrNm" class="int" maxlength="20" onkeyup = "fnChkName(this.value)"/>
						</span>
						<span  id="error_next_box_usr_nm"   class="error_next_box"></span>
					</div>
					
					 <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">휴대전화</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                   <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select name="usrTel1" id="mm" >
                        		<c:forEach var="vo" items="${telList}">
										 				<option value="${vo.gnrCdNm}"> <c:out value="${vo.gnrCdNm}"/> 
										 				</option> 
 											   </c:forEach> 
 								</select>
                            </span>
                        </div>
                        <div id="bir_yy">
                            <span class="box">
                           	    <input type="text" name="usrTel2" id="usrTel2" class="int" maxlength="4" onkeyup="fnChkTel(this.value)" >
                            </span>
                        </div>

                       
                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                               <input type="text" name="usrTel3" id="usrTel3" class="int" maxlength="4" onkeyup="fnChkTel(this.value)" >
                            </span>
                        </div>

                    </div>
                    <span id="error_next_box_usr_tel" class="error_next_box"></span>    
                </div>
                
                <div>
                	<h3 class="join_title">
                		<label for="email">이메일</label>
                		 </h3>
                		 <div id="bir_wrap">
		                      <div id=email_int>
		                            <span class="box int_1">
		                            <input type="text" name="usrEmail1" id="usrEmail1" class="int" onkeyup ="fnShow()"/>
		                            </span>
		                        </div>
		                      <span style="padding-left: 5px; padding-right: 5px;">  @   </span>  
	                        <div id="email_int">
	                                <select name="usrEmail2" id="usrEmail2" >
	                        			 	<c:forEach var="vo" items="${emailList}">
													<option value="<c:out value='${vo.gnrCdNm}'/>"><c:out value='${vo.gnrCdNm}'/></option>
										   </c:forEach>  
	 								</select>
	                        </div>
	 						<div id="email_int">
	 						  <span class="box int_1">
                          	 <input type="button" class="button" name="EmailAuth" id="EmailAuth" onclick="fnEmailAuth()" value="이메일 인증">
							 </span>
	                        </div>
	                               <span  id="error_next_box_usr_email"  class="error_next_box">    
	                              </span>    
                          </div>
                        </div>
                        
                         <div id="bir_wrap" >
                        	<div id="email_auth1">
                          	  <span class="box int_1"  >
                          	     <input type="text" name="emailAuthNum" id="emailAuthNum" class="int" maxlength="6"  disabled >
                        	    </span>
                        	 </div>
                        	 <div id="email_auth2">           
                        	    <span class="box int2"  >
		                            <input type="button" class="button" name="finAuth" id="finAuth" onclick="fnFinAuth()" value="인증번호 입력" disabled="disabled" >
                          	   </span>
 					   			<span  id="error_next_box_usr_email_auth_num"   class="error_next_box"></span>
                            </div>
                        </div> 
                  
                  		<div>
							<h3 class="join_title">
								<label for="juso">주소</label>
							</h3>
                       <div id="bir_wrap">
						<div id="email_auth1">
						<span class="box int_1">
						    <input type="text" name="postCode" id="postCode" placeholder="우편번호"  class="int"    readonly />
						    </span>
						</div>
						<div id="email_auth2">
						<span class="box int2">
                            <input type="button" class="button" onclick="fnDaumPostCode()" value="우편번호 찾기"/><br>
            		   </span>
						</div>
					</div> 
						<div id="bir_wrap">
                            <input type="text" name="selAdr" id="selAdr" placeholder="주소" class="int" readonly /><br>
                     	 	<span  id="guide" style="color:#999;display:none"></span> 
                            <input type="text" name="dtlAdr" id="dtlAdr" placeholder="상세주소" class="int"  />  
					</div>
					<br>
                <!-- JOIN BTN-->
                <div class="btn_area2">
                     <span class="box"  >
                	    <input  type="button" class="button"  onclick="javacript:fnRgt();" value="가입하기">
					</span>
                </div>
                
                </div>
                </div>
                </div>
                </form>
                </div>
                </div>
                <!-- END : 메인버튼 -->
            <!-- END : PAGE CONTENT -->
        <!-- END : CONTENT -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
<script>
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
	        if(data.userSelectedType === "R") {
	        	document.getElementById("selAdr").value = roadAddr;
	        }else{
	        	document.getElementById("selAdr").value=data.jibunAddress;
	        }
	        
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
	         
	
	  		document.getElementById("dtlAdr").focus();
	  		
	    }
	}).open();
	}
</script>
</html>

