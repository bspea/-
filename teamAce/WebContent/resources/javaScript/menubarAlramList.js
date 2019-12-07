	// -------------------------------------------------------
	// 알람 목록 리스트에 하나하나 값을 채워넣는 메소드입니다.
	// $div : 알람 목록 리스트의 Div
	// value : 데이터베이스에서 불러온 값 (ArrayList)
	function alramListSet() {
		// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
		var loginNo = $("#loginSession-mNo").data('value');
		
		$.ajax( {
			url:"alramList.me",
			data:{mNo:loginNo},
			dataType:"json",
			success:function(list) {
				var $div = $("#topSub-alram"); // div부분 선택 (둘 다 공통)
				$div.html("");
				
				if (list.length <= 0) {
					alramListNone($div);
				} else {
					$.each(list, function(index, value) {
						addAlramList($div, value);
					});
				}
			},
			error:function() {
				console.log("서버 연결 안돼요.");
			}
		});
		
		function addAlramList($div, value) {
			var text = new Array();
			text[0] = '<div class="topSub-messageAddMain topContentMain">';
			text[1] = 	'<div class="topSub-LeftImage2"><img src="' + profileImageGet(value) + '"></div>';
			text[2] = 	'<div class="topSub-alramMiddle">';
			text[3] = 		'<div class="topSub-alramMiddleTop">';
			text[4] = 			'<a href="">' + value.mName + '</a>' + value.aContent +'<br>';
			text[5] = 			'<label class="date"><img src="' + getContext() + '/resources/image/jong/iconDate.png">' + getDateString(value) + '</label>';
			text[6] = 		'</div>';
			text[7] = 	'</div>';
			text[8] = 	'<div class="topSub-alramRight">';
			if (value.aImage == null) {
				text[9] = '';
			}
			else {
				text[9] = '<img src="' + value.aImage +'">';
			}
					
			text[10] = '</div>';
			text[11] = '</div>';
			 
			var totalText = "";
			for (var i = 0; i < text.length; ++i) {
				totalText += text[i];
			}
			
			$div.append(totalText);
		}
		
		function alramListNone($div) {
			// append는 마지막에 /div를 넣어주기 때문에 </div>를 또 넣게되면 2개 지정됩니다.
			$div.append('<div id="toSub-friendsNo" class="topSub-no">새로운 요청이 없습니다.');
		}
	}
	
	function alramNewSet() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconAlram-alram");
		var $alramText = $("#topIconAlram-alram>label");
		
		$.ajax({
			url:"alramNew.me",
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
				console.log("alramNewSet 서버 연결 실패");
			}
		});
	}
	
	function alramNewUpdate() {
		var loginNo = $("#loginSession-mNo").data('value');
		var $alram = $("#topIconAlram-alram");
		
		// JQuery가 호출될 필요가 없는데도 계속 호출되는 것을 방지하기 위함입니다.
		if ($alram.css("display") == "none") {
			return;
		}
		
		$.ajax({
			url:"alramNewUpdate.me",
			data:{mId:loginNo},
			success:function(msg) {
				alramNewSet();
			},
			error:function() {
				console.log("alramNewUpdate 서버 연결 실패");
			}
		});
	}