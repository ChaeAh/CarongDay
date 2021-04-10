/**
 * 
 */

/***  
 * @Script Name : datetime.js
 * @Description : 공통 자바스크립트 
 * @Modification Information  
 * @
 * @  수정일      수정자       수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2012.05.31   박헌민       최초생성
 * @ 2018.02.02  민명선		  [전자 출생 신고 시스템 구축 사업]  isValidDatetimeMsg 추가		 
 * 
 * @author 기술지원팀 박헌민
 * @since 2012.05.31
 * @version 1.0
 * 
 *  Copyright (C) 2012 by SAMSUNG SDS co.,Ltd. All right reserved.
 */

/**
 * 현재 시각을 Date 형식으로 리턴
 *
 * @param  : 
 * @return : YYYYMMDD(년월일:yyyymmdd)
 */

function getCurrentDate() 
{
	var pDate = new Date();
	
    var rtrDate = pDate.getFullYear();

    if((pDate.getMonth() + 1) <= 9){
        rtrDate = rtrDate + "0" + (pDate.getMonth() + 1);         
    }else{
        rtrDate = rtrDate + "" + (pDate.getMonth() + 1);
    }
    
    if(pDate.getDate() <= 9){
        rtrDate = rtrDate + "0" + pDate.getDate();
    }else{
        rtrDate = rtrDate + "" + pDate.getDate();
    }
    return rtrDate;
}

/**
 * 현재 시각을 Time 형식으로 리턴
 *
 * @param  : 
 * @return : hhmm(시분:hhmm)
 */

function getCurrentTime() 
{
	var pTime = new Date();
	
	var rtrHours = pTime.getHours();
	var rtrMinutes = pTime.getMinutes();
	
	if((pTime.getHours()) <= 9){
		rtrHours = "0" + (pTime.getHours());         
    }else{
    	rtrHours = pTime.getHours();
    }
	
	if((pTime.getMinutes()) <= 9){
		rtrMinutes = "0" + (pTime.getMinutes());         
    }else{
    	rtrMinutes = pTime.getMinutes();
    }
    
	var rtrTime = rtrHours +""+ rtrMinutes;
		
	return rtrTime;
}


/**
 * 유효한 날짜(Date)인지 체크한다
 *
 * @param : YYYYMMDD(년월일:yyyymmdd)
 * @return     : boolean
 */
function isValidDate(objValue) 
{
    if(!isNum(objValue) || objValue.length < 8)
        return false;



    year  = objValue.substring(0, 4);

    month = objValue.substring(4, 6);

    day   = objValue.substring(6, 8);



    if (parseInt(year, 10) >= 1800  && isValidMonth(month) && isValidDay(year, month, day)) 
        return true;


    return false;

}


/**
 * 날짜 항목(오늘 이전)으로 유효한지 체크한다.
 * 날짜 항목은 yyyy, yyyymm, yyyymmdd 형식으로 입력 가능하며, 오늘 이전이어야 한다.
 *
 * @param : YYYYMMDD(년월일:yyyymmdd)
 * @return     : boolean
 */

function isValidDateP(objValue)
{
	curDate = getCurrentDate();
	
//	var alertMsg  = "날짜 형식이 올바르지 않거나 유효하지 않습니다.\t\n\n";
//		alertMsg += "입력예시 : 2006(yyyy), 200611(yyyyMM), 20061110 (yyyyMMdd)\t";

	if(!isNum(objValue) && (objValue.length != 4 || objValue.length != 6 || objValue.length != 8))
        return false;

    year  = '0000';
    month = '00';
    day   = '00';

    if (objValue.length >= 4) {

        year = objValue.substring(0, 4);

        if (parseInt(year, 10) < 1800) {
//    	    alert(alertMsg);
            return false;
        }
    }

    if (objValue.length >= 6) {
        month = objValue.substring(4, 6);

        if (month != '00' && !isValidMonth(month)) {
//        	alert(alertMsg);
            return false;
        }
    }

    if (objValue.length >= 8) {
        day = objValue.substring(6, 8);

        if (month != '00' && day != '00' && !isValidDay(year, month, day)) {
//        	alert(alertMsg);
            return false;
        }
    }

    if ((year + month + day) - curDate > 0) {
    	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
        alert("오늘 날짜 이후로 입력하실 수 없습니다.");
        return false;
    }
    return true;
}



/**
 * [전자 출생 신고 시스템 구축 사업]  2018.02.02  권성은 수정
 * 일시 항목으로 유효한지 체크한다.
 * 일시 항목은 yyyy, yyyymm, yyyymmdd, yyyymmddHH24, yyyymmddHH24mi, yyyymmddHH24miss 형식으로 입력 가능하며, 오늘 이전이어야 한다.
 *
 * @param : YYYYMMDD(년월일:yyyymmdd)
 * @return     : boolean
 */

function isValidDatetime(objValue)
{
	curDate = getCurrentDate();
	curTime = getCurrentTime();
	
	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
	var alertMsg  = "날짜 형식이 올바르지 않거나 유효하지 않습니다.\n\n";
		alertMsg += "입력예시 : 201711101234(yyyyMMddHHmm)\n";
		
	if(objValue.length==16) {
		objValue = objValue.substr(0, 4) + objValue.substr(5, 2) + objValue.substr(8, 2) + objValue.substr(11, 2) + objValue.substr(14, 2);
    }
	
    if(!isNum(objValue) || (objValue.length != 4 && objValue.length != 6 && objValue.length != 8 && objValue.length != 10 && objValue.length != 12 && objValue.length != 14)) {
        alert(alertMsg);
        return false;
    }
    
    year   = '0000';
    month  = '00';
    day    = '00';
    hour   = '00';
    minute = '00';
    second = '00';

    if (objValue.length >= 4) {
        year = objValue.substring(0, 4);
        
        if (parseInt(year, 10) < 1800) {
        	//alert(alertMsg);
            return false;
        }
    }

    if (objValue.length >= 6) {
        month = objValue.substring(4, 6);

        if (month != '00' && !isValidMonth(month)) {
        	alert(alertMsg);
            return false;
        }
    }

    if (objValue.length >= 8) {
        day = objValue.substring(6, 8);

        if (month != '00' && day != '00' && !isValidDay(year, month, day)) {
        	alert(alertMsg);
            return false;
        }
    }

    if (objValue.length >= 10) {
        hour = objValue.substring(8, 10);
    }
    if (objValue.length >= 12) {
        minute = objValue.substring(10, 12);
    }
    if (objValue.length >= 14) {
        second = objValue.substring(12, 14);
    }

    if (!isValidTime(hour+minute+second)) {
    	alert(alertMsg);
        return false;
    }

    if ((year + month + day) - curDate > 0) {
    	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
    	alert("오늘 날짜 이후로 입력하실 수 없습니다.");
        return false;
    }

    // 시간은 지금 이후로 입력하실 수 없습니다.
    if ((year + month + day) == curDate && (hour + minute) - curTime > 0) {
    	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
    	alert("지금 시간 이후로 입력하실 수 없습니다.");
        return false;
    }
    return true;

}

/**
 * [전자 출생 신고 시스템 구축 사업] 연월일시분초가 유효한지 체크한다.
 */
function isValidDatetimeMsg(objValue,msgType)
{
	var returnVal = {};
	curDate = getCurrentDate();
	curTime = getCurrentTime();
	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
	var alertMsg  = "날짜 형식이 올바르지 않거나 유효하지 않습니다.\n\n";
	
	if(msgType == "birthDtm"){
		alertMsg += "입력예시 : 2017년 01월 05일 03시 05분 \n";
	}else{
		alertMsg += "입력예시 : 201711101234(yyyyMMddHHmm)\n";
	}
    if(!isNum(objValue) || (objValue.length != 4 && objValue.length != 6 && objValue.length != 8 && objValue.length != 10 && objValue.length != 12 && objValue.length != 14)) {
        alert(alertMsg);
        returnVal.flag = false;
        returnVal.focus = "year";
        return returnVal;
    }

    year   = '0000';
    month  = '00';
    day    = '00';
    hour   = '00';
    minute = '00';
    second = '00';

    if (objValue.length >= 4) {
        year = objValue.substring(0, 4);
        
        if (parseInt(year, 10) < 1800) {
        	alert(alertMsg);
            returnVal.flag = false;
            returnVal.focus = "year";
            return returnVal;
        }
    }

    if (objValue.length >= 6) {
        month = objValue.substring(4, 6);

        if (month != '00' && !isValidMonth(month)) {
        	alert(alertMsg);
            returnVal.flag = false;
            returnVal.focus = "month";
            return returnVal;
        }
    }

    if (objValue.length >= 8) {
        day = objValue.substring(6, 8);

        if (month != '00' && day != '00' && !isValidDay(year, month, day)) {
        	alert(alertMsg);
            returnVal.flag = false;
            returnVal.focus = "year";
            return returnVal;
        }
    }

    if (objValue.length >= 10) {
        hour = objValue.substring(8, 10);
    }
    if (objValue.length >= 12) {
        minute = objValue.substring(10, 12);
    }
    if (objValue.length >= 14) {
        second = objValue.substring(12, 14);
    }

    if (!isValidTime(hour+minute+second)) {
    	alert(alertMsg);
        returnVal.flag = false;
        returnVal.focus = "hour";
        return returnVal;
    }

    if ((year + month + day) - curDate > 0) {
    	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
    	alert("오늘 날짜 이후로 입력하실 수 없습니다.");
        returnVal.flag = false;
        returnVal.focus = "year";
        return returnVal;
    }

    // 시간은 지금 이후로 입력하실 수 없습니다.
    if ((year + month + day) == curDate && (hour + minute) - curTime > 0) {
    	//[온라인 출생신고시스템 구축 사업 일정] 2018.03.24 민명선 \t 삭제 ( 크로스브라우징 이슈)
    	alert("지금 시간 이후로 입력하실 수 없습니다.");
        returnVal.flag = false;
        returnVal.focus = "hour";
        return returnVal;
    }
    returnVal.flag = true;
    return returnVal;

}

 
/**
 * 유효한 일(日)인지 체크한다
 *
 * @param : YYYY, MM, DD(년, 월, 일)
 * @return     : boolean
 */

function isValidDay(yyyy, mm, dd) 
{

    var m   = parseInt(mm, 10) - 1;
    var d   = parseInt(dd, 10);
    var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);

    if ((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0) 
        end[1] = 29;

    return (d >= 1 && d <= end[m]);
}


/** 유효한 월(月)인지 체크한다
 *
 * @param : MM(월)
 * @return     : boolean
 */
function isValidMonth(mm) 
{
    var m = parseInt(mm, 10);

    return (m >= 1 && m <= 12);
}


/**
 * 유효한 시간(Time)인지 체크한다
 *
 * @param : HHMMSS(시분초)
 * @return     : boolean
 */
function isValidTime(objValue)
{
   if(!isNum(objValue))
        return false;

    hour = objValue.substring(0, 2);

    min  = objValue.substring(2, 4);

    if(objValue.length == 6)
        sec = objValue.substring(4, 6);
    else
        sec = 0;

    if(hour < 24 && min < 60 && sec < 60)
        return true;
    return false;

}

/* ========================= 
 *                           
 *     Delimiter 관련 함수    
 *                           
 * ========================= */


/**
 * 날짜 입력시 날짜의 dash('-')를 추가하는 함수
 * 날짜 입력란의 onBlur()시 호출
 *
 * @param : object
 */

function addDateDelim(obj) 
{
	
    var varDate = obj;
    
    obj = addDateDelimiter(varDate);
}


/**
 * 날짜(yyyymmdd)를 받아 dash('-')를 추가하는 함수
 *
 * @param : object value
 * @return     : yyyy-mm-dd
 */

function addDateDelimiter(dateValue)
{
    if(dateValue.length != 8){
    	return dateValue;
    }
    
    year  = dateValue.substring(0, 4);

    month = dateValue.substring(4, 6);

    day   = dateValue.substring(6, 8);


    return year + "-" + month + "-" + day;
}



/**
 * 날짜 입력시 날짜의 dash('-')를 추가하는 함수
 * 단, 일 미정 등의 처리가 가능해야 하므로 4, 6, 8자리를 허용하도록 한다.
 * 날짜 입력란의 onBlur()시 호출
 *
 * @param : object
 */

function addDatePDelim(obj) 
{
   
    var varDate = obj;

    if (varDate.length != 4 && varDate.length != 6 && varDate.length != 8)
        obj = varDate;

    year = (varDate.length >= 4) ? varDate.substring(0, 4) : '';

    month = (varDate.length >= 6) ? varDate.substring(4, 6) : '';

    day = (varDate.length >= 8) ? varDate.substring(6, 8) : '';

    obj = year + (month != '' ? '-' + month + (day != '' ? '-' + day : '') : '');

}


/**
 * 날짜 입력시 날짜의 dash('-')를 삭제하는 함수
 * 날짜 입력란의 onFocus()시 호출
 *
 * @param : object
 */
function delDateDelim(obj) 
{
    obj = obj.replace(/-/gi,"");
    obj = obj.replace(/\//gi,"");
    return obj;
}



/**
 * 날짜(yyyy-mm-dd)를 받아 dash('-')를 삭제하는 함수
 *
 * @param : object value
 * @return     : yyyymmdd
 */
function delDateDelimiter(dateValue)
{
    objvalue = dateValue.replace(/-/gi,"");

    objvalue = objvalue.replace(/\//gi,"");

    return objvalue;
}



/**
 * 일시 입력시 날짜의 dash('-'), colon(':'), space(' ')를 추가하는 함수
 * 일시 입력란의 onBlur()시 호출
 *
 * @param : object
 */
function addDatetimeDelim(obj) 
{
    var varDate = obj;

    if (varDate.length != 4 && varDate.length != 6 && varDate.length != 8 && varDate.length != 10 && varDate.length != 12 && varDate.length != 14)
        obj = varDate;
    
    year = (varDate.length >= 4) ? varDate.substring(0, 4) : '';

    month = (varDate.length >= 6) ? varDate.substring(4, 6) : '';

    day = (varDate.length >= 8) ? varDate.substring(6, 8) : '';

    hour = (varDate.length >= 10) ? varDate.substring(8, 10) : '';

    minute = (varDate.length >= 12) ? varDate.substring(10, 12) : '';

    second = (varDate.length >= 14) ? varDate.substring(12, 14) : '';

    obj = year + (month != '' ? '-' + month + (day != '' ? '-' + day + (hour != '' ? ' ' + hour + (minute != '' ? ':' + minute + (second != '' ? ':' + second : '') : '') : '') : '') : '');
}



/**
 * 일시 입력시 일시의 dash('-'), colon(':'), space(' ')을 삭제하는 함수
 * 일시 입력란의 onFocus()시 호출
 *
 * @param : object
 */
function delDatetimeDelim(obj) 
{
  
    obj = obj.replace(/-/gi,"");
    obj = obj.replace(/\//gi,"");
    obj = obj.replace(/:/gi, "");
    obj = obj.replace(/ /gi, "");

}

/**
 * 일시 입력시 일시의 dash('-'), colon(':'), space(' ')을 삭제하는 함수
 *
 * @param : object
 */
function delDatetimeDelimiter(dateValue) 
{
    dateValue = dateValue.replace(/-/gi,"");
    dateValue = dateValue.replace(/\//gi,"");
    dateValue = dateValue.replace(/:/gi, "");
    dateValue = dateValue.replace(/ /gi, "");
    
    return dateValue;

}



/**
 * 날짜(yyyymmdd)를 받아 slash('/')를 추가하는 함수
 *
 * @param : objectValue
 * @return     : yyyy/mm/dd
 */
function addSlashDelimiter(objValue)
{
    if(objValue.length != 8) return objValue;

    year  = objValue.substring(0, 4);

    month = objValue.substring(4, 6);

    day   = objValue.substring(6, 8);

    return year + "/" + month + "/" + day;
}



/**
 * 시간 입력시 시간의 Colon(':')을 추가하는 함수
 * 시간 입력란의 onBlur()시 호출
 *
 * @param : object
 */
function addTimeDelim(obj) 
{
        var varTime = obj;

        if ((varTime != null) && (varTime != "")) 
        {
            hour = varTime.substring(0, 2);
            min  = varTime.substring(2, 4);
            if(obj.length == 6)
            {
                sec  = varTime.substring(4, 6);
                obj = hour + ":" + min + ":" + sec;
            }
            else
                obj = hour + ":" + min;
        }

}

/**
 * 시간(hhmmss)을 받아 Colon(':')을 추가하는 함수
 *
 * @param : object value
 * @return     : hh:mm:ss
 */
function addTimeDelimiter(objValue) 
{
   
    if ((objValue != null) && (objValue != ""))
    {
        hour = objValue.substring(0, 2);
        min  = objValue.substring(2, 4);
        if(objValue.length == 6)
        {
            sec  = objValue.substring(4, 6);
            objValue = hour + ":" + min + ":" + sec;
        }
        else
            objValue = hour + ":" + min;
    }
    return objValue;
}



/**
 * 시간 입력시 시간의 Colon(':')을 삭제하는 함수
 * 시간 입력란의 onFocus()시 호출
 * @param : object
 */
function delTimeDelim(obj) 
{
	obj = obj.replace(/:/gi,"");
}



/**
 * 시간(hh:mm:ss)을 받아 Colon(':')을 삭제하는 함수
 *
 * @param : object value
 * @return     : hhmmss
 */

function delTimeDelimiter(objValue) 
{
    objValue = objValue.replace(/:/gi,"");
    return objValue;
}

/**
 * 통화 입력시 통화의 comma(',')를 추가하는 함수
 * 통화 입력란의 onBlur()시 호출
 *
 * @param : object
 */
function addCurrencyDelim(obj)
{
    var str = trim(obj);
    var strLength = str.length;
    var index = 0;

    if(str.indexOf('.') == -1)
        index = strLength - 1;
    else
        index = str.indexOf('.') - 1;

    var res = "";
    var p = 0;
    for(var i=index; i>=0; i--, p++)
    {
        if((p != 0) && ((p%3) == 0))
            res = "," + res;

        res = str.charAt(i) + res;
    }
    return res;

}



/**
 * 통화 입력시 통화의 comma(',')를 추가하는 함수
 * 통화 입력란의 onBlur()시 호출
 *
 * @param : object Value
 */

function addCurrencyDelimeter(objectValue)
{
   	var str = objectValue;
    var strLength = str.length;
    var index = 0;

    if(str.indexOf('.') == -1)
        index = strLength - 1;
    else
        index = str.indexOf('.') - 1;

    var res = "";
    var p = 0;
    for(var i=index; i>=0; i--, p++)
    {
        if((p != 0) && ((p%3) == 0))
            res = "," + res;

        res = str.charAt(i) + res;
    }
    return res;
}


/**
 * 통화 입력시 통화의 comma(',')를 삭제하는 함수
 * 통화 입력란의 onFocus()시 호출
 * @param : object
 */

function delCurrencyDelim(obj)
{
    var cur = trim(obj.replace(/,/gi,""));

    return cur;
}


/**
 * 통화 입력시 통화의 comma(',')를 삭제하는 함수
 * 통화 입력란의 onFocus()시 호출
 * @param : object Value
 */
function delCurrencyDelimeter(objectValue)
{
   	var str = objectValue;
    var cur = trim(str.replace(/,/gi,""));
    return cur;
}


/* ========================= 
 *                           
 *     날짜 계산 관련 함수    
 *                           
 * ========================= */

/**
 * 년도(Year)와 달(Month)을 입력 파라미터로 받아 그 달의 마지막 일(day)을 리턴한다.
 * 
 * @param : 년도(Year), 달(Month)
 * @return   : 그 달의 마지막 일(day)
 */
function getLastDate(year, month)
{
    var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31 , 30 ,31);
    last[1] = leapYear(year);

    return last[month-1];
}


/**
 * 년도(Year)를 입력 파라미터로 받아 윤년이면 29, 윤년이 아니면 28을 리턴한다.
 *
 * @param : year    년도(Year) 
 * @return     : 해당 년도가 윤년이면 29, 아니면 28
 */
function leapYear(year)
{
    if(year % 4 == 0 && year % 100 != 0 || year % 400  == 0)
        return "29";
    return "28";
}

/**
 * 기준 날짜의 전후일을 계산하는 함수
 *
 * ex) beforeDate("20061010", "10") = "20061020"
 *     beforeDate("20061010", "-5") = "20061005"
 *
 * @param : 기준일, 일수
 * @return     : 계산일
 */
function beforeDate(tda, plan)
{
    year  = tda.substring(0, 4);
    month = tda.substring(4, 6);
    day   = tda.substring(6, 8);

    dt = year + "/" + month + "/" + day;

    var cDate = new Date(dt);
    cTime = cDate.getTime()+plan*1000*3600*24;
    var bTime = new Date();
    bTime.setTime(cTime);

    bY = (bTime.getFullYear()<100)?"19"+bTime.getFullYear():bTime.getFullYear();
    bM = bTime.getMonth()+1;
    bD = bTime.getDate();

    if (bM < 10) bM = "0" + bM;
    if (bD < 10) bD = "0" + bD;
    
    bDate = bY + "" + bM + "" + bD;

    return bDate;
}



/**
 * 두 날짜 사이의 일수를 구한다
 *
 * ex) getPeriod("20061010", "20061014") = 4
 *
 * @param : 시작일, 끝일
 * @return     : 일수
 */
function getPeriod(sdate, edate)
{
    var sDT = new Date(addSlashDelimiter(sdate));
    var eDT = new Date(addSlashDelimiter(edate));

    var gDS = eDT - sDT;

    return gDS/1000/60/60/24; 
}

/**
 * 기준 날짜의 전후 월을 계산하는 함수
 *
 * ex) beforeMonth("20061010", "-5") = "20060509"
 *     beforeMonth("20061010", "10") = "20070809"
 *
 * @param : 기준일, 개월
 * @return     : 개월 전후의 일
 */
function beforeMonth(tda, plan)
{
    year  = tda.substring(0, 4);
    month = tda.substring(4, 6);
    day   = tda.substring(6, 8);

    cY = year;
    cM = month;
    cD = day;

    // 기준 날짜 전월(before month) 계산
    if(plan < 0)
    {
        cM = eval(month)+eval(plan);
        if(cM < 0) cY = eval(year) - 1;

        while(cM < 0)
        {
            if(cM < -12) cY -= 1;

            cM += 12;
        }
        if(cM == 0)
        {
            cM = 12;
            cY -= 1;
        }
    }
    // 기준 날짜 후월(after month) 계산
    else if(plan > 0)
    {
        cM = eval(month)+eval(plan);
        if(cM > 12)
        {
            cY = eval(year) + 1;
            cM -= 12;
        }

        while(cM > 12)
        {
            if(cM > 12)
            {
                cY += 1;
                cM -= 12;
            }
        }
    }

    if(day > getLastDate(cY, cM))
        cD = getLastDate(cY, cM);

    cdate = cY+paddingZero(cM+"", 2)+cD;

    if(day != getLastDate(year, month))
        cdate = beforeDate(cdate, "-1");

    return cdate;
}

/**
 * 기준 날짜의 전후 월을 계산하는 함수
 *
 * ex) beforeMonth2("20061010", "-5") = "20060510"
 *     beforeMonth2("20061010", "10") = "20070810"
 *
 * @param : 기준일, 개월
 * @return     : 개월 전후의 일
 */
function beforeMonth2(tda, plan)
{
    year  = tda.substring(0, 4);
    month = tda.substring(4, 6);
    day   = tda.substring(6, 8);

    cY = year;
    cM = month;
    cD = day;

    // 기준 날짜 전월(before month) 계산
    if(plan < 0)
    {
        cM = eval(month)+eval(plan);
        if(cM < 0) cY = eval(year) - 1;

        while(cM < 0)
        {
            if(cM < -12) cY -= 1;

            cM += 12;
        }
        if(cM == 0)
        {
            cM = 12;
            cY -= 1;
        }
    }
    // 기준 날짜 후월(after month) 계산
    else if(plan > 0)
    {
        cM = eval(month)+eval(plan);
        if(cM > 12)
        {
            cY = eval(year) + 1;
            cM -= 12;
        }

        while(cM > 12)
        {
            if(cM > 12)
            {
                cY += 1;
                cM -= 12;
            }
        }
    }

    if(day > getLastDate(cY, cM))
        cD = getLastDate(cY, cM);

    cdate = cY+paddingZero(cM+"", 2)+cD;

    return cdate;
}

/**
 * 두 날짜값(시작일, 끝일)의 선후 체크
 *
 * @param : sdate, edate
 * @return     : boolean
 */
function checkDates(sdate, edate)
{
    svdate = delDateDelimiter(sdate);
    evdate = delDateDelimiter(edate);

    if((evdate-svdate) < 0)
    {
        alert("날짜의 선후 관계(from, to)가 올바르지 않습니다.\t");
        return false;
    }
    return true;

}



/**
 * 오늘 날짜 이후 체크
 *
 * @param : chkDate, curDate, [type]
 * @return     : boolean
 */
function checkCurrentDate(chkDate, curDate, type)
{
        cdate = delDateDelimiter(curDate);
        vdate = delDateDelimiter(chkDate);

        if((cdate-vdate) < 0)
        {
            if(typeof type == "undefined")
                alert("오늘 날짜보다 큽니다.\t");
            return false;
        }
        return true;

}



/**
 * 두 날짜 사이의 차가 plan보다 작으면 true, 크면 false
 *
 * @param : 기준일, 일수
 * @return     : 계산일
 */
function betweenDates(cDate, vDate, plan)
{
   
        sdate = beforeDate(delDateDelimiter(cDate), plan);

        if(sdate <= delDateDelimiter(vDate))
            return false;
        else
            return true;

}


/**
 * 두 날짜 사이의 개월 수를 계산하여 plan 보다 작으면 true, 크면 fasle.
 *
 * @param : 시작일, 끝일, 개월 수
 * @return     : boolean
 */
function getMonths(adate, bdate, plan)
{

    sdate = delDateDelimiter(adate);
    edate = delDateDelimiter(bdate);

    cdate = beforeMonth(sdate, plan);

    if((edate - cdate) > 0)
        return false;
    else
        return true;
}