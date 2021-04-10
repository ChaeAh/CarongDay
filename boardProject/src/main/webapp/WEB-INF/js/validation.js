/**
 * 
 */

/***  
 * @Script Name : validation.js
 * @Description : 공통 자바스크립트 
 * @Modification Information  
 * @
 * @  수정일       수정자       수정내용
 * @ ----------   ---------   -------------------------------
 * @ 2012.05.31   박헌민       최초생성
 * @ 2014.11.19   김병옥       SR-2014-10-31-00008 전자가족관계등록시스템 발급 가능 프린터 기능 개선
 * @ 2018.02.02  권성은       [전자 출생 신고 시스템 구축 사업] checkValidation - case "DATETIME": // 일시 수정
 * @ 2019.11.25  강경혜       [SR-2019-11-25-00001] 모의 해킹 진단에 대한 결과 조치
 * 
 * @author 기술지원팀 박헌민
 * @since 2012.05.31
 * @version 1.0
 * 
 *  Copyright (C) 2012 by SAMSUNG SDS co.,Ltd. All right reserved.
 */

/// 에러메시지 포멧 정의 ///
var NO_BLANK = "{name+은는} 반드시 입력하여야 합니다.";
var NOT_VALID = "{name+이가} 올바르지 않습니다";
var NO_SPECIAL_CHAR = "{name}에 \" & < > ' @ -- $ % ; | + .. \\\\  는 허용되지 않는 문자입니다.";
var NO_SPECIAL_CHAR2 = "{name}에 -- \'$ % | + .. SCRIPT <IFRAME <OBJECT <EMBEDED <FORM JAVASCRIPT 는 허용되지 않는 문자입니다.";
var specialCharPattern = /\"|\&|\<|\>|\'|\--|\$|\%|\;|\||\+|\.\.|\@|\\\\/;
var specialCharPattern2 = /\--|\'|\$|\%|\||\+|\.\.|\SCRIPT|\<IFRAME|\<OBJECT|\<EMBEDED|\<FORM|\JAVASCRIPT|\<SVG|\<APPLET|\ONCLICK|\ONMOUSEOVER|\ONFOCUS|\AUTOFOCUS|\ONLOAD|\ONERROR|\ONDBLCLICK/;
var orgClassName = null;
var ssn1 = null;

//SR-2014-09-03-00010 신고 현주소 상세주소 관련 필터 추가(가족과 동일) : 김재욱
var NO_SPECIAL_CHAR3 = "{name}에 \" & / @ < > \\\\ ; -- \' $ % | + .. SCRIPT <IFRAME <OBJECT <EMBEDED <FORM JAVASCRIPT 는 허용되지 않는 문자입니다.";
var specialCharPattern3 = /\"|\&|\/|\@|\<|\>|\\\\|\;|\--|\'|\$|\%|\||\+|\.\.|\SCRIPT|\<IFRAME|\<OBJECT|\<EMBEDED|\<FORM|\JAVASCRIPT/;

var NO_SPECIAL_CHAR4 = "{name}에 \" & / @ < > \\\\ ; -- \' $ % | + .. SCRIPT <IFRAME <OBJECT <EMBEDED <FORM JAVASCRIPT 는 허용되지 않는 문자입니다.";
var specialCharPattern4 = /\"|\/|\&|\/|\@|\<|\>|\\\\|\;|\--|\'|\$|\%|\||\+|\.\.|\SCRIPT|\<IFRAME|\<OBJECT|\<EMBEDED|\<FORM|\JAVASCRIPT/;

var NO_SPECIAL_CHAR5 = "{name}에 \" & < > ' @ -- $ % ; | .. \\\\  는 허용되지 않는 문자입니다.";
var NO_SPECIAL_CHAR6 = "{name}에 -- \'$ % | .. SCRIPT <IFRAME <OBJECT <EMBEDED <FORM JAVASCRIPT 는 허용되지 않는 문자입니다.";
var specialCharPattern5 = /\"|\&|\<|\>|\'|\--|\$|\%|\;|\||\.\.|\@|\\\\/;
var specialCharPattern6 = /\--|\'|\$|\%|\||\.\.|\SCRIPT|\<IFRAME|\<OBJECT|\<EMBEDED|\<FORM|\JAVASCRIPT/;



/**
 * form의 필수값, 입력 형태를 체크한다.
 *
 * @param  : form
 * @return : YYYYMMDD(년월일:yyyymmdd)
 */
function validate(form)
{
  try
  {
      for (var i = 0; i < form.elements.length; i++ ) 
      {
    	  
          var el = form.elements[i];
          var filter = el.getAttribute("FILTER");
          // 필수 항목 체크
          if (el.getAttribute("CHKREQ") == "true") 
          {
             var trimval = el.value == null ? null : el.value.trim();
              if (trimval == null || trimval == "")
                  return doError(el,NO_BLANK,"sel");
          }
          if(el.tagName.toUpperCase() != "OBJECT")
          {
        	  if( filter != "off" )
              {
            	  if(filter == "offx"){
            		  //필터가 offx 인 경우 현주소의 상세주소 validation체크 수행(현 사용처는 현주소의 상세주소만 사용)
            		  if(specialCharPattern3.test(el.value)
            				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
            					 &&el.getAttribute("NAME")!="INIpluginData"))
            			  return doError(el,NO_SPECIAL_CHAR3);
                  }
            	  else{
            		  if(specialCharPattern.test(el.value)
                			  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
                				  &&el.getAttribute("NAME")!="INIpluginData"))
                		  return doError(el,NO_SPECIAL_CHAR);
                  }
              }
        	  //필터가 off여도 Xss관련한 validation체크는 수행해야 함
        	  if(specialCharPattern2.test(el.value.toUpperCase())
    				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
    					 &&el.getAttribute("NAME")!="INIpluginData"))
    			  return doError(el,NO_SPECIAL_CHAR2);
          }
          if(el.value.length != 0 && !checkValidation(el))
        	  return false;
      }
      return true;
  }
  catch(e)
  {
      e.addLocation("validate", "/js/common/validation.js"); 
      throw e;
  }
}

// [CSR번호] : SR-2014-10-31-00008 전자가족관계등록시스템 발급 가능 프린터 기능 개선 [수정자] : 김병옥
// [수정내용] : 발급가능프린터 XSS 허용하기 위한 validate 추가
function validateXss(form)
{
  try
  {
      for (var i = 0; i < form.elements.length; i++ ) 
      {
    	  
          var el = form.elements[i];
          var filter = el.getAttribute("FILTER");
          // 필수 항목 체크
          if (el.getAttribute("CHKREQ") == "true") 
          {
             var trimval = el.value == null ? null : el.value.trim();
              if (trimval == null || trimval == "")
                  return doError(el,NO_BLANK,"sel");
          }
          if(el.tagName.toUpperCase() != "OBJECT")
          {
        	  if( filter != "off" )
              {
            	  if(filter == "offx"){
            		  //필터가 offx 인 경우 현주소의 상세주소 validation체크 수행(현 사용처는 현주소의 상세주소만 사용)
            		  if(specialCharPattern3.test(el.value)
            				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
            					 &&el.getAttribute("NAME")!="INIpluginData"))
            			  return doError(el,NO_SPECIAL_CHAR3);
                  }
            	  else{
            		  if(specialCharPattern.test(el.value)
                			  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
                				  &&el.getAttribute("NAME")!="INIpluginData"))
                		  return doError(el,NO_SPECIAL_CHAR);
                  }
              }
        	  //필터가 off여도 Xss관련한 validation체크는 수행해야 함
        	  if(specialCharPattern4.test(el.value.toUpperCase())
    				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
    					 &&el.getAttribute("NAME")!="INIpluginData"))
    			  return doError(el,NO_SPECIAL_CHAR4);
          }
          if(el.value.length != 0 && !checkValidation(el))
        	  return false;
      }
      return true;
  }
  catch(e)
  {
      e.addLocation("validate", "/js/common/validation.js"); 
      throw e;
  }
}

function doError(el,type,action) 
{
  var pattern = /{([a-zA-Z0-9_]+)\+?([가-힝]{2})?}/;                    
  var name = (hname = el.getAttribute("HNAME")) ? hname : el.getAttribute("NAME");
  pattern.exec(type);
  var tail = (RegExp.$2) ? josa(eval(RegExp.$1),RegExp.$2) : "";
  alert(type.replace(pattern,eval(RegExp.$1) + tail));
  /*
  if (action == "sel") 
      el.select();
  else if (action == "del")
      el.value = "";
  */
  
    // [온라인 출생신고시스템 구축 사업] 민명선 신고인 자격이 비활성화 인 경우 IE8 에러 대처 start
    if(el.getAttribute('name') == 'arDclrVO.dclrQlfcCd'){
    	var elName = el.getAttribute("name");
	    elName = elName.replace(".","\\.");
	    $(":radio[name='"+ elName +"']").each(function(idx){
	  		if(!$(this).is(':disabled')){
	  		    $(this).focus();
	  		    return false;
	  		}
  	    });
    }else{
    	el.focus();
    }
    // [온라인 출생신고시스템 구축 사업] 민명선 신고인 자격이 비활성화 인 경우 IE8 에러 대처 end
  
  return false;
}

function validateXss2(form)
{
  try
  {
      for (var i = 0; i < form.elements.length; i++ ) 
      {
    	  
          var el = form.elements[i];
          var filter = el.getAttribute("FILTER");
          // 필수 항목 체크
          if (el.getAttribute("CHKREQ") == "true") 
          {
             var trimval = el.value == null ? null : el.value.trim();
              if (trimval == null || trimval == "")
                  return doErrorXss(el,NO_BLANK,"sel");
          }
          if(el.tagName.toUpperCase() != "OBJECT")
          {
        	  if( filter != "off" )
              {
            	  if(filter == "offx"){
            		  //필터가 offx 인 경우 현주소의 상세주소 validation체크 수행(현 사용처는 현주소의 상세주소만 사용)
            		  if(specialCharPattern6.test(el.value)
            				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
            					 &&el.getAttribute("NAME")!="INIpluginData"))
            			  return doErrorXss(el,NO_SPECIAL_CHAR6);
                  }
            	  else{
            		  if(specialCharPattern5.test(el.value)
                			  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
                				  &&el.getAttribute("NAME")!="INIpluginData"))
                		  return doErrorXss(el,NO_SPECIAL_CHAR5);
                  }
              }
        	  //필터가 off여도 Xss관련한 validation체크는 수행해야 함
        	  if(specialCharPattern6.test(el.value.toUpperCase())
    				  &&(el.getAttribute("NAME")!="_ETEExt_SEED_"
    					 &&el.getAttribute("NAME")!="INIpluginData"))
    			  return doErrorXss(el,NO_SPECIAL_CHAR6);
          }
          if(el.value.length != 0 && !checkValidation(el))
        	  return false;
      }
      return true;
  }
  catch(e)
  {
      e.addLocation("validate", "/js/common/validation.js"); 
      throw e;
  }
}

function doErrorXss(el,type,action) 
{
  var pattern = /{([a-zA-Z0-9_]+)\+?([가-힝]{2})?}/;                    
  var name = (hname = el.getAttribute("HNAME")) ? hname : el.getAttribute("NAME");
  pattern.exec(type);
  var tail = (RegExp.$2) ? josa(eval(RegExp.$1),RegExp.$2) : "";
  alert(type.replace(pattern,eval(RegExp.$1) + tail));
  return false;
}


function josa(str,tail) 
{
  return (str.hasFinalConsonant()) ? tail.substring(0,1) : tail.substring(1,2);
}


/*
 * object의 Validation 체크와 포맷을 맞춤
 *
 * Parameter : object
 * Return    : boolean
 */
function checkValidation(obj)
{
	var name = "";
	
    try
    {
        objVal = trim(obj.value);

        switch(obj.getAttribute("types"))
        {
            case "DATE":    // 날짜
            	objVal = delDateDelim(objVal);
                if(isValidDate(objVal)) 
                    addDateDelim(objVal);
                else
                {
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var alertMsg  = "의 날짜 형식이 올바르지 않거나 유효하지 않습니다.";
//                		alertMsg += "입력예시 : 20121110 (yyyyMMdd)\t";
                	
               		alert(name + alertMsg);
                	obj.focus();
                    return false;
                }
                break;

            case "DATEP":    // 날짜
            	objVal=delDateDelim(objVal);
                if(isValidDate(objVal))
                {
                	if (objVal - getCurrentDate()  > 0) {
                		alert("오늘 날짜 이후로 입력하실 수 없습니다.");
                		obj.focus();
                	    return false;
                	}
                    addDateDelim(objVal);
                }
                else
                {
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var alertMsg  = "의 날짜 형식이 올바르지 않거나 유효하지 않습니다.";
//                		alertMsg += "입력예시 : 20121110 (yyyyMMdd)\t";
                	
               		alert(name + alertMsg);
                	obj.focus();
                    return false;
                }
                addDateDelim(objVal);
                break;
            
            //  [전자 출생 신고 시스템 구축 사업]  2018.02.02  권성은 checkValidation - case "DATETIME": 일시 수정    
            case "DATETIME": // 일시
            	
            	if(isValidDatetime(objVal)) {
            		
            		//addDatetimeDelim(objVal);
            	}
                else
                {
                    return false;
                }
                break;
			
            case "TIME":    // 시간
                delTimeDelim(objVal);
                if(isValidTime(obj.value)) 
                    addTimeDelim(objVal);
                else
                {
            		name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
        			
            		var alertMsg  = "의 시간 입력이 잘못되었습니다.";
//            			alertMsg += "입력예시 : 000000, 235959 (HHmmss)\t";
               		alert(name + alertMsg);
                	obj.focus();
                	
                    return false;
                }
                break;

            case "HCHR":    // 한글 2자 이상
                if(!isKorean(obj.value))              {   
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	
                	var alertMsg  = " 한글 2자 이상만 입력하실 수 있습니다.";
//                  		alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣\n";
//                  		alertMsg += "입력예시 : 대법원, 전자가족관계";
                	
               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false; }
                else if(getByteLength(obj.value) < 4) {
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	
                	var alertMsg  = " 한글 2자 이상만 입력하실 수 있습니다.";
//                  		alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣\n";
//                  		alertMsg += "입력예시 : 대법원, 전자가족관계";
                	
               		alert(name + tail + alertMsg);
                	obj.focus();
                	return false; }
                break;

            case "CHAR":    // 한글만
                if(!isKorean(obj.value))              {   
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	
                	var alertMsg  = " 한글만 입력하실 수 있습니다.";
//                  		alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣\n";
//                  		alertMsg += "입력예시 : 대법원, 전자가족관계";
                	
               		alert(name + tail + alertMsg);
                	obj.focus();
                 	
                	return false; }
                break;
                
            case "HCNO":    // 한글 또는 숫자
            	 if(!isKoreanOrNum(obj.value))              {   
                 	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                 	var tail = josa(name,'은는');
                 	
                 	var alertMsg  = " 한글과 숫자만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣, 0 ~ 9\n";
//	                	alertMsg += "입력예시 : 대법원, 가족관계등록2006, 1201";
                 	
                		alert(name + tail + alertMsg);
                 	obj.focus();
                  	
                 	return false; }
                 break;

            case "NUMB":    // 숫자
                if(!isNum(obj.value))                 {
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 숫자만 입력하실 수 있습니다.";
//                		alertMsg += "입력범위 : 0 ~ 9\n";
//                		alertMsg += "입력예시 : 0.11, 2003, 12345.67890";
                	
               		alert(name + tail + alertMsg);
                	obj.focus();
                	return false; 
                	}
                break;

            case "ECNO":    // 숫자와 영문만
                if(!isAlphaOrNum(objVal))             {  
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 영문과 숫자만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
//	                	alertMsg += "입력예시 : simple, Scourt21, 3144";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	return false; }
                break;

            case "TELNO":    // 숫자, '-', '(', ')'
                if(!isTelNum(obj.value))              {   
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 숫자와 -, ( )만 입력하실 수 있습니다.";
//	            		alertMsg += "입력범위 : 0 ~ 9, -, (, )\n";
//	            		alertMsg += "입력예시 : 02-000-0000, (02)000-0000";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	return false; } 
                break;
            case "CECHR":
                var objValue = obj.value.replace(/ /gi, "");
                if(!isAlpha(objValue))              {   
                    name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                    var tail = josa(name,'은는');
                    var alertMsg  = " 영문과 공백만 입력하실 수 있습니다.";

                    alert(name + tail + alertMsg);
                    obj.focus();
                    return false; } 
                break;
/*
            case "EVAL":    // 숫자와 영문만
                if(isAlphaOrNum(obj.value))               {
                	
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 영문과 숫자만 입력하실 수 있습니다.\t\n\n";
	                	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
	                	alertMsg += "입력예시 : simple, Scourt21, 3144";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false; }
                break;
*/
            case "EVAL_BOTH":    // 숫자와 영문 (반드시 혼용)
                if(!isAlphaNum(obj.value))            {   
                	
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                    var alertMsg  = " 영문과 숫자만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
//	                	alertMsg += "입력예시 : simple, Scourt21, 3144";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false; } 
                break;

    
            case "SSN1":    // 주민등록번호 앞자리
                if(!isNum(obj.value))          { doError(obj,NOT_VALID); return false; }
                else if(obj.value.length != 6) { doError(obj,NOT_VALID); return false; }
                ssn1 = obj.value;
                break;

            case "SSN2":    // 주민등록번호 뒷자리
                if(!isNum(obj.value))          { doError(obj,NOT_VALID); return false; }
                else if(obj.value.length != 7) { doError(obj,NOT_VALID); return false; }
                ssn = ssn1 + obj.value;
               /* if(!isValidSSN(ssn)) 
                { 
                	return false;
                }*/
                break; 

            case "SSN":     // 주민등록번호
                if(obj.value == "" || obj.value.length != 14 || !isNum(obj.value.substring(0, 6)) || obj.value.substring(6, 7) != '-' || !isNum(obj.value.substring(7, 14)))
                {
                	doError(obj,NOT_VALID);
                    return false;
                }
                break;
                
            case "URL":    // URL
                if(!isURL(obj.value))               {
                	
                	name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " URL 형식만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
//	                	alertMsg += "입력예시 : http://www.scourt.go.kr";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false; }
                break;   
                
            case "MAILID":	// MAILID 김재욱 추가
            	if(!isAlphaOrNumSpcl(obj.value)){
            		name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 영문과 숫자 - _ . 형식만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
//	                	alertMsg += "입력예시 : http://www.scourt.go.kr";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false;
            	}
            	break;
            	
            case "DOMAIN":	// DOMAIN 김재욱 추가
            	if(!isAlphaOrNumSpclDomain(obj.value)){
            		name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 영문과 숫자 - . 형식만 입력하실 수 있습니다.\n마지막 위치에 - . 은 올 수 없습니다.";
//	                	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
//	                	alertMsg += "입력예시 : http://www.scourt.go.kr";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false;
            	}
            	break;
            	
            case "ADDRNM":	// ADDRNM 김재욱 추가
            	if(!isAddNm(obj.value)){
            		name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 한글과 숫자 또는 . 만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
//	                	alertMsg += "입력예시 : http://www.scourt.go.kr";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false;
            	}
            	break;
            	
            case "SPCLADR":	// SPCLADR 김재욱 추가
            	if(!isSpclAdr(obj.value)){
            		name = (hname = obj.getAttribute("HNAME")) ? hname : obj.getAttribute("NAME");
                	var tail = josa(name,'은는');
                	var alertMsg  = " 한글과 숫자 또는 ( ) - , . 만 입력하실 수 있습니다.";
//	                	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
//	                	alertMsg += "입력예시 : http://www.scourt.go.kr";

               		alert(name + tail + alertMsg);
                	obj.focus();
                	
                	return false;
                	
            	}
            	break;
        }
        return true;
    }
    catch(e)
    {
        e.addLocation("checkValidation", "/js/common/validation.js"); 
        throw e;
    }
}


/// 스트링 객체에 메소드 추가 ///
String.prototype.trim = function(str) 
{ 
    str = this != window ? this : str; 
    return str.replace(/^\s+/g,'').replace(/\s+$/g,''); 
}

String.prototype.hasFinalConsonant = function(str)
{
    str = this != window ? this : str; 
    var strTemp = str.substr(str.length-1);
    return ((strTemp.charCodeAt(0)-16)%28!=0);
}
    
String.prototype.bytes = function(str) 
{
    var len = 0;
    str = this != window ? this : str;
    for(j=0; j<str.length; j++) 
    {
        var chr = str.charAt(j);
        len += (chr.charCodeAt() > 128) ? 2 : 1
    }
    return len;
}