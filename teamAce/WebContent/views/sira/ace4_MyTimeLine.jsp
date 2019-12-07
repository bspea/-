<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>

<%
	ArrayList<Member> list = (ArrayList<Member>)request.getSession().getAttribute("friendsList");
	Member member = (Member)request.getSession().getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
        <meta charset="UTF-8">
        <title>내 타임라인</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        body{
            margin:0;
        }
        
        #myTLine_AllOuter{ /* 타임라인 전체 Div */
            min-height:910px; /* 최소크기 지정(이 크기보다 작아질 수 없음) */
            font-family:inherit;
            padding-right:205px;
            width:981px;
            /* display:inline; */
            clear:both;
            margin:0 auto;
            position:relative;
            zoom:1;
    
            /* border:1px dashed gray; */
        }
        .myTLine_Contents_Div{ /* 컨텐츠 div -> .fb_content */
            min-height:640px;
        }
        #myTLine_Contents_Div{ /* 컨텐츠 div -> #content */
            margin:0;
            outline:none;
            padding:0;
            width:auto;
        }
        .myTLine_Contents_Clearfix{ /* -> .clearfix */
            zoom:1;
        }
        .myTLine_Contents_Clearfix::after{ /* -> .clearfix::after */
            clear:both;
            content:".";
            display:block;
            font-size:0px;
            height:0px;
            line-height:0;
            visibility:hidden;
        }
        .myTLine_hidden_elem{ /* -> .hidden_elem*/
            display:none  !important;  
        }
        #myTLine_MainContainer{ /* -> #mainContainer */
            margin-left:-1px;
            display:block;
            width:100%;
        }
        #myTLine_leftCol{ /* -> #leftcol */
            display:none;
            float:left;
            min-height:50px;
            padding:20px 0 0 2px;
            position:relative;
            width:179px;
            word-wrap:break-word;
        }
        #myTLine_ContentCol{ /* -> #contentCol */
            background:none;
            padding-top:0px;
        }
        #myTLine_ContentArea{ /* -> #contentArea */
            position:relative;
            width:851px !important;
            margin-right:-1px;
            outline:none;
            padding-left:1px;
            word-wrap:break-word;
        }
        .myTLine_5h60{ /* -> ._5h60 */
    
        }
        #myTLine_TimeLine_Top_section{ /* -> #timeline_top_section */
         /* 타임라인 위에 section div */
    
        }
        .myTLine_6-d{ /* -> ._6-d */
            position:relative;
        }
        #myTLine_PageLet_Above_Header_TimeLine{ /* -> #pagelet_above_header_timeline */
            margin-left:0px;
            margin-right:0px;
            position:relative;
            z-index:1;
            margin:-1px -1px 0;
        }
        #myTLine_Above_Hrader_TimeLine_PlaceHolder{ /* -> above_header_timeline_placeholder */
            display:none;
        }
        .myTLine_fbTimeLineSection{ /* -> .fbTimelineSection */
            border:1px solid #d3d6db;
            border-radius:0 0 3px 3px;
            background:#fff;
        }
        .myTLine_fbTimeLineTopSection{ /* -> .fbTimelineTopSection */
            margin:0;
            padding:0;
        }
        #myTLine_fbProFileCover{ /* -> #fbProfileCover */
            margin:-1px -1px 0;
        }
        .myTLine_Cover{ /* -> .cover */
        /* 메뉴바 제외한 상단 커버 */
            display:block;
            position:relative;
        }
        .myTLine_CoverWrap{ /* -> .coverWrap */
            display:block;
            position:relative;
            height:315px;
            overflow:hidden;
            text-decoration:none;
        }
        .myTLine_6_7>li a{
            color:#385898;
            cursor:pointer;
            text-decoration:none;
        }
        a{
            cursor:pointer;
            text-decoration:none;
            color: #1c1e21;
        }
        /*.myTLine_fbProFileCover, .myTLine_CoverWrap,*/ .myTLine_Photo{ /* -> .fbProFileCover, .coverWrap, .photo */
            image-rendering:optimizeQuality;
            min-height:100%;
            min-width:100%;
            position:absolute;
            left:0px;
        }
        .myTLine_Photo{
            top:-242px;
            width:100%;
        }
        img{
            border: 0;
        }
        .myTLine_InstructionWrap{ /* -> .instructionWrap */
            display:none;
        }
        .myTLine_CoverBorder{ /* -> .coverBorder */
        /* 커버이미지 선택안했을때 기본 배경 */
            /* background:linear-gradient(rgba(0,0,0,0)71%,
                                         rgba(0,0,0,.53)); */
            border-bottom-color:rgba(0, 0, 0, 0.4);
            border-color:rgba(0,0,0,.25);
            border-top-color:rgba(0,0,0,0.1);
            bottom:0px;
            left:0px;
            position:absolute;
            right:0px;
            top:0px;
        }
        .myTLine_ProFilePicNotch{ /* -> .profilePicNotch */
            display:none;
        }
        .myTLine_CoverChangeThrobber{ /* -> .coverChangeThrobber */
            display:none;
            left:50%;
            margin-top:-8px;
            position:absolute;
            top:50%;
        }
        .myTLine_30vx{ /* -> ._30vx */
            left:20px;
            position:absolute;
            top:15px;
        }
        .myTLine_6a{ /* -> ._6a */
            display:inline-block;
        }
        .myTLine_P{ /* -> ._p */
            display:block;
        }
        .myTLine_30vy{ /* -> ._30vy */
            height:34px;
            position:relative;
        }
        .myTLine_30vy, .myTLine_30vy:hover{ 
            text-decoration:none;
        }
        .myTLine_sp_aw7bxAgNwFG_1_5_x{ /* -> .sp_aw7bxAgNwFG_1_5_x */
        /* 커버사진 아이콘 */
            width:27px;
            height:25px;
            /* background-position:0 -108px; */
            /* background-size:74px 388px; */
            background-repeat:no-repeat;
            display:inline-block;
            margin-left:auto;
            margin-right:auto;
        }
        i, .myTLine_Img{ /* -> .img */
            -ms-high-contrast-adjust:none;
        }
        .myTLine_30vz{ /* -> ._30vz */
            left:5px;
            opacity:0.7;
            position:absolute;
            top:8px;
            transition:all.3s cubic-bezier(.175, .885, .32, 1.275);
            z-index:1;
        }
        .myTLine_30v-{ /* -> ._30v- */
        /* 커버사진 업데이트 div 색깔 */
            background-clip:padding-box;
            /* background-color:rgb(50, 0, 100); */
            background:#464646;
            border:1px solid #fff;
            border-color: rgba(255, 255, 255, 0.8);
            border-radius:2px;
            box-shadow:0px 0px 3px rgba(10, 10, 10, 0.6);
            box-sizing:border-box;
            /* color:#fff; */
            color:#fff;
            display:inline-block;
            overflow:hidden;
            padding:6px 12px;
            position:relative;
            top:3px;
            transition:opacity .3s cubic-bezier(.175, .885, .32, 1.275),
                        width .3s step-end;
            white-space:nowrap;
            width:160px;
            word-wrap:normal;
            display:none;
        }
        .myTLine_30w0{ /* -> ._30w0 */
            -webkit-font-smoothing:antialiased;
            padding-left:26px;
            position:relative;
            z-index:2;
        }
        .myTLine_50f7{ /* -> ._50f7 */
            font-weight:600;
            font-size:12px;
        }
        .myTLine_2xc6{ /* -> ._2xc6 */
        /* 내 타임라인 사진옆 프로필 이름 */
            bottom:12px;
            left:201px;
            position:absolute;
            width:200px;
    
        }
        .myTLine_2n1v{ /* -> ._2n1v */
            font-weight:bold;
            letter-spacing:0px;
            font-size:24px;
            -webkit-font-smoothig:antialiased;
            line-height:30px;
            max-width:275px;
            position:relative;
        }
        h1,h2,h3,h4,h5,h6{
            /* color:#1c1e21; 이상하면 나중에 다시보기 -------- */
            margin:0;
            padding:0;
        }
        .myTLine_2n1v{ /* -> ._2n1v */
            font-weight:bold;
            letter-spacing:0px;
            font-size:24px;
            -webkit-font-smoothing:antialiased;
            line-height:30px;
            max-width:275px;
            position:relative;
            height:70px;
            color:gray;
        }
    
        /* --- 메뉴바 --- */
        #myTLine_fbTimeLineHeadLine{ /* -> #fbTimelineHeadline */
            min-height:41px;
            position:relative;
            width:100%;
            border-top:1px solid #d3d6db;
            z-index:4;
        }
        .myTLine_70k{ /* -> ._70k */
            clear:right;
            padding-left:201px;
            width:649px;
        }
        .myTLine_6_7{ /* -> ._6_7 */
            border-left:1px solid #e9eaed;
        }
        ul{
            list-style-type:none;
            margin:0;
            padding:0;
        }
        .myTLine_9rx{ /* -> ._9rx */
            padding:0;
        }
        .myTLine_6-7{ /* -> ._6-7 */
            border-width:0 1px;
            color:#4b4f56;
        }
        .myTLine_6-6{ /* -> ._6-6 */
            border-right:1px solid #e9eaed;
            float:left;
            font-size:14px;
            font-weight:600;
            height:43px;
            line-height:3.05;
            position:relative;
            vertical-align:middle;
            white-space:nowrap;
            padding:0 17px;
        }
        .myTLine_9ry{ /* -> ._9ry */
            /* padding:0 17px; */
        }
        .myTLine_bxy{ /* -> ._bxy */
            margin-left:7px;
            position:relative;
            top:-2px;
        }
        .myTLine_513x{ /* -> ._513x */
            background-size:500px 254px;
            background-position:-258px -200px;
            bottom:-1px;
            display:none;
            left:50%;
            margin-left:-8px;
            position:absolute;
            width:17px;
        }
        .myTLine_gs6{ /* -> ._gs6 */
        /* 친구 숫자 넣는 곳 */
            color:#89919c;
            font-size:11px;
            font-weight:normal;
            padding-left:6px;
        }
    
        /* 프로필 영역 */
        .myTLine_Name{ /* -> .name */
            overflow:hidden;
        }
        .myTLine_ProFilePicThumb{
            box-shadow:none;
            height:170px;
            left:15px;
            margin-top:0px;
            top:-143px;
            width:170px;
            display:block;
            padding:1px;
            position:absolute;
        }
        .myTLine_1hh{ /* -> ._1hh */
            border-radius:50%;
        }
        .myTLine_ProFilePic{ /* -> .profilePic 프로필 참고*/
        
            border:4px solid #fff;
        }
        .myTLine_s4g{ /* -> ._s4g */
            overflow:hidden;
            position:relative;
        }
        .myTLine_1c_u{ /* -> ._1c_u */
            outline:none;
            width:170px;
            height:170px;
            margin-left:-5px;
            margin-top:-5px;
        }
        .myTLine_4rc5{ /* -> ._4rc5 */
           /*  cursor:pointer; */
            position:absolute;
        }
        .myTLine_53j5{ /* -> ._53j5 */
        	margin:auto;
            max-height:100%;
            max-width:100%;
            overflow:hidden;
            position:relative;
            z-index:0;
        }
        .myTLine_6q41{ /* -> ._6q41 */
            border-radius:50%;
        }
        .myTLine_ox1{ /* -> ._ox1 */
            height:100%;
            left:0px;
            position:absolute;
            width:100%;
        }
        .myTLine_m54{ /* -> ._m54 */
            cursor:pointer;
            text-align: center;
        }
        .myTLine_3htz{ /* -> .3htz */
            height:100%;
            left:0px;
            max-height:100%;
            max-width:100%;
            position:absolute;
            top:0px;
            width:100%;
        }
        .myTLine_1445{ /* -> ._1445 */
            height:100%;
            width:100%;
        }
        .myTLine_4ndd{ /* -> ._4ndd */
            background-position:center center;
            background-repeat:no-repeat;
            background-size:contain;
            transform:scaleX(1.01);
        }
        .myTLine_fbTimeLineProFilePicSelector{ /* -> .fbTimelineProfilePicSelector */
            text-align:center;
            top:auto;
            position:absolute;
            z-index:5;
            margin-left:-15px;
        }
        .myTLine_23fv{ /* -> ._23fv */
            bottom:7px;
            left:20px;
            overflow:hidden;
            width:160px; /*업데이트 영역 길이문제있으면 여기보기 -----------*/
        }
        .myTLine_156n{ /* -> ._156n */
            display:block;
            overflow:hidden;
            position:relative;
        }
        .myTLine_156n a{
            color:#fff;
            display:block;
        }
        .myTLine_1o59{ /* -> ._1o59 */
            border-bottom-left-radius:80px;
            border-bottom-right-radius:80px;
            height:78.6px;
            text-align:center;
            background: #161616;
            width:160px;
            opacity:0.7;
        }
    
    
    
        .myTLine_156p{ /* -> ._159p */
            transition:opacity.13s ease-out;
            -webkit-font-smootiong:antialiased;
            font-weight:700px;
        }
        .myTLine_1o5e{ /* -> ._1o5e */
            /* margin:auto; */
            margin-top:-13px;
            padding:20px 0 0 0;
            text-align:center;
            vertical-align:middle;
        }
        .myTLine_CameraUpdateIcon{
            outline:none;
        }
        #myTLine_fbTPFPS{
            display:none;
        }

        /* 타임라인 커버메뉴영역 밑부분 */
        
        #myTLine_timeline_tab_content{ /* -> #timeline_tab_content */
           /*  margin-bottom:35px; */
        }
        .myTLine_clearfix{ /* -> .clearfix */
            zoom:1;
        }
        .myTLine_3-8y{ /* -> ._3-8y */
            margin-top:12px;
        }
        #myTLine_u_0_z{
        	cursor:pointer;
        }
    </style>

    </head>
    <body>
      <%@ include file="/views/jong/menubar.jsp" %>
    
        <div id="myTLine_AllOuter"> <!-- 타임라인 전체 div -->
            <div class="myTLine_Contents_Div myTLine_Contents_Clearfix" id="myTLine_Contents_Div">
                <div>
                    <div class="myTLine_hidden_elem" id="myTLine_toolbarContainer"></div>
                    <div id="myTLine_MainContainer">
                        <div id="myTLine_leftCol"></div>
                        <div class="myTLine_Contents_Clearfix" id="myTLine_ContentCol">
                            <div id="myTLine_ContentArea" role="main">
                                <div class="myTLine_5h60" id="myTLine_Pagelet_TimeLine_Main_Column">
                                
                                    <!-- 타임라인 상단 커버부분 영역 -->
                                    <div class="myTLine_5h60" id="myTLine_TimeLine_Top_section">
                                        <div class="myTLine_fbTimeLineTopSectionBase myTLine_6-d">
                                            <div class="myTLine_5h60" id="myTLine_PageLet_Above_Header_TimeLine"></div>
                                            <div id="myTLine_Above_Hrader_TimeLine_PlaceHolder"></div>
                                            <div class="myTLine_fbTimeLineSection myTLine_fbTimeLineTopSection">
                                                <div id="myTLine_fbProFileCover">
                                                
                                                
                                                
                                                
                                                
                                                
                                                <form id="myTLine_FileC" action="<%= contextPath%>/fileCover.me" method="post" enctype="multipart/form-data">
                                                			
                                                			<!-- 실제로 파일첨부 버튼 -->
                                                      		<div style="height:1px; width:1px;" id="myTLine_divHide">
                                                               <input type="file" id="myTLine_cFileClick" name="myTLine_cFileClick" onchange="imgUp();">
    														</div>
    														
                                                    <div class="myTLine_Cover" id="myTLine_u_0_10">
                                                    
                                                        <!-- 여기 클릭하면 파일첨부 뜨는 메소드 실행되게 -->
                                                        <div class="myTLine_coverImage" id="myTLine_u_0_z">
                                                        
                                                        
                                                            <!-- 커버 이미지 경로 div -->
                                                            <div title="커버 사진" class="myTLine_CoverWrap" id="myTLine_fbCoverImageContainer">
	                                                            <!-- 커버 이미지 경로 -->
	                                                            <img width="849" height="315" class="myTLine_ox1 myTLine_21y0" id="myTLine_u_jsonp_2-_f"src="<%=member.getCoverImage() %>">
                                                            </div>
                                                            
                                                            
                                                            
                                                            <div class="myTLine_InstructionWrap">
                                                                <div class="myTLine_Instructions">커버사진을 끌어서 움직여보세요</div>
                                                            </div>
                                                            
                                                            
                                                            
                                                            <div class="myTLine_CoverBorder"></div>
                                                            <div class="myTLine_ProFilePicNotch myTLine_Circular">
                                                                <div class="myTLine_NotchInner"></div>
                                                            </div>
                                                            <img width="16" height="16" class="myTLine_CoverChangeThrobber img"
                                                            art="이미지 못불러올때 대신뜨는 글" src="">
                                                            </a>
                                                            <div class="myTLine_6a myTLine_uiPopover myTLine_30vx myTLine_5v-0" id="myTLine_fbProFileCoverPhotoSelector">
                                                                <a class="myTLine_fbTimeLineEditCoverButton myTLine_30vy myTLine_5pwk myTLine_P" id="myTLine_u_0_11"
                                                                role="button" aria-expanded="false" aria-haspopup="true" aria-controls="myTLine_u_1d_3" rel="toggle">
                                                                <!-- aria-expanded : 웹 접근성 측면에서 열린 부분은 true, 닫힌부분은 false.
                                                                     aria-controls : 속성값은 본문이 보여지게될 부분의 id와 일치해야 한다.
                                                                     href : 본문이 보여지게 될 부분의 id를 입력한다(a 태그)
                                                                -->
                                                                <% if(loginUser != null && member.getmNo() == loginUser.getmNo()){ %>
                                                                <img src="resources/image/sira/camera_image2.png" class="myTLine_30vz myTLine_Img myTLine_sp_aw7bxAgNwFG_1_5_x myTLine_sx_98cc64"></img>
                                                                <div class="myTLine_30v-">
                                                                	<!-- 커버 사진 업데이트 버튼 -->
                                                                    <span class="myTLine_30w0 myTLine_50f7">커버 사진 업데이트</span>
                                                                </div>
                                                              	<% } %>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="myTLine_2n1j myTLine_2xc6">
                                                                <!-- 사용자 이름 -->
                                                                <h1 class="myTLine_2n1v">
                                                                    <label>
                                                                       	 <%=member.getmName() %><br>
                                                                    </label>
                                                                    <label style="font-size:20px;">
                                                                        
                                                                    </label>
                                                                </h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                      
    											</form>
    											
    											
    											
    											
    
    
    
    
                                                    <!-- 메뉴바 -->
                                                    <div class="myTLine_Contents_Clearfix" id="myTLine_fbTimeLineHeadLine">
                                                    
                                                        <div class="myTLine_70k">
                                                            <ul class="myTLine_6_7 myTLine_Contents_Clearfix" id="myTLine_u_0_13">
                                                                <li>
                                                                    <div class="myTLine_6a myTLine_uiPropover myTLine_6-6 myTLine_9rx myTLine_6-7"
                                                                        id="myTLine_u_0_14">
                                                                        <a class="myTLine_9ry myTLine_P" id="myTLine_u_0_15" href="">
                                                                        	타임라인 ▼
                                                                        </a>
                                                                    </div>
                                                                </li>
    
                                                                <li>
                                                                    <a class="myTLine_6-6" href="">
                                                                        	정보
                                                                        <span class="myTLine_513x"></span>
                                                                    </a>
                                                                </li>
                                                                
                                                                <li>
                                                                   <a id="myTLine_friends" class="myTLine_6-6" href="">
                                                                       	친구
                                                                       <!-- 친구 숫자 넣기 -->
                                                                       <span class="myTLine_gs6"><%=list.size() %></span>
                                                                       <span class="myTLine_513x"></span>
                                                                   </a> 
                                                                </li>
                                                            </ul>
                                                        </div>
    
    
                                                 <!-- 프로필 사진 영역 -->
                                                <form id="myTLine_FileP" action="<%= contextPath %>/fileProfile.me" method="post" enctype="multipart/form-data">
                                                
                                                	<!-- 실제로 파일첨부 버튼 -->
                                                      		<div style="height:1px; width:1px;" id="myTLine_divHide2">
                                                               <input type="file" id="myTLine_PFileClick" name="myTLine_PFileClick" onchange="imgUp2();" style="height:1px; width:1px;">
    														</div>
                                                
                                                        <div class="myTLine_Name">
                                                            <div class="myTLine_PhotoContainer">
                                                                <div class="myTLine_1ro1 myTLine_5ycb">
                                                                    <div class="myTLine_ProFilePicThumb">
                                                                        <!-- 프로필사진 div 영역 둥근형태 -->
                                                                        <div class="myTLine_s4g myTLine_1hh myTLine_ProFilePic" id="myTLine_s4g"
                                                                             style="width:160px; height:160px;">
                                                                             
                                                                             <div class="myTLine_1c_u myTLine_4rc5" id="myTLine_u_0_18" style="">
                                                                                
                                                                                <!-- 프로필사진(실제들어갈)div -->
                                                                                <div tabindex="0" class="myTLine_53j5 myTLine_6q41" id="myTLine_u_0_19" style="height:170px; width:170px;">
                                                                                    
                                                       <!-------------------------------프로필사진 이미지 --------------------------------------------------------------------------->
																                       <img width="170" height="170" class="myTLine_ox1 myTLine_21y0" id="myTLine_u_jsonp_2-_f-2" 
																                       src="<%=member.getProfileImage()%>">
																                       
																                        <%-- <%if (loginUser.getProfileImage() != null) { %>
																                        <%=loginUser.getProfileImage() %>
																                        <% } else { %>
																                        	<% if (loginUser.getGender() == "M") { %>
																                        		<%=contextPath%>/resources/image/jong/noImageM.jpg
																                        	<% } else { %>
																                        		<%=contextPath%>/resources/image/jong/noImageF.jpg
																                        	<% } %>
																                        <% } %> --%>
																                       
                                                                                    
                                                                                    
                                                                                    <div class="myTLine_m54 myTLine_1jto myTLine_3htz myTLine_hidden_elem" id="myTLine_u_jsonp_2-_g">
                                                                                        <img class="myTLine_1445 myTLine_4ndd myTLine_Img" id="myTLine_u_jsonp20_h"
                                                                                        src="">
                                                                                    </div>
                                                                                </div> 
                                                                             </div>
                                                                        </div>
                                                                        
                                                                        <% if(loginUser != null && member.getmNo() == loginUser.getmNo()){ %>
                                                                        <!-- 프로필 사진 업데이트 버튼 -->
                                                                        <div class="myTLine_fbTimeLineProFilePicSelector myTLine_23fv" id="myTLine_fbTPFPS">
                                                                            <div class="myTLine_156n myTLine_23fw myTLine_1o59" id="myTLine_23fw">
                                                                                <a class="myTLine_156p myTLine_1o5e" id="myTLine_u_jsonp_2-_j"
                                                                                role="button"rel="dialog">
                                                                                <div class="myTLine_CameraUpdateIcon_Div">
                                                                                    <img class="myTLine_CameraUpdateIcon myTLine_Img"
                                                                                    src="resources/image/sira/camera_image.png">
                                                                                </div>
                                                                               	 	업데이트
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <%} %>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
    												</form>
    												
    												
    												
    												
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 타임라인 커버메뉴영역 아래부분 -->
                                    <div class="myTLine_5h60" id="myTLine_pagelet_main_column_personal">
                                        <div id="myTLine_fbSuggestionsPlaceHolder"></div>
                                        <div id="myTLine_timeline_tab_content">
                                            <div class="myTLine_clearfix myTLine_ikh myTLine_3-8y">
	<!-- 소개 글상자 페이지 -->
    <%@include file= "/views/sira/ace4_MyTimeLine_Menu1.jsp" %>
    
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


        <script>
        
     // 파일첨부 안보이게하기, 커버전체 또는 커버업데이트 버튼 클릭시 이벤트 발생
        //#myTLine_cFileClick파일버튼 .myTLine_30w0커버사진버튼 #myTLine_u_0_z커버전체부분
        
        $(function(){
        	 $("#myTLine_divHide").hide();
        	 $("#myTLine_u_0_z").click(function(){
        		 $("#myTLine_cFileClick").click();
        	 });
        	 
        });
     
     
     	// 파일첨부 안보이게하기, 프로필 업데이트  버튼 클릭시 이벤트 발생
     	$(function(){
     		$("#myTLine_divHide2").hide();
     		$("#myTLine_fbTPFPS").click(function(){
     			$("#myTLine_PFileClick").click();
     		});
     		
     	});
        	
/*         // 이미지 onchange 함수
        function loadImg(value, num){
        	console.log(num);
        	// 파일 존재 유무
        	if(value.files && value.files[0]){
        		
        		var reader = new FileReader();
        		
        		reader.onload = function(e){
        			
        			switch(num){
        			case 1: $("#myTLine_u_jsonp_2-_f").attr("src", e.target.result); // data:URL
        					break;
        			
        			}
        		}
        		
        		reader.readAsDataURL(value.files[0]);
        		
        	}
        	
        	
        	
        }	 */
        
        
        /* 커버 사진 업데이트 ajax */
        
        
        function imgUp(){
        	
        	
        	/* var data = new FormData();
    		data,append('coverImg',$(".myTLine_FileC")[0].files[0]); */
        	var form = $('#myTLine_FileC')[0];
    		var formData = new FormData(form);
    		/* var form = $("form")[0];
    		var formData = new FormData(form); */
    		
    		console.log(formData);
    		
    		$.ajax({
    			url:"fileCover.me",
    			type:"POST",
    			enctype: "multipart/form-data",
    			data:formData,
    			contentType : false,
    			processData : false,
    			success:function(status){
    				
    				
    					console.log("사진 업데이트 성공");
    					$("#myTLine_u_jsonp_2-_f").attr("src",status); 
    				
    				
    			},error:function(){
    				console.log("서버와 통신 실패!");
    			}
    			
    		});
    		
        }
        
     
        /* 프로필 사진 업데이트 ajax */
        function imgUp2(){
        	var form = $('#myTLine_FileP')[0];
    		var formData = new FormData(form);
    		
    		$.ajax({
    			url:"fileProfile.me",
    			type:"POST",
    			enctype: "multipart/form-data",
    			data:formData,
    			contentType : false,
    			processData : false,
    			success:function(status){
    				
    				
    					console.log("사진 업데이트 성공");
    					$("#myTLine_u_jsonp_2-_f-2").attr("src",status); 
    				
    				
    			},error:function(){
    				console.log("서버와 통신 실패!");
    			}
    			
    		});
    		
        }
        
        
     		// 커버이미지 마우스로 가져다댔을때 이벤트 발생
            $(document).ready(function(){
                $("#myTLine_u_0_10").mouseover(function(){
                    $(".myTLine_30v-").attr("style","display:block");
                }).mouseleave(function(){
                    $(".myTLine_30v-").attr("style","display:none");
                });
            });
    
            
            
         	// 프로필 사진 영역 마우스 가져다댔을때 이벤트 발생
            $(document).ready(function(){
                $(".myTLine_PhotoContainer").mouseenter(function(){
                    $("#myTLine_fbTPFPS").attr("style","display:block");
                }).mouseleave(function(){
                    $("#myTLine_fbTPFPS").attr("style","display:none");
                });
            });
				
         	// 소개수정 클릭시 이벤트 발생
             $("#myTLine_sosu").click(function(){
                 $(".myTLine_4xda").attr("style","display:block"); // textarea부분 block
                 $("#myTLine_introduce_Id").removeAttr("readonly"); // readonly속성 제거
                 $(".myTLine_4xd9").attr("style","border:1px solid lightgray");
                 $("#myTLine_sosu").attr("style","display:none");
             });
                
               /* 메뉴 > 타임라인 클릭시 */
               $("#myTLine_u_0_15").click(function(){
	               	location.href="<%=contextPath%>/timeLines.bo?mNo=" + <%= member.getmNo()%>;
	               	/* $(".myTLine_newM").attr("style","display:block");
	               	$(".myTLine_newMMM").attr("style","display:none"); */
	               	return false;
               });
               
                
                /* 메뉴 > 친구 클릭시 */
                $("#myTLine_friends").click(function(){
                	location.href="<%=contextPath%>/timelinefd.bo";
                	/* $(".myTLine_newM").attr("style","display:none");
                	$(".myTLine_newMMM").attr("style","display:block"); */
                	return false;
                });
                
                
        </script>
    </body>
    </html>