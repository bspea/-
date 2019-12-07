<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
        #messageFirstMain {
            position: fixed;
            height: 100%;
            width: 220px;
            right: 0px;
            /* background: red; */
            border-left: 1px solid rgb(200, 200, 200);
        }
        .messageMiniProfile {
            width: 100%;
            height: 55px;
            cursor: pointer;
            transition-duration: 0.2s;
        }
        .messageMiniProfile:hover {
            background: white;
        }
        .messageMiniProfile>img {
            float: left;
            width: 35px;
            height: 35px;

            border-radius: 50%;
            margin-left: 10px;
            vertical-align: middle;
            margin-top: 10px;
        }
        .messageMiniProfile>p {
            float: left;
            font-size: 13px;
            margin-top: 19px;
            margin-left: 6px;
            color: rgb(60, 60, 60);
        }
        .messageBox {
            right: 250px;
            bottom: 0px;
            position: fixed;
            width: 300px;
            height: 300px;
            background: white;
            box-shadow: 1px 1px 2px 2px rgb(220, 220, 220);

            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .messageBoxTitle {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 1px 1px 2px 2px rgb(220, 220, 220);
            height: 15%;
            transition-duration: 0.2s;
            cursor: pointer;
        }
        .messageBoxTitle:hover{
            background: rgb(245, 245, 245);
        }
        .messageBoxTitle>img {
            float: left;
            width: 35px;
            height: 35px;

            margin-left: 8px;
            margin-top: 5px;
            border-radius: 50%;
        }
        .messageBoxTitle>label {
            float: left;
            margin-top: 12px;
            margin-left: 10px;
            font-weight: bold;
            font-size: 14px;
            cursor:pointer;
        }
        .messageBoxBody {
            height: 75%;
            overflow-y:scroll;
            overflow-x: hidden;
        }
        .messageBoxFoot {
            height: 10%;
            border-top: 1px solid rgb(220, 220, 220);
        }
        .messageBoxFoot>input {
            box-sizing: border-box;
            margin-left: 10%;
            width: 90%;
            height: 100%;
            border: none;
        }
        .messageBoxFoot>input:focus{
            outline: none;
        }
        .footerIcon {
            width: 20px;
            height: 20px;;
            position: fixed;
            margin-left: 5px;
            margin-top: 5px;
            cursor:pointer;
        }
        .messageTalk-Right {
            text-align: right;
            margin-top: 10px;
            margin-right: 20px;
            margin-bottom: 10px;
            
            width: 100%;
        }
        .messageTalk-Left {
            margin-top: 10px;
            margin-left: 10px;
            text-align: left;
            
            width: 100%;
        }
        .messageTalkText {
            display: inline-table;
            max-width:140px;
            height: 30px;
            border-spacing:5px;
            
            border-radius: 30px;
            background: rgb(255, 187, 0);

            color: white;
            text-align: center;
            vertical-align: middle;
            padding-left:5px;
            padding-right:5px;
        }
</style>
</head>
<body>
      <div id="messageFirstMain">
      
      </div>


    
    

    
    <script>
    // 옆에 목록 불러오는 에이잭스
    $(function() {
		var loginNo = $("#loginSession-mNo").data('value');
		
        $.ajax({
    		url:"messengerForm.me",
    		data:{mNo:loginNo},
    		dataType:"json",
    		success:function(result) {
    			// 현재 친구 추가 요청된 사람이 하나도 없는지 검사합니다.
    			// 친구 요청이 있는 경우가 없는 경우 보여지는 게 다르기 때문입니다.
    			var $div = $("#messageFirstMain"); // div부분 선택 (둘 다 공통)
    			$div.html("");
    			if (result.length <= 0) {
    				//friendsListNone($div);
    			} else {
    				$.each(result, function(index, value) {
    					addMessengerList($div, value);
    				});
    			}
 
    		},
    		error:function() {
    			console.log("messengerForm 서버 연결 안돼요.");
    		}
    	});
    });

    // 사람들 자동으로 생성
	function addMessengerList($div, value) {
	var text = new Array();
	text[0] = '<div class="messageMiniProfile" onclick="openMessage(' + value.mNo + ')">';
	text[1] = '<input class="partnerNo" type="hidden">';
	text[2] = '<img src="' + value.profileImage + '"></img>';

	text[3] = '<p>'+ value.mName +'</p>';
	text[4] = '</div>';
	
	var totalText = "";
	for (var i = 0; i < text.length; ++i) {
		totalText += text[i];
	}
	
	$div.append(totalText);
	}
	
    
    // 창을 클릭하면 메신저창을 생성한다.
    function openMessage(mNo) {
    	// 오류가 나지만 include 순서 문제. 설계단계에서 해결했어야 했음으로 일단 두겠음.
    	// 실제 작동에는 문제 없음
    	var userMNo = <%=loginUser.getmNo()%>;

		$.ajax( {
			url:"meseengerWindow.me",
			data:{mNo:mNo, userMNo:userMNo},
			dataType:"json",
			success:function(list) {
				var result = 0;
				$.each(list, function(index, value) {
					// 만약 이미 중복값이 있다면 (이미 메세지가 만들어진 후라면)
					// 메세지창을 만들지 않습니다.
					if (value == mNo) {
						result = -1;
						return false;
					}
					
				});
				// 위에서 메세지창이 이미 생성되었음을 확인했다면 (result = 1)
				// 메세지창을 띄우지 않습니다.
				if (result != -1) {
					addMessageWindow(mNo, list.length);
				}
				
				// Session은 새로고침 해야 갱신됩니다
				
	
			},
			error:function() {
				console.log("openMessage 연결 실패");
			}
		});
    }
    
	// 세션을 기반으로 메신저를 구현
    // 사람들 자동으로 생성
	function addMessengerBoxList($div, value) {
		var text = new Array();
		text[0] = '<div class="messageMiniProfile">';
		text[1] = '<img src="' + value.profileImage + '"></img>';

		text[2] = '<p>'+ value.mName +'</p>';
		text[3] = '</div>';
	
		var totalText = "";
		for (var i = 0; i < text.length; ++i) {
			totalText += text[i];
		}
	}
	
	// 단순히 창만 생성하는 역할입니다.
	function addMessageWindow(mNo, index) {
		var result = 0;
		
		$.ajax( {
			url:"messengerInfo.me",
			data:{mNo:mNo},
			dataType:"json",
			async: false,
			success:function(value) {				
				var text = new Array();
				text[0] = '<div class="messageBox" style="right:' + (250 + (index * 330)) +'px;">';
				text[1] = '<div class="messageBoxTitle" onclick="closeMessage(' + value.mNo + ')">';
				text[2] = '<img src="' + value.profileImage + '">';

				text[3] = '<label>' + value.mName + '</label>';
				text[4] = '</div>';
				
				text[5] = '<div class="messageBoxBody">';
				
				text[6] = '</div>';
				
				text[7] = '<div class="messageBoxFoot">';
				text[8] = '<img class="footerIcon" src="<%=contextPath%>/resources/image/jong/icon-camera.png">';
				text[9] = '<input type="text" placeholder="메세지를 입력해주세요." onkeydown="JavaScript:sendMessage(this,' + mNo +',' + index +');">';
				text[10] = '</div>';
				text[11] = '</div>';
				
				var totalText = "";
				for (var i = 0; i < text.length; ++i) {
					totalText += text[i];
				}
				
				$("body").append(totalText);
				
				// 이후 ajax로 메세지 내용들을 불러옵니다.
				updateMessengerContent(mNo, index);
			},
			error:function() {
				console.log("addMessageWindow 1차 연결 실패");
			}
		});
	}
	
	// 메세지창 안의 컨텐츠들을 업데이트 해줍니다.
	function updateMessengerContent(mNo, index, scrollRefresh) {
		var loginNo = $("#loginSession-mNo").data('value');
		
		$(".messageBoxBody").eq(index).html("");
		
		$.ajax( {
			url:"messengerContent.me",
			data:{mNo:mNo},
			dataType:"json",
			async: false,
			success:function(list) {
				var text = new Array();
					$.each(list, function(index, value) {
						// 오류뜨지만 include문제라서 정상작동됨
						if (value.mNo == loginNo) {
							text[index] = '<div class="messageTalk-Right"><div class="messageTalkText" readonly>' + value.mContent + '</div></div>';
						} else {
							text[index] = '<div class="messageTalk-Left"><div class="messageTalkText" readonly>' + value.mContent + '</div></div>';
						}
						
					}) ;
					
					$(".messageBoxBody").eq(index).append(text);
					
					if (scrollRefresh == 1)
						$('.messageBoxBody').scrollTop( $(document).height() );
			},
			error:function() {
				console.log("addMessageWindow 2차 연결 실패");
			}
		});
	}
	
	function sendMessage(obj, mNo, index) {
		if (event.keyCode == 13) {
			var text = obj.value;
			obj.value = "";

			// 메세지 넣는 작업
			$.ajax( {
				url:"messengerInsert.me",
				data:{mNo:mNo, sendText:text},
				dataType:"json",
				async: false,
				success:function() {
					
				},
				error:function() {
					console.log("sendMessage 실패");
				}
			});
			
			updateMessengerContent(mNo, index, 1);
		}
	}
	
	function refresh() {
		$.ajax({
			url:"messengerRefresh.me",
			dataType:"json",
			async: false,
			success:function(list) {
				
				$.each(list, function(index, value) {
					updateMessengerContent(value, index);
				});
			},
			error:function() {
				console.log("messengerRefresh 연결 실패");
			}
		});
	}
	
	function closeMessage(mNo) {
		$.ajax({
			url:"messengerClose.me",
			data:{mNo:mNo},
			async: false,
			success:function() {
				fullRefresh();
			},
			error:function() {
				console.log("closeMessage 연결 실패");
			}
		});
	}
	
	function fullRefresh() {
		$(".messageBox").remove();
		$.ajax( {
			url:"messengerRefresh.me",
			dataType:"json",
			async: false,
			success:function(list) {
				var result = 0;
				$.each(list, function(index, value) {
					addMessageWindow(value, index);
				});
			},
			error:function() {
				console.log("messengerRefresh 연결 실패");
			}
		});
	}

	
	// 최초 접속시 메세지창을 다시 띄워줘서 원래 띄워준 것처럼 속입니다.
	// 아주 교묘하네요.
	$(function() {
		setInterval(refresh, 10000);
		
		$.ajax( {
			url:"messengerRefresh.me",
			dataType:"json",
			async: false,
			success:function(list) {
				var result = 0;
				$.each(list, function(index, value) {
					addMessageWindow(value, index);
				});
			},
			error:function() {
				console.log("messengerRefresh 연결 실패");
			}
		});
		

	});

	</script>
</body>
</html>