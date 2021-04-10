/* 일반 팝업 호출 */
function openPopup(f, url, caseSort, targetNm, w, h, scrollbars){

    var winWidth = document.documentElement.clientWidth;
	var winX = window.screenLeft;
	var left = winX + (winWidth - w)/2;

	var popObj = window.open('', targetNm, 'toolbar=no,scrollbars='+scrollbars+',resizable=no,top=50, left='+left+',width='+w+',height='+h+'');

	f.action = url;
	f.method = "post";
	f.target = targetNm;
	f.submit();

	popObj.focus();

	return popObj;

}

/*form 생성 후 팝업 호출*/
function openPopup2(url, params, targetNm, w, h, scrollbars){

	//기존 생성된 form이 존재하면 삭제
	var delF = document.getElementById("tempF");
	if(delF != null){
		document.body.removeChild(delF);
	}

	var f = document.createElement("form");
    var param = params.split("&");
    var input;

    for(var i in param){

    	var data = param[i].split("=");

		input = document.createElement('input');
		input.type = 'hidden';
		input.name = data[0];
		input.value = data[1];
		f.appendChild(input);

    }

    document.body.appendChild(f);

    var winWidth = document.documentElement.clientWidth;
	var winX = window.screenLeft;
	var left = winX + (winWidth - w)/2;
	var popObj = window.open('', targetNm, 'toolbar=no,scrollbars='+scrollbars+',resizable=no,top=50, left='+left+',width='+w+',height='+h+'');

	f.id = "tempF";
	f.action = url;
	f.method = "post";
	f.target = targetNm;
	f.submit();

	popObj.focus();
	
	return popObj;

}

function windowOpen(url, winname, width, height, scroll)
{
    var winWidth = document.documentElement.clientWidth;
	var winX = window.screenLeft;
	var left = winX + (winWidth - width)/2;
	
    try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       50, ";
            settings += "left=      " +left  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "toolbar   =no,";
            settings += "menubar   =no,";
            settings += "location  =no,";
            settings += "resizable =no";

            window.open(url, winname, settings);
    }
    catch(e)
    {
        e.addLocation("openWindow", "/js/common/popup.js");
        throw e;
    }
}

/* 멀티브라우저를 위한 팝업사이즈 조절(팝업창에서는 onLoad에서 무조건 호출) */
function popSize(useSort, commonSort){
   if(useSort){
       // 엣지 브라우저 체크
       var edgeChk = navigator.userAgent.toLowerCase().indexOf("edge") != -1

       // IE 브라우저 체크
       var ieChk = (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (navigator.userAgent.toLowerCase().indexOf("msie") != -1);

       if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
           strWidth = window.outerWidth;
           strHeight = $('body').outerHeight() + (window.outerHeight - window.innerHeight);
       }

       if(commonSort && strHeight > 910) {
           strHeight = 910;
       }

       window.resizeTo(strWidth, strHeight);
   }
}
