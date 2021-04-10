$(function(){
	$("#content").attr("tabindex", "-1");
	$("#gnbToggle > span.hidden").html("전체메뉴 열기");

    // 메인메뉴 이벤트
    var $gnb = $("#gnb");
    var $gnbItem = $("#gnb > ul > li");
    var $gnbSubItem = $(".gnbSubWrap");
    $gnbItem.on("mouseenter focusin", function() {
        if(!$("html").hasClass("navToggle")) {
            $gnb.addClass("on");
            $(this).addClass("on").siblings().removeClass("on");
        }
    })
    $gnbItem.on("mouseleave" , function() {
        $gnb.removeClass("on");
        $("#gnb > ul > li").removeClass("on");
    })
    $gnbSubItem.on("mouseenter focusin", function() {
        $gnb.addClass("on");
        $(this).closest($gnbItem).addClass("on").siblings().removeClass("on");
    })
    $gnbItem.last().find("li").last().on("focusout" ,function() {
        $gnb.removeClass("on");
        $("#gnb > ul > li").removeClass("on");
    })
    
    var $allnavToggle = $("#gnbToggle");
    var $allnav = $("#allNav");
    var $allnav1da = $("#allNav > ul > li > a");
    var $allnav2da = $("#allNav .gnbSubWrap > ul > li > a");
    var $allSubToggle = $(".allSubToggle");
     
    $allnavToggle.on("click", function(event) {
        if(!$("html").hasClass("navToggle")) {
            $(window).scrollTop(0);
    		$("html").addClass("navToggle");
            $("#allNav > ul > li").first().addClass("on").siblings().removeClass("on");
            $(this).find("span.hidden").html("전체메뉴 닫기");
    	} else {
    		$("html").removeClass("navToggle");
    		$(this).find("span.hidden").html("전체메뉴 열기");
    	}
    })

    $("#allNav > ul > li:last-of-type > .gnbSubWrap > ul > li:last-of-type > a").keydown(function(event) {
        var keycode = event.keyCode || event.which;
        
        if(!$(this).parent("li").hasClass("on") && !event.shiftKey && keycode === 9) {
        	$allnavToggle.focus();
        	return false;
        }
    })

    $("#allNav > ul > li:last-of-type > .gnbSubWrap > ul > li:last-of-type > ul > li:last-of-type > a").keydown(function(event) {
    	var keycode = event.keyCode || event.which;
        
        if(!event.shiftKey && keycode === 9) {
        	$allnavToggle.focus();
        	return false;
        }
    })
    $allnav1da.on("click", function(){
        $(this).parent().addClass("on").siblings().removeClass("on");
        $(this).next("div").addClass("on");
    })
    $allnav2da.on("click", function(){
        $(this).parent().toggleClass("on")
        $(this).next("ul").toggleClass("on");
    })
    $allSubToggle.on("click", function(){
        if($(this).hasClass("on")) {
            $(this).html("하위메뉴 열기").removeClass("on")
            $("#allNav .gnbSubWrap > ul > li > ul").removeClass("on");
        } else {
            $(this).html("하위메뉴 닫기").addClass("on")
            $("#allNav .gnbSubWrap > ul > li > ul").addClass("on");
        }
    })

    var $snb1dItem = $(".snb > li > a");
    $snb1dItem.on("mouseenter focusin", function(){
        $(this).addClass("ov");
    }).on("mouseleave focusout" , function() {
        $(this).removeClass("ov");
    })

    var $snb2dItem = $(".snb > li > ul > li > a");
    $snb2dItem.on("mouseenter focusin", function(){
        $(this).addClass("ov");
    }).on("mouseleave focusout" , function() {
        $(this).removeClass("ov");
    })

    // 테이블 클릭 이벤트
    $(document).on("click", ".tblSelect tr", function(){
    	$(this).toggleClass("on").siblings().removeClass("on");
    })

    // 접근성 탭
    $(".tab:first-of-type, .tabpanel:first-of-type").addClass("on").attr("tabindex", "0");
    $(".tab:first-of-type").attr("aria-selected", "true");
    $(document).on("click", ".tab", function(event){
        event.preventDefault();
        
        // 선택된 탭 활성화
        $(this).addClass("on").attr("aria-selected", "true")
        // 기존 탭 비활성화
        .siblings().removeClass("on").attr("aria-selected", "false");
        // 연관된 탭 패널 활성화
        $("#" + $(this).attr("aria-controls")).attr("tabindex", "0").addClass("on")
        // 기존 탭 패널 비활성화
        .siblings(".tabpanel").attr("tabindex", "-1").removeClass("on");
    });
})
