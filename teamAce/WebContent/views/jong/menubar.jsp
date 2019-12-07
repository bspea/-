<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.member.model.vo.Member"%>
    
<%
	ArrayList<Member> reqFriendList = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>Ace Book</title>

    <style>
::-webkit-scrollbar {
  width: 11px;
}

::-webkit-scrollbar-thumb {
  background-color: #b0b0b0;
  border-radius: 15px;
}

::-webkit-scrollbar-track {
  background-color: white;
}
/* Buttons */
::-webkit-scrollbar-button {
  display: none;
  border-style: solid;
  height: 13px;
  width: 16px;
}
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background: rgb(235, 235, 235);

            scrollbar-face-color: red;
        }

        #top {
        	position: fixed;
        	width: 100%;
            height: 42px;
            background: #FFC101;
            border-bottom: 1px solid rgb(238, 178, 0);
            margin-bottom: 42px;
            z-index: 1000000;
        }

        #top>div {
            width: 1000px;
            height: 32px;
            margin:auto;
            padding-top: 7px;
            /* background: black; */
        }

        #topLogo {
            /* padding-top: 10px; */
            vertical-align: middle;
        }

        /* 검색 입력 칸 */
        #menuSearch {
            vertical-align: middle;
            max-width: 400px;
            min-width: 100px;
            width: 20vw;
            height: 22px;

            /* text setting */
            font-size: 14px;
            text-indent: 5px;

            /* border setting */
            border-left: 1px solid rgb(238, 178, 0);
            border-top: 1px solid rgb(238, 178, 0);
            border-bottom: 1px solid rgb(238, 178, 0);
            border-right: none;
            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px;
        }
        #menuSearch:focus {
            outline: none;
        }
        #searchHistoryListTitle {
            background: rgb(245, 245, 245);
            font-size: 11px;
            height: 30px;
            border-top: 1px solid rgb(150, 150, 150, .3);
            border-left: 1px solid rgb(150, 150, 150, .3);
            border-right: 1px solid rgb(150, 150, 150, .3);
            border-bottom: 1px solid rgb(235, 235, 235);
            line-height: 25px;
            text-indent: 10px;
            font-weight: bold;
            color: rgb(170, 170, 170);
        }
        #searchList {
            margin-top: 30px;
            border-left: 1px solid rgb(150, 150, 150, .3);
            border-right: 1px solid rgb(150, 150, 150, .3);
            border-bottom: 1px solid rgb(150, 150, 150, .3);
        }
        .searchListDiv{
            height: 40px;
            background: white;
            cursor: pointer;
            transition-duration: 0.2s;
        }
        .searchListDiv:hover {
            background: rgb(250, 250, 250);
        }
        .searchListDiv>.leftProfileImage {
            width: 25px;
            height: 25px;
            
            margin-top: 7px;
            margin-left: 5px;
            vertical-align: middle;
            border-radius: 50%;
        }
        .searchListDiv>.cancleImage {
            width: 20px;
            height: 20px;
            float: right;
            
            margin-top: 10px;
            margin-right: 5px;
        }
        .searchListDiv>label {
            position: absolute;
            font-size: 12px;
            margin-top: 10px;
            margin-left: 5px;
            cursor:pointer;
        }
        .searchListBoxSetting {
            position: absolute;
            max-width: 445px;
            min-width: 145px;
            width: calc(20vw + 45px);
            margin-left: 30px;*/
            box-sizing: border-box;
        }
        .searchListBoxSetting2 {
            position: absolute;
            max-width: 445px;
            min-width: 145px;
            width: calc(20vw + 45px);
            margin-left: 15px;
            box-sizing: border-box;
        }
        
        #searchListForm {
            border-radius: 3px;
            overflow: hidden;
            background: white;
        }
        .searchDiv {
            text-indent: 10px;
            line-height: 34px;
            font-size: 13px;
            height: 35px;
            transition-duration: 0.2s;
        }
        .searchDiv:hover {
            background: rgb(255, 248, 240);
            cursor: pointer;
        }
        
        #searchListHistory, #searchListFind {
        	position:absolute;
        	display:none;
        }

        /* 검색 버튼 (오른쪽 회색아이콘) */
        #searchBtn {
            width: 45px;
            height: 26px;
            vertical-align: middle;
            
            margin-left: -6px;
            background: rgb(245, 245, 245);

            /* image */
            background-repeat: no-repeat;
            background-position: center;

            /* border setting */
            border-left: none;
            border-top: 1px solid rgb(238, 178, 0);
            border-bottom: 1px solid rgb(238, 178, 0);
            border-right: 1px solid rgb(238, 178, 0);
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px;

            transition-duration: 0.1s;
        }
        #searchBtn:hover{
            background: rgb(235, 235, 235);
            background-repeat: no-repeat;
            background-position: center;
            cursor: pointer;
        }
        #searchBtn:focus {
            outline: none;
        }
        
        #topLeft {
            margin-right: 90px; 
            float:left;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        .chaCursorHover:hover {
            cursor: pointer;
        }

        /* -------- Right ---------- */
        .topLine {
            margin-top: 4px;
            float: left;
            width: 1px;
            height: 18px;
            background-color:rgb(238, 178, 0);
        }

        .topMenuText {
            font-size: 12px;
            color: rgb(50, 0, 100);
            font-weight: bold;
        }

        #topRight {
            float: left;
            height: 30px;
            /* background: black; */
        }
        #topRight>#topMenu>div {
            float: left;
            padding-top: 2px;
            padding-bottom: 2px;
        }

        #topName {
            width: 80px;
            vertical-align: middle;
        }
        #topRight>#topMenu>div:hover {
            background-color: rgb(241, 165, 24);
            /* cursor:pointer; */
        }

        #topName>img {
            /* 임시 */
            margin-left: 5px;
            vertical-align: middle;
            width: 25px;
            height: 25px;
            border-radius: 50%;
        }
        #topName>label {
            vertical-align: middle;
            margin-left: 5px;
        }

        #topHome {
            vertical-align: middle;
            line-height: 27px;
            height: 25px;
            width: 35px;
            text-align: center;
        }
        #topFindFriend {
            vertical-align: middle;
            line-height: 27px;
            height: 25px;
            width: 75px;
            text-align: center;
        }
        #topMenu, .topMenuText {
            cursor: pointer;
        }
        #topIconMenu, #topMenu {
            float: left;
        }
        #topIconMenu {
            display: inline-block;
            margin-top: 2px;
            /* height: 500px; */
            /* width: 200px; */
            /* background: black; */
        }
        .topIconMenuSet {
            float: left;
            width: 35px;
            height: 25px;
            background-repeat: no-repeat;
            background-position: center;
            cursor: pointer;
            text-align: center;
        }
        .topImportMenuIcon {
            vertical-align: middle;
        }

        /* ------------------------------- */
        /* 툴팁 관련 css */
        #tooltip-friends, #tooltip-message, #tooltip-alram {
            top: 43px;
            color: white;
            text-align: center;
            position: absolute;
            padding-left: 10px;
            padding-right: 10px;
            display: none;
        }
        #tooltip-message {
            margin-left: 35px;
        }
        #tooltip-alram {
            margin-left: 70px;
        }

        .balloon {
            position: inline-block;
            position: relative;
            background: black;
            height: 25px;
            opacity: 0.9;
        }
        .balloon:after {
            content: '';
            position: absolute;
            border-bottom: 5px solid black;
            border-right: 3px solid transparent;
            border-left: 3px solid transparent;
            bottom: 25px;
            left: 13px;
            opacity: 0.95;
        }

        /* ------------------------------- */
        /* 상세보기 관련 기본세팅 */
        /* 네모칸 베이스 */
        .topIconContent {
            width:400px;
            max-height: 700px;
            margin-left: -295px;
            margin-top: 34px;
            position: absolute;
            background: rgb(235, 235, 235);
            border-left: 1px solid rgb(225,225,225);
            border-right: 1px solid rgb(225,225,225);
            border-bottom: 1px solid rgb(225,225,225);
            border-bottom-left-radius: 3px;
            border-bottom-Right-radius: 3px;
            box-shadow: 1px;
            display: none;
        }

        /* 위에 화살표 */
        .topIconContentArrow {
            content: '';
            position: absolute;
            border-bottom: 8px solid white;
            border-right: 8px solid transparent;
            border-left: 8px solid transparent;
            margin-top: -8px;
            opacity: 0.95;
        }

        /* 내용이 없을 때 (친구추가한 사람이 없거나 등등) */
        .topSub-no {
            width: 100%;
            height: 70px;
            line-height: 70px;
            text-align: center;
            color: rgb(150,150,150);
            font-size: 13px
        }

        /* 본문 내용 규격 */
        .topContentMain {
            background-color: white;
            height: 65px;
            border-top: 1px solid rgb(220, 220, 220);
            border-bottom: 1px solid rgb(220, 220, 220);
            margin-top: -1px;
            margin-bottom: -1px;
            transition-duration: 0.2s;
        }
        .topContentMain:hover {
            background-color: rgb(245,245,245);
        }

        /* 왼쪽 동그란 이미지 */
        .topSub-LeftImage {
            float: left;
            width: 28%;
            height: 100%;
        }
        /* 2번째 버전 */
        .topSub-LeftImage2 {
            float: left;
            width: 18%;
            height: 100%;
        }
        .topSub-LeftImage>img, .topSub-LeftImage2>img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            vertical-align: middle;
            margin-left: 10px;
            margin-top: 6px;
            cursor: pointer;
        }

        .chaCursorHover{
            cursor: pointer;
        }

        /* ------------------------------- */
        /* 친구 상세보기 관련 css */

        #topIconFriendsContent>.topIconContentArrow {
            margin-left: 304px;
        }
        .topSub-top {
            background: white;
            position: relative;
            border-bottom: 1px solid rgb(220,220,220);
            padding: 6px;
            padding-left: 15px;
            font-size: 12px;
            font-weight: bold;
            color: rgb(70, 70, 70);
        }
        .topSub-bottom {
            background: white;
            position: relative;
            border-top: 1px solid rgb(220,220,220);
            padding: 8px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            color: rgb(90, 90, 200);
            cursor: pointer;
        }
        .topSub-bottom:hover{
            text-decoration: underline;
        }
        #topSub-friends {
            max-height: 400px;
            overflow: auto;
        }
        .topSub-friendsAddLeft {
            width: 65%;
            height: 100%;
            float: left;
        }

        .topSub-firendsTop{
            float: left;
            width: 72%;
            height:50%;

        }
        .topSub-firendsTop>a {
            color: rgb(90, 90, 200);
            font-weight: bold;
            font-size: 12px;
            display: inline-block;
            margin-top: 15px;
        }
        .topSub-firendsTop>a:hover {
            text-decoration: underline;
            cursor: pointer;
        }
        .topSub-firendsBottom{
            float: left;
            width: 72%;
            height:50%;

            color: rgb(150, 150, 150);
            font-size: 12px;
        }
        .topSub-friendsAddRight {
            width: 35%;
            height: 100%;
            float: right;
            text-align: center;
            line-height: 65px;
        }
        .topSub-friendsAddRight button {
            font-size: 12px;
            font-weight: bold;
            padding-top: 2px;
            padding-bottom: 2px;
            padding-left: 4px;
            padding-right: 4px;
            cursor: pointer;
            margin-top: 20px;
            vertical-align:middle;
            height:25px;
        }
        
        .btnFriends-add {
            color: white;
            background: #FFC101;
            border: 1px solid rgb(238, 178, 0);
            border-radius: 2px;

            transition-duration: 0.15s;
        }
        .btnFriends-add:hover {
            background:rgb(241, 165, 24);
        }
        .btnFriends-add>img {
            width: 15px;
            height: 15px;
            vertical-align: middle;
            margin-right: 5px;
        }
        .btnFriends-no {
            color: rgb(100, 100, 100);
            background: rgb(230, 230, 230);
            border: 1px solid rgb(200, 200, 200);
            border-radius: 2px;
            width: 45px;
            transition-duration: 0.15s;
        }
        .btnFriends-no:hover {
            background: rgb(210, 210, 210);
        }

        .topSub-body {
            background: rgb(245, 245, 245);
        }


        /* 메세지 상세보기 관련 css */
        #topIconMessageContent>.topIconContentArrow {
            margin-left: 340px;
        }

        .topSub-messageLeft {
            width: 65%;
            height: 100%;
            float: left;
        }

        .topSub-messageRight {
            width: 35%;
            height: 100%;
            float: left;
        }

        
        .topSub-messageTopLeft{
            float: left;
            width: 41%;
            height:50%;
            /* background: red; */
            line-height: 43px;
        }
        .topSub-messageTopLeft>a {
            color: rgb(90, 90, 200);
            font-weight: bold;
            font-size: 12px;
        }
        .topSub-messageTopRight{
            float: right;
            width: 38%;
            height:50%;
            /* background: blue; */
            line-height: 44px;
        }
        .topSub-messageTopRight {
            text-align: right;
            color: rgb(150, 150, 150);
            font-size: 12px;
            
            padding-right: 3%;
        }
        .topSub-messageBottom{
            float: left;
            width: 82%;
            height:50%;
            color: rgb(150, 150, 150);
            font-size: 12px;
        }


        /* 알람 상세보기 관련 */
        #topIconAlramContent>.topIconContentArrow {
            margin-left: 373px;
        }
        .topSub-alramMiddle {
            float: left;
            width: 64%;
            height: 100%;
            vertical-align: bottom;
        }
        .topSub-alramMiddleTop {
            width: 100%;
            height: 50%;
            font-size: 12px;
            margin-top: 15px;
        }
        .topSub-alramMiddleTop>a {
            font-weight: bold;
            font-size: 12px;
            color: rgb(90, 90, 200);
        }
        .topSub-alramMiddleTop>.date {
            font-size: 12px;
            color: rgb(180, 180, 180);
        }
        .date>img {
            width: 13px;
            height: 13px;
            vertical-align: middle;
            margin-right: 3px;
        }
        .topSub-alramMiddleBottom {
            width: 100%;
            height: 50%;
            font-size: 12px;
            line-height: 47px;
        }
        .topSub-alramRight {
            float: right;
            width: 18%;
            height: 100%;
            vertical-align: bottom;
        }
        .topSub-alramRight>img{
            width: 100%;
            height: 100%;
        }
        #topIconCommunity>img {
            width: 25px;
            height: 25px;
        }
        .topiconNewIcon {
            position: absolute;
            display: none;
            width: 18px;
            height: 18px;
            top: 2px;
            margin-left: 17px;
            cursor: pointer;
            
            background: red;
            border-radius: 50%;
            border: 1px solid rgb(255, 255, 255, 0.8);

            text-align: center;
            color: white;
            font-size: 12px;
            line-height: 18px;
        }
        .topiconNewIcon label {
        	cursor: pointer;
        }
        
        
    </style>
</head>
<body>
<%@ include file="/views/dataPage.jsp" %>
<div style="height:42px;">
    <div id="top">
        <div>
            <div id="topLeft">
                <img id="topLogo" src="<%=contextPath%>/resources/image/jong/logo.png"></img>
                <form action="<%=contextPath%>/searchForm.se" method="get" style="display:inline-block;" autocomplete="off">
                	<input id="menuSearch" type="text" placeholder="검색" name="searchWord">
                </form>
                
                <div id="searchListHistory">
                <!-- 아래부터 검색기록 넣으면 됩니다. -->
                	<div id="searchDiv" class="searchListBoxSetting2">
                    	<div id="searchListForm" class="searchListBoxSetting2">
                    	</div>
                	</div>
                </div>
                <!-- 끝 -->
                
                <!-- 또 다른 검색 기록 -->
                <div id="searchListFind">
                	<div id="searchHistoryListTitle" class="searchListBoxSetting">유사 친구</div>
                	<!-- 아래부터 검색기록 넣으면 됩니다. -->
                	<div id="searchList" class="searchListBoxSetting">
                    	<!-- 이하 지속적으로 추가되는 것. -->
                    	<div class="searchListDiv">
                        	<img class="leftProfileImage" src="<%=contextPath%>/resources/image/jong/testImage.jpg">
                        	<label>공유</label>
                        	<img class="cancleImage" src="<%=contextPath%>/resources/image/jong/cancle.png">
                    	</div>
               		</div>
                <!-- 끝 -->
				</div>
                
                <button id="searchBtn"></button>
                
                
            </div>
            
            <!-- 90px -->
            <!-- 프로필 + 이름부분 -->
            <div id="topRight">
                <div id="topMenu">
                    <div id="topName" title="프로필" OnClick="location.href ='timeLines.bo'">
                        <img src="
                        <%if (loginUser.getProfileImage() != null) { %>
                        <%=loginUser.getProfileImage() %>
                        <% } else { %>
                        	<% if (loginUser.getGender() == "M") { %>
                        		<%=contextPath%>/resources/image/jong/noImageM.jpg
                        	<% } else { %>
                        		<%=contextPath%>/resources/image/jong/noImageF.jpg
                        	<% } %>
                        <% } %>
                       "><label class="topMenuText"><%=loginUser.getmName() %></label>
                    </div>
                    <div class="topLine"></div>
                    <div id="topHome" OnClick="location.href ='test.me'">
                        <label class="topMenuText">홈</label>
                    </div>
                    <div class="topLine"></div>
                    <div id="topFindFriend"><label class="topMenuText">친구찾기</label></div>
                    <div class="topLine"></div>
                </div>

                <!-- right IconMenu -->
                <div id="topIconMenu">
                    
                    <!---------------- 친구 부분 ---------------->
                    <div id="tooltip-friends" class="balloon">친구 요청</div>
                    <div id="topIconFriends" class="topIconMenuSet"><img class="topImportMenuIcon" src="<%=contextPath%>/resources/image/jong/iconFriends3.png"></div>
                    <!-- 새로운 친구추가가 있을 때 나타나는 동그라미 표시 -->
                    <div id="topIconFriends-alram" class="topiconNewIcon"><label></label></div>
                    <!-- 친구 아이콘 상세보기 -->
                    <div id="topIconFriendsContent" class="topIconContent">
                        <div class="topIconContentArrow"></div>
                        <div class="topSub-top"><a href=>친구 요청</a></div>
 
                        <div id="topSub-friends" class="topSub-body">
                            <!-- 여기에 DB값에 따라 for문으로 생성합니다. -->
                            <!-- <div id="toSub-friendsNo" class="topSub-no">새로운 요청이 없습니다.</div> -->
                            
                            <!-- 여기에 스크립틀릿으로 종료 괄호를 넣습니다. -->
                        </div>
                        <div class="topSub-bottom">모두 보기</div>
                    </div>
                    <!-- 친구 아이콘 상세보기 끝 -->


                    <!---------------- 메세지 부분 ---------------->
                    <div id="tooltip-message" class="balloon">메세지</div>
                    <div id="topIconMessage" class="topIconMenuSet"><img class="topImportMenuIcon" src="<%=contextPath%>/resources/image/jong/iconMessage3.png"></div>
                    <!-- 새로운 메세지가 있을 때 나타나는 동그라미 표시 -->
                    <div id="topIconMessage-alram" class="topiconNewIcon" style="margin-left:57px;"><label>1</label></div>
                    <!-- 메세지 아이콘 상세보기 -->
                    <div id="topIconMessageContent" class="topIconContent"> 
                        <div class="topIconContentArrow"></div>
                        <div class="topSub-top"><label>메세지 목록</label></div>
                        
                        <div id="topSub-message" class="topSub-body chaCursorHover">
                            <!-- 여기에 DB값에 따라 for문으로 생성합니다. -->
                            <!-- <div id="toSub-messageNo"class="topSub-no">새로운 메세지가 없습니다.</div> -->
                            <div class="topSub-messageAddMain topContentMain">
                                <div class="topSub-LeftImage2"><img src="<%=contextPath%>/resources/image/jong/testImage.jpg"></div>
                                <div class="topSub-messageTopLeft"><a href="">김종환</a></div>
                                <div class="topSub-messageTopRight">9월 18일</div>
                                <div class="topSub-messageBottom">자니..?</div>
                            </div>
                            <!-- 여기에 스크립틀릿으로 종료 괄호를 넣습니다. -->
                        </div>

                        <div class="topSub-bottom">Messanger에서 모두 보기</div>
                    </div>
                    <!-- 메세지 아이콘 상세보기 끝 -->


                    <!---------------- 알람 부분 ---------------->
                    <div id="tooltip-alram" class="balloon">알림</div>
                    <div id="topIconAlram" class="topIconMenuSet"><img class="topImportMenuIcon" src="<%=contextPath%>/resources/image/jong/iconAlram3.png"></div>
                    <!-- 새로운 알람이 있을 때 나타나는 동그라미 표시 -->
                    <div id="topIconAlram-alram" class="topiconNewIcon" style="margin-left:92px;"><label>1</label></div>
                    <!-- 알람 아이콘 상세보기 -->
                    <div id="topIconAlramContent" class="topIconContent">
                        <div class="topIconContentArrow"></div>
                        <div class="topSub-top"><label>알림</label></div>

                        <div id="topSub-alram" class="topSub-body chaCursorHover">
                            <!-- 여기에 DB값에 따라 for문으로 생성합니다. -->
                            <!-- <div id="toSub-alramNo"class="topSub-no">새로운 알람이 없습니다.</div> -->
                           
                            <!-- 여기에 스크립틀릿으로 종료 괄호를 넣습니다. -->
                        </div>

                        <div class="topSub-bottom">모두 보기</div>
                    </div>

                    <div class="topLine"></div>
                    <div id="topIconCommunity" class="topIconMenuSet" OnClick="location.href ='help.bo'"><img src="<%=contextPath%>/resources/image/jong/iconCommunity.png"></div>
                </div>
            </div>
        </div>
    </div>
</div>
    
    <script>
	function getContext() {
		return "<%=contextPath%>";
	}
	
	// 나를 친구추가한 사람 불러오는 ajax
	$(function() {
		friendsListSet(); // 친구 추가 요청한 회원들의 List를 구해옵니다.
		friendsNewsSet(); // 친구 추가의 빨간색 아이콘
		messageListSet();
		messageNewSet();
		alramListSet();
		alramNewSet();
	});
	
	
	function searchHistoryListSet() {
		// js파일은 스크립틀릿이 인식을 못하기 때문에 이렇게 세션을 따로 검사합니다.
		var loginNo = $("#loginSession-mNo").data('value');
		
		$.ajax( {
			url:"searchHistory.me",
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
				console.log("searchHistoryListSet 연결 실패");
			}
		});
	}
	
    </script>
    
    
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarProfileImageGet.js?ver=4"></script>
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarDateGet.js?ver=11"></script>
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarMouseEvent.js?ver=4"></script>
    <script type="text/javascript" src="<%=contextPath%>/resources/javaScript/menubarMenuClose.js?ver=4"></script>
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarSearchMenu.js?ver=32"></script>
    
    <!-- 친구목록, 메세지목록, 알람목록 -->
    
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarFriendsList.js?ver=15"></script>
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarMessageList.js?ver=5"></script>
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarAlramList.js?ver=4"></script>
    
    <script type="text/javascript" src="<%=contextPath %>/resources/javaScript/menubarTopMenuIcon.js?ver=15"></script>
    
    <%@ include file="/views/jong/messenger.jsp" %>
</body>
</html>