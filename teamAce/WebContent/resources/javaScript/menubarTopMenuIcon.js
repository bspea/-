var jsContextPath = "테스트";
var topIconMouseEvent = new Array();
topIconMouseEvent[0] = 0;
topIconMouseEvent[1] = 0;
topIconMouseEvent[2] = 0;
topIconMouseEvent[3] = 0;

$(function() {
	jsContextPath = getContext();

	
    // 친구 아이콘 마우스 이벤트
    $("#topIconFriends, #topIconFriends-alram").mouseenter(function(){
        if (iconClickCheck(0) == false) {
            if (topIconMouseEvent[0] != 2){
            topIconMouseEvent[0] = 1;
            $("#topIconFriends").children().eq(0).attr('src', jsContextPath + '/resources/image/jong/iconFriendsHover3.png');
            setTimeout(function() {
           
            if (topIconMouseEvent[0] == 1)
                $("#tooltip-friends").css({"display":"inherit"});
            }, 500);
            }
        }
    }).mouseleave(function() {
        if (iconClickCheck(0) == false) {
            if (topIconMouseEvent[0] != 2) {
                topIconMouseEvent[0] = 0;
            $("#tooltip-friends").css({"display":"none"});
            $("#topIconFriends").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconFriends3.png');
            }
        }
    }).click(function() {
    		friendsNewsUpdate();
            iconBtnClear(0);

            if (topIconMouseEvent[0] != 2) {
                topIconMouseEvent[0] = 2;
            $("#tooltip-friends").css({"display":"none"});
            $("#topIconFriends").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconFriendsClick3.png');
            // $("#topIconFriendsContent").css('display','inherit');
            $("#topIconFriendsContent").fadeIn(120);
            } else {
                iconBtnClear(5);
                topIconMouseEvent[0] = 0;
            }
    });


    // 메세지 아이콘 마우스 이벤트
    $("#topIconMessage, #topIconMessage-alram").mouseenter(function(){
        if (iconClickCheck(1) == false) {
            if (topIconMouseEvent[1] != 2){
            topIconMouseEvent[1] = 1;
            $("#topIconMessage").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconMessageHover3.png');
            setTimeout(function() {
           
            if (topIconMouseEvent[1] == 1)
                $("#tooltip-message").css({"display":"inherit"});
            }, 500);
            }
        }
    }).mouseleave(function() {
        if (iconClickCheck(1) == false) {
            if (topIconMouseEvent[1] != 2) {
                topIconMouseEvent[1] = 0;
            $("#tooltip-message").css({"display":"none"});
            $("#topIconMessage").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconMessage3.png');
            }
        }
    }).click(function() {
            iconBtnClear(1);
            messageNewUpdate();

            if (topIconMouseEvent[1] != 2) {
                topIconMouseEvent[1] = 2;
            $("#tooltip-message").css({"display":"none"});
            $("#topIconMessage").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconMessageClick3.png');
            // $("#topIconMessageContent").css('display','inherit');
            $("#topIconMessageContent").fadeIn(120);
            } else {
                iconBtnClear(5);
                topIconMouseEvent[1] = 0;
            }
    });


    // 알람 아이콘 마우스 이벤트
    $("#topIconAlram, #topIconAlram-alram").mouseenter(function(){
        if (iconClickCheck(2) == false) {
            if (topIconMouseEvent[2] != 2){
            topIconMouseEvent[2] = 1;
            $("#topIconAlram").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconAlramHover3.png');
            setTimeout(function() {
           
            if (topIconMouseEvent[2] == 1)
                $("#tooltip-alram").css({"display":"inherit"});
            }, 500);
            }
        }
    }).mouseleave(function() {
        if (iconClickCheck(2) == false) {
            if (topIconMouseEvent[2] != 2) {
                topIconMouseEvent[2] = 0;
            $("#tooltip-alram").css({"display":"none"});
            $("#topIconAlram").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconAlram3.png');
            }
        }
    }).click(function() {
   			alramNewUpdate();
            iconBtnClear(2);

            if (topIconMouseEvent[2] != 2) {
                topIconMouseEvent[2] = 2;
            $("#tooltip-alram").css({"display":"none"});
            $("#topIconAlram").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconAlramClick3.png');
            // $("#topIconMessageContent").css('display','inherit');
            $("#topIconAlramContent").fadeIn(120);
            } else {
                iconBtnClear(5);
                topIconMouseEvent[2] = 0;
            }

    });
});


function iconBtnClear(index) {
    for (var i = 0; i < topIconMouseEvent.length; ++i) {
        if (index == i)
            continue;
        topIconMouseEvent[i] = 0;
    }

    $("#topIconFriends").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconFriends3.png');
    $("#topIconMessage").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconMessage3.png');
    $("#topIconAlram").children().eq(0).attr('src',jsContextPath + '/resources/image/jong/iconAlram3.png');
    $("#topIconFriendsContent").fadeOut(120);
    $("#topIconMessageContent").fadeOut(120);
    $("#topIconAlramContent").fadeOut(120);
}

function iconClickCheck(index) {
    for (var i = 0; i < topIconMouseEvent.length; ++i) {
            if (i == index)
                continue;

            if (topIconMouseEvent[i] != 0)
                return true;
        }
    
    return false;
}

