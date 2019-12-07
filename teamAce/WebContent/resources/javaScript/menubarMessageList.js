	function messageListSet() {
		// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
		var loginNo = $("#loginSession-mNo").data('value');
		
		$.ajax({
			url:"messageList.me",
			data:{mNo:loginNo},
			dataType:"json",
			success:function(result) {
				// 현재 친구 추가 요청된 사람이 하나도 없는지 검사합니다.
				// 친구 요청이 있는 경우가 없는 경우 보여지는 게 다르기 때문입니다.
				var $div = $("#topSub-message"); // div부분 선택 (둘 다 공통)
				$div.html("");
				if (result.length <= 0) {
					messageListNone($div);
				} else {
					$.each(result, function(index, value) {
						addMessageList($div, value);
					});
				}

			},
			error:function() {
				console.log("서버 연결 안돼요.");
			}
		});
		
		
		// ajax 부분이 너무 길어져서 내부함수로 지정
		function addMessageList($div, value) {
		var text = new Array();
		text[0] = '<div class="topSub-messageAddMain topContentMain">';
		text[1] = '<div class="topSub-LeftImage2"><img src="' + profileImageGet(value) + '"></div>';
		text[2] = '<div class="topSub-messageTopLeft"><a href="">' + value.mName + " (" + value.readCount + ")" + '</a></div>';
		text[3] = '<div class="topSub-messageTopRight">' + getMessageDateString(value) + '</div>';
		text[4] = '<div class="topSub-messageBottom">' + value.mContent + '</div>';
		text[5] = '</div>'
		
		
		 
		var totalText = "";
		for (var i = 0; i < text.length; ++i) {
				totalText += text[i];
			}
		
		$div.append(totalText);
		}
		
		// 친구 추가가 없을 경우 호출되는 함수
		function messageListNone($div) {
			// append는 마지막에 /div를 넣어주기 때문에 </div>를 또 넣게되면 2개 지정됩니다.
			$div.append('<div id="toSub-messageNo"class="topSub-no">새로운 메세지가 없습니다.');
		}
	}
	
	function messageNewSet() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconMessage-alram");
		var $alramText = $("#topIconMessage-alram>label");
		
		$.ajax({
			url:"messageNew.me",
			data:{mNo:loginNo},
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
				console.log("alramNewSet 서버 연결 실패");
			}
		});
	}
	
	function messageNewUpdate() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconMessage-alram");
		
		// JQuery가 호출될 필요가 없는데도 계속 호출되는 것을 방지하기 위함입니다.
		if ($alram.css("display") == "none") {
			return;
		}
		
		
		$.ajax({
			url:"messageNewUpdate.me",
			data:{mId:loginNo},
			success:function(msg) {
				messageNewSet();
			},
			error:function() {
				console.log("messageNewUpdate 서버 연결 실패");
			}
		});
	}