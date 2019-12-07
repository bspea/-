<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta charset="UTF-8">
    <title>고객센터</title>
<style>
    html, body{
        padding: 0;
        margin: 0;
        font-family:"Arial";
    }

        .outer{
            width: 100%;
            height: 50px;
            background-color: #ffc101;
            
        }
        #logo{
            float: left;
            width: 20%;
            height: 100%;
            background-color: #ffc101;
            color: rgb(50, 0, 100);
            margin-top: 15px;

        }
    .logoCursor{
        width: 110px;    
            cursor: pointer;
            /* background: white; */
            /* margin: auto; */
            margin-top: 15px;
            font-size: 14px;
            font-weight: bold;
            line-height: 25px;
        
        }
        .logoCursor>img {
            vertical-align: top;
            margin-right: 10px;
        }
        #search{
            float: left;
            width: 60%;
            height: 100%;
            margin-top: 15px;
        }
        #helptop{
            width: 1000px;
            height: 60px;
            margin: auto;
        }
        #helptop p {
            display: inline-block;
        }
        #back{
            float: left;
            width: 20%;
            height: 100%;
            background-color: #ffc101;
        }
        .biconCusor{
            width: 168px;
            height: 35px;    
            cursor: pointer;
            font-size: 14px;
            margin-top: 30px;
            /* background: red; */
        }
        #bicon{
            width: 180px;    
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
            color: rgb(50, 0, 100);
            line-height: 30px;
        }
        #bicon:hover{
            color: rgb(50, 0, 100);
            font-weight: bold;
        }


        #bottommenu{
            height: 100%;
            color: rgb(156, 178, 214);
            /* margin-top: 0px; */
            
            padding-right: 20px;
            /* line-height: 40px; */
            background: red;
        }


        .bottomMenu1{
            height: 100%;
        }

        #topMenu {
            margin-bottom:  10px;
            height: 50px;
            background: ffc101;
            
        }
        #topMenu>p{
            height: 100%;
            color: rgb(50, 0, 100);
            font-size: 14px;
            margin-top: 0px;
            margin-bottom: 0px;
            padding-left: 7px;
            padding-right: 7px;
            line-height: 50px;
        }
        #topMenu>p:hover{
            background:  #f8ba00;
            color: rgb(70, 0, 120);
            font-weight: bold;
        }
        #topMenu>p:hover+.topMenu-sub{
            display: block;
        }

        #scon{
            border: none;
            border-radius: 3px;
            box-shadow: none;
            color: rgb(50, 0, 100);
            cursor: pointer;
            margin-top: 13px;
            padding-left: 9px;
            
        }
        #sicon {
            width: 30px;
            float: left;
            background: #ffffff85;
            margin-top: 10px;
            height: 42px;
            
            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px;
        }
        #sicon>img{
            vertical-align: middle;
            width: 16px;
            height: 16px;
        }
        #search1{
            margin-top: 10px;
            width: 550px;
            height: 40px;
            background: #ffffff85;
            border: none;
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px;
            box-shadow: none;
            color: rgb(50, 0, 100);
            
        }
        #bicon>img{
            vertical-align: middle;
            width: 16px;
            height: 16px;
        }
        #helptoptop {
            margin-bottom: 15px;   
            height: 100%;
            margin-top: 0px;
        }
        #home:hover {
            cursor: pointer;
        }
        #menu1{
            position: absolute;
            /* margin-top: 40px; */
            margin-left: 33px;
            width: 200px;
            height: 300px;
            background: white;
            display: none;
            z-index: 1000;
        }
        #menu1>p {
            display: block;
        }
        #menu2{
            position: absolute;
            /* margin-top: 40px; */
            margin-left: 139px;
            width: 200px;
            height: 300px;
            background: white;
            display: none;
            z-index: 1000;
        }
        #menu2>p {
            display: block;
        }
        #menu3{
            position: absolute;
            /* margin-top: 40px; */
            margin-left: 218px;
            width: 200px;
            height: 300px;
            background: white;
            display: none;
            z-index: 1000;
            
        }
        #menu3>p {
            display: block;
        }
        #menu4{
            position: absolute;
            /* margin-top: 40px; */
            margin-left: 370px;
            width: 200px;
            height: 300px;
            background: white;
            display: none;
            z-index: 1000;
            
        }
        #menu4>p {
            display: block;
        }
        #middleBack{
            width:100%; 
            background: rgb(228, 240, 246);
        }
        #middleFont{
            font-size: 28px;
        }
        .middle{
            width: 1000px;
            height: 500px;
            margin: auto;
        }
        #middleprint{
            width: 550px;
            height: 380px;
        }
        .mdQue{
            font-size: 18px;
            max-width: 450px;
            background: #ffc101;
            border-radius: 20px;
            box-sizing: border-box;
            color: rgb(50, 0, 100);
            margin-bottom: 12px;
            padding: 6px 14px; 
            width: max-content;
        }
        .mdQue:hover{
            cursor:pointer;
            background: #f8ba00;
        }
        .middleLeft{
            position: absolute;
        }
        .middieRight{
            float: right;
        }
        #topic{
            margin: auto;

            font-size: 28px;
            width: 100%;
            height: 100px;
            background: #ffffff;
        }
        #middlelouder{
            margin: auto;
            height: 310px;
            width: 1000px;
            background: #ffffff;
        }
        #pro, #homep, #message, #pwd{
            float: left;
        }
        .bottomMenu1{
            height: 100%;
            color: rgb(156, 178, 214);
            /* margin-top: 0px; */
            padding-left: 5px;
            padding-right: 5px;
            /* line-height: 40px; */
        }


        .bottomMenu1:hover {
            background: rgb(240,240,240);
            cursor: pointer;
        }



        #pro1, #homep1, #message1, #pwd1{
            width: 230px;
            height: 150px;
            margin: auto;
            border-radius: 350px;
        }

        #pro{
            border: 1px solid rgb(222, 223, 222);
        }
        #homep{
            border: 1px solid rgb(222, 223, 222);
        }
        #message{
            border: 1px solid rgb(222, 223, 222);
        }
        #pwd{
            border: 1px solid rgb(222, 223, 222);
        }
        .infor{
            margin: auto;
            color: #54c7ec;
            font-size: 11px;
            width: 100%;
            margin-left: 15px;
        }
        .information{
            width: 50px;
            height: 5px;
        }
        .loderfont3{
            width:120px;
            height: 20px;
            margin-left: 15px;
            font-size: 18px;
            color: #1d2129;
        }
        .ex{
            width: 200px;
            height: 70px;
            color: #8D949E;
            font-size: 13px;

            margin-left: 15px;
            margin-right: 15px;
        }
        .bottomcom{
            text-align: center;
            margin: auto;
            background: #ffffff;
        }
        #another{
            height: 50px;
            background: #ffffff;
            font-size:28px;
        }
        #anothercom{
            background: #ffffff;
            color: #8d949e;
            font-size: 14px;
        }
        #anotherimg{
            margin: auto;
            background: #ffffff;
            width: 244px;
            height: 200px;
        }

        #footer{
            background: #ffffff;
            color: #8d949e;
            font-size: 14px;
        }
        #loginbox1{
            width: 16px;
            height: 14px;
            vertical-align: middle;
            margin-right: 5px;
            
            
        }
        #gocom{
            width: 246px;
            height: 36px;
            background: rgb(240, 240, 240);
            border: 1px solid rgb(200, 200, 200);
            border-radius: 3px;
        }
        #gocom:hover{
            cursor: pointer;
            background:rgb(230, 230, 230);
        }
</style>
</head>
<body>
<%@ include file="/views/chul/header.jsp"%>
<header>
    <div class="outer">
                <div id="helptop">
                        <div id="helptoptop">
                            <div id="topMenu">
                                <p id="home" onclick="location.href='<%=contextPath%>/views/chul/helpmain.jsp';">홈</p>
                                <p id="mainMenu1">facebook 사용</p>
                                <div id="menu1" class="topMenu-sub">
                                    <p>계정 만들기</p>
                                    <p>친구 맺기</p>
                                    <p>홈페이지</p>
                                    <p>메시지</p>
                                    <p>사진</p>
                                    <p>동영상</p>
                                    <p>페이지</p>
                                </div>
                                <p>계정 관리</p>
                                <div id="menu2" class="topMenu-sub">
                                    <p>로그인 및 비밀번호</p>
                                    <p>프로필 및 설정</p>
                                    <p>Facebook상의 이름</p>
                                    <p>계정 보안 유지</p>
                                    <p>알림</p>
                                </div>  
                                <p>개인정보보호 및 안전</p>
                                <div id="menu3" class="topMenu-sub">
                                        <p>로그인 및 비밀번호</p>
                                        <p>프로필 및 설정</p>
                                        <p>Facebook상의 이름</p>
                                        <p>계정 보안 유지</p>
                                        <p>알림</p>
                                </div>   
                                <p>정책</p>
                                <div id="menu4" class="topMenu-sub">
                                        <p>로그인 및 비밀번호</p>
                                        <p>프로필 및 설정</p>
                                        <p>Facebook상의 이름</p>
                                        <p>계정 보안 유지</p>
                                        <p>알림</p>
                                </div>  
                            </div>

                        </div>
                </div>
    </div>  
    <div id="middleBack">
        <div class="middle">
                <div class="middleLeft">
                    <p id="middleFont">회원님을 위한 맞춤 질문</p>
                    <div>
                        <p class="mdQue">Facebook에서 사용할 수 있는 이름은?</p>
                        <p class="mdQue">Facebook에서 어떤 알림을 받을지 선택하려면?</p>
                        <p class="mdQue">내 Facebook 설정은 어디에서 찾을 수 있나요?</p>
                        <p class="mdQue">내 Facebook 비밀번호를 변경하거나 재설정하려면?</p>
                        <p class="mdQue">Facebook에서 대화에 회신할 수 없다는 오류 메시지가 나타나는 이유는?</p>
                    </div>
                </div>
                <div class="middieRight">
                    <img src="<%=contextPath%>/resources/image/chul/help.png" id="middleprint">
                </div>
        </div>
    </div>

    <div id="middlelouder">
        <p id="topic"><br>인기 주제</p>
        <div id="pro" class="bottomMenu1">
            <div class="louderimg"> 
            <img src="<%=contextPath%>/resources/image/chul/pro.PNG" id="pro1">
            </div>
            <div class="information">
            <p class="infor">정보</p>
            </div>
            <div class="loderfont3">
            <p id="profont">프로필</p>
             </div>
            <div>
            <p class="ex">프로필 사진을 추가하고 정보를 수정하고 타임라인에서 게시물을 관리하는 방법을 알아보세요</p>
            </div>
        </div>
        <div id="homep" class="bottomMenu1">
            <div class="louderimg">
            <img src="<%=contextPath%>/resources/image/chul/homep.PNG" id="homep1">
            </div>
            <div class="information">
            <p class="infor">정보</p>
            </div>
            <div class="loderfont3">
            <p id="homepfont">홈페이지</p>
            </div>
            <div>
            <p class="ex">뉴스피드 기능에 대해 알아보고, 뉴스피드에서 표시되는 내용을 관리하고 게시물에 공감을 표현하는 방법을 알아보세요.</p>
            </div>
        </div>
        <div id="message" class="bottomMenu1">
            <div class="louderimg">
            <img src="<%=contextPath%>/resources/image/chul/message.PNG" id="message1">
            </div>
            <div class="information">
            <p class="infor">정보</p>
            </div>
            <div class="loderfont3"> 
            <p id="messagefont">메세지</p>
            </div>
            <div>
            <p class="ex">Facebook에서 메세지를 보내고 받는 데 대한 답변을 찾아보세요.</p>
            </div>
        </div>
        <div id="pwd" class="bottomMenu1">
            <div class="louderimg">
            <img src="<%=contextPath%>/resources/image/chul/pwd.PNG" id="pwd1">
            </div>
            <div class="information">
            <p class="infor">정보</p>
            </div>
            <div class="loderfont3">
            <p id="pwdfont">공개 범위</p>
            </div>
            <div>
            <p class="ex">공개 범위 설정을 통해 회원님이 믿을 수 있는 친구들과 연결하고 공유하는 방법을 알아보세요.
        </div>

        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>   <br>
    <br>   <br>
    <br>
    <div class="bottomcom">
        <div id="another">
                다른내용을찾으시나요
        </div>
        <div id="anothercom">
            고객 커뮤니티를 둘러보거나 Facebook 광고에 대해 자세히 알아보세요
        </div>
        <div id="anotherimg">
            <img src="<%=contextPath%>/resources/image/chul/com.PNG">
        </div>
        <div>
            <button id="gocom" onclick="gocommunity();" ><img src="<%=contextPath%>/resources/image/chul/loginbox.png" id="loginbox1">고객 커뮤니티 방문</button>
        </div>
        <div id="footer">
            유사한 질문을 한 다른 Facebook 사용자로부터 도움을 받으세요
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    
                
</header>
<script>
       function gocommunity(){
    	   location.href="<%=contextPath%>/list.qabo";
   
       }
</script>

</body>
</html>