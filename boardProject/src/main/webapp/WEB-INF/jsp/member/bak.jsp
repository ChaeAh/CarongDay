<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 공통으로 사용되는 taglib 선언 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>멤버 상세조회</title>
    <link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css">
<!-- common.css의 경우 추후 디자인 분리 작업이 진행 될 경우 협의 후 참조 여부 결정이 필요합니다. -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/ui.css">
<link rel="shortcut icon" href="/images/favicon.png">
<script type="text/javascript">
function memberModify(){
	var log = document.member;
	log.action="memberModify.do";
	var pw=document.member.pw.value;
	var name = document.member.name.value;
	var email1 = document.member.email1.value;
	if(name=="") alert("아이디를 입력해주세요");
	else if(email1=="") alert("이메일을 입력해주세요");
	else if(pw=="") alert("비밀번호를 입력해주세요");
	else log.submit();
}
function memberDelete(){
	var log=document.member;
	log.action="";
	log.submit();
}
</script>
<style>
.inputClass td{
padding-left: 5px;
padding-right: 5px;
}
</style>

<body>
<!-- START : HEADER -->
<header id="hd">
    <!-- START : HEADER TOP -->
    <div class="hdTop">
        <!-- START : HEADER TOP CONTAINER -->
        <div class="innerContainer">
            <!-- START : 다국어 버튼 영역 -->
            <ul class="global">
                <li><a href="#" class="en" title="영어페이지로 이동" onclick="javascript:headerMenu('/sm/ovs/SmTopEnglishInformation.do?guideCd=0000010001&amp;guideYn=Y','080000000002','N');">ENGLISH</a></li>
				<li><a href="#" class="cn" title="중국어페이지로 이동" onclick="javascript:headerMenu('/sm/ovs/SmTopChineseInformation.do?guideCd=0000010001&amp;guideYn=Y','080000000009','N');">中國語</a></li>
				<li><a href="#" class="jp" title="일본어페이지로 이동" onclick="javascript:headerMenu ('/sm/ovs/SmTopJapaneseInformation.do?guideCd=0000010001&amp;guideYn=Y','080000000014','N');">日本語</a></li>
            </ul>
            <!-- END : 다국어 버튼 영역 -->

            <!-- START : 사이트 내 전체검색 영역 -->
            <div class="hdSearchWrap">
                <fieldset>
                    <legend>사이트 내 전체검색</legend>
                    <form id="unifSrch" name="unifSrch" action="/cs/CsBltnWrt.do" method="post" onsubmit="return false;">
                        <input type="hidden" name="fg" value="Y">
			            <input type="hidden" name="inqTrgt" value="02">
			            <input type="hidden" name="inqType" value="03">
                        <label for="srchWord" class="hidden">검색어 필수</label>
                        <input type="text" name="srchWord" id="srchWord" class="keyword" placeholder="검색어를 입력하세요." onfocus="javascript:clearSrch(this);">
                        <button type="submit" name="button" class="btnSearch" onclick="javascript:unifSrchView();"><span class="hidden">검색</span></button>
                    </form>
                </fieldset>
            </div>
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
				<h2 id="topmenuNm" class="hidden">주메뉴</h2>
				


<!-- 메뉴3단계 E3.ul 체크 변수--> 

<ul>
	<!-- for start : 1단계 메뉴  -->
	 
		<!-- S1.li -->
		<li>

			<!-- 1단계 메뉴 현출 -->
		 	<a id="top1m01" href="#_">증명서발급</a> 
			<!-- S2.div -->
			<div class="gnbSubWrap gnbSub1">
				<!-- S2.ul -->
				<ul>
					<!-- for start : 메뉴2단계 -->
							<!-- S2.li -->
							<li> 
								<a href="#" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=01','010000000002','N');">가족관계등록부</a>
												<!-- S3.ul -->
									<ul>
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=02','010000000003','N');">가족관계증명서</a></li>
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=03','010000000004','N');">기본증명서</a></li>
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=04','010000000005','N');">혼인관계증명서</a></li>
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=05','010000000006','N');">입양관계증명서</a></li>
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtFrrpApplrInfoInqW.do?menuFg=06','010000000007','N');">친양자입양관계증명서</a></li>
									</ul>
											<!-- E3.ul -->
							</li>
							<!-- E2.li -->
								<script type="text/javascript">
								<!-- 1단계로 올리기 위한 강제 스크립트 실행 -->
								if(firstMenuChk){
									var trgtId = "top1m01";
									$("#"+trgtId).click(function(){
										var prgUrl = '/pt/PtFrrpApplrInfoInqW.do?menuFg=01';
										prgUrl = prgUrl.replace(/&amp;/g, "&"); 
									    headerMenu(prgUrl,'010000000002','N');
									});
								}
								</script>
							<!-- S2.li -->
							<li> 
								<a href="#" onclick="javascript:headerMenu('/pt/PtEngFrrpApplrInfoInqW.do?menuFg=08','010000000009','N');">영문증명서</a>
							</li>
							<!-- E2.li -->
								<!-- S2.li -->
							<li> 
								<a href="#" onclick="javascript:headerMenu('/pt/PtJjkpApplrInfoInqW.do?menuFg=09','010000000010','N');">제적부</a>
								
										<!-- S3.ul -->
												<ul>
											
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtJjkpApplrInfoInqW.do?menuFg=10','010000000011','N');">제적등본</a></li>
												
											<li><a href="#_" onclick="javascript:headerMenu('/pt/PtJjkpApplrInfoInqW.do?menuFg=11','010000000012','N');">제적초본</a></li>
										
									  </ul>
	</header>								  
									  
			</ul>
				<!-- E2.ul -->
			</div>
			<!-- E2.div -->
			<!-- 2단계 메뉴 건수 초기화 -->

			<!-- 2단계 all block 시 -->
            
		</li>
		<!-- E1.li -->
	
	<!-- for end : 1단계 메뉴  -->
	<!-- START : 외국인 안내 페이지 메뉴 -->
	
	<!-- END : 외국인 안내 페이지 메뉴 -->
</ul>
<!-- E1.ul -->  

            </nav>            
        </div>
        <!-- END : HEADER WRAP CONTAINER -->
    </div>
    <!-- END : HEADER WRAP -->
	<form id="headerMn" name="headerMn" action="/cs/CsBltnWrt.do" method="post" onsubmit="return false;"></form>      
</header>
<!-- END : HEADER -->
	<!-- END : top호출 -->

    <!-- START : CONATINER -->
    <div id="container">
        <!-- START : side navigation호출 -->
<script type="text/javaScript">
 
 	var menuBlckYn = false;
 
	$(function(){
		
		//메뉴 차단 여부 확인
	    blckCheck();		
	    
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
	
	});

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
			
			
			if(forResult < 1){
				if(blckYn == "Y"){ //차단 여부
					menuBlckYn = true;
	                alert(msgBox('', '전자가족관계등록시스템의 보다 편리하고 안정적인\n서비스를 위해 시스템의 일부 업무를 점검 중입니다.\n\n신속히 서비스를 제공할 수 있도록 노력하겠습니다.'));
	                return ;
	            }
				
				document.leftMnCall.submit();
				
		    }
		}else{
			if(blckYn == "Y"){ //차단 여부
				menuBlckYn = true;
	            alert(msgBox('', '전자가족관계등록시스템의 보다 편리하고 안정적인\n서비스를 위해 시스템의 일부 업무를 점검 중입니다.\n\n신속히 서비스를 제공할 수 있도록 노력하겠습니다.'));
	            return ;
	        }
	        
			document.leftMnCall.submit();
			
		}
	}
	
	//차단된 메뉴 진입 시 메인 이동
	function blckCheck(){
	    if("" == "Y" || "" == "Y") { 
	        
	            alert(msgBox('', '전자가족관계등록시스템의 보다 편리하고 안정적인\n서비스를 위해 시스템의 일부 업무를 점검 중입니다.\n\n신속히 서비스를 제공할 수 있도록 노력하겠습니다.'));
	            $("form[name='leftMnCall']").attr("action","/sm/SmMnScr.do");
		        document.leftMnCall.submit();
		        return false;
	        
	    }
	}	


</script>
<!-- END : side navigation호출 --><aside id="menu_v" class="aside">
				<h2 class="snbTitle04"><span class="hidden">고객센터</span></h2>
					<ul class="snb">
						<li class="on">
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000001','040000000002','04','0101','N');"> <span>공지사항</span></a>
							</li>			    
					<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000003','040000000003','04','0102','N');"> <span>자주 하는 질문</span></a>
						</li>			    
						<li class="plus">
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009001&amp;guideYn=Y','040000000004','04','0103','N');"> <span>사이트이용안내</span></a>
							<ul>
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009001&amp;guideYn=Y','040000000005','04','010301','N');"> <span>인터넷 증명서 발급 방법 안내</span></a>
						</li>
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009002&amp;guideYn=Y','040000000006','04','010302','N');"> <span>인터넷 신고 방법 안내</span></a>
						</li>
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009003&amp;guideYn=Y','040000000007','04','010303','N');"> <span>아포스티유 안내</span></a>
						</li>
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsOcertCopyGuide.do','040000000008','04','010304','N');"> <span>인증서 가져오기/내보내기</span></a>
						</li>					
							</ul>
					</li>			    
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000005','040000000009','04','0104','N');"> <span>신청서 양식 다운로드</span></a>
						</li>			    		
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsUcertIssdLct.do','040000000010','04','0105','N');"> <span>무인증명서발급기 위치 조회</span></a>
						</li>			    
					<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000009','040000000011','04','0106','N');"> <span>국어의 로마자 표기 조회</span></a>				
						</li>			    				
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000010','040000000012','04','0107','N');"> <span>인명용 한자 조회</span></a>			
						</li>			    				
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsInetBirthDclPsblHsptlInq.do','040000000013','04','0108','N');"> <span>인터넷출생신고 의료기관 확인</span></a>				
						</li>			    
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009004&amp;guideYn=Y','040000000014','04','0109','N');"> <span>위변조 확인 프로그램</span></a>				
						</li>			    
						<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtList.do?bltnbordId=0000006','040000000015','04','0110','N');"> <span>설치 프로그램</span></a>
						</li>			    
							<li>
							<a href="#_" onclick="javascript:leftMnCalled('/cs/CsBltnWrtGuide.do?bltnbordId=0000009&amp;guideCd=0000009008&amp;guideYn=Y','040000000022','04','0116','N');"> <span>웹 접근성 안내</span></a>
						</li>
					</ul><!-- end : ul-class="snb" -->

	<form id="leftMnCall" name="leftMnCall" action="/cs/CsBltnWrt.do" method="post" onsubmit="return false;"> 
		<input type="hidden" name="prgId" id="prgId">
		<input type="hidden" name="leftMnCd" id="leftMnCd">
	</form>
</aside>
        <!-- START : CONTENT -->
        <section id="content" tabindex="-1">
        	
        	<!-- START : 이전 파라미터 FORM -->
			<form id="csBltnWrtVO" name="listForm" action="/cs/CsBltnWrt.do" method="post">
				<input id="bltnbordId" name="bltnbordId" type="hidden" value="0000001">
				<input id="bltnId" name="bltnId" type="hidden" value="000000120210202000001">
				<input id="inqType" name="inqType" type="hidden" value="">
				<input id="srchKeywd" name="srchKeywd" type="hidden" value="">
				<input id="pageIndex" name="pageIndex" type="hidden" value="1">
				<input id="inqOrder" name="inqOrder" type="hidden" value="">
			</form>
			<!-- END : 이전 파라미터 FORM -->
			
			<!-- START : 첨부파일 FORM -->
			<form id="csAtchfileVO" name="atchfileForm" action="/cs/CsBltnWrt.do" method="post">
				<input id="bltnbordId" name="bltnbordId" type="hidden" value="0000001">
				<input id="bltnId" name="bltnId" type="hidden" value="000000120210202000001">
				<input id="atchfileId" name="atchfileId" type="hidden" value="">
				<input id="atchfileNm" name="atchfileNm" type="hidden" value="">
			</form>
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
            <div class="pageContent">
                <h2 class="pgTitle">회원가입</h2>
				<input type="hidden" id="rgtDtm" value="">	
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
                                <td class="fwB"><input type="text" name="userId" id="userId"/></td>
                            </tr>
                            <tr>
                                <th><label>비밀번호</label></th>
                                <td>
                                	<div class="boContent">
                                		<span id="contentSpan">전자가족관계등록시스템을 이용한 온라인 출생신고 참여병원 신청절차 안내입니다.<br><br>온라인 출생신고 참여를 원하시는 병원은 <font style="color:#F15F5F"><b>첨부파일(온라인_출생신고_참여신청서.hwp)을 작성 후 스캔</b></font>하여 아래의 신청 접수기간에  <font style="color:#F15F5F"><b>이메일(ebirth@scourt.go.kr)로 접수</b></font>하여 주시기 바라며, <font style="color:#6799FF"><b>시스템연계구축을 통하여 최종적으로 사업참여가 확정된 병원에 대한 공문은 행정안전부에서 별도로 시행</b></font>될 예정입니다.<br><br><div align="center"><b>- 아&nbsp;&nbsp;&nbsp;&nbsp;래 -</b></div><br><div class="text_08"><ul><li><table class="list_table" border="0" cellspacing="0" summary="온라인 출생신고 참여병원 신청 안내"><thead><tr><th scope="col" style="text-align: center; vertical-align:middle;" width="80">구분</th><th scope="col" style="text-align: center; vertical-align:middle;">신청 접수기간</th><th scope="col" style="text-align: center; vertical-align:middle;">적용일자</th><th scope="col" style="text-align: center; vertical-align:middle;">비고</th></tr></thead><tbody><tr><td style="width:110px;">1차 참여신청</td><td>2021. 2. 1.(월) ~ 2021. 4. 16.(금)</td><td>2021. 4. 30.(금)</td><td></td></tr><tr><td>2차 참여신청(예정)</td><td>2021. 4. 17.(토) ~ 2021. 10. 15.(금)</td><td>2021. 10. 29.(금)</td><td></td></tr></tbody></table></li></ul><p class="alInfo"> 상기 일정은 시스템 점검 등의 상황에 따라 변경될 수 있음</p><br>또한, 사업참여 이후 <font style="color:#F15F5F"><b>담당자 변경 시 반드시 첨부파일(온라인_출생신고_담당자_변경신청서.hwp) 작성 후 스캔</b></font>하여 <font style="color:#F15F5F"><b>이메일(ebirth@scourt.go.kr)로 접수</b></font>하여 주시기 바랍니다.</div></span>
                                	</div>
                                </td>
                            </tr>
                            <tr>
                                <th><label>첨부파일</label></th>
                                <td>
                                	<ul class="fileList">
	                                	
									        <li><a href="#_" onclick="fnDownAtchfile('202102020002','온라인_출생신고_참여신청서.hwp')">온라인_출생신고_참여신청서.hwp</a></li>
								        
									        <li><a href="#_" onclick="fnDownAtchfile('202102020023','온라인_출생신고_정보제공_동의서.hwp')">온라인_출생신고_정보제공_동의서.hwp</a></li>
								        
									        <li><a href="#_" onclick="fnDownAtchfile('202102020024','온라인_출생신고_담당자_변경신청서.hwp')">온라인_출생신고_담당자_변경신청서.hwp</a></li>
								        
							        </ul>
							    </td>
                            </tr>
                            <tr>
                                <th><label>등록일자</label></th>
                                <td><span id="rgtDtmSpan">2021-02-02</span><span id="rgtDtmSpanHidden" style="visibility:hidden;">20210202133432</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- END : 공지사항 상세조회 -->
                
                <!-- START : 메인버튼 -->
                <div class="formBtn">
                    <button type="button" name="button" onclick="javacript:fnBackToList();">확인</button>
                    <button type="button" name="button" title="새창" class="nw2" onclick="javacript:fnOpenDtlInqPrint();">출력</button>
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
<!-- START : FOOTER -->
<!-- <footer id="ft">
    <h2 class="hidden">푸터영역</h2>
	<div class="innerContainer">
		 START : 지원센터 안내
            <div class="csWrap">
                <h3 class="csTitle"><strong>사용자지원센터</strong>
					일반 통화요금 부과 (별도 정보이용료 없음)</h3>
				<p class="csCall mo-hidden">1899-2732, 031-776-7878</p>
                <p class="csCall mo-visible"><a href="tel:1899-2732">1899-2732</a>, <a href="tel:031-776-7878">031-776-7878</a></p>
                
                <span class="csInfo">월~금요일 (09:00~18:00) / 토 · 일요일 및 공휴일은 휴무</span>
            </div>
            END : 지원센터 안내

        <div class="copyWrap">
            <div class="ftLink">
            	<h3 class="hidden">하단 링크</h3>
                <ul>
                    <li><a href="javascript:fn_popUp('/sm/SmBottomAgreement.do','900','600');" class="nw" title="새창">이용약관</a></li>
                    <li><a href="javascript:fn_popUp('/sm/SmBottomIndiInfoProcPolic.do','900','600');" class="nw tBlack" title="새창">개인정보 처리방침</a></li>
                    <li><a href="javascript:fn_popUp('/sm/SmBottomCopyProtecPolic.do','900','600');" class="nw" title="새창">저작권 보호 정책</a></li>
                    <li><a href="javascript:fn_popUp('/sm/SmBottomLinkMatterAttend.do','900','600');" class="nw" title="새창">링크 시 유의사항</a></li>
                    <li class="mo-hidden"><a href="http://efamilyrs.scourt.go.kr" title="새창" target="_blank">원격지원</a></li>
                </ul>
            </div>
            <div class="copy">
                <p>Copyright©Supreme Court of Korea. All Rights reserved.</p>
            </div>
        </div>
    </div>
</footer> -->
<%@include file="../cm/footer.jsp" %>
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
								
<%-- <div class="layer_fixed">
<%@include file="/WEB-INF/jsp/header.jsp" %>
	<br/>
	<br/>
	<form:form name="member" method="post">
	<table align="center" border=1px class="inputClass">
		<tr>
			<td>회원 아이디</td>
			<td>${memberVO.userId }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="pw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" id="name" value="${memberVO.name }"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email1" id="email1" value="${memberVO.email1 }"></td>
		</tr>
	</table>
	<br/>
	<table align="center">
		<tr>
			<td align="center"> <input type="button" value="정보수정" onClick="memberModify()"></td>
			<td align="center"> <input type="button" value="회원탈퇴" onClick="memberDelete()"></td> 
		</tr>
	</table>
	<c:if test="${not empty resultMessage}">
		<table align="center">
			<tr>
				<td colspan="2"><font color=red>${resultMessage }</font></td>
			</tr>
		</table>
	</c:if>
	</form:form>
</div>	
<%@include file="/WEB-INF/jsp/footer.jsp" %> --%>
</body>