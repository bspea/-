<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.qa.model.vo.QABoard"%>   
<%
	QABoard qa = (QABoard)request.getAttribute("qa");

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	font-family: "Arial";
}

/* font 관련 부분*/
#right-top, .ment999 {
    color:rgb(60, 60, 60);
    /* color:black; */
}

#top-header {
	background: #ffc101;
	width: 100%;
	height: 40px;
}

#couter {
	margin: auto;
	width: 1000px;
	height: 500px;
	background: white;
}

#top-menu {
	margin: auto;
	width: 100%;
	background: #ffc101;;
}

#menu p {
	padding-right: 15px;
	display: inline-block;
	background: #ffc101;;
	font-size: 12px;
	color: rgb(50, 0, 100);
}

#menu p:hover {
	color: rgb(70, 0, 120);
	text-shadow: 1px 1px 1px rgb(150, 150, 150);
	cursor: pointer;
}

#louder-menu {
	width: 100%;
	height: 100%;
}

#left-menu {
	width: 250px;
	height: 50px;
	float: left;
	text-align: left;
	margin-left: 13px;
	margin-top: 25px;
	padding-bottom: 18px;
}

#lmdiv {
	width: 80%;
	height: 75px;
	border-bottom: 1px solid rgb(247, 243, 247);
}

#lmb1, #lmb2, #lmb13 {
	transition-duration: 0.2s;
}

#lmphoto {
	float: left;
	width: 30%;
	height: 50px;
	box-sizing: border-box;
}
#lmphoto>img {
	width: 50px;
	height: 50px;
}

#lmphoto:hover {
	cursor: pointer;
}

#lmrdiv {
	float: left;
	box-sizing: border-box;
	width: 70%;
}

#lmrdiv a {
	text-decoration: none;
}

#lmrdiv a:hover {
	text-decoration: underline;
	text-shadow: 1px 1px 1px rgb(150, 150, 150);
}

#lmname {
	margin: 0px;
	float: left;
	width: 200px;
	height: 19px;
	box-sizing: border-box;
	font-size: 13px;
	color: rgb(50, 0, 100);
}

#lmrbdiv {
	box-sizing: border-box;
	width: 100%;
	height: 16px;
	display: inline-block;
}

#lmrbdiv p {
	display: inline-block;
	margin: 0px;
	box-sizing: border-box;
	height: 16px;
	font-size: 11px;
	color: rgb(50, 0, 100);
}

#lmrbdiv p:hover {
	text-shadow: 1px 1px 1px rgb(150, 150, 150);
	cursor: pointer;
}

#left-menu-bottom {
	float: left;
}

#left-menu-bottom p {
	margin: 0px;
	vertical-align: middle;
	padding-top: 15px;
	width: 200px;
	height: 37px;
	font-size: 12px;
	color: rgb(50, 0, 100);
	border-bottom: 1px solid rgb(247, 243, 247);
}

#left-menu-bottom p:hover {
	background: #ffd966;
	cursor: pointer;
	text-shadow: 1px 1px 1px rgb(150, 150, 150);
}

#right-menu {
	width: 734px;
	float: right;
	font-size: 18px;
	margin: 0px;
	box-sizing: border-box;
}

#right-menu-top {
	height: 50px;
	/* line-height: 90px; */
}

#right-menu-p p {
	line-height: 55px;
}

#wiconwrap {
	float: right;
	height: 40px;
	margin-top: 11px;
}

#wicon {
	float: left;
	background: #ffffff85;
	background-color: #f5f6f7;
	border: 1px solid #f5f6f7;
	height: 23px;
	border-top-left-radius: 2px;
	border-bottom-left-radius: 2px;
}

#wcon {
	vertical-align: middle;
	margin-right: 5px;
	width: 17px;
	height: 17px;
}

#qanda {
	font-size: 12px;
	width: 86px;
	height: 24px;
	float: right;
	font-weight: bold;
	background-color: #f5f6f7;
	border: 1px solid #ccd0d5;
	border-radius: 3px;
	margin-top: 15px;
}

#qanda:hover {
	background: rgb(240, 240, 240);
	cursor: pointer;
}

#right-borard-list {
	border-top: 1px solid rgb(255, 221, 107);
	background: rgb(255, 231, 137);
	height: 30px;
}

#board-list p {
	padding-bottom: 2px;
	padding-left: 2px;
	padding-right: 2px;
	margin-left: 4px;
	margin-right: 4px;
	margin-top: 5px;
	display: inline-block;
	font-size: 12px;
	color: rgb(50, 0, 100);
	border-radius: 3px;
	cursor: pointer;
}

.right-borard-list {
	width: 100%;
	height: 80px;
	border-bottom: 1px solid rgb(247, 243, 247);
	transition-duration: 0.2s;
}

.right-borard-list:hover {
	background: rgb(245, 245, 245);
}
/* 왼쪽 div 2등분 */
.board-left {
	float: left;
	width: 10%;
	height: 100%;
}

.board-left-top {
	width: 100%;
	height: 50%;
	text-align: center;
	line-height:50px;
	/* font-weight: bold; */
}

.board-left-top>label:hover {
	cursor: pointer;
}

.board-left-bottom {
	width: 100%;
	height: 40%;
	text-align: center;
}

.board-right {
	float: right;
	width: 90%;
	height: 100%;
}
/* 오른쪽 div 2등분 */
.board-right-top {
	width: 100%;
	height: 50%;
	line-height:50px;
}
.board-right-top a {
	font-weight: bold;
}

.board-right-bottom, .board-left {
	color: rgb(140, 140, 140);
}

.board-right-top a, .board-right-bottom a {
	text-decoration: none;
	color: #643000;
}


.board-right-top>p>a:hover {
	text-decoration: underline;
}

.board-right-bottom>p>a:hover {
	text-decoration: underline;
}

.board-right-bottom {
	width: 100%;
	height: 50%;
	line-height:21px;
}

.board-right-top>p {
	font-size: 14px;
	margin: 0px;
}

.board-right-bottom>p {
	font-size: 12px;
	margin: 0px;
	display: inline-block;
	vertical-align: text-top;
}

.btns {
	text-align: center;
}

#pre1btn, #pre2btn, #midbtn, #next1btn, #next2btn, #searchbtn {
	background: rgb(240, 240, 240);
	border: 1px solid rgb(200, 200, 200);
	border-radius: 7px;
	height: 35px;
	background: none;
	border: none;
}

#pre1btn:hover, #pre2btn:hover, #midbtn:hover, #next1btn:hover,
	#next2btn:hover, #searchbtn:hover {
	transition-duration: 0.2s;
	cursor: pointer;
	background: rgb(230, 230, 230);
}

#bottom-search {
	text-align: center
}
#bottom-search>input{
	width: 220px;
	margin-left:3px;
	margin-right:3px;
	
}

#search2 {

	width: 200px;
	height: 30px;
	background: #ffffff85;
	border: 1px solid rgb(220, 220, 220);
	border-radius: 5px;
	box-shadow: none;
	color: rgb(50, 0, 100);
	margin-right:20px;
}

#bottom-search>select{
	vertical-align: middle;
	width:68px;
	height:35px;
	background: #ffffff85;
	border: 1px solid rgb(220, 220, 220);
	border-radius: 5px;
	box-shadow: none;
	color: rgb(50, 0, 100);
}

    #hi{
        margin: auto;
        width: 700px;
        margin-left: 8px;
    }
    #hi1{
        border-bottom: 1px solid rgb(204, 204, 204);
        background: white;
        height: 60px;
    }
    #right-menu{
        width: 700px;
        font-size: 18px;
        margin: 0px;
        box-sizing: border-box;
        margin-top: 4px;
        
    }
    #right-menu>label{
        line-height: 55px;
        vertical-align: middle;
        
        
    }
    #wcon{
       vertical-align: middle;
       margin-right: 5px;
       width: 17px;
       height: 17px;
       
   }
    #qanda{  
        font-size: 12px;
        width: 86px;
        height: 24px;
        font-weight: bold;
        background-color: #f5f6f7;
        border: 1px solid #ccd0d5;
        border-radius: 3px;
        float:right;
        margin-top: 13px;
    }
    #border-go1{
        width: 100%;
        height: 70px;
        margin-top: 5px;
        border-bottom: 1px solid rgb(247, 243, 247);
        background: white;
    }
    #left-img{
        height: 55px;
        margin-top: 3px;
        float: left;
        width: 8%;
        

    }
    #left-img>img {
        width: 100%;
        height: 100%;
    }
    #right-text{
        width: 90%;
        float: left;
        margin-left: 10px;
    }
    #right-top{
        float: left;
        width: 92%;
        height: 40%;
        font-size: 12px;
        
    }
    #right-bottom{
        float: left;
        width: 92%;
        height: 60%;
        font-size: 12px;
        color: rgb(150, 150, 150);
    }
    #right-bottom a{
        text-decoration: none;
        font-weight: bold;
        color: rgb(180, 60, 1);
    }
    #right-bottom a:hover{
        text-decoration: underline;
        text-shadow: 1px 1px 1px rgb(150, 150, 150);

    }
    #serArea{
        padding-top: 10px;
        height: 80px;
        width: 100%;
        margin: auto;
    }
     #serArea img{
     	height:50px;
     	width:50px;
     }

    #img-an{
        float: left;
        margin-right: 8px;
    }
    #textar1{
        float: left;
        width: 640px;
        height: 100%;
    }
    #textArea1{
        /* background: red; */
        float: left;
    }
    #qareplyContent{
        float: left;
        font-size: 11px;
        resize: none;
        width: 636px;
        height: 44px;
        border: 1px solid rgb(230, 230, 230);
    }
    #hiden{
        float: right;
        /* border: 1px solid rgb(230, 230, 230); */
        /* background: rgb(255, 231, 137); */
        height: 30px;
        width: 640px;
        /* display: none; */

    }
    #textan{
        
        float: right;
        margin-top: 3px;
        margin-right: 3px;
        height: 20px;
    }
    #goanswer{
        font-weight: bold;
        height: 23px;
        width: 89px;
        font-size: 11px;
        color: white;
        background: #ffc101;
        border:  none;
        border-radius: 2px;
    }
    #goanswer:hover{
        background: #f1b500;
        transition-duration:0.2s;
        cursor: pointer;
    }




    #goodandbad{
        height: 30px;
        width: 100%;
        margin: auto;
        vertical-align: middle;
        text-align: center;
        background: rgb(255, 243, 199);
    }
    #good{
        float: left;
        width: 75px;
        height: 20px;
        margin: 0;
        line-height: 30px;
        font-size: 13px;
        vertical-align: middle;
    }
    #good:hover{
        cursor: pointer;
    }
    #good label:hover{
        cursor: pointer;
    }
    #good #good1{
        font-size: 13px;
        /* border-right: 1px solid gray; */
        /* color: #643000; */
        color : rgb(180, 60, 1);
    }
    #answerArea{
        height: 30px;
        width: 100%;
        margin: auto;
        vertical-align: middle;
        text-align: center;
        background: rgb(255, 243, 199);
        font-size: 11px;
    }
    #answer-left{
        margin-top: 6px;
        margin-right: 6px;
        margin-left: 6px;
        float: left;
    }
    #answer-right{
        margin-top: 2px;
        margin-right: 6px;
        margin-left: 6px;
        float: right;
        height:20px;
        color: rgb(50, 0, 100);
        border-radius: 3px;
    }
    #answer-right>p{
        transition-duration:0.2s;
        display: inline-block;
        margin:0;
        padding-bottom: 2px;
        padding-left: 2px;
        padding-right: 2px;
        margin-left: 4px;
        margin-right: 4px;
        margin-top: 5px;
        display:inline-block;
        color: rgb(50, 0, 100);
        border-radius: 3px;
        cursor: pointer;
    }

    .commentArea{
        float: left;
        width: 100%;
        height: 100%;
        padding-top: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid rgb(230, 230, 230);
    }
    .img1>img{
        width: 50px;
        height: 50px;
        margin-right: 8px;
    }
    .img1{
        width: 7%;
        height: 100%;
        float: left;
    }
    .mentArea{
        font-size: 12px;
        float: left;
        width: 636px;
        height: 100%;
        /* background: blue; */
        margin-left: 15px;
    }
    .mentNameArea{
        width:644px;
        height: 35px;

    }
    .mentName{
        width: 40%;
    }
    .mentName>a{
        font-size: 13px;
        text-decoration: none;
        font-weight: bold;
        color: rgb(180, 60, 1);
    }
    .mentName>a:hover{
        text-decoration: underline;
        text-shadow: 1px 1px 1px rgb(150, 150, 150);
    }
    .mentgood{
        width: 40%;
    }
    .mentgood>label{
        font-size: 11px;
        color: #90949c;
    }
    .ment999{
        margin-top: 3px;
        margin-bottom:6px;
    }
    .ment888{
        font-size: 11px;
        color: rgb(180, 60, 1);

        
    }
    .date000{
        color:rgb(200, 200, 200);
    }
    .ment888>img{
        width: 20px;
        height: 20px;
    }
    .date000:hover{
        cursor: pointer;
        text-decoration: underline;
        color:rgb(180, 180, 180);
    }
    .ment777{
        display: inline-block;
        font-size: 11px;
        color: rgb(180, 60, 1);
    }
    .ment777>img:hover,.good000:hover{
        cursor: pointer;
        color: rgb(180, 60, 1);
        text-decoration: underline;
    }
</style>
</head>
<body>
	<%@ include file="/views/chul/headercommu.jsp"%>
	<div id="top-header">
		<div id="couter">
			<div id="top-menu">
				<div id="menu">
					<p onclick="gohelp();">고객센터로 돌아가기</p>
					<p onclick="gocommunity();">고객 커뮤니티</p>
				</div>
				<!-- 탑부분 메뉴 끝나는시점 -->
			</div>
			<div id="louder-menu">

				<div id="left-menu">

					<div id="lmdiv">
						<div id="lmphoto">
							<img src="<%=loginUser.getProfileImage()%>">
						</div>
						<div id="lmrdiv">
							<div id="lmname">
								<a href=""><%=loginUser.getmName()%></a>
							</div>
							<div id="lmrbdiv">
								<p>
									<a href="">질문 0개</a>
								</p>
								<p>·</p>
								<p>
									<a href="">답변 0개</a>
								</p>
							</div>
						</div>
					</div>

					<div id="left-menu-bottom">
						<p id="lmb1">내 게시글</p>
						<p id="lmb2" onclick="gocommunity();">커뮤니티</p>
					</div>
				</div>


				<!-- 오른쪽 부분 -->
				<div id="right-menu">
                        <div id="hi">
                                <!-- top 부분 -->
                                <div id="hi1">
                                    <div id="right-menu">
                                        <label><%=qa.getQaTitle() %></label>
                                        <button id="qanda" onclick="location.href='<%=contextPath%>/views/chul/write.jsp';"><img src="<%=contextPath%>/resources/image/chul/write.png" id="wcon">질문하기</button>
                                    </div>
                                </div>
                                <!-- content 부분 -->
                                <div id="border-go1">
                                    <div id="left-img">
                                        <img src="<%=qa.getProfileImg()%>">
                                    </div>
                                    <div id="right-text">
                                        <div id="right-top">
                                            <%= qa.getQaContent() %>
                                        </div>
                                        <div id="right-bottom">
                                            <br>
                                            <label><a href=""><%=qa.getmName()%></a>님 <%=qa.getDate() %>에 질문</label><br>
                                            <label><%=qa.getQaLikeCount()%>표 <!-- · 팔로워 663명  DB에서 내가 갖고오면되는거임. -->· <%=qa.getQaView() %>명이 읽음</label>
                                        </div>
                                    </div>
                                </div>
                                <div id="goodandbad">
                                        <div id="good">▲<label id="good1"> 좋은 질문</label></div>
                                </div>
                                
                                <div id="serArea">
                                    <div id="img-an">
                                        <img src="<%=loginUser.getProfileImage()%>">
                                    </div>
                                    <div id="textar1">
                                        <div id="textArea1">
                                            <textarea id="qareplyContent" placeholder="답변 주가하기..." ></textarea>
                                            <div id="hiden">
                                            <div id="textan">
                                                <button id="goanswer">답변 추가하기</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                        
                                <div id="answerArea">
                                    <div id="answer-left">
                                        	답변
                                    </div>
                                    <div id="answer-right">
                                        <p id="an1">최근 답변</p><p id="gooder">추천수 많은 답변</p>
                                    </div>
                                </div>
                              
							<div id="replyTemplate">
								
							</div>
								
                                
                        
                                
                        
                        
                        
                            </div>
                        
					
				</div>



			</div>
		</div>

	</div>

	<script>
        $("#lmb1").click(function(){
            $("#lmb1").attr("style","background:#fcc82d");
            $("#lmb2").removeAttr("style","background:#fcc82d");
            $("#lmb3").removeAttr("style","background:#fcc82d");
        });
        $("#lmb2").click(function(){
            $("#lmb1").removeAttr("style","background:#fcc82d");
            $("#lmb2").attr("style","background:#fcc82d");
            $("#lmb3").removeAttr("style","background:#fcc82d");
        });
        $("#lmb3").click(function(){
            $("#lmb1").removeAttr("style","background:#fcc82d");
            $("#lmb2").removeAttr("style","background:#fcc82d");
            $("#lmb3").attr("style","background:#fcc82d");
        });


        $("#re").click(function(){
            $("#re").attr("style","background:#fcc82d");
            $("#re2").removeAttr("style","background:#fcc82d");
            $("#re3").removeAttr("style","background:#fcc82d");
            $("#re4").removeAttr("style","background:#fcc82d");

        });
        
        $("#re2").click(function(){
            $("#re").removeAttr("style","background:#fcc82d");
            $("#re2").attr("style","background:#fcc82d");
            $("#re3").removeAttr("style","background:#fcc82d");
            $("#re4").removeAttr("style","background:#fcc82d");

        });
        $("#re3").click(function(){
            $("#re").removeAttr("style","background:#fcc82d");
            $("#re2").removeAttr("style","background:#fcc82d");
            $("#re3").attr("style","background:#fcc82d");
            $("#re4").removeAttr("style","background:#fcc82d");

        });
        $("#re4").click(function(){
            $("#re").removeAttr("style","background:#fcc82d");
            $("#re2").removeAttr("style","background:#fcc82d");
            $("#re3").removeAttr("style","background:#fcc82d");
            $("#re4").attr("style","background:#fcc82d");

        });
        
        
        
        $(function(){
        	selectQARlist();
        	
        	$("#goanswer").click(function(){
        		var rcomment = $("#qareplyContent").val();
        		var qaNo = <%=qa.getQaNo()%>;
        		var mno = <%=loginUser.getmNo()%>;
        		
        		$.ajax({
        			url:"qarinsert.qabo",
        			type:"post",
        			data:{rcomment:rcomment, qaNo:qaNo, mno:mno},
        			success:function(status){
        				
        				if(status=="success"){
        					
        					$("#qareplyContent").val("");
        					
        					selectQARlist();
        				}else{
        					alert("실패인데 이유찾으세요");
        				}
        				
        			},error:function(){
        				consolog.log("통신실패");
        			}
        		});
        		
        		
        	});
        });
        
        function selectQARlist(){
        	$.ajax({
        		url:"qarlist.qabo",  // 여기 바꿔야할듯
        		data:{qaNo:<%=qa.getQaNo()%>},
        		dataType:"json",
        		success:function(list){
        			
        			
        			console.log(list);
        			
        			var $commentArea = $("#replyTemplate");
        			
        			$commentArea.html("");
        			
        			$.each(list, function(index, value){
        				addReplyList(value);
        			});
        			        			
        		},error:function(){
        			console.log("서버통신 실패");
        			
        			
        		}
        	});
        }

        
        
         $(function(){
        	$("#gooder").click(function(){
        		var rcomment = $("#qareplyContent").val();
        		var qaNo = <%=qa.getQaNo()%>;
        		
        		$.ajax({
            		url:"lookup.qabo",
            		data:{qaNo:<%=qa.getQaNo()%>},
            		dataType:"json",
            		success:function(list){
            			console.log(list);
            	
            			var $commentArea = $("#replyTemplate");
            			$commentArea.html("");
            			$.each(list, function(index, value){
            				addReplyList(value);
            			});
            		},error:function(){
            			console.log("서버통신 실패");
            		}
            	});
        		
        		
        	});
        });
         
  
      $(function(){  
         	$("#an1").click(function(){
         		var rcomment = $("#qareplyContent").val();
         		var qaNo = <%=qa.getQaNo()%>;
         		
         		$.ajax({
             		url:"qalistlately.qabo",
             		data:{qaNo:<%=qa.getQaNo()%>},
             		dataType:"json",
             		success:function(list){
             			console.log(list);
 	
             			var $commentArea = $("#replyTemplate");
             			$commentArea.html("");
             			
             			$.each(list, function(index, value){
             				addReplyList(value);
             			});
             		},error:function(){
             			console.log("서버통신 실패");
             		}
             	});
         		
         		
         	});
         });
         
        
        
        <%-- function lookupQAReply(){/* 좋아요 많게  */
        	$.ajax({
        		url:"lookup.qabo",
        		data:{qaNo:<%=qa.getQaNo()%>},
        		dataType:"json",
        		success:function(list){
        			
        			
        			console.log(list);
        			
        			var $commentArea = $("#replyTemplate");
        			
        			$commentArea.html("");
        			
        			$.each(list, function(index, value){
        				addReplyList(value);
        			});
        			
        			
        		},error:function(){
        			console.log("서버통신 실패");
        			
        			
        		}
        	});
        } --%>
	

        
                             $("#good").click(function(){
                                    if($("#good").css("color") == "rgb(0, 0, 0)"){
                                        $("#good").css("color","rgb(180, 60, 1)");
                                        $("#good1").css("color","rgb(233, 78, 1)");
                                    } else {
                                        $("#good").css("color","rgb(0, 0, 0)");
                                        $("#good1").css("color","rgb(180, 60, 1)");
                                    }
                                });
                        
                                $("#qareplyContent").click(function(){
                                    $("#hiden").css("display","inline");
                                });
                        
                                
                        
                        
                        
                        
                                 $("#an1").click(function(){
                                    $("#an1").attr("style","background:#fcc82d");
                                    $("#gooder").removeAttr("style","background:#fcc82d");
                        
                                });
                                
                                $("#gooder").click(function(){
                                    $("#an1").removeAttr("style","background:#fcc82d");
                                    $("#gooder").attr("style","background:#fcc82d");
                                });
                                
                                function thumbup(index){
                                    console.log($(".ment777")[index]);
                                    console.log(index);
                                }
                             
                                function addReplyList(value) {
                                	var $div = $("#replyTemplate");
                            		var text = new Array();
                            		
                            		text[0] =  '<div class="commentArea">';
                            		text[1] = '<div class="commentArea2">';
                            		text[2] = '<div class="img1"> <img src="' + value.profileImage + '"> </div>';

                            		text[3] = ' <div class="mentArea">';
                            		text[4] = ' <div class="mentNameArea">';
                            		text[5] = '<div class="mentName"><a href="">' +value.mName+ '</a></div>';
                            		
                            		text[6] = '<div class="mentgood"><label>'+value.likeCount+'명에게 추천받은 답변 </label></div></div>';
                            		text[7] = '<div class="ment999">'+value.rComment+'</div>';
                            		text[8] = '<div class="ment888"><div class="ment777" onclick="thumbup(0);"><img src="<%=contextPath%>/resources/image/chul/thumb.png" class="thumb"><label class="good000">추천</label></div> · <label class="date000">'+value.rDate+'에 게시됨</label></div></div></div>';
                            		 
                            		var totalText = "";
                            		for (var i = 0; i < text.length; ++i) {
                            			totalText += text[i];
                            		}
                            		
                            		$div.append(totalText);
                            }
                                
                                
                                
       

 </script>
</body>
</html>





