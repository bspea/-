<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.board.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("b");

	ArrayList<BoardImage> polist = (ArrayList<BoardImage>)request.getAttribute("polist");
	
	int imgNo = Integer.parseInt(request.getParameter("imgNo")); // url로 넘어온값 뽑아주기
	
	ArrayList<BoardLike> likeList = (ArrayList<BoardLike>)request.getAttribute("likeList");
	
	int result = 0;
	int mNum = 0; // 리스트 안 회원번호
	int bNum = 0; // 리스트 안 글번호
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 상세보기</title>
<style>
		body{
            line-height: 1.34;
        }
        button{
            border: none;
            background:none;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }
        button:focus{
            outline: none;
        }
        a{
            text-decoration: none;
        }
        div{
            box-sizing:border-box;
        }
         .outer{
            width:1300px;
            height:1020px;
            background:rgb(233,235,238);
            padding-top:20px;
        }
        
        .mTopArea>div, .mTopArea2>div{width:100%;}
        /* 댓글부분전까지 */
        .upIn2{
            border-bottom:1px solid #dddfe2;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }
        .upIn2{
            height:35%;
            padding: 2%;
        }
        /* 댓글부분전체 */
        .downIn2{
            height:55%;
        }
        .top2{
            height:25%;
            display:flex;
        }
        .middle2{height:35%;}
        .bottom2{
            height:40%;
            border-top: 1px solid #dddfe2;
        }
        .top2>div{height:100%;}
        .lTopArea2{width:20%; text-align: center;}
        .mTopArea2{width:50%;}
        .rTopArea{width:30%;}
        
        /* 작성자 정보영역 */
        #wImg{
            border-radius: 35px;
            width:40px;
          	height:40px;
        }
        .mTopArea2>div{
            height:50%;
            padding:2%;
        }
        .mTopArea2 a:hover{
            text-decoration: underline;
        }
        #wName a, .comment1{
            color: #385898;
            font-weight: 900;
        }
        #wDate a{
            font-size: 12px;
            color: #616770;
        }
        .rTopArea button{float:right;}
        
        /* 글내용 사진영역 */
        .middle2>div{
            width: 100%;
            height:100%;
        }
        .contentArea>div{
            width:100%;
        }
        .textArea2{
            height:100%;
        }
        #contentPt:hover{
            cursor: pointer;
        }
        
        /* 버튼&카운트수 영역 */
        .contentArea, .countsArea>div{height:100%;}
        .countsArea{
            width:100%;
            height:50%;
            display:flex;
        }
        .btnsArea{
            width:100%;
            height:50%;
            display:flex;
            padding: 2%;
        }
        .line2{
            width:90%;
            margin: auto;
        }
        .cLike2{
            width:60%;
            display:table;
        }
        .cShare{
            width:40%;
            text-align: end;
            display: table;
        }
        .cLike2 > span {
           display:table-cell;
           vertical-align: middle;
           width:100%;
           height:100%;
       } 
       .cLike2 >div{
           width:60%;
           height: 80%;
           display: flex;
           padding-top:10%; 
       }
       .cShare >span{
           width:50%;
           height:100%;
           vertical-align: middle;
           display:table-cell;
       }
       .cShare span a:hover{
            text-decoration: underline;
        }
        .cShare span a{
            color: #616770;
            vertical-align: middle;
        }
        .btnsArea>div{
            height: 100%;
            width: 33%;
            margin: 0;
        }
        .btns{width:100%; height:95%;} 
        .btn{
            width:95%;
            height: 70%;
            text-align:middle;
            align-content: center;
            display:table;
            margin:auto;
            font-weight: 900;
            color:rgb(96, 103, 112);
        }
        .btn>div{
            height: 100%;
            width: 100%;
        }
        #btnImg2{
            margin-left:35%;
        }
        .btn > span {
           display:table-cell;
           vertical-align: middle;
           text-align: left;
           width:55%;
           height:100%;
       } 
       .btn:hover{
            background:rgb(245,246,247);
            cursor: pointer;
            border-radius: 4px;
       }
       
       /* 댓글영역 */
       .downIn2>div{
           width:100%;
       }
       .cSort2{
        height:10%;
        padding: 2%;
       }
       .cSort2>span{
           vertical-align: middle;
       }
       .myComment2{
        height:10%;
        display: flex;
        background-color: #f2f3f5;
        position:relative;
       }
       .youComment2{
        height:15%;
        display:flex;
        padding: 2%;
       }
       #replyArea{
       	height:100%;
       	overflow-y: scroll; /* 세로에서 영역넘어가면 스크롤 생성 */
    	overflow-x: hidden; /* 가로에서 영역넘어가면 스크롤x*/
       }
       .cMore{
        height:20%;
        display: flex;
       }
       .cAddArea{
           height:auto;
           margin:0;
       }
       .cAddArea>div{
           padding:1%;
           margin: 0;
       }
       .myComment2>div{
        height: auto;
        display: flex;
        padding: 1%;
        }
       .mImgArea2, .yImgArea2{
        width:15%;
        display: flex;
       }
       #userImg2{
            border-radius: 20px;
            border: 1.5px solid #ccd0d5;
            margin:auto;
            width:40px;
            height:40px;
        }
       .cWriteArea2{
        width:85%;
       }
       .cWrite2>div{height:100%; display: contents;}
       .cWrite2_1>.cText{
       	width:85%;
        padding: 2% 3%;
       }
       .cText:hover{
        cursor:text;
       }
       .cText>textarea{
       	outline: none;
	    border: none;
	    color: rgb(96, 103, 112);
	    background-color: #f2f3f5;
	    font-family: inherit;
	    resize:none;
	    width: 220px;
       }
       .cIcon2:hover{
       	cursor:pointer;
       }
       .cIcon2{
        padding: 2% 3%;
		text-align: end;
       } 
       .cIcon2{width:15%;}
       .hidden_elem2{
       	display:none;
       }
       [contenteditable=true]:empty:before{
        content: attr(placeholder);
        display: block; 
        }
        #cPhotoPreviewArea{
        	background-color: #f2f3f5;
        }
        #cPhotoPreview{
        	width:95%;
   			border: 1px solid #ccd0d5;
   			padding-bottom:2px;
   			height: 60px;
    		margin-left: 10px;
        }
        #cPhotoPreview>span{
        	float:right;
        	cursor:pointer;
        }
        #cPhotoPreview>img{
        	width:10%;
        	padding-left:10px;
        }
       .cWrite_1, .cWrite2_1 {
        background-color: #f2f3f5;
        border-radius: 18px;
        display: flex;
        }
        .cWrite_1{
        	padding: 9px 12px;
        	display:inline-block;
        }
        #reLikeCount{
        	vertical-align: bottom;
  			position: absolute;
  			width: 23px;
        }
        #reLikecNum{
        padding-left: 5%;
		vertical-align: top;
        }
        .cWrite_1{height:70%; width:max-content;}
        .ycBottom2{height:30%; width:100%; }
        .cWrite2_1{height:100%; width:95%;}
        .ycBottom2>span:hover, .cView:hover, .cSort2>span:hover{
            cursor: pointer;
            text-decoration: underline;
        }
        .ycBottom2>span{
            font-size: 12px;
            color:rgb(56, 88, 152);
        }
        .cMore>div{
            height:100%
        }
        .cView{
            width:80%;
            color:rgb(56, 88, 152);
            font-size: 15px;
        }
        .cCount{
            width:20%;
            color:rgb(96, 103, 112);
            font-size: 15px;
        }
	
		
	
		
        /* 사진 클릭시 상세보기 */
	    .mainOuter a{
	        text-decoration: none;
	    }
	    a {
		    color: #385898;
		    cursor: pointer;
		    text-decoration: none;
	    }
	    .mainOuter, .sMainOuter {
		    height: auto;
		    left: 0;
		    min-height: 100%;
		    position: absolute;
		    right: 0;
		    top: 0;
	    }
	    .mainOuter, .sMainOuter {
		    display: table;
		    height: 100% !important;
		    table-layout: fixed;
		    width: 100%;
		    outline: none;
		    color: #1d2129;
	    }
	    .mainOuter{
		    background-color: #1C1C1C;
		    box-shadow : rgba(1, 1, 1, 0.671) 0 0 0 9999px;
		    z-index : 100;
		    padding-top: 50px;
		    /* position:fixed; */
	    }
	    .minOuter {
		    display: table-cell;
		    text-align: center;
		    vertical-align: middle;
		    width: 100%;
	
	    }
	    .minIn {
		    display: inline-block;
		    position: relative;
		    text-align: left;
		    /* position: static; */
		    width: 1200px;
		    height: 600px;
		    margin: auto;
		}
		.innerOuter{
		    box-shadow: 0 12px 24px rgba(0, 0, 0, .3);
		    position: relative;
		}
		.innerIn{
		    width: 1200px;
		    height: 600px;
		}
		.lPhotoOuter{
		    width:70%;
		    line-height: 600px;
		    background-color: #000;
		    height: 100%;
		    min-height: 600px;
		    position: relative;
		    text-align: center;
		    float: left;
		}
		.lPhotoIn{
		    cursor: pointer;
		    display: block;
		    font-size: 0;
		    height: 100%;
		    min-height: 490px;
		    position: relative;
		    text-align: center;
		    width: 100%;
		}
		.lPhoto{
		    /* display: inline-block; */
		    margin: 0 auto;
		    vertical-align: middle;
		}
		.lPhoto>img{
		    display: inline-block;
		    height: auto;
		    max-height: 600px;
		    max-width: 800px;
		    vertical-align: middle;
		    width: auto;
		}
	    .mainOuter a{
	    	text-decoration: none;
	        }
	    .xBtn{
	        float: right;
	    }
	    #detailPhName{
	        color:white;
	        display: block;
	        width: max-content;
	        display:flex;
	        padding:25px;
	        font-size:30px;
	    }
	    #detailPhName:hover{
	    	 text-decoration: underline;
	    }
	    .arrowArea{
	    	display:inline-block;
	    	padding-top:220px;
	    }
	     #backBtn{
	   		padding-right: 350px;
	   		margin-left: 30px;
	    } 
	    #nextBtn{
	    	padding-left: 340px;   
	    }
	    .pbtnsArea{
	    	width: 70%;
		    height: 20%;
		    padding-top: 200px;
	    }
	    .hoverItem{
	    	position: absolute;
	        display:flex;  
	        height:100%;
	        width:100%;
	        color:white;
	        line-height:500%;
	    }
        .lImgArea>div{
            position:absolute;
            top:0;
            left:0;
        }
        .lImgArea:hover{
            cursor: pointer;
            color:white;
            text-decoration: underline;
        }
        .rCommentArea{
            width:30%; 
            border-radius: 0 0 3px 3px;
            color: #1c1e21;
            display: flex;
            flex-direction: column;
            font-size: 13px;
            max-height: 100%;
            background: #fff;
            height:100%;
            overflow:hidden;
            /* position:relative; */
        }
        .rCommentArea>div{
            width:100%;
            height:100%;
        }
        
        /* 메뉴눌렀을시 메뉴창 */
    
        .menuOpen {
	        background-color: #fff;
	        border: 1px solid rgba(0, 0, 0, .15);
	        border-radius: 3px;
	        box-shadow: 0 3px 8px rgba(0, 0, 0, .3);
	        border-top-right-radius: 0;
	        width: 230px;
	        height:auto;
	        color:rgb(29, 33, 41);
	        line-height:50px;
	        text-align: left;
	        padding-top: 1%;
	        padding-bottom: 1%;
	        position: absolute;
        }
        .menuOpen>div{
	        font-weight: 550;
	        padding: 0 12px;
        }
        .menuOpen>div>img{
        	vertical-align: middle;
        }
        .menuOpen>div:hover{
            cursor: pointer;
            background: #3578E5;
            color:white;
            border-top:1px solid black;
            border-bottom:1px solid black;
        }
        
        /* 공통배경 */
        .bgAll{
            margin-top: 20%;
            margin-left: 30%;
            background-color: #fff;
            border-radius: 3px;
            box-shadow: 0 2px 26px rgba(0, 0, 0, .3), 0 0 0 1px rgba(0, 0, 0, .1);
            background-color: rgba(0, 0, 0, .4);
            background-color: rgba(255, 255, 255, .8);
            font-family: Helvetica, Arial, sans-serif;
            box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
            z-index : 100;
            height: auto;
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            /* margin: 0 auto 40px; */
            /* position: relative; */
            position:fixed;
        }
        .bgAll2{
            background-color: #fff;
            border-radius: 3px;
            position: relative;
        }
        
        
        /* 신고하기창 */
        .declareOuter{
            width: 445px;
            height:300px;  
        }
        .declareInner, .declareInner>form{
            width:100%;
            height:100%;
        }
        .declareInner form>div{
            width:100%;
        }
        .declareNotice{
        	height:70%;
        	color: #606770;
		    font-size: 14px;
		    line-height: 18px;
		    padding: 13px;
        }
        .declareTitle{
        	height:15%;	
			background-color: rgb(255, 255, 255);
		    border-bottom: 1px solid rgb(218, 221, 225);
		    padding: 12px 9px 12px 16px;
		    font-size: 16px;
		    font-weight: bold;
		    line-height: 20px;    
		    cursor: default;    	
        }
        .dResonArea{
        	align-items: center;
		    background: #f5f6f7;
		    border: 1px solid #dddfe2;
		    border-radius: 20px;
		    display: inline-flex;
		    margin-bottom: 8px;
		    margin-right: 8px;
		    padding: 8px 12px;
        }
        .dResonArea>span{
        	cursor:default;
        }
        .declareBtnArea{
        	height:15%;
        	padding-right:3%;
        	border-top: 1px solid #dddfe2;
        	padding-top: 2%;
        }
        .declareBtnArea>button{
        	float:right;
    		font-size: 14px;
    		font-weight: bold;
		    text-align: center;
		    background-color: rgb(24, 119, 242);
		    border-color: rgb(24, 119, 242);
		    padding-left: 11px;
		    padding-right: 11px;
		    border-radius: 2px; 
		    color:white;	
        }
    
				
		
	
	
</style>
</head>
<body>

	<%@ include file="/views/jong/menubar.jsp" %>
<div class="outer">
	<!-- 사진클릭시 나오는 화면 -->
	<div class="mainOuter">
		<div class="minOuter">
			<a class="xBtn" id="detailX" href="<%= contextPath%>/test.me"> 
				<img src="<%=contextPath%>/resources/image/hye/취소아이콘.png" alt="">
			</a>
			<div id="test" class="minIn">
				<div class="innerOuter">
					<div class="innerIn">
						<div class="lPhotoOuter">
							<div class="lPhotoIn">
								<!-- 마우스 올리면 나타나도록 -->
								<% for(int i=0; i<polist.size(); i++) { %>
								<% if(imgNo == polist.get(i).getImgNo()) { %>
								<div class="hoverItem">
									<div>
										<a id="detailPhName" href="#올린사람페이지로"><%= b.getmName() %>님이 게시한사진</a>
										<div class="arrowArea"> <%-- 화살표 감싸는 div --%> 
											<a href="detail.news?bNo=<%= b.getbNo() %>&imgNo=<%= polist.get(i).getImgNo()-1 %>">
												<img id="backBtn" src="<%=contextPath%>/resources/image/hye/goprevious_103394.png" alt="" <% if(i == 0) {%>style="visibility:hidden;" <%} %>>
											</a>
											<a href="detail.news?bNo=<%= b.getbNo() %>&imgNo=<%= polist.get(i).getImgNo()+1 %>">
												<img id="nextBtn" src="<%=contextPath%>/resources/image/hye/gonext_103393.png" alt="" <% if(i == polist.size()-1) {%>style="visibility:hidden;" <%} %>>
											</a>
										</div>

										<div class="pbtnsArea" style="width: 43%; height: 30%;"> <%-- 왼쪽 사진뜨는곳에 버튼 감싸는 div --%> 
											<div class="btnsArea">
												<div class="btns">
													<div class="btn likeAllBtn" id="likeBtn3" style="font-size: 12px" onclick="boardLikeBtn(<%=b.getbNo()%>);">
													<input type="hidden" value="<%=b.getbNo()%>">	
														<div>
															<img src="<%=contextPath%>/resources/image/hye/좋아요.png" class="likeImage" id="btnImg3" width="30" height="30" alt="">
														</div>
														<span class="clickLikeName">좋아요</span>
													</div>
												</div> <%-- btns닫는 div --%> 
												
												<div>
													<div class="btn" id="commentBtn3">
														<div>
															<img src="<%=contextPath%>/resources/image/hye/댓글.png" id="btnImg3" width="30" height="30" alt="">
														</div>
														<span>댓글</span>
													</div>
												</div>
												
												<div>
													<div class="btn" id="shareBtn3">
														<div>
															<img src="<%=contextPath%>/resources/image/hye/공유하기.png" id="btnImg3" width="30" height="30" alt="">
														</div>
														<span>공유하기</span>
													</div>
												</div>
											</div> <%-- btnsArea 닫는 div --%> 
										</div> <%-- pbtnsArea 닫는 div --%> 
									</div> <%-- hoverItem 바로밑 div 닫는 --%> 
								</div> <%-- hoverItem 닫는 --%> 
								
								<div class="lPhotoBox">
									<div class="lPhotoArea"></div>
								</div>
								<div class="lPhoto">
									<img src="<%=contextPath%><%= polist.get(i).getImgPath() %>" alt="">
								</div>
							</div> <%-- lPhotoIn 닫는 --%> 
						</div> <%-- lPhotoOuter 닫는 --%>
						<% } %>
						 <% } %>

						<!-- 오른쪽 댓글창 -->
						<div class="rCommentArea">
							<div class="rCommentInner">
								<div class="upIn2">
									<div class="top2">
										<div class="lTopArea2">
											<div>
												<img id="wImg"
													src="<%= b.getProfileimage()%>"
													alt="">

											</div>
										</div>
										<div class="mTopArea2">
											<div id="wName">
												<a href="#"><%= b.getmName() %></a>
											</div>

											<div id="wDate">
												<a href="#"><%= b.getbDate() %> ·</a>
												<!-- 나만보기아이콘 -->
												<img id=""
													src="<%=contextPath%>/resources/image/hye/lock-fill.png"
													alt="" style="vertical-align: middle; width:14px">
											</div>
										</div>
										<div class="rTopArea">
											<button id="menuOpenBtn2">
												<img
													src="<%=contextPath%>/resources/image/hye/more-fill.png"
													alt="">
											</button>

											<div class="menuOpen">
												<div id="bDeclareBtn">
													<img
														src="<%=contextPath%>/resources/image/hye/error-warning-line.png"
														alt=""> 게시물 신고
												</div>
											</div>
										</div> <%-- rTopArea 닫는 --%> 
									</div> <%-- top2 닫는 --%> 
									
									<div class="middle2">
										<div class="contentArea">
											<div class="textArea2"></div>
										</div>
									</div>
									<div class="bottom2">
										<div class="countsArea">
											<div class="cLike2"></div>
											<div class="cShare"></div>
										</div> <%-- countsArea 닫는 --%> 
										
										<div class="btnsArea">
											<div class="btns">
												<div class="btn likeAllBtn" id="likeBtn2" style="font-size: 12px" onclick="boardLikeBtn(<%=b.getbNo()%>);">
													<div>
														<img id="btnImg2" class="likeImage" src="<%=contextPath%>/resources/image/hye/좋아요.png" width="30" height="30" alt="">
													 <% if(!likeList.isEmpty()){ %> <!-- 좋아요리스트 비어있지않으면 -->
													 <%for(int i=0; i<likeList.size(); i++) { %>
														 <% if(likeList.get(i).getmNo() == loginUser.getmNo() && likeList.get(i).getbNo() == b.getbNo()) { %>
															 <% result = 1; %> 
															 <% mNum = likeList.get(i).getmNo();%>
															 <% bNum = likeList.get(i).getbNo();%>
														  <% }else { %>
													    <% } %>
													  <% } %>
													<% } %>   
													</div>
													<span id="clickLikeName">좋아요</span>
												</div>
											</div>
											<div>
												<div class="btn" id="commentBtn2">
													<div>
														<img src="<%=contextPath%>/resources/image/hye/댓글.png"
															id="btnImg2" width="30" height="30" alt="">
													</div>
													<span>댓글</span>
												</div>
											</div>
											<div>
												<div class="btn" id="shareBtn2">
													<div>
														<img src="<%=contextPath%>/resources/image/hye/공유하기.png"
															id="btnImg2" width="30" height="30" alt="">
													</div>
													<span>공유하기</span>
												</div>
											</div>
										</div> <%-- btnsArea 닫는 --%> 
									</div> <%-- bottom2 닫는 --%> 
								</div> <%-- upIn2 닫는 --%> 

								<div class="downIn2">
									<div class="cSort2">
										<span>관련성 높은 댓글</span>
									</div>
									<div id="replyArea">
										 <!-- ajax로 생성 -->
									</div>
								</div> <%-- downIn2 닫는 --%> 

								<div class="myComment2">
									<div class="mImgArea2">
										<img id="userImg2" src="<%= b.getProfileimage()%>" alt="">
									</div>
									<div class="cWriteArea2">
										<form class="cWrite2_1" id="uploadForm" action="<%=contextPath%>/rinsert.new" method="post" enctype="multipart/form-data">
											<div class="cText">
												<textarea class="addReply" name="replyContent" >댓글을 입력하세요...</textarea>
											</div>
											<div class="cIcon2">
												<img class="cameraIcon2"
													src="<%=contextPath%>/resources/image/hye/camera-fill.png">
											</div>
											<input
												accept="video/*,  video/x-m4v, video/webm, video/x-ms-wmv, video/x-msvideo, video/3gpp, video/flv, video/x-flv, video/mp4, video/quicktime, video/mpeg, video/ogv, .ts, .mkv, image/*, image/heic, image/heif"
												class="hidden_elem2" name="replyImg" type="file" onchange="loadImg(this, 1);"> <span
												data-hover="tooltip"> <a aria-label="사진 또는 동영상 첨부"></a>
											</span>
											<input type="hidden" name="bNo" value="<%=b.getbNo()%>">
											<input type="hidden" name="mNo" value="<%=loginUser.getmNo()%>">
										</form>
									</div>
								</div> <%-- myComment2 닫는 --%> 

								<div id="cPhotoPreviewArea"> <%-- 사진미리보기창 --%> 
									<div id="cPhotoPreview">
										<span onclick="closeView();">X</span>
										<img id="titleImg2" src="<%=contextPath%>/resources/image/hye/댓글.png" style="background:black; width:50px;">
									</div>
								</div>
							</div> <%-- rCommentInner 닫는 --%> 
						</div> <%-- rCommentArea 닫는 --%> 
					</div> <%-- innerIn 닫는 --%> 
				</div>  <%-- innerOuter 닫는 --%> 
			</div> <%-- minIn 닫는 --%> 
		</div> <%-- minOuter 닫는 --%> 
	</div> <%-- 사진클릭시 나오는 전체 div닫는 --%> 
</div>



<!-- 신고하기창 -->
<div class="declareOuter bgAll">
    <div class="declareInner bgAll2">
        <form action="" method="post">
            <div class="declareTitle">계속하려면 문제를 선택하세요
            	<a class="xBtn" id="declareX" href="#메인페이지로">
                    <img src="<%=contextPath%>/resources/image/hye/취소아이콘.png" alt="">
                </a>
            </div>
            
            <div class="declareNotice">
            	<div style="padding-bottom:10px;">    	
    	        	<img src="https://www.facebook.com/images/assets_DO_NOT_HARDCODE/facebook_icons/feedback_filled_24_artillery-orange.png" alt="">
	               	 문제를 선택한 후 게시물을 신고할 수 있습니다.<br>
            	</div>
               	 
               	 <div class="dResonArea">
               	 	<span>영리목적/홍보성</span>
               	 </div>
               	 <div class="dResonArea" >
               	 	<span>불법정보</span>
               	 </div>
               	 <div class="dResonArea" >
               	 	<span>음란성/선정성</span>
               	 </div>
               	 <div class="dResonArea" >
               	 	<span>욕설/인신공격</span>
               	 </div>
               	 <div class="dResonArea" >
               	 	<span>개인정보노출</span>
               	 </div>
               	 <div class="dResonArea" >
               	 	<span>같은 내용의 반복 게시(도배)</span>
               	 </div>
               	 <div class="dResonArea" role="checkbox" aria-checked="false">
               	 	<span>기타</span>
               	 </div>
            </div>
            
            <div class="declareBtnArea">
            	<button onclick="">보내기</button>
            </div>
        </form>
    </div>
</div>





<script>
	

	
	// 처음엔 안보이게 하는 요소들
	$("#cPhotoPreview").hide(); // 댓글 사진올리기 미리보기창
	$(".menuOpen").hide(); // 메뉴창
	$(".declareOuter").hide(); // 신고하기창
	$(".sMainOuter").hide(); // 신고하기창
	
	
	/* 사진 상세보기 관련 */
	$(".lPhotoOuter").mouseenter(function(){ // 사진상세보기페이지에서 마우스 올렸을때 나오게만들기
		$(".hoverItem").show(); 
		
	}).mouseleave(function(){
		$(".hoverItem").hide();
	});
	
	
 	$("#menuOpenBtn2").click(function(){ // 메뉴버튼 클릭시
 		$(".menuOpen").show(); 
 		
 		$("#bDeclareBtn").click(function(){ // 신고하기 클릭시
 	         $(".declareOuter").show();
 	     });
 		
 	return false; //중요
 	});
	  // 메뉴버튼 외에 영역 클릭시 창꺼지도록
     $(document).click(function(e){ //문서 body를 클릭했을때
 		if(e.target.className =="rTopArea"){return false} //내가 클릭한 요소(target)를 기준으로 상위요소에 클래스이름이 .rTopArea 없으면 (갯수가 0이라면)
 		$(".menuOpen").stop().fadeOut(500); // 창꺼주기 		
	 });
	  
	  
     
     $("#commentBtn3").click(function(){ // 사진상세보기 댓글클릭시
         $(".cText").children().focus().val("");
         $(".cText").children().css("color","black");
     });
     $("#commentBtn2").click(function(){ // 사진상세보기 댓글클릭시
         $(".cText").children().focus().val("");
         $(".cText").children().css("color","black");
     });
     
     
     $(".ycBottom2").click(function(){ // 댓글에 있는 좋아요 클릭시
         $(this).children().eq(0).css("color","rgb(32, 120, 244)");
         $(this).children().eq(0).css("font-weight","bold");
         $("#reLikeCount").attr("src","<%=contextPath%>/resources/image/hye/좋아요수.png");
         $("#reLikecNum").text(7);
         
      });
     
     
	
	  
	/* 신고하기 관련 */
	 $("#declareX").click(function(){ // 신고하기 x창끄기버튼 클릭시
         $(".declareOuter").hide(); 
     });
	 
	 $(".dResonArea").click(function(){ // 신고사유 버튼 클릭시 
		$(this).css({"background":"#3578e5", "border":"1px solid#3578e5","color":"white"});
		$(this).attr("aria-checked",true);			
	 });
	 
	 

	 
	 /* 댓글 사진미리보기 기능 */
	
	 function closeView(){ // 사진미리보기창 꺼주기
 		$(".titleImg2").removeAttr("src"); // 사진선택 지워주기
 		$("#cPhotoPreview").hide();
 		$(".downIn2").height("55%");
 	 }
	 
	
	 // 각 div(사진넣는곳) 클릭할 때 파일 첨부 창이 뜨도록
		$(function(){
			 
			 $(".cameraIcon2").click(function(){ // 카메라아이콘 클릭시
				$(".hidden_elem2").click(); // 사진등록창키고
				$(".downIn2").height("45%"); // 댓글올라오는창 줄이고
			}); 
		});
		
	 
		
		/* this 는 value가 받고 숫자는 num으로 받음  */
		function loadImg(value, num){
			
			// 파일의 존재 유무
			if(value.files && value.files[0]){ // 파일선택시 하나만 담기기때문에 0번인덱스값
				
				// 1. 파일을 읽어들일 FileReader 자바스크립트 내장 객체 생성
				var reader = new FileReader(); 
				
				// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e){
					
					$("#cPhotoPreview").show();	
					$("#titleImg2").attr("src",e.target.result);
					
					if($(".addReply").val == "댓글을 입력하세요..."){
						
						$(".addReply").focus().val("");
					}else {
						
						$(".addReply").focus();
					}
					
					
				}
					
				// 파일 읽기 메소드
				reader.readAsDataURL(value.files[0]);
				
			
			}
		}
	 $(".addReply").click(function(){ // 써있는값 지워주기
         $(this).val(""); 
	 	 
     });
	 
	
		
	  $(function(){
			// 화면 로딩시 댓글 출력
			selectRlist();
			selectRcountList();
			selectLcountList();
			
			setInterval(function(){
				selectRlist();
				selectRcountList();
				selectLcountList();
			},1000000);
			
			$(".addReply").keydown(function(key){
				if(key.keyCode == 13){
					
					var form = $('#uploadForm')[0];
    				var formData = new FormData(form);
					var content = $(".addReply").val();
			
					$.ajax({
							url:"rinsert.new",
							type: "POST",
            				enctype: 'multipart/form-data',
							data: formData,
							contentType : false,
       	 					processData : false, 
							success:function(status){
								
								if(status == "success"){
									selectRlist();
									selectRcountList();
									$(".addReply").val("");
									
									$("#cPhotoPreview").hide();
									$(".downIn2").height("55%");
									$(".addReply").focus();
									
								}else{
									alert("댓글작성실패!!");
									
								}
							},error:function(){
								console.log("서버와의 통신 실패!");
							}
					});
					
				}
			})
		}); 
		


	  function selectRlist(){
		  
		  $.ajax({
			 	url:"rlist.new",
			 	data:{bNo:<%=b.getbNo()%>},
			 	dataType:"json",
			 	success:function(list){
			 		
			 		//console.log(list);
			 		
			 		var $replyArea = $("#replyArea"); // 댓글담는 <div> </div>
			 		
 			 		$replyArea.html(""); // 기존 테이블 정보 초기화 
			 		
			 		$.each(list,function(index, value){
			 			
						var imgpath = '/teamace'+ value.imgPath; // 댓글 이미지경로
						console.log(value.imgPath);
			 			
			 			var $youComment2 = $("<div>").css({"height":"auto", "display":"flex"});
			 			var $yImgArea2 = $("<div>").css({"width":"15%", "display":"flex"});
			 			var $userImg2 = $("<img>").attr("src",value.profileImage).css({"border-radius":"20px","margin":"auto","border": "0.5px solid #ccd0d5","width":"40px", "height":"40px"});
			 			
			 			var $cWriteArea2 = $("<div>").css({"width":"85%","height":"auto"});
			 			
			 			var $cWrite2 = $("<div>").css({"background-color":"#f2f3f5", "display":"flow-root","border-radius":"18px","padding":"8px", "width":"max-content","align-items":"center"});
			 			var $comment1 = $("<a>").text(value.mName).css({"color":"#385898", "font-weight":"900", "display":"flex"});
			 			var $content1 = $("<div>").text(value.rComment).css({"height":"100%", "display":"flex"});
			 			var $imgDiv = $("<div>").css({"display":"inline-block"});
			 			var $imgArea = $("<img>").attr("src", imgpath).css({"max-width":"200px", "max-height":"200px"});
			 			
			 			var $ycBottom2 =$("<div>").css({"height":"40%", "width":"100%","display":"flex"});
			 			var $rlikeBtn =$("<span>").text(" 좋아요").css({"font-size":"12px", "color":"rgb(56,88,152)"});
			 			var $comma = $("<span>").text(" ·  ").css({"font-size":"12px", "color":"rgb(56,88,152)"});
			 			var $date1 = $("<span>").text(value.rDate).css({"font-size":"12px", "color":"rgb(56,88,152)"});
			 			
			 			var $reLikeArea = $("<div>").css({"background":"white","border-radius":"12px","width":"max-content"})
			 			var $reLikeCount = $("<img>").attr("src","<%=contextPath%>/resources/image/hye/좋아요수.png").css({"ertical-align":"bottom", "position":"absolute", "width":"22px", "position": "inherit"});
			 			var $reLikeNum = $("<span>").text(1).css({"padding-left":"1%", "vertical-align":"top","display": "contents"});
 			

			 			$ycBottom2.append($rlikeBtn);
			 			$ycBottom2.append($comma);
			 			$ycBottom2.append($date1);
			 			
			 			$cWrite2.append($comment1);
			 			$cWrite2.append($content1);
			 			
		 	 			if(value.imgPath != "/resources/image/hye/null"){	// 댓글이미지도올린경우 
			 				
			 				$cWrite2.removeAttr("display");
			 				$imgDiv.append($imgArea);
			 				$cWrite2.append($imgDiv);
			 				
			  			} 
			 			$cWriteArea2.append($cWrite2);
			 			
			 			$reLikeArea.append($reLikeCount);
			 			$reLikeArea.append($reLikeNum);
			 			
			 			$cWriteArea2.append($ycBottom2);
			 			
			 			
			 			$yImgArea2.append($userImg2);
			 			$youComment2.append($yImgArea2);
			 			$ycBottom2.append($reLikeArea);
			 			$youComment2.append($cWriteArea2);
			 		
			 			$replyArea.append($youComment2); 
			 			
			 			$($rlikeBtn).click(function(){ // 댓글 좋아요 클릭시
			 		   	    $(this).css("color","rgb(32, 120, 244)");
							
			 				
			 		   	 }).mouseenter(function(){
			 		   		 $(this).css({"cursor":"pointer","text-decoration":"underline"});
			 		   	 }).mouseleave(function(){
			 		   		$(this).css({"cursor":"none","text-decoration":"none"});
			 		   	 });
		 			
			 			
			 		});
			 		
			 	},error:function(){
			 		console.log("서버와의 통신 실패!!");
			 	}
			 	
		  });
	  }
	  
	  
	 function selectRcountList(){ //댓글총갯수 
		 
		 $.ajax({
			url:"clist.new",
			data:{bNo:<%=b.getbNo()%>},
			dataType:"json",
			success:function(clist){
				
				
				var $countsArea = $(".cShare"); // 카운트수 담는 div
				
				$countsArea.html(""); // 초기화
					 
					 var text = new Array();
           
			         text[0] =     '<span><a href="" style="font-size:13px">댓글 ' + clist  +'개 </a>';     
			         text[1] =     '</span>';
	
			         
			         var totalText = "";
			         for (var i = 0; i < text.length; ++i) {
			            totalText += text[i];
			         }
			         
			         $countsArea.append(totalText);
			         
					 
			
			},error:function(){
				console.log("서버와의 통신 실패!!");
			}
		 });
	 }

	 
	 
	//-------------- 좋아요 -----------------	   
	   $(function() {
		   
		   var $btn = $(".likeAllBtn>input");
		   
		   for (var index = 0; index < $btn.length; ++index) {
			   boardLikeImgChange($btn.eq(index).val(), index); // 좋아요 색깔 변경하는 ajax에 글번호와 인덱스번호 같이 보내주기
			   console.log($btn.eq(index).val(), index);
		   }
		   
	   });
		   
	//--------- 좋아요기능 ------------	   
	function boardLikeBtn(bNo){
		var mNo = <%= loginUser.getmNo()%>;
		
		$.ajax({
			url:"boardLike.news",
			data:{bNo:bNo,mNo:mNo},
		 	dataType:"text",
		 	type:"post",
		 	success:function(){
		 		
		 		console.log("갱신완료!");
		 		boardLikeImgChange(bNo);
		 		
		 	},error:function(request,status,error){
		 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 		console.log("boardLikeBtn 통신 실패!!");
		 	}
		});
	};

	// 좋아요 색깔 바꾸는 기능
	function boardLikeImgChange(bNo){ //좋아요 이미지 변경
		var mNo = <%= loginUser.getmNo()%>;
		
		$.ajax({
			url:"boardLikeChange.news",
			data:{bNo:bNo,mNo:mNo},
		 	dataType:"text",
		 	type:"post",
		 	success:function(msg){
		 		
		 		if(msg=="success"){
		 			$(".likeImage").attr("src","<%=contextPath%>/resources/image/hye/좋아요클릭.png"); 
		 			$(".clickLikeName").css("color","rgb(32, 120, 244)"); // 좋아요글자 색깔 바꾸기
		 			<%-- <%=list.get(i).getbLike()%>+1;   --%>
		 		}else{
		 			$(".likeImage").attr("src","<%=contextPath%>/resources/image/hye/좋아요.png"); 
		 			$(".clickLikeName").css("color","rgb(96, 103, 112)"); // 좋아요글자 색깔 바꾸기
		 			<%-- <%=list.get(i).getbLike()%>-1; --%>
		 		}
		 		console.log("갱신완료!");
		 	},error:function(){
		 		console.log("boardLikeBtn 통신 실패!!");
		 	}
		});
		

	}
	
	
	
	function selectLcountList(){ //좋아요총갯수 
		 
		 $.ajax({
			url:"llist.new",
			data:{bNo:<%=b.getbNo()%>},
			dataType:"json",
			success:function(llist){
				console.log("보자"+ llist);
				
				var $countsArea = $(".cLike2"); // 카운트수 담는 div
				
					$countsArea.html(""); // 초기화
					 
					 var text = new Array();
					 
					 
					 if(llist > 0){ // 좋아요가 있는경우
						 
			         text[0] =    '<div><img src="<%=contextPath%>/resources/image/hye/좋아요수.png" alt></div>';
			         text[1] =    '<span>' +  llist +'</span>'; 
					 
					 }else{
						 
					 text[0] = '<div></div>';
					 text[1] = '<span></span>';
					 }
   
			         var totalText = "";
			         for (var i = 0; i < text.length; ++i) {
			            totalText += text[i];
			         }
			         
			         $countsArea.append(totalText);
			         
					 
			
			},error:function(){
				console.log("서버와의 통신 실패!!");
			}
		 });
	 }


	  
 	  
 	     
	 
</script>


</body>
</html>