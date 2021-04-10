/*
 * 브라우저별 팝업창 사이즈 조절(넓이)
 */
function resizeX(width) {
	var x = 0;
	var w = width;
	
	var browser = navigator.userAgent.toUpperCase();
	
	if(browser.indexOf('CHROME' ) > -1) x =  5; 
	if(browser.indexOf('FIREFOX') > -1) x =  0;
	if(browser.indexOf('OPR'    ) > -1 || browser.indexOf('OPRERA') > -1) x = 15;
	if(browser.indexOf('EDGE'   ) > -1) x =  0;

	return Number(x) + Number(w);
}

/*
 * 브라우저별 팝업창 사이즈 조절(높이)
 */
function resizeY(height) {
	var y = 0;
	var h = height;

	var browser = navigator.userAgent.toUpperCase();

	if(navigator.userAgent.indexOf('Chrome' )>-1) y =  0; 
	if(navigator.userAgent.indexOf('Firefox')>-1) y =  0;
	if(browser.indexOf('OPR'    ) > -1 || browser.indexOf('OPRERA') > -1) y = 95;
	if(browser.indexOf('EDGE'   ) > -1) y = 0;
	
	return Number(y) + Number(h);
}

/*
 * 윈도우의 중앙에 Popup창을 연다
 *
 * Parameter :
 */
function openWindow(url, encData, winname, width, height, scroll)
{
	width  = resizeX(width );
	height = resizeY(height);

    try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       " +winy  +", ";
            settings += "left=      " +winx  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "toolbar   =no,";
            settings += "menubar   =no,";
            settings += "location  =no,";
            settings += "resizable =no";
        
        EncLink(url, encData, winname, settings);
    }
    catch(e)
    {
        e.addLocation("openWindow", "/js/common/window.js"); 
        throw e;
    }
}

//EncLocation 및 일반팝업을 위한 공통 함수 추가
function windowOpen(url, winname, width, height, scroll)
{
	width  = resizeX(width );
	height = resizeY(height);

	try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       " +winy  +", ";
            settings += "left=      " +winx  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "resizable =no";
        
        window.open(url, winname, settings);
    }
    catch(e)
    {
        e.addLocation("windowOpen", "/js/common/window.js"); 
        throw e;
    }
}

//[CSR번호] : SR-2013-08-26-00005 무인증명서발급기위치 지도서비스 제공을 위한 전자지도 솔루션 적용 [수정자] : 김병옥
//[수정내용] : 무인증명서발급기위치 지도서비스 제공을 위한 전자지도 솔루션 적용으로 인한 팝업호출 함수 추가
function openWindow2(url, encData, winname, width, height, scroll)
{
    try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       " +winy  +", ";
            settings += "left=      " +winx  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "resizable =no";
        
        EncLink(url, encData, winname, settings);
    }
    catch(e)
    {
        e.addLocation("openWindow2", "/js/common/window.js"); 
        throw e;
    }
}

function openWindow3(url, encData, winname, width, height, scroll)
{
    try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       " +winy  +", ";
            settings += "left=      " +winx  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "resizable =yes";
        
        EncLink(url, encData, winname, settings);
    }
    catch(e)
    {
        e.addLocation("openWindow3", "/js/common/window.js"); 
        throw e;
    }
}

function openSubmitWindow(form, winname, width, height, scroll)
{
	width  = resizeX(width );
	height = resizeY(height);

	try
    {
        var winx = (screen.width - width ) / 2;
        var winy = (screen.height- height) / 2;
        var settings  = "height=    " +height+", ";
            settings += "width=     " +width +", ";
            settings += "top=       " +winy  +", ";
            settings += "left=      " +winx  +", ";
            settings += "scrollbars=" +scroll+", ";
            settings += "resizable =no";
         
        win = window.open("", winname, settings);
        form.target = winname;
        
        if (EncForm(form)){
        	form.submit();
  	   	} else {
  	   		return;
  	   	}
    }
    catch(e)
    {
        e.addLocation("openWindow", "/js/common/window.js"); 
        throw e;
    }
}

/*
 * 전체크기 브라우져를 연다
 *
 * Parameter : URL
 */

function openFullScreen(url)
{
    var newWin;
    newWin = window.open(url, "", "fullScreen");
    self.opener=self;
    window.close();
}

/*
 * 전체크기 브라우져를 연다
 *
 * Parameter : URL
 */
function change1024Screen(url)
{
    var winx = (screen.width - 1024) / 2;
    var winy = (screen.height-  768) / 2;
    window.resizeTo(1024,768);
    window.moveTo(winx,winy);
}


function tokenizer(strt, delim)
{
    try
    {	
        if(strt == null) strt = "";
        strt = trim(strt);
        var array= strt.split(delim);
        
        return array;
    }
    catch(e)
    {
        e.addLocation("tokenizer", "/common/script/common.js");
        throw e;
    }
}