/*****************************************************************
 * 파일명 : cm.js
 * 용도 : 공통 함수 정리
 *****************************************************************/



 /*****************************************************************
 * 명칭 : fn_movePage
 * 용도 : submit or 페이지 이동시 사용. 폼 아이디는 frm 설정해야함.
 * 예시 : fn_movePage("write.do","Y") or fn_movePage("list.do");
 *****************************************************************/
  function fn_movePage(actionUrl,submitYn ="N",confirmMsg = "") {
	  	if(confirmMsg != ""){
	        if(confirm(confirmMsg)) {}else{
	            return false;
	        }
	  	}
	  
		if(submitYn == "N"){
			location.replace(actionUrl);
		}else{
			$("#frm").attr("action", actionUrl);
			$("#frm").submit();
		}
		return true;
	}
  
  //validate, paging, 그 외 공통함수들 필요함.
  
  function ajaxCallSr(method, url, request) {
	  var returnData = new Object;
	  $.ajax({
		  method : method,
		  url : url,
		  dataType : 'json',
		  data : JSON.stringify(request),
		  async : false,
		  contentType : 'application/json; charset=UTF-8',
		  success : function(data) {
			  returnData= data;
		  },
	  });
	  return returnData;
	  
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
   * 입력값이 null인지 체크한다
   * @param objValue 
   * @return  true / false
   * @exception 
   */
  function isNull(objValue)
  {
      if(objValue != null) objValue = trim(objValue);
      if(objValue == null || objValue == "" || objValue == undefined) return true;

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
              if(!((ch >= 0xAC00 && ch <= 0xD7A3) || (ch >= 0x3131 && ch <= 0x314E) || (ch >= 0x30 && ch <= 0x39) || (ch==0x20) ))
              {
                  bool = false;
                  break;
              }
          }
      }

      return bool;
  }

  function isRpt(objValue)
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

              if(!((ch >= 0xAC00 && ch <= 0xD7A3) || (ch >= 0x3131 && ch <= 0x314E) || (ch >= 0x30 && ch <= 0x39) || (ch==0x20) ) && ch !=47)
              {
                  bool = false;
                  break;
              }
          }
      }

      return bool;
  }

  function ltrim(str)
  {
      while (1)
      {
          if ( str.substring(0, 1) == " " )

          {
              str = str.substring(1, str.length);

          }
          else if (str.charCodeAt(0)    ==    13    &&    str.charCodeAt(1)    ==    10)
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

  function rtrim( str )
  {
      while (1)
      {
          if ( str.substring(str.length - 1, str.length) == " " )
          {
              str = str.substring(0, str.length - 1);
          }
          else if (str.charCodeAt(0)    ==    13    &&    str.charCodeAt(1)    ==    10)
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

  function trim(str) {
      var tmpstr = ltrim(str);
      return rtrim(tmpstr);
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

      return bool;
  }

  function msgBox(sarray, msgNumber)
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

  function changeFinalPattern(strnt, suffix)
  {
     if(strnt == " ")
         return "";

     var rv = "";
     var lastNum = strnt.substring(strnt.length-1);

     if(lastNum == "0" || lastNum == "1" || lastNum == "3" || lastNum == "6" || lastNum == "7" || lastNum == "8") {
         return trim(strnt + suffix.charAt(0));
     } else if(lastNum == "2" || lastNum == "4" || lastNum == "5" || lastNum == "9") {
         rv = trim(strnt + suffix.charAt(1));
     } else {
         // �ѱ� �����ڵ尪�� ����
         var ch = escape(strnt.charAt(strnt.length-1)).replace("%u", "0x");
         // ������ ��
         var ox = (ch - 0xAC00) % 0x1C;

         // ������ ����
         if(ox > 0)
             rv = trim(strnt + suffix.charAt(0));
         else
             rv = trim(strnt + suffix.charAt(1));
     }

     return rv;
  }

  function replaceXss(str)
  {
      var tmpString = str;
      var rtnStr = null;
      
      tmpString = tmpString.replace("&#60;","<");
      tmpString = tmpString.replace("&#62;",">");
      tmpString = tmpString.replace("&#64;","@");
      tmpString = tmpString.replace("&#47;","/");
      tmpString = tmpString.replace("&#38;","&");
      
      rtnStr = tmpString;

      return rtnStr;
  }

  function replaceAllXss(str)
  {
      var tmpString = str;
      var rtnStr = null;
      
      tmpString = tmpString.split("&#60;").join("<");
      tmpString = tmpString.split("&#62;").join(">");
      tmpString = tmpString.split("&#64;").join("@");
      tmpString = tmpString.split("&#47;").join("/");
      tmpString = tmpString.split("&#38;").join("&");
      
      rtnStr = tmpString;

      return rtnStr;
  }

  function replacementXss(str)
  {
      var tmpString = str;    
      var rtnStr = null;
      
      tmpString = tmpString.replace("&","&#38;");
      tmpString = tmpString.replace("/","&#47;");
      tmpString = tmpString.replace("@","&#64;");
      tmpString = tmpString.replace(">","&#62;");
      tmpString = tmpString.replace("<","&#60;");
      
      rtnStr = tmpString;
      
      return rtnStr;
  }

  function replacementAllXss(str)
  {
      var tmpString = str;    
      var rtnStr = null;
      
      tmpString = tmpString.split("&").join("&#38;");
      tmpString = tmpString.split("/").join("&#47;");
      tmpString = tmpString.split("@").join("&#64;");
      tmpString = tmpString.split(">").join("&#62;");
      tmpString = tmpString.split("<").join("&#60;");
      
      rtnStr = tmpString;
      
      return rtnStr;
  }

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
      var keyCode = 0;
   
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

  document.onkeydown  = checkKeys;

  function checkKeys(e) {

      var keyCode = getKeyCode(e);
      var tagType = getTagType(e);

      var readonly = false;
      
      if(getAttributeValue(e, "readonly") == true || getAttributeValue(e, "readonly") == 'readonly')
          readonly = true;
      
      if(keyCode == 8 && readonly == true) {
          if(window.event) {
              event.keyCode      = 0;
              event.cancelBubble = true;
              //event.returnValue  = false;
              event.preventDefault();
              
          } else if(e) {
              return false;
          }
      }

      // Control Key
      if(keyCode == 17) {
          //event.cancelBubble = true;
          //event.returnValue  = false;
          event.preventDefault();
      }
      else if((keyCode == 8) && !(tagType == 'text' || tagType == 'textarea' || tagType == 'password')) {
          if(window.event) {
              event.keyCode      = 0;
              event.cancelBubble = true;
              //event.returnValue  = false;
              event.preventDefault();
          } else if(e) {
              return false;
          }
          
      }
      else if((keyCode == 116)) {
          if(window.event) {
              event.keyCode      = 0;
              event.cancelBubble = true;
              //event.returnValue  = false;
              event.preventDefault();
          } else if(e) {
              return false;
          }
      }
      else if (keyCode == 27){
          event.cancelBubble = true;
          //event.returnValue  = false;
          event.preventDefault();
          return false;
      }
      else if((keyCode == 113)) {
          if(window.event) {
              event.keyCode      = 0;
              event.cancelBubble = true;
              //event.returnValue  = false;
              event.preventDefault();
              if(typeof(printKey) != "undefined") {
              	if(printKey == "F2")
              		fnPrintKey();
              }
          } else if(e) {
              return false;
          }
     }
  }

  function checkBackspace()
  {
      // Control Key
      if(event.ctrlKey == true)
      {
          event.cancelBubble = true;
          //event.returnValue  = false;
          event.preventDefault();
      }

      else if(event.keyCode == 116)
      {
          event.keyCode      = 0;
          event.cancelBubble = true;
          //event.returnValue  = false;
          event.preventDefault();
      }
      
      else if(event.keyCode == 113)
      {
     	    event.keyCode      = 0;
     	    event.cancelBubble = true;
     	    //event.returnValue  = false;
     	    event.preventDefault();
     	    
     	    if(typeof(printKey) != "undefined") {
     	    	if(printKey == "F2")
     	    		fnPrintKey();
     	    }
      }
  }

  function enterKey(obj)
  {
      keynum = event.keyCode;

      // enter key
      if(keynum == 0x0D)
      {
          if((obj.types == "DATE" || obj.types == "DATEP" || obj.types == "DATEH" || obj.types == "DATET")
                  && isValidDate(delDateDelimiter(obj.value)) == true) {
              triggerTab(obj);
          }

          if(obj.getAttribute("submit") != "") {
              window.event.keyCode = 0x09;
          }
      }
  }

  function delKey(obj, method)
  {
      if(obj.readOnly == true && event.keyCode == 46) {
          method(obj.name);
      }
  }

   function loginCheck(form) {
  	 if($('#id').val() == '') {
  		  alert("<spring:message code='login.id'/>");
  	        $('#id').focus();
  	        return;
  	    }
  	  if($('#pw').val() =='') {
  		  alert("<spring:message code='errors.required'/>");
  	        $('#pw').focus();
  	        return;
  	    }
  	    
  	  return true;
   }
   
   
   /***
    * 입력값이 연속되거나 반복된 문자열인지 확인한다(영문 or 숫자)
    * @param obj
    * @return  true / false
    * @exception 
    */
   function isContinueRepitCheck(obj){
  	 var SameCnt =0;
  	 var compareFstPw;
  	 var compareSecPw;
  	 var compareThdPw;
  	 var len = obj.length;
  	 
  	 //연속되게 입력된 비밀번호 체크 (ex abc, 123)
  	 for(var i=0;i<len;i++){
  			if(i+2<len){
  				if(obj.charCodeAt(i)+1==obj.charCodeAt(i+1)&&obj.charCodeAt(i+1)+1==obj.charCodeAt(i+2)){
  					return false;
  				}
  			}
  		}
  	 
  	 // 동일하게 입력된 비밀번호 체크 (ex aaa, 111)
  	 for(var i=0; i<len; i++) {
  	        compareFstPw =obj.charAt(i);
  	        compareSecPw = obj.charAt(i+1);
  	        compareThdPw= obj.charAt(i+2);
  	        if(compareFstPw == compareSecPw && compareFstPw == compareThdPw && compareSecPw ==compareThdPw) {
  	            SameCnt++;
  	        }
  	        
  	 }
  	 
  		    if(SameCnt >1) {
  		        return false;
  		    }
  		    
  		    return true;
   }
   /***
    * 입력값의 길이값과 영대문자,영소문자, 숫자, 특수문자를 체크한다
    * @param obj
    * @return  true / false
    * @exception 
    */	 
  function isLenInputCheck(objValue, fg) {
  	
  	var char_type = 0;
  	 var len = objValue.length;
  	 var checkSpecial = /[_`~!#^*:?,={}()\-\[\]]/;
  	 if(/[a-z]/.test(objValue))            		    //소문자
  		  char_type = char_type+1;            
  		 if(/[A-Z]/.test(objValue))					//대문자
  		  char_type = char_type+1;
  		 if(/[0-9]/.test(objValue))  					//숫자
  		  char_type = char_type+1;
  		 if (/[~!@#$%\^&*()_+`\-={}|[\]\\:";'<>?,./]/gi.test(objValue)){ //특수문자
  			 if (checkSpecial.test(objValue)){
  				   char_type = char_type + 1;
  			 }else {
  				 if(fg == 'pw1') {
  					$('#error_next_box_usr_pw').css("display","block");
  	  				$('#error_next_box_usr_pw').html("비밀번호에 \" ' . - _ =  ` \\  / @ & < > -- $ % ; | + .. \\\\ 등은 허용되지 않는 문자입니다."); 
  				 }else {
  					$('#error_next_box_usr_pw_conf').css("display","block");
  	  				$('#error_next_box_usr_pw_conf').html("비비밀번호에 \" ' . - _ =  ` \\  / @ & < > -- $ % ; | + .. \\\\ 등은 허용되지 않는 문자입니다.");
  				 }
  				 return;
  			 } 
  		 } 
  		 		
  		 /* 비밀번호  : 조합이 1가지만 있고 8자리 미만일때 */
  			 if(char_type<2 && len <8) {		
  				 if(fg == 'pw1') {
  					$('#error_next_box_usr_pw').css("display","block");
  	  				$('#error_next_box_usr_pw').html("비밀번호는 4자 이상 16자 이하로 작성하셔야 합니다.");
  				 }else {
  					$('#error_next_box_usr_pw_conf').css("display","block");
  	  				$('#error_next_box_usr_pw_conf').html("비밀번호는 4자 이상 16자 이하로 작성하셔야 합니다.");
  				 }
  				 return;
  		 /* 비밀번호  : 조합이 1가지만 있고 8자리 이상일때*/
  			 }else if(char_type <2 && len >=8) {	
  				 if(fg == 'pw1'){
	  			    $('#error_next_box_usr_pw').css("display","block");
	   				$('#error_next_box_usr_pw').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 2가지 이상 조합으로 등록 가능합니다.");
  				 }else {
   					$('#error_next_box_usr_pw_conf').css("display","block");
  	  				$('#error_next_box_usr_pw_conf').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 2가지 이상 조합으로 등록 가능합니다.");
  				 }
  				 return;
  		 /* 비밀번호  : 조합이 2가지만 있고 10자리 미만일때*/
  			 }else if(char_type <3 && len <10) {
  				 if(fg == 'pw1') {
	  				$('#error_next_box_usr_pw').css("display","block");
	   				$('#error_next_box_usr_pw').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 2가지 이상으로 조합하여 10자리 이상으로 등록 가능합니다.");
  				 }else {
  					$('#error_next_box_usr_pw_conf').css("display","block");
  	  				$('#error_next_box_usr_pw_conf').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 2가지 이상으로 조합하여 10자리 이상으로 등록 가능합니다.");
  				 }
  				 return;
  		 /* 비밀번호  : 조합이 3가지이상이고 8자리 미만일때*/
  			 }else if(char_type <=4 && len <8)  {
  				 if(fg =='pw1') {
	   				$('#error_next_box_usr_pw').css("display","block");
	   				$('#error_next_box_usr_pw').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 3가지 이상으로 조합하여 8자리 이상 등록 가능합니다.");
	  			}else {
  					$('#error_next_box_usr_pw_conf').css("display","block");
  	   				$('#error_next_box_usr_pw_conf').html("비밀번호는 영문대문자, 영문소문자, 숫자, 특수문자 중 3가지 이상으로 조합하여 8자리 이상 등록 가능합니다.");
  				 }
  				 return;
  			 	}
  			$('#error_next_box_usr_pw').css("display","none");  			 
  			$('#error_next_box_usr_pw_conf').css("display","none");  			 
  	
  		 return true;
  }


  /***
   * 16자리 이상 입력시 메시지 현출
   * @param obj
   * @return  true / false
   * @exception 
   */	 
  function fn_showMsg(obj, maxlength, rgtTxt) {

//  	obj.value=obj.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,'');
  	
  	 var strLen =obj.value.length;
  	 var maxLen = maxlength;
  	 var htmltext=  strLen;

  	 if(strLen ==17) htmltext=16;
  		rgtTxt.html(htmltext+ '/16');
  		
  		if(strLen > maxLen) {
  			alert("입력 가능한 비밀번호 자릿수(16자리)를 초과하였습니다.");
  			event.returnValue =false;
  			obj.value = obj.value.slice(0,16);
  			rgtTxt.html('16/16');
  			return;
  		}
  	 
  	 
  	 
  } 

  /***
   * 허용하지 않는 특수문자 입력시 메시지 현출
   * @param obj
   * @return  true / false
   * @exception 
   */	 
  function fn_chkSpcPtn(obj) {
  	
  	var keyCode = event.keyCode;
  	var arr = ['64','36','37','38','43','59','34','39','60','62','46','47','92','124'];
  		for(var i=0; i<arr.length; i++) {
  			if(arr[i] == keyCode) {
  				alert("비밀번호에 \" ' . \\  / @ & < > -- $ % ; | + .. \\\\ 등은 허용되지 않는 문자입니다");
  				event.returnValue =false;
  				return;
  			}
  		}
  }

  /***
   * 스페이스바 & ctrl+v(붙여넣기) 막는 메소드
   * @param obj
   * @return  true / false
   * @exception 
   */	 

  function fn_chkSpace(obj) {
  	 var keyCode = event.keyCode;

  	 if(keyCode == 32 ||event.ctrlKey && keyCode == 86 ) {		//스페이스바(공백) || ctrl + v
  		 	event.returnValue =false;
  		 	return;  
  	}
  	 
  }
   

