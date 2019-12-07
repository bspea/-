<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();

	String id = (String)request.getAttribute("id");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    body{
        margin:0px;
    }
    #PwdD_Outer{ /* 비밀번호변경 페이지 전체영역 div */
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
    #PwdD_HOD1{ /* 상단바 div */
        width:100%;
        height:75px;
        background-color:#FFC101;
    }
    #PwdD_ImgLogo1{ /* 이미지 로고 div */
        width:185px;
        /* width:20%; */
        margin-left:20%;
        padding-top:13px;
    }
    #PwdD_ImgLogo1>img{ /* 이미지 로고 */
        width:185px;
        height:70px;
    }



    /* ----------------------- center ------------------------ */
    #PwdD_COD1{ /* 가운데 div */
        width:100%;
        /* height:490px; */
        background:rgb(237, 240, 245);
    }
    .PwdD_COD2{ /* 팝업창 가운데로 맞추기위한 가로 div */
		margin-left:auto;
        margin-right:auto;
        background: rgb(237, 240, 245);
    }
    .PwdD_COD2_1{ /* 팝업창 div */
		width:500px;
		height:250px;
		background:white;
		box-shadow:1 1px 1px rgba(0, 0, 0, .1),
				   1 1px 1px rgba(0, 0, 0, .1);
        margin-left:25%;
        display:inline-block;
        border:1px solid rgb(204, 204, 204)
	}


    .PwdD_Title_Div{ /* 팝업창 제목 div */
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
    .PwdD_Title1{ /* 팝업창 제목 */
		color:#1c1e21;
		font-family:SFProDisplay-Bold, Helvetica, Arial, sans-serif;
		font-size:20px;
		font-weight:600;
		line-height:38px;
		margin-bottom:0;
		text-align:left;
	}
    .PwdD_Solid_Stroke1{ /* 선 + 팝업창 contents div영역 */
		border-radius: 0 0 8px 8px;
		border-top:1px solid #dadde1;
		box-sizing:border-box;
		padding:5px 16px 5px 16px;
		position:relative;
		width:500px;
		height:190px;
		text-align:left;
	}
    .PwdD_CenterForm1{ /* 비밀번호변경 form 영역 */
		margin:0;
		padding:0;
		text-align:left;
		width:480px;
		height:170px;
	}
    .PwdD_CenterFormIn_Div{ /* form안의 div 영역*/
		width:400px;
		height:100px;
	}
    .PwdD_NewPwd_Text{ /* 안내말 텍스트 div 영역 */
		font-family:inherit;
		font-weight:bold;
		font-size:12px;
		color:#1c1e21;
		margin: 10px 0px 15px 0px;
	}
	.PwdD_Input_TextBoxStyle_Div{ /* 텍스트 입력칸 div 영역 */
		width:261px;
		height:30px;
        display:inline-block;
	}
    #PwdD_Input_TBS_Div1{ /* 비밀번호 div 영역 */
        margin-bottom:15px;
    }
	.PwdD_Input_TextBoxStyle1{ /* 텍스트 입력 */
		width:250px;
		height:20px;
		padding:5px;
		border:1px solid #d9dcdf;
	}
    .PwdD_center_Outer_Div2{ /* 팝업 하단 div*/
		width:500px;
		height:40px;
		background-color:#f2f2f2;
		/* border:1px solid #ccc; */
        border-top:1px solid #ccc;
		margin-left:-16px;
		margin-top:35px;
	}
	.PwdD_End_Div{ /* 하단 팝업 안의 contens div*/
		margin-left:400px;
		width:87px;
		height:41px;
	}
	#PwdD_End_Btn{ /* 확인 버튼 */
		width:40px;
		height:25px;
		margin-right:7px;
		/* background-color:#FFC101;
		border:1px solid #FFC101; */
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
	#PwdD_X_Btn{ /* 취소 버튼 */
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
	#PwdD_End_Btn:hover{ /* 확인 버튼 hover */
		cursor:pointer;
		background:#3ea12a;
	}
	#PwdD_X_Btn:hover{ /* 취소 버튼 hover */
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
    <!-- 비밀번호변경 페이지 바깥 div -->
    <div class="PwdD_Outer" id="PwdD_Outer">
        <div id="find_UpBackground">
        <!-- ----------------------- Header ------------------------ -->

        <div class="PwdD_HeadOuter_Div" id="PwdD_HOD1">
            <div class="PwdD_ImgLogo1" id="PwdD_ImgLogo1">
                <img src="<%=contextPath%>/resources/image/sira/acebooklogo2.png">
            </div>
        </div>



        <!-- ----------------------- Center ------------------------ -->

        <div class="PwdD_center_Outer_Div1" id="PwdD_COD1">
            <div class="PwdD_COD2" id="PwdD_COD2">
                <div class="PwdD_COD2_1" id="PwdD_COD2_1"> <!-- 비밀번호변경 팝업창 div -->

                    <!-- 비밀번호 변경 title -->
                <div class="PwdD_Title_Div">
                    <div class="PwdD_Title1">비밀번호 변경</div>
                </div>
                
                <div class="PwdD_Solid_Stroke1">
                    <!-- 비밀번호 변경 form -->
                    <form id="PwdD_Cen" class="PwdD_CenterForm1" action="<%=contextPath%>/updatePwd.me?id=<%=id %>" method="post" onsubmit="return validate();">
                        <div class="PwdD_CenterFormIn_Div">
                            <div class="PwdD_NewPwd_Text">
                                	새로 변경할 비밀번호를 입력해주세요.
                            </div>
                            <div class="PwdD_Input_TextBoxStyle_Div" id="PwdD_Input_TBS_Div1">
                                <input type="password" id="PwdD_InputText_NewPwd" name="pwdD_No1" class="PwdD_Input_TextBoxStyle1" placeholder="비밀번호">
                            </div>
                            <div class="PwdD_Input_TextBoxStyle_div" id="PwdD_Input_TBS_Div2">
                                <input type="password" id="PwdD_InputText_OnemorePwd" name="pwdD_No2" class="PwdD_Input_TextBoxStyle1" placeholder="비밀번호 확인">
                            </div>
                        </div>
        
                    <div class="PwdD_center_Outer_Div2">
                        <div class="PwdD_End_Div" id="PwdD_End_Div">
                            <button type="submit" id="PwdD_End_Btn">
                                	확인
                            </button>
                            <a id="PwdD_X_Btn">
                                	취소
                            </a>
                        </div>
                    </div>
                </form>
                </div>
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
    
            $("#PwdD_COD2").css('height',bodySize);
            $("#fod").css('height',footerSize);
    
            $("#PwdD_COD2_1").css('margin-top',bodySize *0.25);
            // alert(winHeight);
        });
    </script>

    <script>
        // 화면 들어오자마자 텍스트에 포커스
        $(document).ready(function(){
            $("#PwdD_InputText_NewPwd").focus();
        });
        

        // 취소버튼 클릭시 이벤트 발생
        $(document).ready(function(){
            $("#PwdD_X_Btn").click(function(){
                window.location.href="loginForm.me";
            });
        });
        
        function validate(){
        	 var regExp = /^[a-z0-9!@#$%^&*]{8,16}$/; // 8글자 이상
        	 var pwd = $("#PwdD_Cen input[name=pwdD_No1]");
        	 var pwd2 = $("#PwdD_Cen input[name=pwdD_No2]");
            	if(!regExp.test((pwd).val())){
            		alert("비밀번호는 8자 이상 16자 이내로 입력해주세요.");
            		pwd.focus().val("");
            		return false;
            	}
            	
            	if(!regExp.test((pwd2).val())){
            		alert("비밀번호는 8자 이상 16자 이내로 입력해주세요.");
            		pwd2.focus().val("");
            		return false;
            	}
            	
            	if($(pwd).val().trim().length==0){ // 비밀번호 입력 안했을 때
            		alert("변경 할 비밀번호를 입력해주세요.");
            		pwd.focus();
            		return false;
            	}
            	
            	if($(pwd2).val().trim().length==0){ // 비밀번호 입력 안했을 때
            		alert("변경 할 비밀번호를 입력해주세요.");
            		pwd2.focus()
            		return false;
            	}
            	
            	if($(pwd).val() != $(pwd2).val()){
            		alert("변경하려는 비밀번호가 일치하지 않습니다.");
            		pwd.focus().val("");
            		pwd2.val("");
            		return false;
            	}
            	
        }
    </script>

</body>
</html>