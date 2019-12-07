<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("b");

	ArrayList<BoardImage> polist = (ArrayList<BoardImage>)request.getAttribute("polist");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(function(){
		
		$(".menuOpen").hide(); // 메뉴창
		$(".tagView").hide(); // 친구태그입력영역
	
		/* 스크롤내려도 화면 중간에 오도록 */
        var winWidth = window.innerWidth / 2;
        var winHeight = window.innerHeight / 2;
        $(".shareOuter").css("margin-left", winWidth - 250);
        $(".shareOuter").css("margin-top", winHeight - 250); 
        
	});
	
	
	// 메뉴버튼 외에 영역 클릭시 창꺼지도록
    $(document).click(function(e){ //문서 body를 클릭했을때
		if(e.target.className =="rTopArea"){return false} //내가 클릭한 요소(target)를 기준으로 상위요소에 클래스이름이 .rTopArea 없으면 (갯수가 0이라면)
		$(".newMenu").fadeOut(500); // 창꺼주기
		if(e.target.className == "sRightBtns"){return false}
		$(".shareLevel").fadeOut(500);
	 });
	
</script>

<style>
	/* 공유하기화면 */
		.updateImg{
			display:flex;
		}
		textarea{
			outline: none;
		    border: none;
		    color: rgb(96, 103, 112);
		    font-family: inherit;
		    resize:none;
		    width: 500px;
		    font-size: 16px;
		}
		.addIcon{
			display:none;
		}
        .shareOuter{
            width:500px;
            background-color: #fff;
            border-radius: 3px;
            box-shadow: 0 2px 26px rgba(0, 0, 0, .3), 0 0 0 1px rgba(0, 0, 0, .1);
            position: fixed;
            height:auto;
            box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
            z-index : 100;
        }
        .shareIn{
            background-color: #fff;
            border-radius: 3px;
            position: relative;
            opacity: 1;
        }
        .shareUp{
            background-color: #f5f6f7;
            border-bottom: 1px solid #e5e5e5;
            border-radius: 3px 3px 0 0;
            color: #1d2129;
            font-weight: bold;
            line-height: 19px;
            padding: 10px 12px;
            height:10%;
            display:flex;
        }
        .shareUp>div{
            height:100%;
        }
        .sTitle{
            width:80%;
            color:rgb(75, 79, 86);
            font-size: 15px;
            font-weight: 700;
            line-height:26px;
        }
        .sXbtn{
            width:20%;
        }
        .sXbtn img{float:right; }
        .shareDown{
            border-bottom-left-radius: 3px;
            border-bottom-right-radius: 3px;
            height:90%;
        }
        .sTextArea{
            overflow: hidden;
            position: relative;
            /* height:auto; */
            height:30%;
        }
        .sTextOut{
            padding:1%;
            font-size: 14px;
            height: 100%;
            line-height: 18px; 
            resize: none;
            background: #fff;
        }
        .sTextOut>div{
        	 outline: none;
        	 user-select: text;
        }
        .originAdd{
            height:5%;
            font-size: 12px;
            }
        .sPhotoArea{
            height:60%;
            /* margin: 14px 12px; */
            margin:1%;
            max-width: 530px;
            overflow: hidden;
            /* position: relative; */
            margin-top: 3%;
        }
        .sBtns{
            height:15%;
            background-color: #f5f6f7;
            border-radius: 0 0 3px 3px;
            border-top: 1px solid #dddfe2;
            display: flex;
        }
        .sBtns>div{
            display: inherit;
        }
        .fTag{
            width:60%;
            padding-left: 2%;
        }
        .hideInfo{
            border: 1px solid #ebedf0;
            border-bottom-style: none;
            padding: 1% 1% 1%;
        }
        .sContent{
            border: 1px solid rgba(0, 0, 0, .1);
            border-top: none;
            /* margin-top: 3%; */
            padding: 0 1% 1%;
            display: flex;
        }
        .sContent>div{
        	height: 150px;
    		width: 180px;
        }
        .sContent>div>span{
        	float:right;
        }
        .sContent>div>img{
            max-width: 150px;
            max-height:200px;
        }
        .sContent>div:hover{
        	border: 2px dashed darkgray; 	
        }
        .sContent>div>img:hover, .sContent>div>span:hover{
        	cursor:pointer;
        }
        .sRightBtns{
            display: flex;
            cursor: pointer;
            display: inline-block;
            text-decoration: none;
            white-space: nowrap;
            width:40%;
        }
        .sLevelBtn, .grayBtn{
            background-color: #f5f6f7;
            color: #4b4f56;
        }
        .sLevelBtn, .sRightBtns>button{
            border: 1px solid #ccd0d5;
            border-radius: 2px;
            font-weight: bold;
            font-size: 11px;
            padding: 0 3%;
            text-align: center;
            height:80%;
            line-height: 10%;
        }
        .sLevelBtn{
            padding-bottom: 2%;

        }
        .sRightBtns>button{
            width:20%;
            margin-left: 3%;
        }
        .blueBtn{
            background-color: #4267b2;
            margin-left: 4px;
            color:white;
        }
        .tagView{
            border-top: 1px dotted #dddfe2;
            font-size: 12px;
            display: flex;
        }
        .tagView>div{
            height:100%;
            display: flex;
            outline: none;
        }
        .friendName{
            user-select: text;
            width:85%;
        }
        .friendName:hover{
            cursor:text;
            
        }
        #withFriend{
            background: #e2e8f6;
            width:15%;
            border-right: 1px dotted #dddfe2;
        }
        #sImg{
            border-radius: 35px;
            width: 100%;
            height: 50%;
        }
        .lTopArea3{
            width:13%;
        }
        .shareLevel{
            width:auto;
            line-height: 35px;
            padding-top: 0%;
            font-size:12px;
        }
        .shareLevel>div{
            background-color: #f5f6f7;
            color:black;
        }
        .shareLevel>div:hover{
            color:white;
        }
        
        
         /* 삭제여부창 */
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
        .cancleOuter{
        	position:fixed;
            width: 445px;
            height:150px;
        }
        .qView{
            float: right;
            display: flex;
            margin-right: 3%;
            font-size: 14px;
        }
        /* 공개대상 메뉴창(수정하기창)  */
         .shareLevel>div{
          font-weight: 550;
          padding: 6px 12px;
          font-size: 13px;
          }
          .shareLevel>div div {
		    font-size: 12px;
		    color: rgb(144, 148, 156);
		    display: block;
		    line-height: 16px;
		  }
		        
        
            /* 메뉴눌렀을시 메뉴창 */
  
          .menuOpen {
          background-clip: padding-box;
          background-color: #fff;
          border: 1px solid rgba(0, 0, 0, .15);
          border-radius: 3px;
          box-shadow: 0 3px 8px rgba(0, 0, 0, .3);
          border-top-right-radius: 0;
          width: 240px;
          height:auto;
          color:rgb(29, 33, 41);
        /*  line-height:50px;  */
          text-align: left;
          padding-top: 2%;
          padding-bottom: 2%;
          position: absolute;
          }
         /*  .menuOpen>div{
          font-weight: 550;
          padding: 0 12px;
          }
          .menuOpen>div div{
          font-size:10px; 
          color: rgb(144, 148, 156);
          display: block;
          line-height: 16px;
          } */
          .menuOpen>div>span{
          	vertical-align: super;
          }
          .menuOpen>div:hover{
              cursor: pointer;
              background: #3578E5;
              color:white;
              border-top:1px solid black;
              border-bottom:1px solid black;
          }
        
        
        
</style>
</head>
<body>

	<%@ include file="/views/jong/menubar.jsp" %>
	
	<!-- 수정하기화면 -->
	<div class="sMainOuter updateNew">
    	<div class="shareOuter">
        	<div class="shareIn">
        		<form action="<%=contextPath%>/update.news?bNo=<%=b.getbNo() %>" method="post" id="updateForm"  enctype="multipart/form-data">
            		<div class="shareUp">
                		<div class="sTitle" id="sTitle">
                			<img src="<%=contextPath%>/resources/image/hye/pencil-line.png" alt=""">
                			게시물 수정                                          	
                		</div> <%-- sTitle 끝 --%>
                		
                		<div class="sXbtn">
                    		<a href="<%=contextPath%>/test.me">
                        		<img src="<%=contextPath%>/resources/image/hye/취소아이콘.png" alt="">
                    		</a>
                		</div> <%-- sXbtn 끝 --%>
            		</div> <%-- shareUp 끝 --%>
            		
            		<div class="shareDown">
                		<div class="sTextArea">
                    		<div class="sTextOut">
                    			<textarea name="content" id="content" rows="5;" ><%= b.getbContent() %></textarea>
                    		</div> <%-- sTextOut 끝 --%>
                		</div> <%-- sTextArea 끝 --%>
                		
                		<div class="sPhotoArea">                    
                    		<div class="sContent">
                    			<% for(BoardImage p : polist) { %>
                    			<div class="updateImg">
                    				<input type="hidden" id="imgContent" name="imgPath" value="<%= p.getImgNo() %>">
                        			<img src="<%=contextPath%><%=p.getImgPath()%>" alt="">
                        			<span class="cancleImgBtn">X</span>
                        		</div>
                        		<% } %>
                        		<!-- 파일 업로드 하는 부분 -->
                        		<div id="fileArea">
	                    			<div id="addImgArea1">
	                    				<input type="file" class="fileArea" id="uploadImg1" onchange="loadImg(this, 1);">
	                    				<img class="addIcon1" src="<%=contextPath%>/resources/image/hye/사진추가아이콘.png" >
	                    			</div>
	                    			<div id="addImgArea2">
	                    				<input type="file" class="fileArea" id="uploadImg2" onchange="loadImg(this, 2);">
	                    				<img class="addIcon2" src="<%=contextPath%>/resources/image/hye/사진추가아이콘.png" >
	                    			</div>
	                    			<div id="addImgArea3">
	                    				<input type="file" class="fileArea" id="uploadImg3" onchange="loadImg(this, 3);">
	                    				<img class="addIcon3" src="<%=contextPath%>/resources/image/hye/사진추가아이콘.png" >
	                    			</div> 
                    			</div>
                    		</div>
                		</div> <%--sPhotoArea 끝 --%>
                		
                		<div class="tagView">
                    		<div id="withFriend">함께한 친구</div>
                    		<div class="friendName" contenteditable="true"></div>
                		</div>  <%--tagView 끝 --%>
                		
                		<div class="sBtns">
                    		<div class="fTag">
                        		<img src="<%=contextPath%>/resources/image/hye/group-fill.png" alt="">
                    		</div> <%--fTag 끝 --%>
                    		
                    		<div class="sRightBtns">
                        		<div class="sLevelBtn">
                            		<span>
                            			<img src="<%=contextPath%>/resources/image/hye/group-fill.png" alt="" width="20px" height="20px">
                            		</span>
                            		<span id="levelName"></span>
                            		<span>
                            			<img src="<%=contextPath%>/resources/image/hye/arrow-bottom-s-fill.png">
                            		</span>
                        		</div> <%--sLevelBtn 끝 --%>
                        		
	                        	<div class="menuOpen shareLevel">
	                           		게시물 공개 대상
	                                <div id="all">
	                                	<img src="<%=contextPath%>/resources/image/hye/earth-line.png" alt="">
	                                	<span>전체공개</span>
	                                    <div>Acebook 내외의 모든 사람</div>
	                                </div>  <%--all 끝 --%>
	                                <div id="friend">
	                                	<img src="<%=contextPath%>/resources/image/hye/group-line.png" alt="">
	                                	<span>친구</span>
	                                    <div>회원님의 Acebook 친구</div>
	                                </div>
	                                <div id="onlyMe">
	                                	<img src="<%=contextPath%>/resources/image/hye/lock-line.png" alt="">
	                                	<span>나만보기</span>
	                                    <div>나만 보기<br></div>
	                                </div>
	                        	</div>  <%--menuOpen sharelevel 끝 --%>
	                        	<button class="grayBtn shareCancel" onclick="history.go(-1);">취소</button>
	                        	<button class="blueBtn sharePrint" id="editBtn" onclick="return updateNewsfeed();">게시</button>
                    		</div>  <%--srightBtn 끝 --%>
                		</div>  <%--sBtns 끝 --%>
            		</div>  <%-- shareDown 끝 --%>
        		</form>
        	</div>  <%-- shareIn 끝 --%>
    	</div>  <%-- shareOuter 끝 --%>
	</div>  <%-- sMainOuter 끝 --%>
	
	
	<script>

		
		
		$(".addImgArea1").mouseenter(function(){ // 댓글 좋아요 클릭시
		   	    $(".addIcon").attr("display","block");
		   	 });
		
 
		function loadImg(value, num){
			
			if(value.files && value.files[0]){ // 파일선택시 하나만 담기기때문에 0번인덱스값(파일 존재유무확인)
				
				// 1. 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader(); 
				
				// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e){
					
					switch(num){
					case 1: $(".addIcon1").attr("src", e.target.result); // data:URL
							break;
					case 2: $(".addIcon2").attr("src", e.target.result);
							break;
					case 3: $(".addIcon3").attr("src", e.target.result);
							break;
					}
				}
				
				// 파일 읽기 메소드
				reader.readAsDataURL(value.files[0]);
			
			}
		}
		
		
		// 사진 추가 div클릭시 파일 첨부창이 뜨도록!
		$(function(){
			$("#fileArea").hide(); // 값은 들어가있지만 display:none으로 보이지않게 작업하기
			
			$("#addImgArea1").click(function(){
				$("#uploadImg1").click();
			});
			$("#addImgArea2").click(function(){
				$("#uploadImg2").click();
			});
			$("#addImgArea3").click(function(){
				$("#uploadImg3").click();
			});
		
		});
	
		
		function updateNewsfeed(){
			$("#updateForm").submit(); // form 전송
		}
		
		
		
		
		
		
		

	
		// 사진안에 x버튼 클릭시 사진 삭제
		$(".cancleImgBtn").click(function(){ 
			
			$(this).parent().hide(); // 해당창 없애기
			$(this).parent().children().eq(0).val(""); // 이미지경로값 지워주기
			
		});
		
		//------- 게시물 공개 대상창 -------------
		$(".sLevelBtn").click(function(){ // 게시물 공개 대상창 열리도록
			$(".shareLevel").show();
			
			console.log(this);
			
			$("#all").click(function(){	// 전체공개 클릭시			
				var $selectName = $(this).children().eq(1).text(); // 전체공개 이름담고
				var $selectImg = $(this).children().eq(0).attr("src"); // 전체공개 이미지담고
	
				$(".sLevelBtn").children().eq(1).text($selectName); // 전체공개 이름 넣어주기
				$(".sLevelBtn").children().children().eq(0).attr("src",$selectImg); // 전체공개 이미지 넣어주기
			
			}); 
			
			
			$("#friend").click(function(){
				var $selectName = $(this).children().eq(1).text(); // 전체공개 이름담고
				var $selectImg = $(this).children().eq(0).attr("src"); // 전체공개 이미지담고
				
				$(".sLevelBtn").children().eq(1).text($selectName); // 전체공개 이름 넣어주기
				$(".sLevelBtn").children().children().eq(0).attr("src",$selectImg); // 전체공개 이미지 넣어주기
			}); 
			
			
			$("#onlyMe").click(function(){
				var $selectName = $(this).children().eq(1).text(); // 전체공개 이름담고
				var $selectImg = $(this).children().eq(0).attr("src"); // 전체공개 이미지담고
				
				$(".sLevelBtn").children().eq(1).text($selectName); // 전체공개 이름 넣어주기
				$(".sLevelBtn").children().children().eq(0).attr("src",$selectImg); // 전체공개 이미지 넣어주기
			}); 
			
			
		
			return false; // 다른부분누르면 창닫히게
		});	

	</script>
	
	
	
	
</body>
</html>