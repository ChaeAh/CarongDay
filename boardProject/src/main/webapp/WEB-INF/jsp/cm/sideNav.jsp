<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css">
<!-- common.css의 경우 추후 디자인 분리 작업이 진행 될 경우 협의 후 참조 여부 결정이 필요합니다. -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/ui.css">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>