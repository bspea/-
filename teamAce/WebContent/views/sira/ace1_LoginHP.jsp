<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, com.kh.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member)session.getAttribute("user");
	String message = (String)session.getAttribute("msg");
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<script>
// ----- 서블릿에서 넘어온 msg가 null이 아닐때 -----
$(function(){
	var msg = "<%= message %>";
	
	if(msg != "null"){
		alert(msg); // 전달받은 메시지 띄우기
		<% session.removeAttribute("msg");%>
	}
});
</script>
<style>
    html, body{
		margin:0px;
		height:100%;
	}
	#hJoin_Outer_Div_First{ 
		width:100%;
		height:100%;
	}
	#hJoin_UpBackground{
		background:rgb(237, 240, 245);
		margin-left:auto;
		margin-right:auto;
		height:100%;
	}


	/* ----------------------- 로그인 홈페이지 ------------------------ */
	#hJoin_UBG_In_Div{ /* hJoin_UpBackground의 contents 영역의 div */
		width:1200px;
		height:80%;
		margin-left:auto;
		margin-right:auto;
	}
	#hJoin_AcebookLogo_Div{ /* Acebook이미지로고 div */
		
		padding-top:70px;
	}
	#hJoin_AcebookLogo_Div img{	/* Acebook 로고 이미지*/
		margin-left:10%;
	}
	#hJoin_Introduce_Div{ /* Acebook 소개말 div */
		width:540px;
		margin-left:11%;
	}
	#hJoin_Introduce_Div h2{ /* Acebook 소개말 */
		margin:0;
	}
	#hJoin_PersonImg_Div{ /* 홈페이지에 있는 사람들 이미지 div */
		margin-top:40px;
		float:left;
		margin-left:11%;
	}
	#hJoin_Login_Div{ /* 로그인 판넬 */
		border:none;
		border-radius:8px;
		box-shadow:0 2px 4px rgba(0,0,0,.1),
				   0 8px 16px rgba(0,0,0,.1);
		box-sizing:border-box;
		width:400px;
		height:350px;
		margin-top:-25%; /* 로그인 판넬 위치에 문제있으면 여기부분 참고해보기 --------------------------------------- */
		margin-left:57%;
		display:inline-block;
		background:white;
		padding: 20px 0 28px;
	}
	.hJoin_TextDiv{ /* 로그인 텍스트 입력하는 칸 div 영역 */
		width:364px;
		height:64px;
		margin-left:auto;
		margin-right:auto;
	}
	.hJoin_InPutText{ /* 로그인 텍스트 입력하는 칸 */
		width:330px;
		height:22px;
		font-family:inherit;
		border-radius:6px;
		font-size:17px;
		padding:14px 16px;
		background:white;
		border:1px solid #dddfe2;
		color:#1d2129;
		line-height:16px;
		vertical-align:middle;
		margin-left:0;
		display:inline-block;
		text-rendering:auto;
	}
	.hJoin_LoginBtn_Div, .hJoin_NewMake_Div{ /* 로그인 버튼 div, 새 계정 만들기 div */
		width:396px;
		height:54px;
		padding-top:6px;
		display:block;
		text-align:center;
		font-size:12px;
		color: #1c1e21;
		margin-left:auto;
		margin-right:auto;

	}
	.hJoin_NewMakeIn_Div{ /* 새 계정 만들기 contents영역 div */
		width:149px;
		margin:0px 126px 0px 126px;
	}
	.hJoin_AgreeBtnIn_Div{
		width:195px;
		margin:0px 102.5px 0px 102.5px;
	}
	.hJoin_LoginBtn{
		font-family:inherit;
		font-size:22.5px;
		font-weight:bold;
		width:364px;
		height:48px;
		background-color:#FFC101;
		border:none;
		border-radius:6px;
		cursor:pointer;
		text-align:center;
		color:white;
		margin-left:auto;
		margin-right:auto;
	}
	#hJoin_FindLink{ /* 계정을 잊으셨나요?(계정찾기) 링크 */
		color:#1877f2;
		font-size:14px;
		font-weight:600;
		cursor:pointer;
		text-decoration:none;
		text-align:center;
		display:block;
	}
	.hJoin_Find_Div{ /* 계정을 잊으셨나요?(계정찾기) 영역 div */
		margin-top:16px;
		display:block;
		text-align:center;
		font-size:12px;
		color:#1c1e21;
	}
	.hJoin_sun1{ /* 계정을 잊으셨나요?, 새 계정 만들기 사이의 구분 선 */
		align-items:center;
		border-bottom:1px solid #dadde1;
		display:flex;
		margin:15px 16px;
		text-align:center;
		font-size:12px;
	}
	.hJoin_green_Btn{ /* 초록색의 새계정만들기, 가입하기 버튼 */
		font-family: inherit;
		border:none;
		border-radius: 6px;
		font-size: 17px;
		line-height: 48px;
		padding:0 16px;
		margin-left:auto;
		margin-right:auto;
		cursor: pointer;
		display: inline-block;
		text-decoration:none;
		color:white;
		font-weight:bold;
		text-align:center;
		background-color:#42b72a;
	}





	/* ----------------------- 새 계정 만들기 ------------------------ */
	.hJoin_Back_div{ /* 새 계정 만들기 창 뒤에있는 영역의 div */
		background:rgba(255, 255, 255, .8);
		left:0;
		bottom:0;
		top:0;
		right:0;
		position:fixed;
		display:none;
		/* background:transparent; */
		/* opacity:0.8; */
	}
	
	/*
	                                       화면 비율때문에 수정----------------1
	.hJoin_back_border1{
		width:100%;
		height:100%;
		vertical-align:middle;
		text-align:center;
		display:inline-block;
		border:1px dashed yellowgreen;
		margin-left:auto;
		margin-right: auto;
	}
*/
	.hJoin_JoinBox1{ /* 화면 비율때문에 수정 -------------------2*/
		width:432px;
		height:519px;
		background:white;
		box-shadow:0 2px 4px rgba(0, 0, 0, .1),
				   0 8px 16px rgba(0, 0, 0, .1);
		border-radius:8px;
		margin-left:auto;
		margin-right: auto;
		margin-top:12%;
		margin-bottom:12%;
		/* bottom:0; */
		/* position:absolute; */
	}
	.hJoin_x{
		width:24px;
		height:24px;
		background-position:0 -302px;
		position:absolute;
		z-index:2;
		cursor: pointer;
		margin-top:10px;
		margin-left:400px;

	}
	.hJoin_Title_Div{
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
	.hJoin_Title_1{
		color:#1c1e21;
		font-family:SFProDisplay-Bold, Helvetica, Arial, sans-serif;
		font-size:27px;
		font-weight:600;
		line-height:38px;
		margin-bottom:0;
		text-align:left;
	}
	.hJoin_Title_2{
		margin-bottom:0;
		color:#606770;
		font-family:SFProText-Regular, Helvetica, Arial, sans-serif;
		font-size: 15px;
		line-height: 24px;
		font-weight: normal;
		text-align: left;

	}
	.hJoin_solidStroke1{
		border-radius: 0 0 8px 8px;
		border-top:1px solid #dadde1;
		box-sizing:border-box;
		padding:16px;
		position:relative;
		width:432px;
		height:437px;
		text-align:left;

	}
	.hJoin_solidStroke2{
		border-radius: 0 0 8px 8px;
		border-top:1px solid #dadde1;
		box-sizing:border-box;
		padding:16px;
		position:relative;
		width:432px;
		height:100px;
		text-align:left;
	}
	.hJoin_JoinForm1{
		margin:0;
		padding:0;
		text-align:left;
		width:400px;
		height:404px;
	}
	.hJoin_JoinForm2{
		margin:0;
		padding:0;
		text-align:left;
		width:400px;
		height:130px;
	}
	.hJoin_Outer_Div{
		/* width:400px;
		height:404px; */
	}
	.hJoin_Boxblock_Div1{
		width:400px;
		height:40px;
		margin-bottom:0px;
	}
	#hJoin_FirstName_Div, #hJoin_LastName_Div{
		width:194px;
		height:40px;
		border-radius:5px;
		font-size:12px;
		display:block;
		position:relative;
		background: rgb(245, 246, 247);
		border:1px solid #dadde1;
		float:left;
	}
	#hJoin_FirstName_Div{
		margin-right:8px;
	}
	#hJoin_FirstName{
		width:194px;
		height:40px;
		padding:11px;
		font-family: SFProDisplay-Regular, Helvetica, Arial, sans-serif;
		font-size: 14px;
		line-height: 16px;
		border-radius:5px;
		margin:0;
		background:transparent;
		border-color:#ccd0d5;
		position: relative;
		border:none;
		box-sizing: border-box;
	}
	#hJoin_LastName{
		width:194px;
		height:40px;
		padding:11px;
		font-family: SFProDisplay-Regular, Helvetica, Arial, sans-serif;
		font-size: 14px;
		line-height: 16px;
		border-radius:5px;
		margin:0;
		background:transparent;
		border-color:#ccd0d5;
		position: relative;
		border:none;
		box-sizing: border-box;
	}
	.hJoin_Boxblock_Div2{
		width:399px;
		height:40px;
		margin-bottom:3px;
		display:inline-block;
		position:relative;
		text-align:left;
		font-size:12px;
		margin-top:10px;
	}
	.hJoin_Boxblock_Div2_1{
		width:399px;
		height:40px;
		position:relative;
		display:block;
		text-align:left;
		font-size:12px;
		background: rgb(245, 246, 247);
		border-radius:5px;
		border:1px solid #dadde1;
	}
	#hJoin_Input_EP, #hJoin_Input_Pwd{
		font-family:inherit;
		border-radius:5px;
		box-sizing:border-box;
		width:399px;
		height:41px;
		padding:11px;
		display:inline-block;
		position:relative;
		text-align:left;
		font-size:14px;
		line-height:16px;
		margin:0;
		background:transparent;
		border-color:#ccd0d5;
		border:none;
	}
	.hJoin_Birth, .hJoin_Gen{
		width:400px;
		height:61.2px;
		position:relative;
		display:block;
		text-align:left;
		font-size:12px;
	}
	#hJoin_Birth, #hJoin_Gen{
		width:400px;
		height:20px;
		margin-bottom:4px;
		color:#606770;
		font-family: SFProText-Medium, Helvetica, Arial, sans-serif;
		font-size: 12px;
   		font-weight: normal;
    	line-height: 20px;
		margin-top: 10px;
		display: block;
		text-align:left;
	}
	.hJoin_Birth_Date{
		width:400px;
		height:37.2px;
		font-family:inherit;
		position:relative;
		display:block;
		text-align:left;
		font-size:12px;

	}
	#hJoin_Birth_Date{
		width:408px;
		height:37.200px;
		font-family:inherit;
		display:inline-block;
		text-align:center;
		font-size:12px;
	}
	#hJoin_Year, #hJoin_Month, #hJoin_Day{
		width:125px;
		height:24px;
		padding:5px;
		border-radius:4px;
		color:#1c1e21;
		font-family:SFProText-Medium, Helvetica, Arial, sans-serif;
		font-size: 15px;
   	 	font-weight: normal;
    	height: 36px;
   		line-height: 20px;
		background-color:#fff;
		border:1px solid #ccd0d5;
		overflow:visible !important;
		text-rendering:auto;
		margin-right:8px;
	}
	.hJoin_Choice_Gen{
		width:412px;
		height:50px;
		font-family: inherit;
		display: flex;
    	flex-wrap: wrap;
    	margin: -8px -6px -6px;
		text-align: left;
		font-size: 12px;
	}
	.hJoin_GenRadio{
		width:111.613px;
		height:34px;
		font-family:inherit;
		background-color: #fff;
		border: 1px solid #ccd0d5;
		box-sizing: border-box;
		display: inline-block;
		flex: 1 0 auto;
		font-weight: normal;
		height: 36px;
		margin: 8px 6px 6px;
		padding: 0;
		position: relative;
		width: auto;
		border-radius: 4px;
		text-align: left;
		font-size: 12px;
	}
	.hJoin_GenLabel{
		width:73.613px;
		height:36px;
		box-sizing: border-box;
		color: #1c1e21;
		display: inline-block;
		font-family: SFProText-Medium, Helvetica, Arial, sans-serif;
		font-size: 15px;
		line-height: 36px;
		padding: 0 28px 0 10px;
		width: 100%;
		font-weight: normal;
		cursor: default;
		vertical-align: middle;
		text-align: left;
	}
	.hJoin_Radio1{
		width:12.8px;
		height:36px;
		margin: 0;
		position: absolute;
		right: 10px;
		top: 0;
		background-color: #fff;
    	color: #1c1e21;
		cursor: default;
		box-sizing: border-box;
		padding: initial;
    	border: initial;
		display: inline-block;
	}
	.hJoin_Agree{
		width:399px;
		height:43.200px;
		font-family: inherit;
		position: relative;
		display: block;
		text-align: left;
		font-size: 12px;
		margin-bottom:15px;
	}
	.hJoin_Agree_P{
		width:399px;
		height:43.200px;
		font-family: inherit;
		width: auto;
		color: #777;
   	 	font-size: 11px;
		margin: 1em 0;
		display: block;
    	margin-block-start: 1em;
    	margin-block-end: 1em;
    	margin-inline-start: 0px;
    	margin-inline-end: 0px;
		text-align: left;

	}
	.hJoin_Agree_P a{
		text-decoration:none;
		color:#385898
	}
	.hJoin_AgreeBtn_Div{
		width:400px;
		height:56px;
		text-align: center;
		display: block;
		font-size: 12px;
	}
	.hJoin_JoinBtn{
		width:130px;
		height:22px;
		font-family: SFProDisplay-Bold, Helvetica, Arial, sans-serif !important;
		font-weight: bold;
		background: none;
		background-color: #00a400;
		border: none;
		border-radius: 6px;
		box-shadow: none;
		color: #fff;
		font-size: 18px;
		font-weight: 600;
		height: 36px;
		overflow: hidden;
		padding-left: 32px;
		padding-right: 32px;
		text-shadow: none;
		margin-top: 10px;
    	margin-bottom: 10px;
		line-height: 126%;
		min-width: 194px;
		padding: 7px 20px;
		text-align: center;
		cursor: pointer;
    	display: inline-block;
    	letter-spacing: 1px;
    	position: relative;
		margin: 0;
	}
	.hJoin_Person_Div{ /*개인정보 약관 동의 창 */
		width:400px;
		height:30.22px;
		opacity:1;
		height:auto;
		font-family:inherit;
		background:#ffebe8;
		border:1px solid #dd3c10;
		line-height:15px;
		margin:0 0 20px 0;
		text-align:center;
		font-size:12px;
		color:#1c1e21;
	}
	#hJoin_AgreeBoxText{
		width:392px;
		height:14.222px;
		font-family:inherit;
		padding:7px 3px;
	}
	.hJoin_AgreeText_Div{
		width:400px;
		height:280px;
	}
	#hJoin_AgreeText1{
		margin-bottom:20px;
		line-height:16px;
		text-align:left;
		font-size:10px;
		color:#1c1e21;
		width:400px;
		height:75px;
	}
	#hJoin_AgreeText2, #hJoin_AgreeText3{
		margin-bottom:20px;
		margin-top:20px;
		line-height:16px;
		text-align:left;
		font-size:10px;
		color:#1c1e21;
		width:400px;
		height:75px;
	}
	#hJoin_AgreeText1_1, #hJoin_AgreeText2_1, #hJoin_AgreeText3_1{
		font-family:inherit;
		border:1px solid #90949c;
		max-height:120px;
		display:block;
		overflow-y:scroll;
		padding:4px;
		line-height:16px;
		text-align:left;
		font-size:12px;
		width:390px;
		height:63px;
	}
	.hJoin_AgreeCh{
		margin-bottom: 0.5px;
		margin-top:0.5px;
		width:400px;
		height:17px;
	}
	.hJoin_AgreeCh_1{
		margin-top:10;
		background:#fff;
		width:12px;
		height:12px;
	}
	.joinBtnDiv2{ /* 나중에다시보기 : 익스플로러랑 크롬이랑 다르게나옴(가입하기 버튼 위치가 약간 다름)*/
		width:400px;
		height:56px;
		text-align: center;
		display: block;
		font-size: 12px;
		margin-top:3px;
	}
	.hJoin_AgBackBtn{
		display:inline-block;
	}
	.hJoin_AgBackBtn a{
		color:#385898;
		cursor:pointer;
		text-decoration:none;
		outline:none;
		font-size:12px;
		line-height:14px;
		font-weight:bold;
	}

	/* 보안코드 입력 페이지 */
	.hJoin_Textguide_Box{
		font-family:inherit;
		font-weight:bold;
		font-size:12px;
		color:#1c1e21;
		margin: 10px 0px 10px 0px;
	}
	.hJoin_CodeInput{
		width:261px;
		height:30px;
	}
	.hJoin_CodeInput_Text{
		width:250px;
		height:20px;
		padding:5px;
		border:1.5px solid #ccd0d5;
	}
	.hJoin_JoinBox2{
		width:432px;
		height:250px;
		background:white;
		box-shadow:0 2px 4px rgba(0, 0, 0, .1),
				   0 8px 16px rgba(0, 0, 0, .1);
		border-radius:8px;
		margin-left:auto;
		margin-right:auto;
		margin-top:12%;
		margin-bottom:12%;
	}
	.hJoin_Outer_Div2{
		width:400px;
		height:80px;
	}
	.hJoin_NBBtn_Div{
		width:432px;
		height:42px;
		background-color:#f2f2f2;
		/* border:1px solid #ccc; */
		margin-left:-16px;
		margin-top:20px;
	}
	.hJoin_NBBtnIn_Div{
		margin-left:330px;
		width:87px;
		height:41px;
	}
	#hJoin_NextBtn_1{
		width:40px;
		height:25px;
		margin-right:7px;
		background-color:#FFC101;
		border:1px solid #FFC101;
		border-radius:2px;
		font-weight:bold;
		font-size:12px;
		padding:0.8px;
		text-align:center;
		color:#fff;
		vertical-align:middle;
		margin: 8px 0 8px 0;
	}
	#hJoin_NextBtn_2{
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
	#hJoin_NextBtn_1:hover{
		cursor:pointer;
		background:rgb(247, 186, 5);
	}
	#hJoin_NextBtn_2:hover{
		cursor:pointer;
		background:rgb(235, 237, 240);
	}





    /* ----------------------- footer ------------------------ */
	#hJoin_DownBackground{ /* footer div 영역 */
		background:white;
		width:100%;
		height:20%;
		text-align:center;
		font-size:13px;
		font-weight:bold;
		margin-top:100px;
		/* ---선생님자리에서 확인해보고 완전바깥 div랑 안맞으면 다시 조절하기---*/
	}
	#hJoin_DBG_Div{	/* footer contents div 영역*/
		width:800px;
		height:150px;
		margin-left:auto;
		margin-right:auto;
	}
	#hJoin_DBG_Div>ul>li{ /* footer div 안에있는 li태그들 설정(font,정렬 등) */
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
	#hJoin_DBG_1{ /* footer 상위 div 영역*/
		width:750px;
		height:40px;
		margin: 30px 0 15px 0;
	}
	#hJoin_sun2{ /* footer 상위와 하위div영역 중간에 있는 구분 선 */
		border-bottom:1px solid #dadde1;
		/* text-align:center; */
		margin-left:auto;
		margin-right:auto;
		display:inline-block;
		width:750px;
	}
	#hJoin_DBG_2{ /* footer 하위 div 영역*/
		width:750px;
		height:40px;
		margin-left:0;
		margin-right:0;
		text-align:right;
		padding:0px;
	}

</style>
</head>
<body>
	<!-- 로그인 페이지 바깥 div -->
	<div id="hJoin_Outer_Div_First">
	
		<div id="hJoin_UpBackground">
		<!-- ----------------------- 로그인 페이지 ------------------------ -->
			<div id="hJoin_UBG_In_Div">

				<!-- Acebook 로고 이미지 -->
				<div id="hJoin_AcebookLogo_Div">
					<img src="<%=contextPath%>/resources/image/sira/acebooklogo.png"; width="200px" height="70px">
				</div>

				<!-- Acebook 글 -->
				<div id="hJoin_Introduce_Div">
					<h2>Acebook에서 전세계에 있는 친구,가족,지인들과<br>
						함께 이야기를 나눠보세요.
					</h2>
				</div>
				
				<!-- 홈페이지에있는 여러 사람모양 이미지 -->
				<div id="hJoin_PersonImg_Div">
					<img src="<%=contextPath%>/resources/image/sira/imageLoginHomeLogo.png"; width="550px" height="200px;">
				</div>



				<!-- 로그인 div -->
				<div id="hJoin_Login_Div">
					<!-- 로그인 form -->
					<% if(loginUser == null) { %>
					<form onsubmit="return validateForm();" class="hJoin_Login_Form1" action="<%=contextPath%>/login.me" method="post">
						
						<!-- 이메일 또는 전화번호 입력란 -->
						<div class="hJoin_TextDiv">
							<input type="text" class="hJoin_InPutText" id="hJEmail" name="hJEmail" placeholder="이메일 또는 전화번호">
						</div>

						<!-- 비밀번호 입력란 -->
						<div class="hJoin_TextDiv">
							<input type="password" class="hJoin_InPutText" id="hJPwd" name="hJPwd" placeholder="비밀번호">
						</div>

						<!-- 로그인 버튼 -->
						<div class="hJoin_LoginBtn_Div">
							<input id="hJoin_LoginBtn" class="hJoin_LoginBtn" name="hJLoginBtn" type="submit" value="로그인">
						</div>

					</form>
					<% } %>
					
					
					
					
					
					

					<!-- 계정찾기 -->
					<div class="hJoin_Find_Div">
						<div id="hJoin_FindLink" onclick="hJoin_FindLink();"> 계정을 잊으셨나요?</div>
					</div>

					<!-- 구분 선 -->
					<div class="hJoin_sun1"></div>

					<!-- 새 계정 만들기 -->
					<div class="hJoin_NewMake_Div">

						<div class="hJoin_NewMakeIn_Div">
						<a role="button" class="hJoin_green_Btn" id="hJoin_NewMake_Btn">새 계정 만들기</a>
						</div>

					</div>
				</div>

			</div>










		<!-- ----------------------- Footer ------------------------ -->
	
		<div id="hJoin_DownBackground">
			<div id="hJoin_DBG_Div">

				<ul id="hJoin_DBG_1"><br><br>
					<li>Acebook &nbsp;|&nbsp;</li>
					<li>call : ☎ 02-1234-5678 &nbsp;|&nbsp;</li>
					<li>mail to : KH_QA@naver.com &nbsp;|&nbsp;</li>
					<li>address : 서울 강남구 테헤란로14길 6 남도빌딩 2,3,4층&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>

				<div id="hJoin_sun2"></div>

				<ul id="hJoin_DBG_2">
					<li>Copyright Acebook Corp. All Rights Reserved</li>
				</ul>

			</div>
		</div>






		</div>
				
			
			
		<!-- ----------------------- 새 계정 만들기 창 ------------------------ -->

		<div class="hJoin_Back_div" id="hJoin_Back_1">
			<div class="hJoin_back_border1">

			<!-- 회원가입 입력창(판넬) -->
            <div class="hJoin_JoinBox1">

				<!-- 닫기 버튼 -->
				<i class="hJoin_x" id="hJoin_x1">
					<img src="<%=contextPath%>/resources/image/sira/x표.png"; width="21px" height="21px;">
				</i>

				<!-- 가입하기 title -->
				<div class="hJoin_Title_Div">
					<div class="hJoin_Title_1">가입하기</div>
					<div class="hJoin_Title_2">빠르고 쉽습니다.</div>
				</div>

				<div class="hJoin_solidStroke1">

				<!-- 가입하기 form -->
				<form action="<%=contextPath %>/insert.me" method="post" 
						id="hJoin_JoinForm1" class="hJoin_JoinForm1" onsubmit="return joinFormValidate();">
					<div class="hJoin_Outer_Div">

						<div class="hJoin_Boxblock_Div1" id="hJoin_Boxblock_Div1">

							<!-- 성 -->
							<div id="hJoin_FirstName_Div">
								<input class="hJoin_sung" id="hJoin_FirstName" name="lH_FirstName" type="text" placeholder="성(姓)">
							</div>

							<!-- 이름 -->
							<div id="hJoin_LastName_Div">
								<input id="hJoin_LastName" name="lH_LastName" type="text" placeholder="이름(성은 제외)">
							</div>

						</div>

							<!-- 휴대폰 번호 또는 이메일 -->
							<div class="hJoin_Boxblock_Div2">
								<div class="hJoin_Boxblock_Div2_1">
									<input id="hJoin_Input_EP" name="lH_HP_Email" type="text" placeholder="휴대폰 번호 또는 이메일">
								</div>
							</div>

							<!-- 새 비밀번호 -->
							<div class="hJoin_Boxblock_Div2">
								<div class="hJoin_Boxblock_Div2_1">
									<input id="hJoin_Input_Pwd" name="lH_Pwd" type="password" placeholder="새 비밀번호">
								</div>
							</div>

							<!-- 생일 -->
							<div class="hJoin_Birth">
								<div id="hJoin_Birth">생일</div>

								<div class="hJoin_Birth_Date">
									<span id="hJoin_Birth_Date" data-type="selectors">
										<span>
											<select aria-label="연도" name="hJoin_Year" id="hJoin_Year" title="연도">
												
												<option hidden>연도</option>
												
											</select>
											
											<!-- 월 -->
											<select aria-label="월" name="hJoin_Month" id="hJoin_Month" title="월">
											<option hidden>월</option>
											<% for(int i=1; i<=12; i++) { %>
											
												<option value="<%=i%>"><%=i%>월</option>
												
											<% }%>
											</select>
											
											
											
											<!-- 일 -->
											<select aria-label="일" name="hJoin_Day" id="hJoin_Day" title="일">
											</select>
										</span>
									</span>
								</div>
							</div>

							<!-- 성별 -->
							<div class="hJoin_Gen">
								<div id="hJoin_Gen">성별</div>

								<span class="hJoin_Choice_Gen" data-type="radio" name="hJoin_Ch_Gen">
								
									<span class="hJoin_GenRadio">
										<label class="hJoin_GenLabel">여성</label>
										<input type="radio" class="hJoin_Radio1" name="gender" value="F" id="radio1">
									</span>

									<span class="hJoin_GenRadio">
										<label class="hJoin_GenLabel">남성</label>
										<input type="radio" class="hJoin_Radio1" name="gender" value="M" id="radio2">
									</span>
								</span>

							</div>

							<!-- 이용하기 약관 -->
							<div class="hJoin_Agree">
								<p class="hJoin_Agree_P">
									가입하기 버튼을 클릭하면 Acebook의 <a href="약관페이지링크넣기" target="_blank">약관</a>,
										<a href="데이터정책페이지링크넣기" target="_blank">데이터 정책</a> 및 
										<a href="쿠키정책페이지링크넣기" target="_blank">쿠키 정책</a>에 
										동의하게 됩니다. Acebook으로 부터 SMS 알림을 받을 수 있으며 알림은 언제든지 옵트 아웃할 수 있습니다.
								</p>
							</div>

							<!-- 가입하기 버튼 -->
							<div class="hJoin_AgreeBtn_Div">
								<div class="hJoin_AgreeBtnIn_Div">
									<input type="submit" class="hJoin_JoinBtn" id="hJoin_JoinBtn" value="가입하기" name="hJoin_JoinBtn1">
								</div>
							</div>
						</div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>



		<!-- ----------------------- 개인정보 약관 동의 창 ------------------------ -->

		<div class="hJoin_Back_div" id="hJoin_Back_2">
			<div class="hJoin_back_border1">
				<!-- 회원가입 입력창 -->
				<div class="hJoin_JoinBox1">
				<!-- 닫기 버튼 -->
				<i class="hJoin_x" id="hJoin_x2">
					<img src="<%=contextPath%>/resources/image/sira/x표.png"; width="21px" height="21px;">
				</i>
				<!-- 가입하기 title -->
				<div class="hJoin_Title_Div">
					<div class="hJoin_Title_1">가입하기</div>
					<div class="hJoin_Title_2">빠르고 쉽습니다.</div>
				</div>
				
				<div class="hJoin_solidStroke1">

					<!-- 개인정보 약관 동의 form -->
					<form class="hJoin_JoinForm1" action="" method="post">
						<div class="hJoin_Outer_Div">

							<!-- 개인정보 약관 동의 짧은 안내텍스트 -->
							<div class="hJoin_Person_Div">
								<div id="hJoin_AgreeBoxText">
									이용 약관 및 개인정보처리방침에 동의하셔야 합니다.
								</div>
							</div>

							<!-- 개인정보 약관 동의 장문 div-->
							<div class="hJoin_AgreeText_Div">

								<!-- 개인정보 약관 동의 장문1 -->
								<div id="hJoin_AgreeText1">

									<div id="hJoin_AgreeText1_1">
										최근 개정된 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 관련하여 국내대리인의 
										연락처 등의 정보를 제공하기 위해 Acebook의 데이터 정책을 업데이트했습니다. 
										이 정책은 대한민국의 이용자에게 적용됩니다.
										
										<br>

										<p><b style="font-size:28px; font-weight:600; color:#333;">데이터 정책</b>
											<br><br><br>
											Acebook 제품을 제공하기 위해 당사는 회원님에 대한 정보를 처리해야 합니다. 
											수집하는 정보의 유형은 회원님이 Acebook 제품을 이용하는 방법에 따라 다릅니다. 
											Acebook 설정에 접속하여 당사가 수집한 정보에 액세스하고 이를 삭제하는 방법에 대해 
											알아보실 수 있습니다.
										</p>
									</div>

									<!-- 동의 체크 -->
									<div class="hJoin_AgreeCh">
										<input type="checkbox" name="hJoin_AgreeCh" id="hJoin_AgreeCh_1" class="hJoin_AgreeCh_1">
										<label>Acebook의 데이터 정책에 동의합니다</label>
									</div>

								</div>
							

							<!-- 개인정보 약관 동의 장문2 -->
							<div id="hJoin_AgreeText2">

								<div id="hJoin_AgreeText2_1">

									<br>

									<p><b style="font-size:28px; font-weight:600; color:#333;"><u>서비스 약관</u></b>
										<br><br>
										Acebook에 오신 것을 환영합니다!<br><br>
										Acebook은 사람들이 서로 교류하고 커뮤니티를 만들며 비즈니스를 성장시킬 수 있는 기술과 서비스를 개발합니다. (본 약관이 아닌) 별도의 약관이 적용된다고 명시되어 있지 않은 한, 본 약관은 회원님의 Acebook, Messenger 및 기타 Acebook이 제공하는 제품, 기능, 앱, 서비스 이용에 적용됩니다.
									</p>
								</div>

								<!-- 동의 체크 -->
								<div class="hJoin_AgreeCh">
									<input type="checkbox" name="hJoin_AgreeCh" id="hJoin_AgreeCh_2" class="hJoin_AgreeCh_1">
									<label>Acebook 권리 및 책임에 관한 정책에 동의합니다</label>
								</div>

							</div>

							<!-- 개인정보 약관 동의 장문3 -->
							<div id="hJoin_AgreeText3">

								<div id="hJoin_AgreeText3_1">
									<p><b style="font-size:15px; font-weight:600; color:#333;">Acebook의 위치 기반 기능</b>
										<br><br>
										Acebook에서는 사람들에게 회원님의 현재 위치 또는 방문한 위치를 알려주는 것은 물론, 
										현재 위치를 기반으로 추천을 받을 수도 있습니다.
										
										<br>

										<ul>
											<li>게시물에 위치 추가: 상태 업데이트, 사진 및 동영상에 위치 정보를 추가할 수 있습니다. 
												현재 위치 또는 방문한 위치를 공유하기 위해 위치에 체크인할 수도 있습니다.</li>

											<br>

											<li>근처 장소 확인 : Acebook의 모바일 앱을 사용하면 친구들이 좋아하거나 추천하거나 
												방문했던 장소를 포함하여, 회원님의 현재 위치 근처에 있는 장소를 찾아볼 수 있습니다.</li>
										</ul>
									</p>
								</div>

								<!-- 동의 체크 -->
								<div class="hJoin_AgreeCh">
									<input type="checkbox" name="hJoin_AgreeCh" id="hJoin_AgreeCh_3" class="hJoin_AgreeCh_1">
									<label>Acebook의 위치 기반 기능 정책에 동의합니다</label>
								</div>
							</div>

							<div>
								<div class="hJoin_AgBackBtn"><a id="hJoin_BeforeBtn">돌아가기</a></div>
								<div class="joinBtnDiv2" id="nextAgreeBtn">
									<div class="hJoin_AgreeBtnIn_Div" id="nextAg">
										<button type="submit" class="hJoin_JoinBtn" id="hJoin_last_Btn" name="hJoin_JoinBtn2">가입하기</button>
									</div>
								</div>
							</div>

							</div>
							</div>
						</div>
					</form>
				</div>
				</div>
			</div>


		<!-- ----------------------- 인증 창 ------------------------ -->

		<div class="hJoin_Back_div" id="hJoin_Back_3">
			<div class="hJoin_back_border2">

			<!-- 보안코드 입력창 -->
				<div class="hJoin_JoinBox2">

				<!-- 닫기 버튼 -->
				<i class="hJoin_x" id="hJoin_x3">
					<img src="<%=contextPath%>/resources/image/sira/x표.png"; width="21px" height="21px;">
				</i>

				<!-- 보안 코드 입력 title -->
				<div class="hJoin_Title_Div">
					<div class="hJoin_Title_1">보안 코드 입력</div>
					<div class="hJoin_Title_2">빠르고 쉽습니다.</div>
				</div>
				
				<div class="hJoin_solidStroke2">

					<!-- 보안 코드 입력 form -->
					<form class="hJoin_JoinForm2" action="<%=contextPath%>/joinCode.me" method="post">
						<div class="hJoin_Outer_Div2">
							<input type="hidden" name="lH_HP_Email" value="" id="aaa">
							<div class="hJoin_Textguide_Box">
								이메일이나 전화번호로 전송된 코드를 확인하세요.
							</div>

							<div class="hJoin_CodeInput">
								<input type="text" id="hJoin_CodeInput_Text" name="hJoin_codeInput" class="hJoin_CodeInput_Text" placeholder="코드 입력">
							</div>

						</div>

						<div class="hJoin_NBBtn_Div">
							<div class="hJoin_NBBtnIn_Div">

								<button type="submit" id="hJoin_NextBtn_1">
									계속
								</button>
								
								<a id="hJoin_NextBtn_2">
									취소
								</a>

							</div>
						</div>
					</form>

				</div>

				</div>
			</div>
		</div>









    <!-- script 부분 -->
        <script>
        
        // -------- 로그인 --------
        function validateForm(){
        	if($("#hJEmail").val().trim().length==0){ // 이메일이나 폰번호 입력 안했을 때
        		alert("이메일이나 휴대폰번호를 입력해주세요.");
        		$("#hJEmail").focus();
        		return false;
        	}
        	
        	if($("#hJPwd").val().trim().length==0){ // 비밀번호 입력 안했을 때
        		alert("비밀번호를 입력해주세요.");
        		$("#hJPwd").focus();
        		return false;
        	}
        }
        
        
     	// -------- 유효성 검사 --------
            function joinFormValidate(){ // 유효성 검사
            	
            	var fName = $("#hJoin_JoinForm1 input[name=lH_FirstName]");	// 성
            	var lName = $("#hJoin_JoinForm1 input[name=lH_LastName]");	// 이름
            	var lHpMail = $("#hJoin_JoinForm1 input[name=lH_HP_Email]"); // 핸드폰번호 or 이메일
            	var lPwd = $("#hJoin_JoinForm1 input[name=lH_Pwd]"); // 비밀번호 
            	
            	
            	
            	// 1. 성 검사
             	var regExp = /^[a-z가-힣]{1,}$/; // 처음글자는 알파벳,한글/ 1글자 이상
            	
            	if(!regExp.test((fName).val())){
            		alert("영문 또는 한글로 성을 입력해주세요.");
            		fName.focus().val("");
            		return false;
            	}
             	

             	// 2. 이름 검사
            	regExp = /^[a-z가-힣]{2,}$/; // 처음글자는 알파벳,한글/ 2글자 이상
            	if(!regExp.test((lName).val())){
            		alert("이름은 영문 또는 한글 2글자 이상으로 입력해주세요.");
            		lName.focus().val("");
            		return false;
            	}
            	
            	var lHId = $("#hJoin_JoinForm1 input[name=lH_HP_Email]"); // input 요소
        		// 3. 핸드폰번호 or 이메일 검사
          	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          	    
          	  	var regExp1 = /^[0-9]{11}$/; // 전화번호 형식
          	    if (!regExp.test((lHId).val()) && !regExp1.test((lHId).val()) ){ // 이메일 형식이 아닐경우
          	    	alert("이메일이나 전화번호 형식이 아닙니다. 다시입력해주세요.");
      	    		lHId.focus().val("");
      	    		return false;
          	    }
            	
            	
           	    // 3. 비밀번호 검사
           	    regExp = /^[a-z0-9!@#$%^&*]{8,16}$/; // 8글자 이상
               	if(!regExp.test((lPwd).val())){
               		alert("비밀번호는 8자 이상 16자 이내로 입력해주세요.");
               		lPwd.focus().val("");
               		return false;
               	}
           	    
           	    // 4. value 값이 선택안되어있을 때
           	    	if($("#hJoin_Year").val()=="연도"){
           	    		alert("연도를 선택해주세요.");
           	    		return false;
           	    	}
           	    	if($("#hJoin_Month").val()=="월"){
           	    		alert("월을 선택해주세요.")
           	    		return false;
           	    	}
           	    	if($("#hJoin_Day").val()=="일"){
           	    		alert("일을 선택해주세요.")
           	    		return false;
           	    	}
           	    
           	    // 5. 성별 하나라도 체크해야 다음으로 넘어가기 가능
           	    	if($("#radio1").prop("checked") == false && $("#radio2").prop("checked") == false){
           	    		alert("성별을 선택해주세요.");
           	    		return false;
           	    	}
           	    
            	
            }
            
			
     	
     	
     	
            $(function(){
            	
            	
            	$("#hJoin_JoinBtn").click(function(){ // 가입하기 버튼 클릭시 이벤트 발생
            		if (joinFormValidate() == false)
            			return false;
            		
            		
          	    		
              	   // 유효한 값인 경우
             	    	var lHId = $("#hJoin_JoinForm1 input[name=lH_HP_Email]");
              	   
              	    	$.ajax({
              	    		url:"idCheck.me",
              	    		type:"post",
              	    		data:{lHId:lHId.val()},
              	    		success:function(result){
              	    			
              	    			console.log("서버 통신 성공");
              	    			
              	    			if(result == "success"){ // 사용 가능
              	    				
              	    				console.log("사용가능 아이디");
              	    				$("#hJoin_Back_1").attr("style", "display:none");
            						$("#hJoin_Back_2").attr("style", "display:block");
              	    			
              	    			}else{ // 사용 불가능
              	    				
              	    				alert("사용할 수 없는 아이디 입니다.");
              	    				lHId.focus().val("");
              	    			}
              	    			
              	    			return false;
              	    			
              	    		},error:function(){
              	    			alert("서버에 오류가 발생했습니다. 다시 시도해주세요.");
								return false;
              	    		}
              	    	});
              	    
              	    	
              	    	return false;
              	    	
            	});
            	
            });
            
            
            
            
            
            
			
			// -------- 새 계정 만들기 버튼 클릭시 이벤트 발생 --------
			 $(document).ready(function(){
				$("#hJoin_NewMake_Btn").click(function(){
					// 보이게 하기
					$("#hJoin_Back_1").fadeIn();
					// $("#joinChang").attr("style", "display:block");
					$("#hJoin_FirstName").focus();
                });
			});



			// -------- 새 계정 만들기 창 -> X 버튼들 클릭시 이벤트 발생 --------
			$("#hJoin_x1").click(function(){ // 가입페이지 X 버튼
				$("#hJoin_Back_1").fadeOut();
			});
			
			$("#hJoin_x2").click(function(){ // 약관페이지 X버튼
				$("#hJoin_Back_2").fadeOut();
			});
			
			$("#hJoin_x3").click(function(){ // 코드인증 X 버튼
				$("#hJoin_Back_3").fadeOut();
			});

			

			
			// ------- 날짜 (년) 선택했을때 --------
			$(document).ready(function(){
				$("#hJoin_Year").change(function(){ // 월 클릭했을 때
					resetInputDate();
				});
			});
			
			
			
			
			
			
			// ------- 날짜 (월) 선택했을때 --------
			$(document).ready(function(){
				$("#hJoin_Month").change(function(){ // 월 클릭했을 때
					resetInputDate();
				});
			});

			
			
			


			// -------- 돌아가기 클릭시 이벤트 발생 --------
			$(document).ready(function(){
				$("#hJoin_BeforeBtn").click(function(){
					$("#hJoin_Back_2").attr("style", "display:none");
					$("#hJoin_Back_1").attr("style", "display:block");
					$("#hJoin_FirstName").focus();
				});
			});

			


			// -------- 가입하기(약관) 버튼 클릭시 이벤트 발생 --------
			$(function(){
				$("#hJoin_last_Btn").click(function(){
					if($("#hJoin_AgreeCh_1").is(":checked") && $("#hJoin_AgreeCh_2").is(":checked") && $("#hJoin_AgreeCh_3").is(":checked")){
						// 약관 체크 3개에 다 체크되어있을때 기존창 끄고 새로운창 열리고 새로운창에있는 텍스트칸에 포커스
						$("#hJoin_Back_1").attr("style", "display:none");
						$("#hJoin_Back_2").attr("style", "display:none");
						$("#hJoin_Back_3").attr("style", "display:block");
						$("#hJoin_CodeInput_Text").focus();
						
						
						var sung = $("#hJoin_FirstName").val();		// 성
						var name = $("#hJoin_LastName").val();		// 이름
						var emailHP = $("#hJoin_Input_EP").val();	// 이메일 또는 폰번호
						var pwd = $("#hJoin_Input_Pwd").val();		// 비밀번호
						var year = $("#hJoin_Year").val();			// 년도
						var month = $("#hJoin_Month").val();		// 월
						var day = $("#hJoin_Day").val();			// 일
						var gender = $('input:radio[name="gender"]:checked').val(); // 사용자가 선택한 성별
						
						$.ajax({
							
							url:"ajaxJoin.me",
							data:{sung:sung, name:name, emailHP:emailHP, pwd:pwd, year:year, month:month, day:day, gender:gender},
							type:"post",
							success:function(result){
								console.log("서버와 통신 성공");
								if(result == "success"){
									console.log("회원가입 성공!");
									
									$("#aaa").val(emailHP);
									
								} else{
									console.log("회원가입 실패!");
								}
								
							},error:function(){
								console.log("서버와 통신 실패");
							}
							
							
						});
						
						
						
					} else {
						alert("약관에 동의해주세요.");
					}
					return false; // submit버튼이라 false 줘서 안넘어가게
				});
			});
			
			
			


			// 보안코드 팝업에서 취소버튼 클릭시 이벤트 발생
			$(document).ready(function(){
				$("#hJoin_NextBtn_2").click(function(){
					$("#hJoin_Back_3").fadeOut();
				});
			});
			


			// 계속 버튼 클릭시 뉴스피드로 이동 ----------------------------- 뉴스피드로 경로로 수정하기 -------------------------------------------> 이쪽
/* 			$(document).ready(function(){
				$("#hJoin_NextBtn_1").click(function(){
					window.location.href="joinCode.me";
					
				});
			}); */


			
			function resetInputDate() {
				// 1. 선택한 년도와 월을 가져옵니다.
				var year = $("#hJoin_Year option:selected").val();
				var month = $("#hJoin_Month option:selected").val();
				
				// 2. Date 클래스를 이용해서 선택한 년도와 월의 마지막 날을 구해옵니다. (getDate())
				var day = (new Date(year, month, 0)).getDate();
				
				// 3. 기존에 있던 일을 전부 날려버립니다. (option을 전부 지워버림)
				// 3.1 그 전에, 일수가 변동되지 않는 경우에는 유지하기 위해서 이전 값을 저장합니다.
				var leftDay = $("#hJoin_Day option:selected").val();
				$("#hJoin_Day option").remove();
			
				// 4. for문을 돌아서 위에서 구한 해당 년월의 마지막 일만큼 반복합니다.
				$("#hJoin_Day").append("<option hidden>일</option>");
				
				for(var i=1; i<=day; i++){
				// 5. append를 이용해서 해당 일을 추가합니다.
				if (leftDay != "일" && leftDay == i)
					$("#hJoin_Day").append("<option value=" + i + " selected>" + i + "일</option>"); // 이전에 선택한 값이 있으면 선택표시 해둡니다.
				else 
					$("#hJoin_Day").append("<option value=" + i + ">" + i + "일</option>");
				};
			}
			
			$(function(){
				var year = new Date().getFullYear();
				var yearInstance = $("#hJoin_Year");
				var yearMax = 50;
				
				for (var i = year; i >= year - yearMax; --i) {
					$("#hJoin_Year").append("<option value=" + i + ">" + i + "년</option>");
				};
				
				resetInputDate();
			});
			
			
			
			
			// ----- 계정 찾기 -----
			function hJoin_FindLink(){
				<%-- location.href="<%=contextPath%>/views/sira/ace2_UserPwdFind.jsp"; --%>
				 window.location.href="userPwdFind.me";
			}
			
			
        </script>
</body>
</html>