	// -------------------------------------------------------
	// 친구 목록 리스트에 하나하나 값을 채워넣는 메소드입니다.
	// $div : 친구목록 리스트의 Div
	// value : 데이터베이스에서 불러온 값 (ArrayList)
	function friendsListSet() {
		// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
		var loginNo = $("#loginSession-mNo").data('value');
		
		$.ajax({
			url:"friendsAdd.me",
			data:{mId:loginNo},
			dataType:"json",
			success:function(result) {
				// 현재 친구 추가 요청된 사람이 하나도 없는지 검사합니다.
				// 친구 요청이 있는 경우가 없는 경우 보여지는 게 다르기 때문입니다.
				var $div = $("#topSub-friends"); // div부분 선택 (둘 다 공통)
				$div.html("");
				if (result.length <= 0) {
					friendsListNone($div);
				} else {
					$.each(result, function(index, value) {
						addFriendsList($div, value);
					});
				}

			},
			error:function() {
				console.log("서버 연결 안돼요.");
			}
		});
		
		
		// ajax 부분이 너무 길어져서 내부함수로 지정
		function addFriendsList($div, value) {
		var text = new Array();
		text[0] =  '<div class="topSub-friendsAddMain topContentMain chaCursorHover">';
		text[1] = '<div class="topSub-friendsAddLeft">';
		text[2] = '<div class="topSub-LeftImage"><img src="' + profileImageGet(value) + '"></div>';

		text[3] = '<div class="topSub-firendsTop"><a href="">' + value.mName + '</a></div>';
		text[4] = '<div class="topSub-firendsBottom">' + value.mDate + '</div>';
		text[5] = '</div>';
		
		text[6] = '<div class="topSub-friendsAddRight">';
		text[7] = '<button class="btnFriends-add" onclick="friendsRequestAgree(' + value.mNo + ');"><img src="' + getContext() + '/resources/image/jong/logo.png">친구 추가</button>';
		text[8] = '<button class="btnFriends-no" onclick="friendsRequestRefusal(' + value.mNo + ');">거절</button>';
		text[9] = '</div>';
		 
		var totalText = "";
		for (var i = 0; i < text.length; ++i) {
			totalText += text[i];
		}
		
		$div.append(totalText);
		}
		
		// 친구 추가가 없을 경우 호출되는 함수
		function friendsListNone($div) {
			// append는 마지막에 /div를 넣어주기 때문에 </div>를 또 넣게되면 2개 지정됩니다.
			$div.append('<div id="toSub-friendsNo" class="topSub-no">새로운 요청이 없습니다.');
		}
	}
	// -------------------------------------------------------
	// 새로운 친구추가 알림용 빨간색 아이콘
	function friendsNewsSet() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconFriends-alram");
		var $alramText = $("#topIconFriends-alram>label");
		
		$.ajax({
			url:"friendsNews.me",
			data:{mId:loginNo},
			type:"get",
			success:function(size) {
				if (size == 0) {
					$alram.css("display","none");
					
				}
				else {
					$alram.css("display","block");
					$alramText.text(size);
				}
			},
			error:function() {
				console.log("friendsNewsSet 서버 연결 실패");
			}
		});
	}
	
	function friendsNewsUpdate() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconFriends-alram");
		
		// JQuery가 호출될 필요가 없는데도 계속 호출되는 것을 방지하기 위함입니다.
		if ($alram.css("display") == "none") {
			return;
		}
		
		$.ajax({
			url:"friendsNewsUpdate.me",
			data:{mId:loginNo},
			success:function(msg) {
				friendsNewsSet();
			},
			error:function() {
				console.log("friendsNewsUpdate 서버 연결 실패");
			}
		});
	}
	
	
	function friendsRequestAgree(index) {
		var loginNo = $("#loginSession-mNo").data('value');
		$.ajax({
			url: "friendsInsert.me",
			data: {mRecvId:index, mId:loginNo},
			type:"get",
			success:function(value) {
				if(value == "complete") {
					friendsListSet();
				} else {
					alert("추가 도중 문제가 발생했습니다. 새로고침 후 시도해주세요.");
				}
			},
			error:function(){
				
			}
		});
	}
	
	function friendsRequestRefusal(index) {
		var loginNo = $("#loginSession-mNo").data('value');
		
		$.ajax({
			url: "friendRefusal.me",
			data: {mRecvId:index, mId:loginNo},
			type:"get",
			success:function(value) {
				if(value == "complete") {
					friendsListSet();
				} else {
					alert("거절 도중 문제가 발생했습니다. 새로고침 후 시도해주세요.");
				}
			},
			error:function(){
				
			}
		});
	}