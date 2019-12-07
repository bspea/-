$(function() {
    // 친구검색창 포커스할 때 발생
    var $searchBox = $("#menuSearch");
    


    $searchBox.focus(function() {
    	if ($searchBox.val() == "") {
    		if ($("#searchListHistory").css("display") == "none") {
    			$("#searchListHistory").fadeIn(200);
    			iconBtnClear(5);
    		}
    	} else {
    		if ($("#searchListFind").css("display") == "none") {
    			$("#searchListFind").fadeIn(200);
    			iconBtnClear(5);
    		}
    	}
    }).on("change keyup paste", function() {
    	if ($searchBox.val() != "") {
    		$("#searchListHistory").css("display","none");
    		$("#searchListFind").css("display","block");
    		iconBtnClear(5);
    		searchListUpdate($searchBox.val());
    		
    	} else {
    		if ($("#searchListFind").css("display") == "block") {
    			$("#searchListFind").css("display","none");
    			$("#searchListHistory").css("display","block");
    			iconBtnClear(5);
    		}
    	}
    }).blur(function() {
    	
    	if ($("#searchListFind").css("display") == "none") {
    		var $targetDiv = $("#searchListForm");
    	 
    	    var divX_Left = $targetDiv.offset().left;
    	    var divY_Top = $targetDiv.offset().top;

    	    var divX_Right = $targetDiv.width() + divX_Left;
    	    var divY_Bottom = $targetDiv.height() + divY_Top; // 메뉴는 List도 존재
    	    
    	    
    	    // alert(divX_Left + " 그리고 " + divX_Right);
    	    // alert(mouseX);
    	    if (divX_Left < mouseX && mouseX < divX_Right &&
    	        divY_Top < mouseY && mouseY < divY_Bottom) {   
    	    	$("#menuSearch").focus();
    	    } else {
    	    	$("#searchListHistory").fadeOut(200);
    	    	$("#searchListFind").fadeOut(200);
    	    	iconBtnClear(5);
    	    }
    	} else {
    		var $targetDiv = $("#searchList");
       	 
    	    var divX_Left = $targetDiv.offset().left;
    	    var divY_Top = $targetDiv.offset().top;

    	    var divX_Right = $targetDiv.width() + divX_Left;
    	    var divY_Bottom = $targetDiv.height() + divY_Top; // 메뉴는 List도 존재
    	 
    	    // alert(divX_Left + " 그리고 " + divX_Right);
    	    // alert(mouseX);
    	    if (divX_Left < mouseX && mouseX < divX_Right &&
    	        divY_Top < mouseY && mouseY < divY_Bottom) {   
    	    	$("#menuSearch").focus();
    	    } else {
    	    	$("#searchListHistory").fadeOut(200);
    	    	$("#searchListFind").fadeOut(200);
    	    	iconBtnClear(5);
    	    }
    	}

    });
});


// 검색 내역 가져오기
$(function() {
	// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
	var mNo = $("#loginSession-mNo").data('value');

	$div = $("#searchListForm");
	$div.html("");
	
	$.ajax({
		url:"searchHistory.me",
		data:{mNo:mNo},
		dataType:"json",
		success:function(result) {
			$.each(result, function(index, value) {
				addHistoryList($div, value);
			});
		},
		error:function() {
			console.log("searchHistory.me 연결 오류");
		}
	});
});

function addHistoryList($div, value) {
	var text = new Array();
	text[0] =  '<div class="searchDiv" onClick="goSearchForm(this);">'  + value.fKeyword + '</div>';
	 
	var totalText = "";
	for (var i = 0; i < text.length; ++i) {
		totalText += text[i];
	}
	
	$div.append(totalText);
}


function searchListUpdate(keyword) {
	var st = 'a';
	// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
	console.log(keyword);
	$.ajax({
		url:"searchFind.sc",
		data:{keyword:keyword},
		dataType:"json",
		success:function(result) {
			// 현재 친구 추가 요청된 사람이 하나도 없는지 검사합니다.
			// 친구 요청이 있는 경우가 없는 경우 보여지는 게 다르기 때문입니다.
			var $div = $("#searchList"); // div부분 선택 (둘 다 공통)
			$div.html("");
			if (result.length <= 0) {
				//friendsListNone($div);
			} else {
				$.each(result, function(index, value) {
					addSearchFindList($div, value);
				});
			}
		},
		error:function(request,status,error) {
			console.log("서버 연결 안돼요.");
		}
	});
}
	
function addSearchFindList($div, value) {
	var text = new Array();
	text[0] = '<div class="searchListDiv" onClick="goTimeline('+ value.mNo +');">';
	text[1] = '<img class="leftProfileImage" src="' + value.profileImage + '">';
	text[2] = '<label>' + value.mName + '</label>';
	 
	var totalText = "";
	for (var i = 0; i < text.length; ++i) {
		totalText += text[i];
	}
	
	$div.append(totalText);
}

function goSearchForm(value) {
	location.href = "/teamace/searchForm.se?searchWord=" + value.innerHTML;
}
function goTimeline(value) {
	location.href = "/teamace/timeLines.bo?mNo=" + value;

}