<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>계정 찾기 인증 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    html, body{
        margin:0px;
        height:100%;
    }
    #find_Outer{ /* 계정찾기 페이지 전체영역 div */
        margin-left:auto;
        margin-right:auto;
        height:100%;
    }
    #find_UpBackground{
		background:rgb(237, 240, 245);
		margin-left:auto;
		margin-right:auto;
        height:100%;
	}


    /* ----------------------- header ------------------------ */
    #find_HOD1{ /* 상단바 div */
        width:100%;
        height:75px;
        background-color:#FFC101;
    }
    #find_ImgLogo1{ /* 이미지 로고 div */
        width:185px;
        margin-left:20%;
        padding-top:13px;
    }
    #find_ImgLogo1>img{ /* 이미지 로고 */
        width:185px;
        height:70px;
    }



    /* ----------------------- center ------------------------ */
    #find_COD1{ /* 가운데 div */
        width:100%;
        background:rgb(237, 240, 245);
    }
    .find_COD2{ /* 팝업창 가운데로 맞추기위한 가로 div */
        margin-left:auto;
        margin-right:auto;
        background: rgb(237, 240, 245);
    }
    .find_COD2_1{ /* 팝업창 div */
		width:500px;
		height:250px;
		background:white;
		box-shadow:1 1px 1px rgba(0, 0, 0, .1),
				   1 1px 1px rgba(0, 0, 0, .1);
        margin-left:25%;
        display:inline-block;
        border:1px solid rgb(204, 204, 204)
	}


    .find_Title_Div{ /* 팝업창 제목 div */
		margin-top:0;
		padding-top:10px;
		align-items:center;
		border-radius:8px 8px 0 0;
		box-sizing:border-box;
		padding:10px 16px;
		position:relative;
		width:432px;
		z-index:1;
		display:block;
		text-align:left;
		font-size:12px;
		font-family:inherit;
		color:#1c1e21;
		direction:1tr;
		line-height:1.34;
	}
    .find_Title1{ /* 팝업창 제목 */
		color:#1c1e21;
		font-family:SFProDisplay-Bold, Helvetica, Arial, sans-serif;
		font-size:20px;
		font-weight:600;
		line-height:38px;
		margin-bottom:0;
		text-align:left;
	}
    .find_Solid_Stroke1{ /* 선 + 팝업창 contents div영역 */
		border-radius: 0 0 8px 8px;
		border-top:1px solid #dadde1;
		box-sizing:border-box;
		padding:5px 16px 5px 16px;
		position:relative;
		width:500px;
		height:190px;
		text-align:left;
	}
    .find_CenterForm1{ /* 계정찾기 form 영역 */
		margin:0;
		padding:0;
		text-align:left;
		width:480px;
		height:170px;
	}
    .find_CenterFormIn_Div{ /* form안의 div 영역*/
		width:400px;
		height:100px;
	}
    .find_PH_Email_Text{ /* 안내말 텍스트 div 영역 */
		font-family:inherit;
		font-weight:bold;
		font-size:12px;
		color:#1c1e21;
		margin: 10px 0px 15px 0px;
	}
	.find_Input_TextBoxStyle_Div{ /* 텍스트 입력칸 div 영역 */
		width:261px;
		height:30px;
        display:inline-block;
	}
    #find_CodeSendDiv{ /* 발송 버튼 div */
		width:50px;
		height:34px;
        float: right;
        margin-right:75px;
    }
    #find_CodeSend_Btn{/* 발송 버튼 */
        width:45px;
		height:30px;
		margin-right:7px;
		background-color:rgb(242, 138, 23);
		border:1px solid rgb(242, 138, 23);
        outline: 0;
		border-radius:2px;
		font-weight:bold;
		font-size:13px;
		padding:0.8px;
		text-align:center;
		color:#fff;
		vertical-align:middle;
		margin: 0;
    }
    #find_CodeSend_Btn:hover{
        cursor:pointer;
        background:rgb(236, 130, 13)
    }
    #find_Input_TBS_Div1{ /* 전화번호 또는 이메일 주소 div 영역 */
        margin-bottom:15px;
    }
    #find_Input_TBS_Div2{ /* 코드 입력 div 영역 */
        
    }
	.find_Input_TextBoxStyle1{ /* 텍스트 입력 */
		width:250px;
		height:20px;
		padding:5px;
		border:1px solid #d9dcdf;
	}
    .find_center_Outer_Div2{ /* 팝업 하단 div*/
		width:500px;
		height:40px;
		background-color:#f2f2f2;
		/* border:1px solid #ccc; */
        border-top:1px solid #ccc;
		margin-left:-16px;
		margin-top:35px;
	}
	.find_End_Div{ /* 하단 팝업 안의 contens div*/
		margin-left:400px;
		width:87px;
		height:41px;
	}
	#find_End_Btn{ /* 확인 버튼 */
		width:40px;
		height:25px;
		margin-right:7px;
		/* background-color:#FFC101; */
		/* border:1px solid #FFC101; */
        background-color:#42b72a;
        border:1px solid #42b72a;
		border-radius:2px;
		font-weight:bold;
		font-size:12px;
		padding:0.8px;
		text-align:center;
		color:#fff;
		vertical-align:middle;
		margin: 8px 0 8px 0;
	}
	#find_X_Btn{ /* 취소 버튼 */
		width:40px;
		height:25;
		background-color:transparent;
		border:1px solid #ccc;
		border-radius:2px;
		font-weight:bold;
		font-size:12px;
		padding:4px 7px 4px 7px;
		text-align:center;
		color:#4b4f56;
		vertical-align:middle;
	}
	#find_End_Btn:hover{ /* 확인 버튼 hover */
		cursor:pointer;
		background:#3ea12a;
	}
	#find_X_Btn:hover{ /* 취소 버튼 hover */
		cursor:pointer;
		background:rgb(235, 237, 240);
	}




    /* ----------------------- footer ------------------------ */
    #fOd{ /* footer div */
        background:white;
        /* width:100%; */
        height:26%;
        min-height: 75px;
        /* margin-top:5%; */
        text-align:center;
        font-size:13px;
        font-weight:bold;
    }
    #downFooter{
        width:800px;
        margin-left:auto;
        margin-right:auto;
    }
    #downFooter>ul>li{
        padding-left:0;
        padding-right:0;
        border-width:0;
        vertical-align:top;
        display:inline-block;
        list-style-type:none;
        font-family:inherit;
        color:#737373;
        font-size:12px;
    }
    #downFooter-1{
        width:750px;
        height:40px;
        margin: 30px 0 15px 0;
    }
    #sun2{
        border-bottom:1px solid #dadde1;
        /* text-align:center; */
        margin-left:auto;
        margin-right:auto;
        display:inline-block;
        width:750px;
    }
    #downFooter-2{
        width:750px;
        height:40px;
        margin-left:0;
        margin-right:0;
        text-align:right;
        padding:0px;
    }
    #downFooter-2>li{
        padding-left:0;
        padding-right:0;
        border-width:0;
        vertical-align:top;
        display:inline-block;
        list-style-type:none;
        font-family:inherit;
        color:#737373;
        font-size:12px;
    }
</style>
</head>
<body>
    <!-- 계정찾기 페이지 바깥 div -->
<div class="find_Outer" id="find_Outer">
    <div id="find_UpBackground">
        <!-- ----------------------- Header ------------------------ -->

        <div class="find_HeadOuter_Div" id="find_HOD1">
            <div class="find_ImgLogo1" id="find_ImgLogo1">
                <img src="<%=contextPath%>/resources/image/sira/acebooklogo2.png">
            </div>
        </div>



        <!-- ----------------------- Center ------------------------ -->


            <div class="find_COD2" id="find_COD2">
                <div class="find_COD2_1" id="find_COD2_1"> <!-- 계정찾기 팝업창 div -->

                    <!-- 계정찾기 title -->
			    <div class="find_Title_Div">
                    <div class="find_Title1">계정 찾기</div>
                </div>
                
                <div class="find_Solid_Stroke1">
                    <!-- 계정찾기 form -->
                    <form id="find_CenterForm1" class="find_CenterForm1" action="<%=contextPath %>/pwdFind.me" method="post" onsubmit="return validate();">
                        <div class="find_CenterFormIn_Div">
                            <div class="find_PH_Email_Text">
                                	인증번호를 보낼 이메일 주소 또는 전화번호를 입력하세요.
                            </div>
                            <div class="find_Input_TextBoxStyle_Div" id="find_Input_TBS_Div1">
                                <input type="text" id="find_InputText_HPEmail" name="find_HPEmail" class="find_Input_TextBoxStyle1" placeholder="전화번호 또는 이메일주소">
                            </div>
                            <div id="find_CodeSendDiv">
                                <button type="submit" id="find_CodeSend_Btn" class="find_CodeSend_Btn">발송</button>
                            </div>
                            <div class="find_Input_TextBoxStyle_div" id="find_Input_TBS_Div2">
                                <input type="text" id="find_InputText_Code" name="find_CodeInput" class="find_Input_TextBoxStyle1" placeholder="코드 입력">
                            </div>
                        </div>
        
                    <div class="find_center_Outer_Div2">
                        <div class="find_End_Div" id="find_End_Div">
                            <button type="submit" id="find_End_Btn">
								확인
                            </button>
                            <a id="find_X_Btn">
								취소
                            </a>
                        </div>
                    </div>
                </form>
                </div>
                </div>
            </div>

            

        <!-- ----------------------- Footer ------------------------ -->

        <div class="footer-Outer-Div" id="fOd">
            <div id="downFooter">

                <ul id="downFooter-1"><br><br>
                    <li>Acebook &nbsp;|&nbsp;</li>
                    <li>call : ☎ 02-1234-5678 &nbsp;|&nbsp;</li>
                    <li>mail to : KH_QA@naver.com &nbsp;|&nbsp;</li>
                    <li>address : 서울 강남구 테헤란로14길 6 남도빌딩 2,3,4층&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                </ul>

                <div id="sun2"></div>

                <ul id="downFooter-2">
                    <li>Copyright Acebook Corp. All Rights Reserved</li>
                </ul>

            </div>

        </div>
    </div>
</div>

    <script>
        // 현재 화면 해상도를 가져와서 100% 유지하는 함수입니다.
        // 컴퓨터마다 발생하는 해상도 차이를 없애줍니다.
        $(function() {
            var winHeight = screen.height - 75 - 145;

            var bodySize = winHeight * 0.7;
            var footerSize = winHeight * 0.3;

            $("#find_COD2").css('height',bodySize);
            $("#fod").css('height',footerSize);

            $("#find_COD2_1").css('margin-top',bodySize *0.25);
            // alert(winHeight);
        });
    </script>

    <script>
        // 화면 들어오자마자 텍스트에 포커스
        $(document).ready(function(){
            $("#find_InputText_HPEmail").focus();
        });

        // 발송버튼 클릭시 이벤트 발생
        $(document).ready(function(){
            $("#find_CodeSend_Btn").click(function(){
            	var emailHP = $("#find_CenterForm1 input[name=find_HPEmail]"); // input 요소
            	
        		// 이메일,폰번호 형식 검사
          	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          	    
          	  	var regExp1 = /^[0-9]{11}$/; // 번호 형식
          	  	
          	    if (!regExp.test((emailHP).val()) && !regExp1.test((emailHP).val()) ){ // 이메일 형식이 아닐경우
          	    	alert("이메일이나 전화번호 형식이 아닙니다. 다시입력해주세요.");
          	    	emailHP.focus().val("");
          	    	return false;
          	    }else{
                	$("#find_InputText_Code").focus();
                	return false;
          	    }
            });
		});
        
        
        
        
        
        
/*         // 확인버튼 클릭시 이벤트 발생
        $(document).ready(function(){
            $("#find_End_Btn").click(function(){
                window.location.href="pwdChange.me";
                return false;
            });
		}); */

		
		
		
        // 취소버튼 클릭시 이벤트 발생
        $(document).ready(function(){
            $("#find_X_Btn").click(function(){
                window.location.href="loginForm.me";
            });
        });
		
		function validate(){
			var regExp = /^[0-9]{1,}$/; // 번호 형식
			var textInput = $("#find_InputText_Code");
				if (!regExp.test((textInput).val())){ // 이메일 형식이 아닐경우
          	    	alert("인증번호는 모두 숫자입니다. 다시입력해주세요.");
          	    	textInput.focus().val("");
          	    	return false;
			}
		}
    </script>
</body>
</html>