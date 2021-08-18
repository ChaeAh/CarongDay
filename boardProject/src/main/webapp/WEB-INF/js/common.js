/**
 * 
 */
/***
 * @Script Name : common.js
 * @Description : 공통 자바스크립트
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
 * @ 2012.05.31   박헌민       최초생성
 * @ 2014.11.06   김병옥       [SR-2014-10-31-00007]전자가족관계등록시스템 마크애니 솔루션 패치로 인한 배포
 * @ 2015.02.09   김병옥       [SR-2015-02-03-00002]전자가족관계등록시스템 마크애니 솔루션 패치로 인한 배포
 * @ 2015.03.03   김병옥       [SR-2015-02-24-00010]전자가족관계등록시스템 발급 가능 프린터 관련 기능개선 및 마크애니 솔루션 패치
 * @ 2015.05.28   주연호       [SR-2015-05-19-00001]전자가족관계등록시스템 발급 가능 프린터 관련 기능개선 및 마크애니 솔루션 패치
 * @ 2015.07.01   김병옥       [SR-2015-06-25-00008]전자가족관계등록시스템 마크애니 솔루션 패치 및 발급 가능 프린터 관련 안내문구 추가
 * @ 2015.09.11   김병옥       [SR-2015-09-03-00004]전자가족관계등록시스템 윈도우10 멀티브라우저 오픈 및 마크애니 패치 작업
 * @ 2015.12.17   김병옥       [SR-2015-12-14-00010]전자가족관계등록시스템 연말정산 대비 솔루션 패치 작업
 * @ 2016.03.10   손승민       [SR-2016-03-07-00002]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.05.30   손승민       [SR-2016-05-09-00005]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.05.31   정보배       [SR-2016-05-17-00002]관리자 메인화면 호출하는 함수추가
 * @ 2016.06.16   손승민       [SR-2016-06-15-00004]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.07.06   김병옥       [SR-2016-07-04-00002]전자가족관계등록시스템 발급가능프린터 관련 기능 개선을 위한 마크애니 솔루션 패치
 * @ 2016.08.23   주연호       [SR-2016-08-19-00002]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.09.06   주연호       [SR-2016-09-06-00002]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.09.22   주연호       [SR-2016-09-21-00002]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2016.11.10   주연호       [SR-2016-11-10-00007]:공시제도 개편에 따른 전자가족관계등록시스템 메뉴 추가
 * @ 2016.12.07   손승민       [SR-2016-12-05-00008]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2017.02.22   손승민       [SR-2017-02-20-00011]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2017.04.25   손승민       [SR-2017-04-19-00005]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2017.06.30   손승민       [SR-2017-06-30-00003]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2017.09.14   조은혜       [SR-2017-08-22-00007]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2017.12.07   조은혜       [SR-2017-11-27-00006]전자가족관계등록시스템 마크애니 솔루션 패치
 * @ 2018.02.22   김여진       [SR-2018-01-31-00004]전자가족관계등록시스템 마크애니 솔루션 패치  
 * @author 기술지원팀 박헌민
 * @since 2012.05.31
 * @version 1.0
 * 
 *  Copyright (C) 2012 by SAMSUNG SDS co.,Ltd. All right reserved.
 */
/* ========================= 
 *                           
 *     공통 영역 변수     
 *                           
 * ========================= */
//timeStamp 작동 여부(true/false)
var timeStampEnable = true;

// main 여부
var isMainPage = false;

 
/* ========================= 
 *                           
 *     Boolean 관련 함수     
 *                           
 * ========================= */

/***
 * 입력값이 null인지 체크한다
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isNull(objValue)
{
    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "") return true;

    return false;
}

/***
 * 입력값이 숫자인지 체크한다(정수와 실수)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isNum(objValue)
{
    var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);

            if(!((ch >= 0x30 && ch <= 0x39) || ch == 0x2E))
            {
                bool = false;
                break;
            }
        }
    }
   
	return bool;
}

/***
 * 입력값이한글인지 체크한다(한글만)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isKorean(objValue)
{
    var bool = true;
    
    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            //20120813 요청으로 스페이스 추가 (0x20) 
            if(!((ch >= 0xAC00 && ch <= 0xD7A3) || (ch >= 0x3131 && ch <= 0x314E)||(ch==0x20)))
            {
                bool = false;
                break;
            }
        }
    }
    /*
    var alertMsg  = "한글만 입력하실 수 있습니다.\t\t\n\n";
    	alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣\n";

	if(!bool) alert(alertMsg);
     */    
	return bool;
}


/***
 * 입력값이 한글이나 숫자인지 체크한다(한글 or 숫자)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isKoreanOrNum(objValue)
{
	var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            //20120813 요청으로 스페이스 추가 (0x20)
            if(!((ch >= 0xAC00 && ch <= 0xD7A3) || (ch >= 0x3131 && ch <= 0x314E) || (ch >= 0x30 && ch <= 0x39) || (ch==0x20) ))
            {
                bool = false;
                break;
            }
        }
    }
    /*
    var alertMsg  = "한글과 숫자만 입력하실 수 있습니다.\t\t\n\n";
    	alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣, 0 ~ 9\n";
    	alertMsg += "입력예시 : 대법원, 가족관계등록2006, 1201, etc.";
     
	if(!bool) alert(alertMsg);
	*/
    return bool;
}


/**
 * 
 * 입력값이 영문인지 체크한다(영문만)
 * 
 * isAlpha("abc")    = true   
 * isAlpha("가나다") = false
 * isAlpha("123")    = false
 * 
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAlpha(objValue)
{
	var bool = true;
    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            if(!((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A)))
            {
                bool = false;
                break;
            }
        }
    }
    /* 
    var alertMsg  = "영문만 입력하실 수 있습니다.\t\n\n";
    	alertMsg += "입력범위 : a ~ Z\n";
    	alertMsg += "입력예시 : simple, Scourt, etc.";
    
    if(!bool) alert(alertMsg);
    */
    return bool;
}

/***
 * 입력값이 영문과 숫자인지 체크한다(영문, 숫자 반드시 혼용)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAlphaNum(objValue)
{
    var  bool = true;
    var aBool = false;
    var nBool = false;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            if((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A))
            {
                aBool = true;
            }
            else if(ch >= 0x30 && ch <= 0x39)
            {
                nBool = true;
            }
            else
            {
                bool = false;
                break;
            }
        }
    }
    if(bool&&aBool && nBool) bool = true;
    else               bool = false;
    /*
    var alertMsg  = "영문과 숫자만 입력하실 수 있습니다.\t\n\n";
    	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
    	alertMsg += "입력예시 : simple, Scourt21, 3144, etc.";
    
    if(!bool) alert(alertMsg);
    */
    return bool;
    
}

/***
 * 입력값이 영문이나 숫자인지 체크한다(영문 or 숫자)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAlphaOrNum(objValue)
{
   var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);

            if(!(((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A)) || (ch >= 0x30 && ch <= 0x39)))
            {
                bool = false;
                break;
            }
        }
    }
/*    
    var alertMsg  = "영문과 숫자만 입력하실 수 있습니다.\t\n\n";
    	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
    	alertMsg += "입력예시 : simple, Scourt21, 3144, etc.";

    if(!bool) alert(alertMsg);
    */
    return bool;
}

/***
 * 김재욱 추가
 * 입력값이 영문이나 숫자인지 체크한다(영문 or 숫자 or -,_,.)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAlphaOrNumSpcl(objValue)
{
   var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);

            if(!(((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A)) || (ch >= 0x30 && ch <= 0x39) || (ch == 0x2D) || (ch == 0x2E) || (ch == 0x5F)))
            {
                bool = false;
                break;
            }
        }
    }
/*    
    var alertMsg  = "영문과 숫자만 입력하실 수 있습니다.\t\n\n";
    	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
    	alertMsg += "입력예시 : simple, Scourt21, 3144, etc.";

    if(!bool) alert(alertMsg);
    */
    return bool;
}

/***
 * 김재욱 추가
 * 입력값이 영문이나 숫자인지 체크한다(영문 or 숫자 or -,.)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAlphaOrNumSpclDomain(objValue)
{
   var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);

            if(!(((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A)) || (ch >= 0x30 && ch <= 0x39) || (ch == 0x2D) || (ch == 0x2E)))
            {
                bool = false;
                break;
            }
            if(i==(objValue.length-1)){
            	if((ch == 0x2D) || (ch == 0x2E)){
            		bool = false;
            		break;
            	}
            }
        }
    }
/*    
    var alertMsg  = "영문과 숫자만 입력하실 수 있습니다.\t\n\n";
    	alertMsg += "입력범위 : a ~ Z, 0 ~ 9\n";
    	alertMsg += "입력예시 : simple, Scourt21, 3144, etc.";

    if(!bool) alert(alertMsg);
    */
    return bool;
}

/***
 * 입력값이 한글이나 숫자인지 체크한다(한글 or 숫자)
 * 김재욱 추가
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isAddNm(objValue)
{
	var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            //20120813 요청으로 스페이스 추가 (0x20)
            //도로명 특성상 . 추가 (0x2E)
            if(!((ch >= 0xAC00 && ch <= 0xD7A3) || (ch >= 0x3131 && ch <= 0x314E) || (ch >= 0x30 && ch <= 0x39) || (ch==0x20) || (ch==0x2E) ))
            {
                bool = false;
                break;
            }
        }
    }
    /*
    var alertMsg  = "한글과 숫자만 입력하실 수 있습니다.\t\t\n\n";
    	alertMsg += "입력범위 : ㄱ ~ ㅎ, 가 ~ 힣, 0 ~ 9\n";
    	alertMsg += "입력예시 : 대법원, 가족관계등록2006, 1201, etc.";
     
	if(!bool) alert(alertMsg);
	*/
    return bool;
}

/***
 * 입력값이 숫자인지 체크한다(정수)
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isInteger(objValue)
{
    var bool = true;

    if(objValue != null) objValue = trim(objValue);

    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            if(!(ch >= 0x30 && ch <= 0x39))
            {
                bool = false;
                break;
            }
        }
    }
    /*
    var alertMsg  = "정수만 입력하실 수 있습니다.\t\t\n\n";
    	alertMsg += "입력범위 : 0 ~ 9\n";
    	alertMsg += "입력예시 : 011, 2003, 1234567890, etc.";
        
    if(!bool) alert(alertMsg);
     */
    return bool;
}



/***
 * 입력값이 전화번호인지 체크한다
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isTelNum(objValue)
{
    var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;
    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);
            if(!((ch >= 0x30 && ch <= 0x39) || ch == 0x28 || ch == 0x29 || ch == 0x2D))
            {
                bool = false;
                break;
            }
        }
    }
	/*var alertMsg  = "숫자와 -, ( )만 입력하실 수 있습니다.\t\t\n\n";
		alertMsg += "입력범위 : 0 ~ 9, -, (, )\n";
		alertMsg += "입력예시 : 02-000-0000, (02)000-0000, etc.";
	if(!bool) alert(alertMsg);
   */
	return bool;
}



/***
 * 주민등록번호(13자리)를 체크한다
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isValidSSN(objValue)
{
    objValue = trim(objValue);
    var year   = objValue.substring(0,2);
    var month  = objValue.substring(2,4);
    var day    = objValue.substring(4,6);
    var sex    = objValue.substring(6,7);
    var result = false;
    
    if     (sex=="1" || sex=="2")
        year="19"+year;
    else if(sex=="3" || sex=="4")
        year="20"+year;

    if(isValidMonth(month) && isValidDay(year, month, day))
    {
        var check   = 0;
        var frontNo = objValue.substring(0, 6);
        var rearNo  = objValue.substring(6,13);

        for(var i=0; i<= 5; i++)
            check = check + (( i % 8 + 2 )* parseInt(frontNo.substring(i,i+1)));

        for(var i=6; i<=11; i++)
            check = check + (( i % 8 + 2 )* parseInt(rearNo.substring(i-6,i-5)));

        check = 11 - (check % 11);
        check = check % 10;

        if(check == parseInt(objValue.substring(12,13)))
            result=true;
    }
    var alertMsg  = "주민등록번호 형식이 올바르지 않습니다.";
	if(!result) alert(alertMsg);
    
    return result;
}

/***
 * 외국인등록번호 유효성 체크 함수 / 외국인등록번호(13자리)를 체크한다
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isValidFSSN(objValue)
{
    objValue = trim(objValue);
    var year   = objValue.substring(0,2);
    var month  = objValue.substring(2,4);
    var day    = objValue.substring(4,6);
    var sex    = objValue.substring(6,7);
    var result = false;

    if     (sex=="5" || sex=="6")
        year="19"+year;
    else if(sex=="7" || sex=="8")
        year="20"+year;
    else if(sex=="9" || sex=="0")
        year="21"+year;            

    if(isValidMonth(month) && isValidDay(year, month, day))
    {
	    var sum = 0;
	    var odd = 0;
	    
	    buf = new Array(13);
	    for (var i = 0; i < 13; i++) buf[i] = parseInt(objValue.charAt(i));
	    
	    odd = buf[7]*10 + buf[8];
	    if (odd%2 != 0) {
	      return false;
	    }
	
	    if ((buf[11] != 6)&&(buf[11] != 7)&&(buf[11] != 8)&&(buf[11] != 9)) {
	      return false;
	    }

	    multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
	    for (i = 0, sum = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);
	
	    sum=11-(sum%11);

	    if (sum>=10) sum-=10;

	    sum += 2;

	    if (sum>=10) sum-=10;

	    if ( sum != buf[12]) {
	        return false;
	    }
	    else {
	        result=true;
	    }
    }
    var alertMsg  = "외국인등록번호 형식이 올바르지 않습니다.";
	if(!result) alert(alertMsg);
	
    return result;
}

/***
 * 입력값이 URL인지 체크한다
 * @param objValue 
 * @return  true / false
 * @exception 
 */
function isURL(objValue)
{
    var bool = true;

    if(objValue != null) objValue = trim(objValue);
    if(objValue == null || objValue == "")
        bool = false;

    else
    {
        for (var i=0; i<objValue.length; i++)
        {
            ch = objValue.charCodeAt(i);

            if(!(((ch >= 0x61 && ch <= 0x7A) || (ch >= 0x41 && ch <= 0x5A)) || (ch >= 0x2E && ch <= 0x3A) || ch == 0x26 || ch == 0x3D || ch == 0x3F || ch == 0x5F))
            {
                bool = false;
                break;
            }
        }
    }
/*
    var alertMsg  = "URL 형식만 입력하실 수 있습니다.\t\t\n\n";
    	alertMsg += "입력범위 : 0 ~ 9, a ~ Z, ., =, /, ?, &, _ \n";
    	alertMsg += "입력예시 : http://www.scourt.go.kr, etc.";

	if(!bool) alert(alertMsg);
   */
    return bool;

}

/* 
 *                           
 *     String 관련 함수     
 *                           
 * ========================= */


/***
 * 입력받은 문자열의 왼쪽 공백을 제거한다. 
 * @param str : 문자열
 * @return str : 문자열
 * @exception 
 */
function ltrim(str)
{
	while (1)
	{
		if ( str.substring(0, 1) == " " )

		{
			str = str.substring(1, str.length);

		}
		else if (str.charCodeAt(0)	==	13	&&	str.charCodeAt(1)	==	10)
		{
			str = str.substring(2, str.length);
		}
		else
		{
			break;
		}
	}
	return str;
}


/***
 * 입력받은 문자열의 오른쪽 공백을 제거한다. 
 * @param str : 문자열
 * @return str : 문자열
 * @exception 
 */
function rtrim( str )
{
	while (1)
	{
		if ( str.substring(str.length - 1, str.length) == " " )
		{
			str = str.substring(0, str.length - 1);
		}
		else if (str.charCodeAt(0)	==	13	&&	str.charCodeAt(1)	==	10)
		{
			str = str.substring(0, str.length - 2);
		}
		else
		{
			break;
		}
	}
	return str;
}


/***
 * 입력받은 문자열의 공백을 제거한다. 
 * @param str : 문자열
 * @return str : 문자열
 * @exception 
 */
function trim(str) {
	var tmpstr = ltrim(str);
	return rtrim(tmpstr);
}


/***
 * 주어진 길이보다 길이가 작은 문자열 앞에 "0"을 붙여 패딩한다
 * 
 * paddingZero(any, 5) = 00aaa  
 * 
 * 
 * @param 	string, int
 * @return 	string
 * @exception 
 */
function paddingZero(str, len)
{
    if(!isNaN(str)) str + "";

    var strLen = str.length;
    var cab = 0;
    var tmp = "";


    if (strLen >= len)
        return str;
    else
        cab = len - strLen;

    for (var ii=0; ii<cab; ii++)

        tmp = "0" + tmp;



    return tmp + str;
}


/***
 * 주어진 길이보다 길이가 작은 문자열 뒤에 "0"을 붙여 패딩한다
 * @param 	string, int
 * @return 	string
 * @exception 
 */
function paddingZeroBack(str, len)
{
    if(!isNaN(str)) str + "";

    var strLen = str.length;
    var cab = 0;
    var tmp = "";

    if (strLen >= len)
        return str;
    else
        cab = len - strLen;



    for (var ii=0; ii<cab; ii++)

        tmp = "0" + tmp;



    return str + tmp;
}


/***
 * 단어 맨 뒷글자의 받침 유무를 검사하여 적당한 접미사를 찾아준다
 * 
 * ex) stn = changeFinalPattern("가감", "을를");
 * 결과 : 가감을
 * 
 * @param 	string, string
 * @return 	string
 * @exception 
 */
function changeFinalPattern(strnt, suffix)
{
    if(strnt == " ")
        return "";

    var rv = "";

    var lastNum = strnt.substring(strnt.length-1);


    if(lastNum == "0" || lastNum == "1" || lastNum == "3" || lastNum == "6" || lastNum == "7" || lastNum == "8")

        return trim(strnt + suffix.charAt(0));

    else if(lastNum == "2" || lastNum == "4" || lastNum == "5" || lastNum == "9")

        rv = trim(strnt + suffix.charAt(1));

    else
    {
        rv = "";

        var ch = escape(strnt.charAt(strnt.length-1)).replace("%u", "0x");

        var ox = eval("((ch - 0xAC00) % (0x15 * 0x1C)) % 0x1C");

        if(ox > 0)

            rv = trim(strnt + suffix.charAt(0));

        else

            rv = trim(strnt + suffix.charAt(1));

    }
    return rv;
}

/** 스트링에서 특정 Character의 갯수를 센다
 *
 * ex) cntChr = countChar("#######-####-#######", "#");
 *     결과 : 18
 *
 * @param : string, character
 * @return    : count
 */

function countChar(str, chr)
{
    var cntChr = 0;
    for(var i=0; i<str.length; i++)
    {
        if(str.charAt(i) == chr)
            cntChr++;
    }

    return cntChr;
}



/* ========================= 
 *                           
 *     Focus 관련 함수     
 *                           
 * ========================= */

/**

 * 숫자만, 한글만, 영문만 입력가능하도록 처리하는 함수

 *

 * @param : obj

 * @return :

*/
function checkTypes(obj)

{

  
        keynum = event.keyCode;

        switch(obj.getAttribute("types"))

        {

            case "DATE":    // 날짜

            case "DATEP":   // 날짜(미래날짜 입력불가)

            case "DATETIME":// 일시

            case "TIME":    // 시간

            case "SSN1":    // 주민번호 앞자리

            case "SSN2":    // 주민번호 뒷자리

            case "FSSN1":   // 외국인등록번호 앞자리

            case "FSSN2":   // 외국인등록번호 뒷자리 

            case "CURR":    // 통화

            case "NUMB":    // 숫자
                obj.style.imeMode = "disabled";

                if(!(keynum >= 0x30 && keynum <= 0x39))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "SSN":     // 주민번호

                obj.style.imeMode = "disabled";

                if(!((keynum >= 0x30 && keynum <= 0x39) || keynum == 0x2D))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "FSSN":     // 외국인등록번호

                obj.style.imeMode = "disabled";

                if(!((keynum >= 0x30 && keynum <= 0x39) || keynum == 0x2D))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break; 

            case "TELNO":   // 전화번호

                obj.style.imeMode = "disabled";

                if(!((keynum >= 0x30 && keynum <= 0x39) || keynum == 0x28 || keynum == 0x29 || keynum == 0x2D))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "HCHR":    // 한글

            case "CHAR":    // 한글

                obj.style.imeMode = "active";

                if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E)))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "HCNO":    // 한글 또는 숫자

                obj.style.imeMode = "active";

                if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E) || (keynum >= 0x30 && keynum <= 0x39)))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "ECHR":    // 영문

                obj.style.imeMode = "disabled";

                if(!((keynum >= 0x61 && keynum <= 0x7A) || (keynum >= 0x41 && keynum <= 0x5A)))

                {

                    obj.focus();

                    event.returnValue=false;

                }

                else return true;

                break;

            case "CECHR":    // 영문(대문자) 또는 공백

                obj.style.imeMode = "disabled";

				if(!(((keynum >= 0x61 && keynum <= 0x7A) || (keynum >= 0x41 && keynum <= 0x5A)) || keynum == 0x20 ))            

                {

                    obj.focus();

                    event.returnValue=false;

                }

				else return true;

                break;    

            case "ECNO":    // 영문 또는 숫자

                obj.style.imeMode = "disabled";

                if(!(((keynum >= 0x61 && keynum <= 0x7A) || (keynum >= 0x41 && keynum <= 0x5A)) || (keynum >= 0x30 && keynum <= 0x39)))

                {

                    obj.focus();

                    event.returnValue=false;

                }

                else return true;

                break;

            case "HNCH":

                if(keynum != 229 && keynum != 8 && keynum !=9 && keynum != 35 && keynum != 36 && keynum != 37 && keynum != 39 && keynum != 46 && (keynum < 48 || keynum > 57) )

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "NOTQ":

                if(keynum == 220 || keynum == 222 )

                {

                    obj.focus();

                    event.returnValue=false;

                }

                else return true;

                break;

            case "URL" :    // 영문, 숫자, ?./=_&:

                obj.style.imeMode = "disabled";

                if(!(((keynum >= 0x61 && keynum <= 0x7A) || (keynum >= 0x41 && keynum <= 0x5A)) || (keynum >= 0x2E && keynum <= 0x3A) || keynum == 0x26 || keynum == 0x3D || keynum == 0x3F || keynum == 0x5F))

                {

                    obj.focus();

                    event.returnValue=false;

                }

                else return true;

                break;

            case "HNSP":    // 한글, 숫자, ", .,()-Space

                obj.style.imeMode = "active";

                if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E) || (keynum >= 0x30 && keynum <= 0x39) || keynum == 0x20 || keynum == 0x22 || keynum == 0x28 || keynum == 0x29 || (keynum >= 0x2C && keynum <= 0x2E)))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

            case "HNSPS":    // 한글, 숫자, ", .,()-Space, '

                obj.style.imeMode = "active"; 

                if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E) || (keynum >= 0x30 && keynum <= 0x39) || keynum == 0x20 || keynum == 0x22 || keynum == 0x27 || keynum == 0x28 || keynum == 0x29 || (keynum >= 0x2C && keynum <= 0x2E)))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break; 

            case "RCHR":    // 한글, . //도로명을 위한 types

                obj.style.imeMode = "active";

                if(!((keynum >= 0xAC00 && keynum <= 0xD7A3) || (keynum >= 0x3131 && keynum <= 0x314E)|| (keynum >= 0x30 && keynum <= 0x39)|| keynum == 0x2E))

                {

                    obj.focus();

                    event.returnValue = false;

                }

                else return true;

                break;

        }
}



/**

 * 입력받은 row의 색을 변환

 *

 * @param : object

*/
function changeRowColor(obj)
{

    try

    {

        selectedEle = obj;

        selectedEle.style.background = "CBE7BA";

    }

    catch(e)

    {

        e.addLocation("changeRowColor", "/js/common/common.js");

        throw e;

    }

}

/***
 * frm을 입력받아 암호화하여 submit한다. 
 * @param frm 
 * @return  
 * @exception 
 */
function encSubmit(frm, callback)
{
	EncForm(frm, callback)
}

function nBrandSubmit(frm)
{
	try
	{
			frm.submit();
	    return false;
	}
	catch(e)
	{
		e.addLocation("submit", "/js/common/common.js");
        throw e;
	}
}


/***
 * ajax용 암호화 
 * @param frm 
 * @return  
 * @exception 
 */
function ajaxEnc(frm, array1, array2)
{
	var chkValue;
	var tmpEl = new Array();
	var tmpElValue = new Array();
	var k = 0;
	for (var i = 0; i < array1.length; i++ )
	{
		chkValue = 0;
		for (var j = 0; j < frm.elements.length; j++ ) 
	    {	
			if(frm.elements[j].getAttribute("NAME")==array1[i]&&chkValue==0)
			{
				tmpEl[k]     = j;
				tmpElValue[k] = frm.elements[j].value;
				frm.elements[j].value = array2[i];
				chkValue = 1;
				k += 1;
			}
			
	    }
		if(chkValue==0)
		{
			var obj = document.createElement("<input type='text' name='"+array1[i] +"' value='"+ array2[i]   +"'>");
			frm.appendChild(obj);
		}
	}
	if(EncForm2(frm, frm))
	{
		for (var l = 0; l < tmpElValue.length; l++ )
		{
			frm.elements[tmpEl[l]].value                = tmpElValue[l]; 
		}
		return true;
	}
}


//TimeStamp - Request time 셋팅
function setTimeStamp(){

	if(timeStampEnable){
		var rqstTmsp = new Date();

		//var yy = rqstTmsp.getYear();
		var yy = rqstTmsp.getFullYear();

		var mm = rqstTmsp.getMonth() + 1;

		if (mm < 10) mm = "0" + mm;

		var dd = rqstTmsp.getDate();

		dd = dd.toString();

		if (dd.length != 2) dd = "0" + dd;

		var hh = rqstTmsp.getHours();

		hh = hh.toString(); 

		if (hh.length != 2) hh = "0" + hh;

		var mm2 = rqstTmsp.getMinutes();

		mm2 = mm2.toString(); 

		if (mm2.length != 2) mm2 = "0" + mm2;

		var sec = rqstTmsp.getSeconds();

		sec = sec.toString(); 

		if (sec.length != 2) sec = "0" + sec;

		var msec = rqstTmsp.getMilliseconds();

		msec = msec.toString(); 

		if (msec.length != 3) msec = "0" + msec;

		if (msec.length != 3) msec = "0" + msec;

		return yy + "" + mm + "" + dd + "" + hh + "" + mm2 + "" + sec + "" + msec;
	}

}

/* 메세지를 출력한다
*
* ex) array[0] = "경상북도 경산"
*     array[1] = "KYUNGSAN"
*     array[2] = "김경산"
*     stn = msgBox(array, "CIUM0009");
*     결과 : 현재 '경상북도 경산'에 관장자가 존재합니다.
*
*              - 관장자 ID : KYUNGSAN
*              - 관장자 성명 : 김경산
*
* Parameter : array, msgNumber
* Return    : message
*/
function msgBox(sarray, msgNumber)
{
    try
    {
        var msg = msgNumber;
        var cut = msg;
        var cnt = countChar(cut, "{");

        var flag = (typeof sarray);
        
        if(flag == 'string')
            var array = new Array(sarray);
        else
        	array = sarray;

        if(cnt < 1) return msg;

        var isb = checkArray(array);

        for(var i=0; i<cnt; i++)
        {
            var spos = cut.indexOf("{");
            var epos = cut.indexOf("}");

            var size = (epos + 1) - spos;
            var mssg = cut.substring(spos, epos+1);

            if(size > 3)
                if(isb) chms = changeFinalPattern(array[i], cut.substring(spos+1, epos));
                else    chms = changeFinalPattern(array   , cut.substring(spos+1, epos));
            else
                if(isb) chms = trim(array[i]);
                else    chms = trim(array);

            rm = msg.replace(mssg, chms);

            msg = rm;
            cut = cut.substring(cut.indexOf("}")+1);
        }

        for(var i=0; i<cnt; i++)
        {
            rm = rm.replace("<br>", "\n");
            rm = rm.replace("<tab>", "\t");
        }

        return rm;
    }
    catch(e)
    {
        e.addLocation("msgBox", "/common/common.js");
        throw e;
    }
}

/* 입력값이 Array인지 일반 string인지 체크한다
*
* Parameter : array string
* Return    : boolean
*/
function checkArray(array)
{
   try
   {
       if(array[0]) return true;
   }
   catch(e)
   {
       return false;
   }
}

/* 스트링에서 특정 Character의 갯수를 센다
*
* ex) cntChr = countChar("#######-####-#######", "#");
*     결과 : 18
*
* Parameter : string, character
* Return    : count
*/
function countChar(str, chr)
{
   try
   {
       var cntChr = 0;
       for(i=0; i<str.length; i++)
       {
           if(str.charAt(i) == chr)
               cntChr++;
       }

       return cntChr;
   }
   catch(e)
   {
       e.addLocation("countChar", "/js/common/common.js");
       throw e;
   }
}

/* 단어 맨 뒷글자의 받침 유무를 검사하여 적당한 접미사를 찾아준다
*
* ex) stn = checkFinalPattern("가감", "을를");
*     결과 : 가감을
*
* Parameter : string, string
* Return    : string
*/
function changeFinalPattern(strnt, suffix)
{
   try
   {
       if(strnt == " ")
           return "";

       var lastNum = strnt.substring(strnt.length-1);

       if(lastNum == "0" || lastNum == "1" || lastNum == "3" || lastNum == "6" || lastNum == "7" || lastNum == "8")
           return trim(strnt + suffix.charAt(0));
       else if(lastNum == "2" || lastNum == "4" || lastNum == "5" || lastNum == "9")
           rv = trim(strnt + suffix.charAt(1));
       else
       {
           var rv = "";
           var ch = escape(strnt.charAt(strnt.length-1)).replace("%u", "0x");
           var ox = eval("((ch - 0xAC00) % (0x15 * 0x1C)) % 0x1C");

           if(ox > 0)
               rv = trim(strnt + suffix.charAt(0));
           else
               rv = trim(strnt + suffix.charAt(1));
       }

       return rv;
   }
   catch(e)
   {
       e.addLocation("countChar", "/js/common/common.js");
       throw e;
   }
}

/*
*//***
 * 마우스 on 시 row의 색상을 바꿔준다.
 * @param event 
 * @return  
 * @exception 
 *//*
function mouseOver(e)
{
 var targ = null;
    
 //브라우저별 event 객체 처리방식에 따른 분기
    if (!e){
     var e = window.event;
    }
    if (e.target){ //FF
     targ = e.target;
    }
    else if (e.srcElement){ //IE 
     targ = event.srcElement;
    }
    
    targ.parentNode.style.background='#E7E7E7';
}

*//***
 * 마우스 out 시 row의 색깔을 바꿔준다
 * @param event,  selectedEle
 * @return 
 * @exception 
 *//* 
function mouseOut(e, se)
{
 var targ = null;
    
 //브라우저별 event 객체 처리방식에 따른 분기
    if (!e){
     var e = window.event;
    }
    if (e.target){ //FF
     targ = e.target;
    }
    else if (e.srcElement){ //IE 
     targ = event.srcElement;
    }
    
    if (targ.parentNode != se)
    {
     targ.parentNode.style.background= '#FFFFFF';
        return;
    }
    targ.parentNode.style.background= '#E3F2DA';
}

*//***
 * 마우스 out 시 row의 색깔을 바꿔준다
 * @param event,  selectedEle
 * @return 
 * @exception 
 *//* 
function mouseOut2(e)
{
 var targ = null;
    
 //브라우저별 event 객체 처리방식에 따른 분기
    if (!e){
     var e = window.event;
    }
    if (e.target){ //FF
     targ = e.target;
    }
    else if (e.srcElement){ //IE 
     targ = event.srcElement;
    }
    targ.parentNode.style.background= '#FFFFFF';
}*/

/* 특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리한다. ( <, >, &,@,/)
*
* Parameter : string
* Return    : string
*/
function replaceXss(str)
{
   try
   {
	   	var tmpString = str;	
		var rtnStr = null;
		
		/*
		tmpString = tmpString.replace(/</g, "&lt;");   
		tmpString = tmpString.replace(/>/g, "&gt;");   
		tmpString = tmpString.replace(/&/g, "&amp;");  
		tmpString = tmpString.replace(/ /g, "&nbsp;"); 
		tmpString = tmpString.replace(/\'/g, "&apos;"); 
		tmpString = tmpString.replace(/\"/g, "&quot;"); 
		*/
		
		tmpString = tmpString.replace("&#60;","<");
		tmpString = tmpString.replace("&#62;",">");
		tmpString = tmpString.replace("&#64;","@");
		tmpString = tmpString.replace("&#47;","/");
		tmpString = tmpString.replace("&#38;","&");
		
		rtnStr = tmpString;

		return rtnStr;
   }
   catch(e)
   {
       e.addLocation("replaceXss", "/js/common/common.js");
       throw e;
   }
}

// input에서 Enter key 를 눌러서 Submit이 발생하는 것을 방지.
// 단, textarea는 제외
document.onkeypress = CancelEnterKey;

function CancelEnterKey(e) {
	var keyCode = getKeyCode(e);
	var tagType = getTagType(e);
	
	if ((keyCode == 13) && (tagType == "text" || tagType == "checkbox" || tagType == "radio" || tagType == null)) {
		if(getAttributeValue(e, "submit") == "Y")
			return;

		return false; 
	}
}

function getKeyCode(e) {
	var keyCode;
 
	if(window.event)
		keyCode = window.event.keyCode;
	else if(e)
		keyCode = e.which;
	 
	return keyCode;
}

function getTagType(e) {
	var tagType;
 
	if(e)
		tagType = e.target.type;
	else
		tagType = event.srcElement.type;
	 
	return tagType;
}

function getAttributeValue(e, attr) {
	var val;
 
	if(window.event) {
		val = eval('event.srcElement.getAttribute("' + attr + '")');
	}
	else {
		val = eval('e.target.getAttribute("' + attr + '")');
	}

	return val;
}

/*
* CTRL Key와 Backspace, F5 Key를 막는다.
*/

document.onkeydown  = checkKeys;

function checkKeys(e) {
	
	try {
		var keyCode = getKeyCode(e);
		var tagType = getTagType(e);

		var readonly = false;
		
		if(getAttributeValue(e, "readonly") == true || getAttributeValue(e, "readonly") == 'readonly')
            readonly = true;
		
		// readonly 속성일때 백스페이 이벤트 동작 방지
		if(keyCode == 8 && readonly == true) {
            event.keyCode      = 0;
            event.cancelBubble = true;
            
            if(event.preventDefault){
                event.preventDefault();
            } else {
                event.returnValue = false;
            }				
		}

		// Control Key
		if(keyCode == 17) {
            event.cancelBubble = true;
            
            if(event.preventDefault){
                event.preventDefault();
            } else {
                event.returnValue = false;
            }
		}
		// BackSpace(8) 금지
		else if((keyCode == 8) && !(tagType == 'text' || tagType == 'textarea' || tagType == 'password')) {
            event.keyCode      = 0;
            event.cancelBubble = true;
            
            if(event.preventDefault){
                event.preventDefault();
            } else {
                event.returnValue = false;
            }	
		}
		// F5(116) 금지
		else if((keyCode == 116)) {
            event.keyCode      = 0;
            event.cancelBubble = true;
            
            if(event.preventDefault){
                event.preventDefault();
            } else {
                event.returnValue = false;
            }			
       }
   }
   catch(e)
   {
       e.addLocation("checkKeys", "/js/common/common.js");
       throw e;
   }
}

//AnySign 체크 판단 변수
var anysignChkFg = "Anysign"; 
/*************** 솔루션 전체 설치 체크 시작*****************/
function fn_chk_solution_installed(anysignChk) {
	if(anysignChk == "noAnysign"){
		anysignChkFg = anysignChk;
	}
	// VoiceEye
	abvm_versionCheckStart(["ActiveBridge", "VOICEYE Web Maker"], wsab_versionCheckStart_callback);
}

function wsab_versionCheckStart_callback(result, programInfoArray, errorCode, errorMsg)
{
	//보이스아이 체크 성공
	if (result == VERMGR_CB_UPTODATE)
    {
		//MarkAny + OZ 체크
		maBrokerInit(OZ_MA_InstallCheck, 'getVersion', false );
    }
	// 일부 제품 미설치 또는 이전 버전
    // todo: 수동 설치파일 다운로드 페이지로 이동하도록 수정하면 됩니다.
	else if (result == VERMGR_CB_MUSTINSTALL)
    {
        window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=VoiceEyeNX";          
    }
    // 오류발생
    // todo: 오류코드가 800번 이상이면 사용자 OS 및 브라우저가 지원되지 않는 대상으로 적절한 메시지를 출력하세요.
    //       오류코드가 800번 미만이면 개발 단계에서 발생할 수 있는 오류이므로 (주)보이스아이로 연락주세요.
    else if (result == VERMGR_CB_ERROR)
    {
        alert("오류코드: " + errorCode + "\n상세정보: " + errorMsg);
    }   
}

function OZ_MA_InstallCheck() {
	if (typeof (maResJsonData) != 'string') {
		for (var chkFile_i = 0; chkFile_i < maResJsonData.length; chkFile_i++) {
			var installFlag = maResJsonData[chkFile_i].installFlag
			if (installFlag == false) {
				if(chkFile_i < 2) {
					window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=MarkanyNX";
				}
				else {
					window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=OZViewerNX";
				}
			}
		}
	} else {
		window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=MarkanyNX";
	}
	
	if (maOnlyInstallFlag == true) {
		/**
		 * 프린터 드라이버 자동 업데이트
		 * Init함수. 콜백함수 및 명령어 세팅 후 브로커 호출
		 * @param maEPS_InstallCheck - 리턴해줄 콜백 함수. 전역변수 maResJsonData에 최종 결과 JSON 데이터를 받을 수 있습니다.
		 * @param commandType - 실행할 명령어 타입(getVersion, executeBinary, getClientInfo, getPrintInfo)
		 * @param repeatCheckflag - 반복 체크 여부
		 */
		maBrokerInit(updatePrinterDATFunc, 'updatePrinterDAT', false);
	}
}

function updatePrinterDATFunc(){
	//ASTX 체크
	fn_check_astx_running();
}

//가상화,원격 판단 변수
var isVMRemote;

function fn_check_astx_running() {
	
	$ASTX2.setOption({e2eform:true});
	
	$ASTX2.init(
    	function onSuccess() {
    		
    		//키보드보안 초기화  + 한컴 연동
    		$ASTX2.initE2E(1967,
    				function fnComplete(){
		    			if(anysignChkFg == "Anysign"){
		    				// AnySign 체크
		    				PrintObjectTag ();
		    			}
    				}
    		);
    		//value가 0일 경우 가상환경/원격환경 둘 다 아님 1일 경우 가상환경 or 원격환경에 있음
    		$ASTX2.isVmRemoteEnv(
    		        function onReceive(value, errno){
    		        	isVMRemote = value;
    		        }
    		);
        },
        function onFailure() {
        	var errno = $ASTX2.getLastError();
            if(errno == $ASTX2_CONST.ERROR_NOTINST) {
            	window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=ASTx";
            }else {
                alert("기타 에러");
            } 
        }
	);
}
/*************** 솔루션 전체 설치 체크 끝*****************/

/*************** ASTX/AnySign 체크 시작*****************/
function fn_check_astx_anysign() {
	
	$ASTX2.setOption({e2eform:true});
	
	$ASTX2.init(
    	function onSuccess() {
    		
    		//키보드보안 초기화  + 한컴 연동
    		$ASTX2.initE2E(1967,
    				function fnComplete(){
    					// AnySign 체크
    					PrintObjectTag();
    				}
    		);
    		//value가 0일 경우 가상환경/원격환경 둘 다 아님 1일 경우 가상환경 or 원격환경에 있음
    		$ASTX2.isVmRemoteEnv(
    		        function onReceive(value, errno){
    		        	isVMRemote = value;
    		        }
    		);
        },
        function onFailure() {
        	var errno = $ASTX2.getLastError();
            if(errno == $ASTX2_CONST.ERROR_NOTINST) {
            	window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=ASTx";
            }else {
                alert("기타 에러");
            } 
        }
	);
}
/*************** ASTX/AnySign 체크 끝*****************/

/*************** ASTX 체크 시작*****************/
function fn_check_astx() {
	
	$ASTX2.setOption({e2eform:true});
	
	$ASTX2.init(
    	function onSuccess() {
    		
    		//키보드보안 초기화  + 한컴 연동
    		$ASTX2.initE2E(1967,
    				function fnComplete(){
    					
    				}
    		);
    		//value가 0일 경우 가상환경/원격환경 둘 다 아님 1일 경우 가상환경 or 원격환경에 있음
    		$ASTX2.isVmRemoteEnv(
    		        function onReceive(value, errno){
    		        	isVMRemote = value;
    		        }
    		);
        },
        function onFailure() {
        	var errno = $ASTX2.getLastError();
            if(errno == $ASTX2_CONST.ERROR_NOTINST) {
            	window.location.href = "/wizvera/veraport/install/install_pc.html?P_name=ASTx";
            }else {
                alert("기타 에러");
            } 
        }
	);
}
/*************** ASTX 체크 끝*****************/
/**
 @param 
 @return DomainName
 @exception 
*/
function getDomainName()
{
	var domainName=location.protocol+"//"+location.host;
	return domainName;
}


//접속 디바이스 확인
function deviceCheck() {
	var userAgent = navigator.userAgent;
    if (userAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) 
        != null || userAgent.match(/LG|SAMSUNG|Samsung/) != null){
        return 3; //접속한 device가 모바일일 경우 return
    }else if(navigator.userAgent.toLowerCase().indexOf('ipad') > -1 ||
    	(navigator.userAgent.toLowerCase().indexOf('android') > -1 && navigator.userAgent.toLowerCase().indexOf('mobile') == -1)) {
    	return 2; //접속한 device가 태블릿일 경우 return
    }else{
    	return 1; //접속한 device가 PC일 경우 return
    }
}

function isMobileDevice() {
	
	var phoneArray = new Array('samsung-', 'sch-', 'shw-', 'sph-', 'sgh-', 'lg-', 'canu', 'im-', 'ev-', 'iphone', 
								'nokia', 'blackberry', 'lgtelecom', 'natebrowser', 'sonyericsson', 'mobile', 'android', 'ipad'); 
	
	for (i = 0; i < phoneArray.length; i++) {
		if (navigator.userAgent.toLowerCase().indexOf(phoneArray[i]) > -1) { 
			return true; 
		} 
	} 
	return false; 
}

function isTabletDevice() {
	
	if (!isMobileDevice()) { return false; } 
	
	// 태블릿검사 
	if (navigator.userAgent.toLowerCase().indexOf('ipad') > -1 || (navigator.userAgent.toLowerCase().indexOf('android') > -1 &&
			navigator.userAgent.toLowerCase().indexOf('mobile') == -1)) {
		return true; 
	} 
	// 갤럭시 탭
	var galaxyTabModel = new Array('shw-'); 
	for (i = 0; i < galaxyTabModel.length; i++) {
		if (navigator.userAgent.toLowerCase().indexOf(galaxyTabModel[i]) > -1) {
			return true; 
		} 
	} 
	return false; 
}


var backwardChk = function(){
	window.innerDoc = false;
	
	window.addEventListener('mouseover', function(event){
		window.innerDoc = true;
	});
	
	window.addEventListener('mouseout', function(event){
		window.innerDoc = false;
	});
	
	history.pushState({page:"first"}, document.title);

	window.addEventListener('popstate', function(event){
		history.pushState({page:"historyChanged"}, document.title);

		if(!window.innerDoc){
			alert("뒤로가기 버튼은 사용할 수 없습니다.");
		}
	});		
		
}

