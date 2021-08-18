<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/WEB-INF/jsp/cm/common.jsp" %>
        <!-- 공통으로 사용되는 taglib 선언 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오맵</title>
<!--     <link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"> -->
<!-- common.css의 경우 추후 디자인 분리 작업이 진행 될 경우 협의 후 참조 여부 결정이 필요합니다. -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/ui.css">
</head>
<!-- START : 터널링사용 -->
<!-- 카카오 맵 인증(네이티브 앱) -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps-tunneling/sdk.js?appkey=a50971432d67545c4857ba17a4d45beb&libraries=services"></script> -->
<!-- 카카오 맵 인증(REST API 키) -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps-tunneling/sdk.js?appkey=7ae7e7de14f330a66b86a939d717002f&libraries=services"></script> -->
<!-- 카카오 맵 인증(JAVASCRIPT 키) -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e40bb6432d10805927c82b324062d70"></script>
<!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps-tunneling/sdk.js?appkey=6e40bb6432d10805927c82b324062d70&libraries=services"></script>  -->
<!-- 카카오 맵 인증(ADMIN 키) -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps-tunneling/sdk.js?appkey=4bd6e7f15e80445c307e6a57cc475e84&libraries=services"></script> -->
<!-- END : 터널링사용 -->

<!-- START : 일반사용 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ae7e7de14f330a66b86a939d717002f&libraries=services"></script> -->
<!-- END : 일반사용 -->
<script type="text/javaScript" defer="defer">
	
	//사이즈 재조회하기 위한 변수
	var reInquiryMap = "";
	//카카오 지도 주소
	var mapAddress = "";
	
	/* 초기화 */
	$(document).ready(function() {
		//시도조회
		selectSido();
		//카카오 맵 초기화
		fnKakaoMapInit();
	});
	
	/* 시도조회 */
	function selectSido() {
		$.ajax({
			type : 'post',
			data : {},
			dataType : "json",
			url : "/cs/CsAdongCdSidoListUcert.do",
			success : function(data, status) {
				onSuccessSidoList(data);
			},
			error : function(request, status) {
				alert(msgBox('', '데이터처리 중 장애가 발생하였습니다.'));
			}
		});
	}
	
	/* 시도 조회결과 생성 */
	function onSuccessSidoList(data) {

		var htmltext = "";
		
		for ( var n = 0; n < data.list.length; n++) {
			var smSidoSggVO = data.list[n];
			htmltext += "<option value=\'" + smSidoSggVO.sidocd + "\'>" + smSidoSggVO.sidonm + "</option>";
		}
		
		$("#sidocd").html(htmltext);
		//시군구 조회
		selectSgg_callback();
		//초기값 조회
		selectUcertIssdLct(1);
	}
	
	/* 시군구 조회 */
	function selectSgg_callback() {
        
        var form = $("form[name=ucertIssdLctForm]").serialize();
        
        $.ajax({
            type : 'post',
            data : form,
            dataType : "json",
            url : "/cs/CsAdongCdSggListUcert.do",
            success : function(data, status) {
            	onSuccessSggList(data);
            },
            error : function(request, status) {
                alert(msgBox('', '조회하는데 실패하였습니다.'));
            }
        });
	}
	
	/* 시군구 조회결과 생성 */
	function onSuccessSggList(data) {
	
		var htmltext = "";
		
		htmltext += "<option value=\'\'>전체</option>";
		
		for ( var n = 0; n < data.list.length; n++) {
			var smSidoSggVO = data.list[n];
			htmltext += "<option value=\'" + smSidoSggVO.sggcd + "\'>" + smSidoSggVO.sggnm + "</option>";
		}
		
		$("#sggcd").html(htmltext);
	}

	/* 무인증명서발급기 위치 조회 */
	function selectUcertIssdLct(pageNo) {
	
		var iForm = document.ucertIssdLctForm;
		iForm.addrFg.value = iForm.addrFgs[0].checked == true ? "1" : "2";
		
		if (!validate(document.ucertIssdLctForm)) {
			return;
		}
		
		//목록 조회
		if(pageNo == 1) {
			$("#pageIndex").val("1");
		}
		
		selectUcertIssdLct_callback();
	}
	
	function selectUcertIssdLct_callback() {
	
		var form = $("form[name=ucertIssdLctForm]").serialize();
		
		$.ajax({
		    type : 'post',
		    data : form,
		    dataType : "json",
		    url : "/cs/CsUcertIssdLctInq.do",
		    success : function(data, status) {
		    	onSuccessUcertIssdLct(data);
		    },
		    error : function(request, status) {
		        alert(msgBox('', '조회하는데 실패하였습니다.'));
		    }
		});
	}	
	
	/* 무인증명서발급기 위치 조회결과 생성*/
	function onSuccessUcertIssdLct(data) {
		var iForm = document.ucertIssdLctForm;
		var htmltext = "";
		$("#totCnt").val(data.resultList.length);
		
		if (data.resultList.length == 0) {
			htmltext += "<li class=\"nodata\"> 조회 결과가 없습니다.</li>";
		} else {
			var pIndex = data.ucertIssdLctForm.pageIndex;
		    var pSize = data.ucertIssdLctForm.recordCountPerPage;
			
			for ( var n = 0; n < data.resultList.length; n++) {
				var csUcertIssdLctVO = data.resultList[n];
				htmltext += "<li id=\"list" + n + "\" class=\"mapInfo\"><a href=\"#\" onclick=\"fnKakaoMapOuput("+"'"+csUcertIssdLctVO.strNmAddr+"'"+",'"+csUcertIssdLctVO.adongAddr+"','"+csUcertIssdLctVO.dtlAddr+"','"+csUcertIssdLctVO.reprTelNo+"','"+n+"');\">";
				htmltext += "<div><p class=\"title\">" + csUcertIssdLctVO.dtlAddr + "</p>";
				htmltext += "<address class=\"strNm\">" + csUcertIssdLctVO.strNmAddr + "</address>";
				htmltext += "<address class=\"lndNo\">(지번) " + csUcertIssdLctVO.adongAddr + "</address>";
				htmltext += "<p class=\"tel\">" + csUcertIssdLctVO.reprTelNo + "</p>";
				htmltext += "</div></a></li>";
			}
		}
		
		$("#csUcertIssdLctTbl > ul").html(htmltext);
		
		//페이징
		$("#pagination").quickPager({
	        pageSize: data.paginationInfo.pageSize,
	        pageUnit: data.paginationInfo.recordCountPerPage,
	        pageIndexId: "pageIndex",
	        callback:function() {
	            selectUcertIssdLct('2');
	        },
	        currentPage: data.paginationInfo.currentPageNo,
	        totalCount: data.paginationInfo.totalRecordCount,
	        searchUrl: "#"
	    });
	    
	    //페이징변경
	    $(".first").parent().remove();
	    $(".last").parent().remove();
	}
	
	/* 카카오 맵 위치 현출 */
	function fnKakaoMapOuput(strNmAddress, adongAddress, detailAddress, telNo, listNum) {
		
		//active 클래스 추가 및 삭제
		$(".title").closest("li").removeClass("active");
		$("#list" + listNum).addClass("active");
		
		//카카오 맵 위치 현출
		mapAddress = detailAddress;
		
		if(detailAddress != null && detailAddress != "") {
			reInquiryMap = strNmAddress + " " + detailAddress;
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
						
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(reInquiryMap, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div class="marker">' + reInquiryMap + '</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		//관서, 도로명, 행정동, 전화번호 삽입
		$("#strNmAddrtmp").val(strNmAddress);
		$("#adongAddrtmp").val(adongAddress);
		$("#dtlAddrtmp").val(detailAddress);
		$("#telNotmp").val(telNo);
		$("#listNum").val(listNum);
	}
	
	/* 카카오 맵 초기화*/
	function fnKakaoMapInit() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						    
	    mapOption = {
	        center: new kakao.maps.LatLng(37.412032, 127.125481), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
						
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 결과값으로 받은 위치를 마커로 표시합니다
        var markerPosition = new kakao.maps.LatLng(37.412032, 127.125481);
        
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        
        marker.setMap(map);
	}
	
	/* 목록 hide Function */
	function fnResizeMap() {
		$('.mapList').toggleClass('hide');
		fnKakaoMapOuput($("#strNmAddrtmp").val(),$("#adongAddrtmp").val(),$("#dtlAddrtmp").val(),$("#telNotmp").val(),$("#listNum").val());
	}
	
	/* 출력 */
	function fnPrint() {
		
		if(reInquiryMap == "") {
			alert(msgBox("목록","{을를} 선택하세요."));
			return;
		}
		
		//URL 설정
		var url = "/cs/CsUcertIssdLctGuidePrt.do";
		
		//파라미터 설정
        var data = "totCnt=" + $("#totCnt").val()
        		 + "&addrFg=" + $("#addrFg").val()
        		 + "&telNo=" + $("#telNotmp").val()
        		 + "&strNmAddr=" + $("#strNmAddrtmp").val()
        		 + "&adongAddr=" + $("#adongAddrtmp").val()
        		 + "&dtlAddr=" + $("#dtlAddrtmp").val();
		
		//openPopup(document.ucertIssdLctForm, '/cs/CsUcertIssdLctGuidePrt.do', '', 'fnSearchPrgId', '700', '650', 'no');
		openPopup2(url, data, 'CsUcertIssdLctGuidePrtP', '700', '650', 'no');
	}
	
	
	
	/* 지도보기 버튼 */
	function fnMapView() {
		
		if(mapAddress == "") {
			alert(msgBox("목록","{을를} 선택하세요."));
			return;
		}
		
		var url = "https://map.kakao.com/link/search/" + mapAddress;
		window.open(url, '_blank'); 

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
        <!-- START : CONTENT -->
        <section id="content" tabindex="-1">
        	
        	<!-- START : 이전 파라미터 FORM -->
			<form id="csBltnWrtVO" name="listForm" action="/cs/CsBltnWrt.do" method="post" onsubmit="return false;">
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
        	
 <div class="breadclumbs">
    <ul>
        <li>홈</li>
        <li>고객센터</li>
        <li class="current">관할법원 위치 조회</li>
        
    </ul>
</div>


			<!-- END : 네비게이션 호출 -->
			
            <!-- START : PAGE CONTENT -->
            <div class="pageContent">
                <h2 class="pgTitle">관할법원 위치 조회</h2>
                <input type="hidden" id="inqTypeOrigin" name="inqTypeOrigin" value=""/>
				<input type="hidden" id="srchKeywdOrigin" name="srchKeywdOrigin" value=""/>
				<input type="hidden" id="srchKeywdOrigin" name="srchKeywdOrigin2" value=""/>
                
	    		<!-- START : 게시판 FORM -->
				<form id="ucertIssdLctForm" name="ucertIssdLctForm" action="/cs/CsUcertIssdLct.do" method="post" onsubmit="return false;">
	                <input type="hidden" name="totCnt" id="totCnt"/>
	                <input type="hidden" name="addrFg" id="addrFg" />
	                <input type="hidden" name="telNo" id="telNotmp" />
	                <input type="hidden" name="strNmAddr" id="strNmAddrtmp" />
	                <input type="hidden" name="adongAddr" id="adongAddrtmp" />
	                <input type="hidden" name="dtlAddr" id="dtlAddrtmp" />
	                <input type="hidden" name="listNum" id="listNum" />
	                
	                <!-- START : 게시판 조회조건 -->
	                <div class="boMultiSchWrap">
                        <div class="frmGroup">
                            <div class="iptGroup size50p">
                                <label for="sidocd" class="size3">시도</label>
                                <div class="frmDiv">
                                    <select name="sidocd" id="sidocd" class="frmInput" hname="시도" onchange="selectSgg_callback()" chkreq="true">
                                        <option value="" selected="selected">선택</option>
                                    </select>
                                </div>
                            </div>
                            <div class="iptGroup size50p">
                                <label class="size4">주소구분</label>
                                <div class="frmDiv">
                                    <label for="addrFg1"><input type="radio" name="addrFgs" id="addrFg1" checked="checked" value="1"> 도로명주소</label>
                                    <label for="addrFg2"><input type="radio" name="addrFgs" id="addrFg2" value="2"> 지번주소</label>
                                </div>
                            </div>
                            <div class="iptGroup size50p">
                                <label for="sggcd" class="size3">시군구</label>
                                <div class="frmDiv">
                                    <select name="sggcd" id="sggcd" hname="시군구" class="frmInput">
                                        <option value="" selected="selected">선택</option>
                                    </select>
                                </div>
                            </div>
                            <div class="iptGroup size50p">
                                <label for="searchword" class="size4">검색</label>
                                <div class="frmDiv">
                                    <input type="text" name="searchword" maxlength="40" types="HCNO" hname="주소검색" chkReq="false" class="frmInput" id="searchword"/>
                                </div>
                            </div>
                        </div>
                        <div class="frmBtn">
                            <button type="submit" name="button" value="조회" onclick="selectUcertIssdLct(1)">조회</button>
                        </div>
                    </div>
                    <!-- END : 게시판 조회조건 -->
	                
	                <!-- START : 카카오맵 -->
					<div class="mapSearch">
						<div class="mapList" id="csUcertIssdLctTbl">
							<h3 class="hidden">지도 검색 결과</h3>
							<button type="button" name="button" class="btnListToggle" onclick="fnResizeMap()">
								<span class="hidden">목록 감추기</span>
							</button>
							<ul>
							</ul>
							<div id="mapPaging" class="pagination">
								<ul>
									<input type="hidden" id="pageIndex" name="pageIndex" value="1"/>
		                    		<div id="pagination"></div>
								</ul>
							</div>
						</div>
						<div class="mapWrap" id="mapWrap">
							<h3 class="hidden">지도영역</h3>
							<div id="map" style="width: 100%; height: 100%;"></div>
						</div>
						<!-- START : 메인버튼 -->
						<div class="formBtn">
							<button type="button" name="button" title="새창" class="nw2" onclick="fnMapView()">지도보기</button>
							<button type="button" name="button" title="새창" class="nw2" onclick="fnPrint()">출력</button>
						</div>
						<!-- END : 메인버튼 -->
					</div>
		            <!-- END : 카카오맵 -->
	            </form>
	            <!-- END : 게시판 FORM -->
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
<footer id="ft">
    <h2 class="hidden">푸터영역</h2>
	<div class="innerContainer">
		 <!-- START : 지원센터 안내 -->
            <div class="csWrap">
                <h3 class="csTitle"><strong>사용자지원센터</strong>
					일반 통화요금 부과 (별도 정보이용료 없음)</h3>
				<p class="csCall mo-hidden">1899-2732, 031-776-7878</p>
                <p class="csCall mo-visible"><a href="tel:1899-2732">1899-2732</a>, <a href="tel:031-776-7878">031-776-7878</a></p>
                
                <span class="csInfo">월~금요일 (09:00~18:00) / 토 &middot; 일요일 및 공휴일은 휴무</span>
            </div>
            <!-- END : 지원센터 안내 -->

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
                <p>Copyright&copy;Supreme Court of Korea. All Rights reserved.</p>
            </div>
        </div>
            
        <div class="certi">
        	<a href="javascript:fn_popUp('/sm/SmBottomLinkCertificate.do','780','600');" title="새창">
            	<img src="/images/logo_isms.png" alt="정보보호관리체계인증" style="width: 30px;">
           	</a>
            &nbsp;
            <!-- 오픈날짜에 맞춰서 주석수정할 것 -->
            <!-- <img src="/images/logo_wa.gif" alt="웹접근성인증마크" style="width: 55px;"> -->
        </div>
    </div>
</footer>
<!-- END : FOOTER -->
	<!-- END : footer호출 -->
</div>
<!-- END : WRAP -->
</body>
</html>