<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>

<%
	ArrayList<Member> list2 = (ArrayList<Member>)request.getSession().getAttribute("friendsList");
	Member member2 = (Member)request.getSession().getAttribute("member");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
     /* 타임라인 왼쪽 사이드바 */
        img{
            border: 0;
        }
        a{
            cursor:pointer;
            text-decoration:none;
            color:#1c1e21;
        }
        .myTLine_4b17{ /* -> ._4b17 */
            float:left;
            min-height:1px;
            word-wrap:break-word;
        }
        .myTLine_3-91{ /* -> ._3-91 */
            margin-right:12px;
        }
        .myTLine_5ss7{ /* -> ._5ss7 */
            position:relative;
            height:883px;
        }
        .myTLine_5ss8{ /* -> ._5ss8 */
            margin-bottom:40px;
            max-width:100%;
            position:absolute;
        }
        span{
            font-family:inherit;
        }
        .myTLine_3-96{ /* -> ._3-96 */
            margin-bottom:12px;
        }
        .myTLineTwoColumn{ /* -> .fbTimelineTwoColumn */
            clear:none;
            float:none;
        }
        .myTLine_fbTimelineUnit{ /* -> .fbTimelineUnit */
            /* display:inline-block; */
            display:block;
            width:323px;
            color:#1c1e21;
            margin-bottom:10px;
            position:relative;
        }
        
        /* 왼쪽 소개 사이드메뉴 div */
        .myTLine_4-u2{ /* -> ._4-u2 */
            border:1px solid #dddfe2;
            border-radius:3px;
        }
        .myTLine_4-u8{ /* -> ._4-u8 */
            background-color:#fff;
        }

        /* 소개 부분 영역 */
        .myTLine_3qn7{ /* -> ._3qn7 */
            display:flex;
        }
        .myTLine_61-3{ /* -> ._61-3 */
            justify-content:space-between;
        }
        .myTLine_2fyi{ /* -> ._2fyi */
            flex-direction:row;
        }
        .myTLine_3qng{ /* -> ._3qng */
            align-items:center;
        }
        .myTLine_3-8t{ /* -> ._3-8t */
            margin-left:12px;
            margin-right:12px;
        }
        .myTLine_2pi4{ /* -> ._2pi4 */
            padding-top:12px;
            padding-bottom:12px;
        }
        .myTLine_46yc{
            padding-bottom:4px;
        }
        .myTLine_sp_iiGu_6r3G5H_1_5x{
            width:24px;
            height:24px;
            background-position:0 -60px;
        }
        .myTLine_sx_dd5f6e{
            border-radius:50%;
        }
        .myTLine_3qn7{
            display:flex;
        }
        .myTLine_61-0{
            justify-content:flex-start;
        }
        .myTLine_2fyi{
            flex-direction:row;
        }
        .myTLine_3qnf{
            align-items:flex-start;
        }
        .myTLine_19c4{
            -moz-flex-grow:1;
            -ms-flex-grow:1;
            flex-grow: 1;
        }
        .myTLine_3-9a{
            margin-left:8px;
        }
        .myTLine_2ie1{
            font-size:16px;
            line-height:20px;
        }
        .myTLine_5kx5{
            font-weight:normal;
        }
        .myTLine_3-8t{
            margin-left:12px;
            margin-right:12px;
        }
        .myTLine_3c-4{
            position:relative;
        }
        .myTLine_2x70{
            word-wrap:break-word;
        }
        .myTLine_50f9{
            color:#1d2129;
        }
        .myTLine_50f3{ /* 친구이름*/
            font-size:12px;
            line-height:16px;
            text-align:center;
        }
        .myTLine_7rlq{
            box-sizing:border-box;
            width:100%;
            outline:none;
        }
        .myTLine_3-95{
            margin-bottom:8px;
        }
        .myTLine_4jy4{
            line-height:26px;
            padding:0 10px;
        }
        .myTLine_517h{
            background:#f5f6f7;
            border:1px solid #ccd0d5;
            border-radius:2px;
            /* color:#4b4f56; */
        }
        .myTLine_42ft{
            cursor:pointer;
            display:inline-block;
            text-decoration:none;
            white-space:nowrap;
        }
        button{
            margin:0;
        }


        /* textarea form쪽 */

        .myTLine_4xd8{ /* -------------------------------------> 소개 텍스트상자 테두리 div*/
            /* border:1px solid #ebedf0; */
            position:relative;
        }
        .myTLine_3-97{
            margin-bottom:16px;
        }
        .myTLine_3-8x{
            margin-top:8px;
        }
        form{
            margin:0;
            padding:0;
        }
        .myTLine_4xd9{
            text-align:center;
            border:none;
            box-sizing:border-box;
            display:block;
            padding:8px 8px;
            resize:none;
            width:100%;
            height:80px;
            outline:none;
        }
        textarea{
            font-size:12px;
            background-color:#fff;
            color:#1c1e21;
            max-width:100%;
            -webkit-appearance:none;
            border-radius:0;
            margin:0;
            font-family:inherit;
            overflow:hidden;
        }

        /* textarea 밑부분 div  */
        .myTLine_4xda{ /*------------------------------------> 소개수정 누르면 아래나타나게*/
            background:#f5f6f7;
            border-top:1px solid #ebedf0;
            height:60px;
            display:none;
        }
        .myTLine_2ph-{
            padding:4px;
            height:15px;
        }
        .myTLine_rfloat{
            float:right;
        }
        .myTLine_4qpq{
            font-size:11px;
        }
        .myTLine_50f8{
            color:#90949c;
        }
        .myTLine_inputsu{
            height:30px;
        }
        .myTLine_2phz{
            height:30px;
            outline:none;
        }
        .myTLine_XSave{
            padding:4px;
            height:15px;
            text-align: right;
        }
        #myTLine_saveS{
        	outline:none;
        }
        .myTLine_lfloat{
            float:left;
        }
        .myTLine_X{
            display: inline-block;
        }
        #myTLine_btnXX{
        	outline:none;
        }
        .myTLine_Save{
            display: inline-block;
        }
        .myTLine_introBtn1{
            width:40px;
            border:1px solid #ccd0d5;
            font-size:12px;
            background:#f5f6f7;
            color:#4b4f56(151, 150, 150);
            border-radius:2px;
            cursor:pointer;
            box-sizing:content-box;
        }
        .myTLine_introBtn2{
            width:40px;
            border:1px solid #9cb4d8;
            font-size:12px;
            background:#9cb4d8;
            color:white;
            border-radius:2px;
            cursor:pointer;
            box-sizing:content-box;

        }

        /* 친구 틀 */
        .myTLine_fbTimelineTwoColumn{
            clear:none;
            float:none;
            position:static; /*------------------------------친구틀에 문제있으면 여기 포지션보기*/
        }
        /* 친구 타이틀 div쪽 */
        .myTLine_2iem{
            font-size:14px;
            line-height:23px;
        }
        a.myTLine_39g5{
            color:#90949c;
        }
        /* 친구 추가되는 쪽 */
        .myTLine_e4b{
            padding:0 5px 4px 5px;
        }
        /* 친구 첫번째줄div에 첫번째칸 */
        .myTLine_3s6w{
            position:relative;
            height:auto;
            width:99.9px;
            /* border:1px solid gray; */
        }
        .myTLine_7s1x{
            height:auto;
        }
        .myTLine_51m-{
            padding-left:0px;
            padding-top:0px;
            display:inline-block; /*-----------------------> 다음줄 블럭형태 여기참고해보자*/
        }
        .myTLine_vTop{
            vertical-align:top;
        }
        .myTLine_3s6v{
            border-radius:0;
            height:99.9px;
            width:99.9px;
        }
        .myTLine_3s6x{
            background:none;
            color:inherit;
            padding:2px 5px 5px 0;
            position:relative;
            bottom:0px;
            left:0px;
            right:0px;
        }
        .myTLine_50f3{ /*------------------------------------> 친구이름 위치 이상하면 여기보기*/
            font-size:12px;
            line-height:16px;
        }
        .myTLine_50f3{
            color:#385898;
            cursor:pointer;
            text-decoration:none;
        }


        /* 오른쪽 타임라인 글상자쪽------------------------------------- */
        .myTLine_fbTimelineCapsule{
            list-style:none;
            margin:0;
            padding:0;
            position:relative;
        }
        .myTLine_fbTimelineComposerCapsule{
            float:none;
            position:static;
            margin-bottom:40px;
            
        }
        .myTLine_fbTimelineComposerUnit{
            padding:0;
            width:100%;
        }
        .myTLine_timelineUnitContainer{
            padding:0;
            width:100%;
        }
         .myTLine_3u13{
            position:relative;
/*              background:#000; */
             
        }
        .myTLine_3u15{
            background:#000;
            bottom:100%;
            left:0px;
			opacity:0;
            position:fixed;
            right:0px;
            top:0px;
			transition:opacity .3s, bottom 0s .3s;
            z-index:310;
        }
        
        /* 타임라인 글상자 눌렀을때 배경 까맣게 주기 none처리했다가 텍스트상자 클릭시  block처리하면됨 */
       .myTLine_3u15{
        	bottom:0%;
        	opacity:0.6;
        	transition:opacity .3s;
        	display:none;
        }
        
        /* 얘는 텍스트상자만 띄우게보이게끔 하는것 -> 글상자 클릭했을때 얘는 켜두기 display:block; */
        .myTLine_3u16{
        	position:relative;
        	z-index:311 !important;
        }
        
        
        i, .myTLine_Img{ /* -> .img */
            -ms-high-contrast-adjust:none;
        }
        .myTLine_5n2b{
            border: none;
            margin-bottom:0px;
        }
        .myTLine_3ubp{
            padding:8px 0;
            padding-right:24px;
            background-color:#f5f6f7;
            border-bottom:1px solid #dddfe2;
            border-radius:2px 2px 0 0;
            font-weight:bold;
        }
        .myTLine_sg2{
            padding:8px 0;
            padding-right:24px;
        }
        .myTLine_sg1{
            border-left:none;
            background-color:#f5f6f7;
            color:#365899;
            padding: 0 4px;
            position:relative;
        }
        .myTLine_sg1>a{
            cursor:pointer;
            text-decoration:none;
            color:#385898;
        }
        .myTLine_4-h7{
            display:inline;
            padding: 4px 6px 4px 4px;
        }
        .myTLine_4-fs{
            display:inline-block;
            padding-left:21px;
            position:relative;
        }
        .myTLine_5qto{
            left:0px;
            position:absolute;
            top:-2px;
            vertical-align:middle;
            line-height:16px;
        }
        .myTLine_sp_ueylrBHi1-I_1_5x{
            width:16px;
            height:16px;
            background-position:-36px -2022px;
            background-size:64px 2254px;
            background-repeat:no-repeat;
            display:inline-block;
        }
        .myTLine_sx_7cc176{
            width:16px;
            height:16px;
            background-position:-36px -2022px;
        }
        .myTLine_5qtp{
            color:#4b4f56;
            display:inline-block;
            font-size:12px;
            font-weight:600;
            line-height:14px;
        }
        .myTLine_4-h8{
            display:block;
            border-bottom:8p solid #ebedf0;
            border-left:8px solid transparent;
            border-right:8px solid transparent;
            bottom:-9px;
            font-size:0px;
            height:0px;
            left:50%;
            line-height:0;
            position:absolute;
            width:0px;
        }
        .myTLine_m{
            position:relative;
        }
        .myTLine_yt4{
            padding:5px 0 3px 0;
        }
        .myTLine_sp_fjyi8pDT92q_1_5x{
            background-position:-74px -536px;
            background-size:202px 592px;
            display:inline-block;
            height:18px;
            width:18px;
        }
        .myTLine_sx_e980d5{
            background-position:-74px -536px;
        }
        .myTLine_4zoz{
            border-top:none;
            position:relative;
        }
        .myTLine_4cw{
            min-height:73px;
        }
        .myTLine_4-u3{
            border-bottom-left-radius:3px;
            border-bottom-right-radius:3px;
        }
        .myTLine_fbTimelineUnit2{
            /* display:inline-block; */
            display:block;
            width:516px;
            color:#1c1e21;
            margin-bottom:10px;
            position:relative;
        }
        .myTLine_i-o{
            position:relative;
        }
        .myTLine_7r84{
            position:relative;
        }
        .myTLine_q-v{
            margin:12px 0 0 12px;
        }
        .myTLine_4b17{
            float:left;
            min-height:1px;
            word-wrap:break-word;
        }
        .myTLine_3hvt{
            display:block;
            position:relative;
        }
        .myTLine_4b19{
            overflow:hidden;
            word-wrap:break-word;
        }
        .myTLine_3nd0{
            overflow:hidden;
            position:relative;
        }
        .myTLine_1mwp{
            max-height:100px;
            min-height:71px;
            padding-top:13px;
            font-size:14px;
            font-weight:normal;
            line-height:18px;
            padding-right:48px;
            background-color:transparent;
            border:0;
            box-sizing:border-box;
            height:100%;
            outline:0;
            padding:13px 12px;
            resize:none;/**/
            word-wrap:break-word;
        }
        .myTLine_3t-3{
            padding-top:13px;
            font-size:14px;
            font-weight:normal;
            letter-spacing:normal;
            line-height:18px;
            
        }
        .myTLine_5yk1{
            background:#fff;
            cursor:text;
        }
        .myTLine_5rp7{
            position:relative;
            height:inherit;
            text-align:initial;
        }
        .myTLine_1p1t{
            color:#90949c;
            position:absolute;
            z-index:1;
        }
        .myTLine_5rpb{
            background-color:rgba(255,255,255,0);
            border-left:1px solid transparent;
            position:relative;
            z-index:1;
            height:inherit;
            text-align:initial;
        }
        .myTLine_16ve{
            overflow:hidden;
            border-top:1px solid #e9ebee;
            margin:0 12px;
            padding:8px 0;
        }
        .myTLine_7i31{
            overflow:hidden;
        }
        ul{
            list-style-type:none;
            margin:0;
            padding:0;
        }
        .myTLine_5xmp{
            margin-right:6px;
            display:inline-block;
        }
        .myTLine_m_1{
            max-width:calc(138px);
            background:#f5f6f7;
            border-radius:18px;
            cursor:pointer;
            position:relative;
        }
        .myTLine_4a0a{
            height:20px;
            left:9px;
            position:absolute;
            top:6px;
            width:20px;
        }
        .myTLine_sx_bf57ca{
            background-position:-22px -1338px;
        }
        .myTLine_2aha{
            height:32px;
            line-height:32px;
            box-sizing:border-box;
            color:#4b4f56;
            display:inline-block;
            font-weight:600;
            overflow:hidden;
            padding:0 15px 0 35px;
            text-overflow:ellipsis;
            vertical-align:middle;
            white-space:nowrap;
            width:100%;
            font-size:12px;
            font-family:inherit;
        }
        /* 글상자바로밑부분(처음에 none처리해줄부분) ----------------------------*/
        .myTLine_2dck{
        	border-radius:0 0 3px 3px;
        	border-top:1px solid #dddfe2;
        	display:none;
        }
        
        .myTLine_1pek{
        	background-color:#f5f6f7;
        }
        .myTLine_uiContextualLayerParent{
        	position:relative;
        }
        .myTLine_26bz{
        	background-color:transparent;
        	padding: 5px 3px 5px 5px;
        	list-style-type:none;
        	margin:0;
        	max-height:300px;
        	overflow-y:auto;
        }
        .myTLine_6_1t{
        	align-items:center;
        	border-radius:4px;
        	display:flex;
        	justify-content:space-between;
        	padding-right:4px;
        }
        .myTLine_5dd8{
        	display:inline-block;
        }
        .myTLine_3-wg{
        	margin-right:10px;
        	padding-top:0px;
        	margin-left:390px; /* ----------- 공개 버튼 크기 다시 조정*/
        }
        .myTLine_4jy0{
        	border:1px solid;
        	border-radius:2px;
        	box-sizing:content-box;
        	font-size:12px;
        	font-weight:bold;
        	justify-content:center;
        	padding:0 8px;
        	position:relative;
        	text-align:center;
        	text-shadow:none;
        	vertical-align:middle;
        }
        .myTLine_5vto:hover{
        	background-color:#4267b2;
        	border-color:#4267b2;
        	box-shadow:none;
        	color:#fff;
        }
        .myTLine_2agf{
        	word-wrap:normal;
        	display:inline-flex;
        }
        .myTLine_4o_4{
        	display:inline-flex;
        }
        .myTLine_4jy3{
        	line-height:23px;
        }
        .myTLine_3-8_{
        	margin-right:4px;
        	margin-top:3px;
        }
        .myTLine_sx_4d4154{
        	width:16px;
        	height:16px;
        	background-position:-44px -1554px;
        }
        .myTLine_55pe{
        	flex:0 1 auto;
        	display:inline-block;
        	overflow:hidden;
        	text-overflow:ellipsis;
        	vertical-align:top;
        	white-space:nowrap;
        }
        .myTLine_45wg{
        	padding: 0 12px 10px;
        }
        .myTLine_1mf7{
        	font-size:12px;
        	line-height:22px;
        	padding: 0 16px;
        }
        .myTLine_4r1q{
        	box-sizing:border-box;
        	height:28px;
        	width:100%;
        }
        .myTLine_4jy1{
        	background-color:#9cb4d8;
        	border-color:#9cb4d8;
        	color:#fff;
        }
        .myTLine_42fr{
        	background-color:#9cb4d8;
        	border-color:#9cb4d8;
        	cursor:default;
        	outline:none;
        }
        .myTLine_1p1v{ /* textarea*/
        	width:433px;
        	outline:none;
        	vertical-align:middle;
        	font-size:16px;
        	resize:none;
        	border:0;
        }
        .myTLine_kkp{
        	overflow-x:auto;
        	width:!00%;
        	height:100%;
        }
        .myTLine_kkq{
        	/* height:112px; */
        	height:100%;
        	white-space:nowrap;
        }
        .myTLine_fbScrollableArea{
        	overflow:hidden;
        	position:relative;
        }
        .myTLine_fbScrollableAreaWrap{
        	width:100%;
        	overflow-y:hidden;
        	overflow-x:auto;
        	position:relative;
        	height:150%;
        }
        .myTLine_fbScrollableAreaBody{
        	position:relative;
        	display:inline-block;
        }
        .myTLine_fbScrollableAreaContent{
        	white-space:nowrap;
        }
        .myTLine_2pko{
        	margin-left:7px;
        	display:inline-block;
        	vertical-align:top;
        }
        /* 사진첨부할때 생기는 div 처음에 none처리 해주기 사진/동영상 눌렀을때 바꿔주기 */
        .myTLine_jfc{
        	display:inline-block;
        	margin-left:5px;
        	position:relative;
        	border:1px dashed gray;
        	display:none;
        }
        .myTLine_fbScrollableAreaTrack{
        	display:inline-block;
        	position:absolute;
        	left:2px;
        	right:2px;
        	bottom:2px;
        	height:7px;
        	z-index:5;
        }
        .test222{
        	cursor:pointer;
        }
    </style>
</head>
<body>

    <!-- 왼쪽 사이드 바 div -->
    <div class="myTLine_4b17 myTLine_3-91" style="width:323px">
        <div id="myTLine_u_0_1i">
            <div class="myTLine_5ss7">
                <div class="myTLine_5ss8" style="left:auto; top:0px; width:323px; bottom:auto; z-index:0;">
                    <span>
                        <div class="myTLine_3-96">
                            <div id="myTLine_timeline_small_column">
                                <div id="myTLine_profile_timeline_qp"></div>
                                <div id="myTLine_profile_timeline_info_review"></div>
                                <div id="myTLine_profile_timeline_intro_card">
                                    <li class="myTLineTwoColumn myTLine_fbTimelineUnit myTLine_clearfix">
                                        <!-- 소개 사이드 메뉴 div -->
                                        <div class="myTLine_4-u2 myTLine_4-u8" id="myTLine_u_0_2j">
                                            <!-- 소개부분 영역 div -->
                                            <div class="myTLine_3qn7 myTLine_61-3 myTLine_2fyi myTLine_3qng myTLine_3-8t myTLine_2pi4 myTLine_46yc">
                                                <div class="myTLine_8kaf">
                                                    <img class="myTLine_Img myTLine_sp_iiGu_6r3G5H_1_5x myTLine_sx_dd5f6e" 
                                                    src="resources/image/sira/earth-fill.png">
                                                </div>
                                                <!-- 소개 텍스트 div-->
                                                <div class="myTLine_3qn7 myTLine_61-0 myTLine_2fyi myTLine_3qnf myTLine_19c4 myTLine_3-9a">
                                                    <span class="myTLine_2ie1 myTLine_5kx5">소개</span>
                                                </div>
                                            </div>
                                            <!-- 소개 밑부분 전체-->
                                            <div id="myTLine_intro_container_id">
                                                <!-- 소개쓰는부분부터 소개수정버튼까지 div( div 잡을때 양옆마진같이줬음) -->
                                                <div class="myTLine_3-8t">
                                                <!-- 소개쓰는부분부터 소개수정버튼까지의 contents 영역 -->
                                                    <div class="myTLine_3c-4 myTLine_2x70" id="myTLine_profile_intro_card_bio">
                                                        <div class="myTLine_50f9 myTLine_50f3">

                                                            <!-- textarea 쪽 -->

                                                                <!-- <- 사용자가 입력할 소개내용으로/ placeholder도 내용,공백이 없을때 나타나게해주기  -->
                                                                <%if(member2.getIntroduceText() != null) {%>
                                                                <textarea id="myTLine_introduce_Id" name="myTLine_introduce_name" class="myTLine_4xd9"
                                                                placeholder="회원님에 대해 소개해주세요" row="4" readonly><%= member2.getIntroduceText() %></textarea>
																<%}else{ %>
																	<textarea id="myTLine_introduce_Id" name="myTLine_introduce_name" class="myTLine_4xd9"
                                                                	placeholder="회원님에 대해 소개해주세요" row="4" readonly></textarea>
																<%} %>
                                                                <!-- 입력한 글자수, 취소,저장 div -->
                                                                <div id="myTLine_xsavediv" class="myTLine_4xda">
                                                                    <!-- 입력한 글자수 div -->
                                                                    <div class="myTLine_inputsu">
                                                                        <!-- 입력한 글자수 contents -->
                                                                        <div class="myTLine_2ph- myTLine_clearfix">
                                                                            <!-- 입력한 글자수 표시 -->
                                                                            <div class="myTLine_ohf myTLine_rfloat">
                                                                                <div class="myTLine_4qpq myTLine_50f8">
                                                                                    90
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <!-- 취소,저장 div -->
                                                                    <div class="myTLine_2phz myTLine_clearfix">
                                                                        <div class="myTLine_XSave">
                                                                            <div class="myTLine_ohe myTLine_lfloat"></div>
                                                                            <!-- 취소 -->
                                                                            <div class="myTLine_X">
                                                                            <button id="myTLine_btnXX" class="myTLine_introBtn1" type="button">취소</button>
                                                                            </div>
                                                                            <!-- 저장 -->
                                                                            <div class="myTLine_Save">
                                                                            <button id="myTLine_saveS" type="button" class="myTLine_introBtn2">저장</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            <!-- 버튼쪽 -->
                                                            <% if(loginUser != null && member2.getmNo() == loginUser.getmNo()){ %>
                                                            <button id="myTLine_sosu" class="myTLine_7rlq myTLine_3-95 myTLine_4jy4 myTLine_517h myTLine_51sy myTLine_42ft"
                                                            type="submit" value="myTLine_introduce1">
                                                               	 소개수정
                                                            </button>
															<% } %>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                            </div>
                            <!-- 친구 div -->
                            <div>
                                <div class="myTLine_5h60" id="myTLine_profile_timeline_titles_unit_pagelets_friends">
                                    <li class="myTLine_fbTimelineTwoColumn myTLine_fbTimelineUnit myTLine_clearfix">
                                        <div class="myTLine_4-u2 myTLine_4-u8">
                                            <div role="article">
                                                <div class="myTLine_65tv" id="myTLine_u_jsonp_2_0">

                                                        <!-- 친구부분타이틀 영역 div -->
                                                    <div class="myTLine_3qn7 myTLine_61-3 myTLine_2fyi myTLine_3qng myTLine_3-8t myTLine_2pi4">
                                                        <div class="myTLine_8kaf">
                                                            <img class="myTLine_Img myTLine_sp_iiGu_6r3G5H_1_5x myTLine_sx_dd5f6e" 
                                                            src="resources/image/sira/fdlogo.png">
                                                        </div>
                                                        <!-- 친구 텍스트 div-->
                                                        <div class="myTLine_3qn7 myTLine_61-0 myTLine_2fyi myTLine_3qnf myTLine_19c4 myTLine_3-9a">
                                                            <a href="#"> <!--친구 주소링크 넣기-->
                                                                <span class="myTLine_2ie1 myTLine_5kx5">친구</span>                                                                                                    
                                                            </a>
                                                            <span role="presentation" aria-hidden="true">&nbsp;·&nbsp;</span>   
                                                            <span class="myTLine_50f8 myTLine_2iem">
                                                                <a class="myTLine_39g5"><%=list2.size() %></a>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- 친구 추가되는 곳 영역(패딩줌) -->
                                                    <div class="myTLine_e4b" id="myTLine_u_jsonp_2_2">
                                                        <!-- 친구틀 안의 전체div -->
                                                        <div class="myTLine_uiGrid myTLine_51mz">

                                                                <!-- ★ 여기서부터 친구 보이는곳 for문 돌릴거임 -->
                                                                <!-- 친구 1번(패딩) -->
                                                                <% if(list2.isEmpty()) { %>
                                                                
                                                                <h4> 아직 친구가 없습니다.</h4>
                                                                <% }else { %>
                                                                	<% for(Member m : list2) { %>
	                                                                <div class="myTLine_51m- myTLine_vTop">
	                                                                    <!-- 친구 1번 contents -->
	                                                                    <div class="myTLine_3s6w myTLine_7s1x">
	                                                                        <!-- <a href=""> --> <!--이거 클릭하면 해당 친구 타임라인 가지게 링크걸기-->
	                                                                            <!-- 이미지, 이름 두개합한 div -->
	                                                                            <div>
	                                                                                <!-- 이미지 -->
	                                                                                <input type="hidden" id="mNoF" value="<%= m.getmNo() %>">
	                                                                                <img class="myTLine_s0 myTLine_4ooo myTLine_1x2_ myTLine_1ve7 myTLine_3s6v myTLine_rv myTLine_Img test222"
	                                                                                	src="<%=m.getProfileImage()%>">
	                                                                                <!-- 친구이름 div -->
	                                                                                <div class="myTLine_3s6x">
	                                                                                    <div class="myTLine_50f3"><%= m.getmName() %></div>
	                                                                                </div>
	                                                                            </div>
	                                                                        <!-- </a> -->
	                                                                    </div>
	                                                                </div>
                                                                	<% } %>
																<% } %>
																<script>
																	$(function(){
																		$(".test222").click(function(){
																			location.href="<%=contextPath%>/timeLines.bo?mNo=" + $(this).prev().val();
																		});
																	});
																</script>

                                                                <!--이런식으로 for문 돌릴거임
                                                                ->친구 2번(패딩)
                                                                <div class="myTLine_51m- myTLine_vTop">
                                                                    -> 친구 2번 contents
                                                                    <div class="myTLine_3s6w myTLine_7s1x">
                                                                        <a href=""> ->이거 클릭하면 해당 친구 타임라인 가지게 링크걸기
                                                                            ->이미지, 이름 두개합한 div
                                                                            <div>
                                                                                ->이미지
                                                                                <img class="myTLine_s0 myTLine_4ooo myTLine_1x2_ myTLine_1ve7 myTLine_3s6v myTLine_rv myTLine_Img">
                                                                                ->친구이름 div
                                                                                <div class="myTLine_3s6x">
                                                                                    <div class="myTLine_50f3">친구이름2</div>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </div>
                                                                </div> -->
                                                            
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                            </div>

                        </div>
                    </span>
                </div>
            </div>
            </div>
			
            <!-- 오른쪽 타임라인 div -->
<%--            <form id="myTLine_File33" action="<%= contextPath %>/file33.me" method="post" enctype="multipart/form-data"> --%>
            <div class="myTLine_4b17 myTLine_3-96 myTLine_fix" style="width:516">
                <div id="myTLine_timeline_story_column">
                    <!-- 글상자 -->
                    <div id="myTLine_pagelet_timeline_composer">
                        <!-- 글상자div -->
                        <ol class="myTLine_clearfix myTLine_fbTimelineCapsule">
                            <!-- 글상자 밑 마진 -->
                            <li class="myTLine_fbTimelineUnit2 myTLine_fbTimelineComposerCapsule myTLine_clearfix myTLine_fbTimelineTwoColumn" id="myTLine_u_0_1s">
                                <div class="myTLine_4-u2 myTLine_4-u8">
                                    <div class="myTLine_fbTimelineComposerUnit myTLine_timelineUnitContainer">
                                        <div>
                                            <div>
                                                <div class="myTLine_3u13 myTLine_3e9r" id="myTLine_js_1a" role="region" aria-label="게시물 작성">
                                                    <div id="myTLine_3u15" class="myTLine_3u15" role="presentation"></div>
                                                    <div class="myTLine_3u16">
                                                        <div>
                                                            <div id="myTLine_u_0_1v">
                                                                <div class="myTLine_1cx1 myTLine_4a8c myTLine_4aay myTLine_4ab3">
                                                                    <div class="myTLine_5n2b myTLine_36bx myTLine_4-u2 myTLine_4-u8" id="myTLine_rc.u_0_1t">
                                                                        <!-- 글상자 위 메뉴 -->
                                                                        <div class="myTLine_3ubp myTLine_sg2">
                                                                                <!-- 게시물 작성 -->
                                                                                <span class="myTLine_sg1">
                                                                                    <a class="myTLine_4-h7 myTLine_5qtn myTLine_fbReactComposerAttachmentSelector_STATUS">
                                                                                        <span class="myTLine_4-fs">
                                                                                            <img class="myTLine_5qto myTLine_Img myTLine_sp_ueylrBHi1-I_1_5x myTLine_sx_7cc176" src="resources/image/sira/pencil-fill.png">
                                                                                        <span class="myTLine_5qtp">게시물 만들기</span>
                                                                                        <span class="myTLine_4-h8"></span>
                                                                                        </span>
                                                                                    </a>
                                                                                </span>
                                                                                <!-- 사진/동영상클릭했을때 script에 쓸거임 id="myTLine_photo_dong" -->
                                                                                <span class="myTLine_sg1" id="myTLine_photo_dong">
                                                                                    <a class="myTLine_4-h7 myTLine_fbReactComposerAttachmentSelector_MEDIA">
                                                                                        <span class="myTLine_4-fs">
                                                                                            <img class="myTLine_5qto myTLine_Img myTLine_sp_fjyi8pDT92q_1_5x myTLine_sx_e980d5" src="resources/image/sira/camera_image_text.png">
                                                                                            <span class="myTLine_5qtp">사진/동영상</span>
                                                                                            <span class="myTLine_4-h8"></span>
                                                                                        </span>
                                                                                    </a>
                                                                                </span>
                                                                                <!-- input file1,2,3,4 (script)-->
                                                                                <div style="height:1px; width:1px;" id="myTLine_divHide3">
                                                                                	<input type="file" id="myTLine_PhotoClick" name="myTLine_PhotoClick" onchange="imgUp3(this, 1);" style="height:1px; width:1px;">
                                                                                </div>
                                                                                
                                                                        </div>
                                                                        <!-- 글상자 -->
                                                                        <div class="myTLine_4zoz myTLine_5xv3 myTLine_4cw myTLine_4-u3">
                                                                            <!-- 글상자+사진/동영상div -->
                                                                            <div id="myTLine_js_fai">
                                                                            
                                                                                <!-- 글상자div -->
                                                                                <div class="myTLine_i-o myTLine_2j7c">
                                                                                    <div class="myTLine_3eny">
                                                                                        <div class="myTLine_7r84">
                                                                                            <div class="myTLine_clearfix myTLine_ikh">
                                                                                                <!-- 글상자안의 프로필사진(마진) -->
                                                                                                <div class="myTLine_q-v myTLine_4b17">
                                                                                                    <!-- 글상자안의 프로필사진 -->
                                                                                                    <div class="myTLine_3hvt">
                                                                                                        <!-- <img width="40" height="40" class="myTLine_btn myTLine_Img"
                                                                                                        src=""> -->
                                                                                                        <img width="40" height="40" class="myTLine_btn myTLine_Img" src="
																				                        <%if (member2.getProfileImage() != null) { %>
																				                        <%=member2.getProfileImage() %>
																				                        <% } else { %>
																				                        	<% if (member2.getGender() == "M") { %>
																				                        		<%=contextPath%>/resources/image/jong/noImageM.jpg
																				                        	<% } else { %>
																				                        		<%=contextPath%>/resources/image/jong/noImageF.jpg
																				                        	<% } %>
																				                        <% } %>
																				                       ">
                                                                                                    </div>
                                                                                                </div>
                                                                                                
                                                                                                <!-- 여기서부터하기 글상자안의 text입력상자 -->
                                                                                                
                                                                                                <div class="myTLine_4b19">
                                                                                                     <div class="myTLine_3nd0" style="min-height:50px; max-height:200px;"> <!-- --------표시 -->
                                                                                                     	<!-- 클릭시 글상자 모달창 display 이벤트 발생시킬것 -->
                                                                                                         <div id="myTLine_textClick" class="myTLine_1mwp myTLine_navigationFocus myTLine_395 myTLine_1mwq myTLine_4c_p myTLine_5bu_ myTLine_3t-3
                                                                                                         myTLine_34nd myTLine_21mu myTLine_5yk1">
                                                                                                         <!-- 무슨 생각을 하고 계신가요? 텍스트부분 -->
                                                                                                         <div class="myTLine_5yk2">
                                                                                                             <div class="myTLine_5rp7">
                                                                                                                 <div class="myTLine_1p1t">
                                                                                                                 
                                                                                                                   <%  if(loginUser != null && member2.getmNo() == loginUser.getmNo()){%>
                                                                                                                 	<textarea class="myTLine_1p1v" id="myTLine_tttext" placeholder="무슨 생각을 하고 계신가요?"></textarea>
                                                                                                                 	<%}else{ %>
                                                                                                                 	<textarea class="myTLine_1p1v" id="myTLine_tttext" placeholder="<%=member2.getmName()%>님에게 글을 남겨보세요..."></textarea>
                                                                                                                 	<%} %>
                                                                                                                 	
                                                                                                                 </div>
                                                                                                                 <div class="myTLine_5rpb"></div>
                                                                                                             </div>
                                                                                                         </div>
                                                                                                         </div>
                                                                                                     </div>
                                                                                               </div>
                                                                                                
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    
                                                                                    <!-- 사진첨부선택 미리보기 -->
                                                                                    <!-- 가로영역 -->
                                                                                    <div class="myTLine_kkp">
                                                                                    	<!-- 세로영역 -->
                                                                                    	<div class="myTLine_kkq">
                                                                                    		<div class="myTLine_fade">
                                                                                    			<div class="myTLine_fbScrollableArea" style="height:100%; width:100%;">
                                                                                    				<div class="myTLine_fbScrollableAreaWrap">
                                                                                    				<!-- 추가되는 칸 마진패딩없는 가로전체 영역 div -->
	                                                                                    				<div class="myTLine_fbScrollableAreaBody" style="height:100%;">
	                                                                                    					<div class="myTLine_fbScrollableAreaContent">
	                                                                                    						<!-- 위쪽틀이랑 맞추려고 왼쪽마진있는 사진영역 1칸 -->
	                                                                                    						<div class="myTLine_2pko">
	                                                                                    							<!--  -->
	                                                                                    							<div>
	                                                                                    								<!-- 첨부파일 진짜 왼쪽 마진 영역 -->
	                                                                                    								<div class="myTLine_jfc" id="myTLine_marginf" style="width:100px; height: 100px;">
	                                                                                    									<!-- 이미지 추가 경로-->
	                                                                                    									<img width="100" height="100" id="myTLine_Imgg1" name="myTLine_Imgg1" class="myTLineImg">
	                                                                                    								</div>
	                                                                                    								
	                                                                                    								<!-- for문 -->
	                                                                                    								<!-- <div class="myTLine_jfc" id="myTLine_marginf" style="width:100px; height: 100px; border:1px dashed gray">
	                                                                                    									이미지 추가 경로
	                                                                                    									<img width="100" height="100" class="myTLineImg" src="">
	                                                                                    								</div>
	                                                                                    								<div class="myTLine_jfc" id="myTLine_marginf" style="width:100px; height: 100px; border:1px dashed gray">
	                                                                                    									이미지 추가 경로
	                                                                                    									<img width="100" height="100" class="myTLineImg" src="">
	                                                                                    								</div>
	                                                                                    								<div class="myTLine_jfc" id="myTLine_marginf" style="width:100px; height: 100px; border:1px dashed gray">
	                                                                                    									이미지 추가 경로
	                                                                                    									<img width="100" height="100" class="myTLineImg" src="">
	                                                                                    								</div> -->
	                                                                                    								
	                                                                                    								
	                                                                                    							</div>
	                                                                                    						</div>
	                                                                                    					</div>
	                                                                                    				</div>
                                                                                    				</div>
                                                                                    				
                                                                                    			</div>
                                                                                    		</div>
                                                                                    	</div>
                                                                                    </div>
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                </div>
                                                                                 <!-- 사진/동영상div -->
                                                                                <div class="myTLine_1j2v">
                                                                                    <!-- 여기서부터 시작 사진/동영상div(마진) -->
                                                                                    <div class="myTLine_16ve myTLine_7i31">
                                                                                        <!-- 사진/동영상contents -->
                                                                                        <ul class="myTLine_16vg myTLine_1oxv">
                                                                                            <!-- 옆 마진 -->
																							<li class="myTLine_5xmp myTLine_fbReactComposerAttachmentSelector_MEDIA">
                                                                                                <!-- 아이콘, 사진/동영상 div -->
                                                                                                <div class="myTLine_m_1 myTLine_1pnt" id="myTLine_PhotoClick2">
                                                                                                    <!-- 아이콘 -->
                                                                                                    <img class="myTLine_4a0a myTLine_Img myTLine_sp_ueylrBHi1-I_1_5x myTLine_sx_bf57ca" src="resources/image/sira/textPhoto.png">
                                                                                                    <!-- 사진/동영상 -->
                                                                                                    <div class="myTLine_2aha">사진/동영상</div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                    
                                                                                    <!-- 글상자바로 밑부분(처음에 none처리 해줄거임) -->
                                                                                    <!-- 공개+게시 div -->
                                                                                    <div id="myTLine_2dck" class="myTLine_2dck myTLine_1pek myTLine_4-u3">
                                                                                    	<!-- 공개 -->
                                                                                    	<div class="myTLine_uiContextualLayerParent">
                                                                                    		<div class="myTLine_26c-">
                                                                                    			<!-- 마진 -->
                                                                                    			<ol class="myTLine_26bz">
                                                                                    				<!-- contents -->
                                                                                    				<li class="myTLine_1pek myTLine_6_1t">
                                                                                    					<!-- 공개범위 옆 마진-->
                                                                                    					<div class="myTLine_5dd8 myTLine_3-wg">
                                                                                    						<div>
                                                                                    							<a class="myTLine_42ft myTLine_4jy0 myTLine_55pi myTLine_5vto myTLine_2agf myTLine_4o_4 myTLine_4jy3 myTLine_nl myTLine_517h">
                                                                                    								<!-- 공개범위 아이콘 -->
                                                                                    								<span class="myTLine_3-8_">
                                                                                    									<img class="myTLine_21or myTLine_Img myTLine_sp_ueylrBHi1-I_1_5x myTLine_sx_4d4154" src="resources/image/sira/earth-p.png">
                                                                                    								</span>
                                                                                    								<!-- 공개범위 텍스트 -->
                                                                                    								<span class="myTLine_55pe">전체 공개 ▼</span>
                                                                                    								
                                                                                    							</a>
                                                                                    						</div>
                                                                                    					</div>
                                                                                    				</li>
                                                                                    			</ol>
                                                                                    		</div>
                                                                                    	</div>
                                                                                    	
                                                                                    	<!-- 게시 버튼쪽-->
                                                                                    	<div class="myTLine_45wg">
                                                                                    		<button id="myTLinesub" class="myTLine_1mf7 myTLine_4r1q myTLine_4jy0 
                                                                                    		myTLine_4jy3 myTLine_4jy1 myTLine_42ft myTLine_42fr" type="submit" value="">
                                                                                    			<!-- 게시 텍스트 -->
                                                                                    			<span>게시</span>
                                                                                    		</button>
                                                                                    	</div>
                                                                                    	
                                                                                    </div>
                                                                                    
                                                                                </div>                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
		<!-- </form> -->

            <script>
          			
            		// 포토/동영상 눌렀을때 첨부파일창 열리게
            		$(function(){
            			$("#myTLine_divHide3").hide();
            			$("#myTLine_photo_dong").click(function(){
            				$("#myTLine_PhotoClick").click();
            				$("#myTLine_marginf").attr("style","display:inline-block");// 이미지 첨부할때 display:none해놨던거 틀 보이게하기
            				$("#myTLine_3u15").attr("style","display:block"); // 타임라인 글상자 눌렀을때 배경 불투명도로까맣게 씌우기
                       		$("#myTLine_2dck").attr("style","display:block"); // 글상자바로밑부분에있는 공개범위,게시쪽div
            			});
            		});
            		
            		$(function(){
            			$("#myTLine_PhotoClick2").click(function(){
            				$("#myTLine_divHide3").hide();
            				$("#myTLine_PhotoClick").click();
            				$("#myTLine_marginf").attr("style","display:inline-block");// 이미지 첨부할때 display:none해놨던거 틀 보이게하기
            				$("#myTLine_3u15").attr("style","display:block"); // 타임라인 글상자 눌렀을때 배경 불투명도로까맣게 씌우기
                       		$("#myTLine_2dck").attr("style","display:block"); // 글상자바로밑부분에있는 공개범위,게시쪽div
            			});
            		});
            		
            		/* 
            		  내타임라인 게시판 파일추가 ajax
            		  
                    	function imgUp3(){
                    	var form = $('#myTLine_File33')[0];
                		var formData = new FormData(form);
                		
                		$.ajax({
                			url:"file33.bo",
                			type:"POST",
                			enctype: "multipart/form-data",
                			data:formData,
                			contentType : false,
                			processData : false,
                			success:function(status){
                				
                				
                					console.log("사진 업데이트 성공");
                					$("#myTLine_Imgg1").attr("src",status); 
                				
                				
                			},error:function(){
                				console.log("서버와 통신 실패!");
                			}
                			
                		});
                		
                    } */
            		
            		
            		
            		function imgUp3(value, num){
                    	
                    	if(value.files && value.files[0]){
                    		
                    		
                    		var reader = new FileReader();
                    		
                    		reader.onload = function(e){
                    			
                    			switch(num){
                    			case 1: $("#myTLine_Imgg1").attr("src", e.target.result); break;
                    			}
                    			
                    		}
                    	
                    		reader.readAsDataURL(value.files[0]);
                    		
                    	}
                    	
                    	
                    }
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            
            
                   	$("#myTLine_sosu").click(function(){
                       $(".myTLine_4xda").attr("style","display:block"); // textarea부분 block
                       $("#myTLine_introduce_Id").removeAttr("readonly"); // readonly속성 제거
                       $(".myTLine_4xd9").attr("style","border:1px solid lightgray");
                       $("#myTLine_sosu").attr("style","display:none");
                   	});
                   	
                   	
                   	
                   	
                   // 소개 저장버튼 클릭시 이벤트 발생
                   $("#myTLine_saveS").click(function(){
                	   $(".myTLine_4xda").attr("style","display:none");
                  		$("#myTLine_introduce_Id").attr("readonly","readonly");
                  		$(".myTLine_4xd9").attr("style","border:0");
                  		$("#myTLine_sosu").attr("style","display:block");
                   		
                   		/* 소개부분 텍스트 저장하기 */
                       	var tContent = $("#myTLine_introduce_Id").val(); // textarea 입력값
                       	var loginUNum = <%= member2.getmNo()%> // 로그인한유저 회원번호
                       	
                       	$.ajax({
                       		url:"textUpdate.bo",
                       		type:"post",
                       		data:{tContent:tContent, loginUNum:loginUNum},
                       		success:function(result){
                       			if(result == "success"){
                       				console.log(result);
                       				console.log("수정성공");
                       				$(".myTLine_4xd9").val(tContent);
                       			}
                       			console.log("서버통신 성공")
                       		},error:function(){
                       			console.log("myTLine_saveS 통신 실패")
                       		}
                       	});
                   		
                   	});
                   
                   
                   
                   
                   // 소개 취소버튼 클릭시 이벤트 발생
                   	$("#myTLine_btnXX").click(function(){
                   		$(".myTLine_4xda").attr("style","display:none");
                   		$("#myTLine_introduce_Id").attr("readonly","readonly");
                   		$(".myTLine_4xd9").attr("style","border:0");
                   		$("#myTLine_sosu").attr("style","display:block");
                   	});
                   	
                   
                   // 타임라인 오른쪽 텍스트상자 클릭시 이벤트 발생
                   	$("#myTLine_textClick").click(function(){
                   		$("#myTLine_3u15").attr("style","display:block"); // 타임라인 글상자 눌렀을때 배경 불투명도로까맣게 씌우기
                   		$("#myTLine_2dck").attr("style","display:block"); // 글상자바로밑부분에있는 공개범위,게시쪽div
                   	});
                
                   
                   	$("#myTLine_tttext").keyup(function(){ // 글상자에 키보드를 눌렀다 뗐을때 이벤트
                   		
                   		if($("#myTLine_tttext").val().trim().length == 0){   
                      		$("#myTLinesub").attr("style","disabled");
                      		return false;
                   		}else{
                   			$("#myTLinesub").removeAttr("disabled");
                   			$("#myTLinesub").attr("style","background:rgb(66,103,178)");
                   		}
                   	});
                	
                   	
                   	// 사진/동영상 클릭했을때 나타내기
                   	("#myTLine_photo_dong").click(function(){
                   		$(".myTLine_jfc")
                   	});
                   	
                   	
                   	
                   	
                   	
                   	// 게시 버튼 눌렀을때 이벤트
                   	$(document).ready(function(){
	                   	$("#myTLinesub").click(function(){
	                   		if($("#myTLine_tttext").val().trim().length == 0){
	                      		return false;
	                   		}else{
	                   			$("#myTLine_3u15").attr("style","display:none");
	                       		$("#myTLine_2dck").attr("style","display:none");
	                       		$("#myTLine_tttext").val("");
	                       		$("#myTLinesub").attr("style","background:#9cb4d8");
	                       		
	                   		}
	                   	});
                   	});  
                     
                   	
                   	
                   	
                   	
                   	
                   	
                </script>
                
                
</body>
</html>