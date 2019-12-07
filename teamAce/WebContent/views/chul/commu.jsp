<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.qa.model.vo.QABoard"%>
<% 
	ArrayList<QABoard> list = (ArrayList<QABoard>)request.getAttribute("list");
	QABoard qa = (QABoard)request.getAttribute("qa");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	font-family: "Arial";
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
	height: 500px;
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
#lmphoto>img{
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
	margin-left: 10px; /*이게 왼쪽으로 옮기는 부분*/
	width: 700px; /* 700 px?*/
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
	margin-top:8px;

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
	margin-top:5px;
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
.empty-qaboard{
	text-align:center;
	line-height: 85px;
	width: 100%;
	height: 80px;
	border-bottom: 1px solid rgb(247, 243, 247);
	color: rgb(140, 140, 140);
	transition-duration: 0.2s;
	font-size:15px;
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
	font-weight: bold;
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
.delete{
	float:right;
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
									<a href="">질문 3개</a>
								</p>
								<p>·</p>
								<p>
									<a href="">답변 4개</a>
								</p>
							</div>
						</div>
					</div>

					<div id="left-menu-bottom">
						<p id="lmb1" onclick="gocommunity();">내 게시글</p>
						<p id="lmb2" onclick="gocommunity();">커뮤니티</p>
					</div>
				</div>


				<!-- 오른쪽 부분 -->
				<div id="right-menu">
					<div id="right-menu-top">
						<button id="qanda" onclick="location.href='<%=contextPath%>/views/chul/write.jsp';">
							<img src="<%=contextPath%>/resources/image/chul/write.png" id="wcon">질문하기
						</button>
						<div id="right-menu-p">
							<p>질문 찾아보기</p>
						</div>
					</div>

					<div id="right-borard-list">
						<div id="board-list">
							<p id="re">최신글</p>
							<p id="re2">추천수</p>
							<p id="re3">조회수</p>
							<p id="re4">댓글수</p>
						</div>
					</div>
					<!-- 게시판관련 리스트 -->

					<div id="right-content">
					

							<%-- <% if(list.isEmpty()) { %>
							<div class="empty-qaboard">존재하는 공지사항이 없습니다.</div>
					<% }else{ %>
			 		 	<%
			 		 		
							for (QABoard q : list) {
						%>
						
   			 			<div class="right-borard-list">
							<div class="board-left">
								<div class="board-left-top">
									<label>▲</label>
								</div>
								<div class="board-left-bottom"><%=q.getQaLikeCount() %></div>
							</div>
							<div class="board-right">
								<div class="board-right-top">
									<p>
										<a href="detail.qabo?qaNo=<%= q.getQaNo() %>"><%=q.getQaTitle() %></a>
									</p>
								</div>
								<div class="board-right-bottom">
									<p>
										<a href="detail.qabo?qaNo=<%= q.getQaNo() %>">답변 <%=q.getQareplyCount() %>개</a> · <%=q.getQaView()%>명이 읽음 · <%=q.getDate() %> 게시됨
									</p>
								</div>
							</div>
							
						</div>
						<%
							}
						%> 

					<%
						}
					%>  --%>
					
					
					</div>
					
					<!-- 게시판 페이징처리 기능 버튼들 -->
<!-- 					 <div class="btns">
						<button id="pre1btn">&lt;&lt;</button>
						<button id="pre2btn">&lt;</button>
						<button id="midbtn">1~10</button>
						<button id="next1btn">></button>
						<button id="next2btn">>></button>
						<br>

						<div id="bottom-search">
							<select name="categoryname">
								<option value="40">----</option>
								<option value="10">글쓴이</option>
								<option value="20">제목</option>
								<option value="30">내용</option>
							</select>
							<input type="text" placeholder="검색" id="search2">
							<button id="searchbtn">검색하기</button>
						</div>
					</div> -->
					<!-- 게시판 페이징처리 기능 버튼 끝 -->
				</div>



			</div>
		</div>

	</div>

<script>
		//-------------- 좋아요 -----------------     
			$(function() {
    
    	var $btn = $(".board-left-top>label");
    
    	for (var index = 0; index < $btn.length; ++index) {
       
       		selectLcountList($btn.eq(index).val(), index); // 좋아요수조회
       		boardLikeImgChange($btn.eq(index).val(), index); // 좋아요 색깔 변경하는 ajax에 글번호와 인덱스번호 같이 보내주기
       		console.log($btn.eq(index).val(), index);
    	}
    
 		});
		
		 //--------- 좋아요기능 ------------    
		 function qaBoardLikeBtn(qaNo, index){
			 console.log(qaNo);
		      console.log("실행되고있는지-------------");
		      var mNo = <%= loginUser.getmNo()%>;
		      $.ajax({
		         url:"qaboardLike.qabo",
		         data:{qaNo:qaNo,mNo:mNo},
		         dataType:"text",
		         type:"post",
		         success:function(){
		            console.log("갱신완료!");
		             selectQAlist();
		             
		             
		             
		            boardLikeImgChange(qaNo, index);
		             selectLcountList(qaNo, index); 

		          },error:function(request,status,error){
		              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             console.log("boardLikeBtn 통신 실패!!");
		          }
		      });
		   };
		   
		   
		   /* 삭제하는거 */		
		   <%--	 function qaBoardLikeBtn(qaNo, index){
				 console.log(qaNo);
			      console.log("실행되고있는지-------------");
			      var mNo = <%= loginUser.getmNo()%>;
			      $.ajax({
			         url:"qaboardNoLike.qabo",
			         data:{qaNo:qaNo,mNo:mNo},
			         dataType:"text",
			         type:"post",
			         success:function(){
			            console.log("갱신완료!");
			             selectQAlist();
			             
			             
			             
			            boardLikeImgChange(qaNo, index);
			             selectLcountList(qaNo, index); 

			          },error:function(request,status,error){
			              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			             console.log("boardLikeBtn 통신 실패!!");
			          }
			      });
			   }; --%>

		  
		   
		   
<%-- 		   function selectLcountList(bNo, index){ //좋아요총갯수 
		       
		       $.ajax({
		         url:"llist.new",
		         data:{bNo:bNo},
		         dataType:"json",
		         success:function(llist){
		            console.log("보자"+ llist);
		            
		            var $countsArea = $(".cLike").eq(index); // 카운트수 담는 div
		            
		               $countsArea.html(""); // 초기화
		                
		                var text = new Array();
		                
		                if(llist > 0){ // 좋아요가 있는경우
		                   
		                  text[0] =    '<div><img src="<%=contextPath%>/resources/image/hye/좋아요수.png" alt></div>';
		                  text[1] =    '<span>' +  llist +'</span>'; 
		                
		                }else{
		                   
		                text[0] = '<div><img></div>';
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
		    } --%>




		/* 내 게시글  커뮤니티 색깔 변환 */
        $("#lmb1").click(function(){
            $("#lmb1").attr("style","background:#fcc82d");
            $("#lmb2").removeAttr("style","background:#fcc82d");
        });
        $("#lmb2").click(function(){
            $("#lmb1").removeAttr("style","background:#fcc82d");
            $("#lmb2").attr("style","background:#fcc82d");
        });


		/* 최신글 답글많은거 등등 4개의 버튼 색깔처리 */
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
	
        function gocommunity(){
     	   location.href="<%=contextPath%>/list.qabo";
    
        }
        
        
        function gohelp(){
       	   location.href="<%=contextPath%>/help.bo";

        	/*   	   
        		if (list.size() == 0) { // 아예없을경우에 넣기.
    	   } */
        }   
       	   
<%--         function QABoardelete(){
        	 location.href="<%=contextPath%>/QAdelete.qabo?qaNo=<%=qa.getQaNo()%>";
        	 location.href="QAdelete.qabo?qaNo=+value.qaNo+"
        	 				<a href="detail.qabo?qaNo='+value.qaNo+'">
        }  --%>
      
        
 
        
        
        $(function(){
        	selectQAlist();
        
        	
        	
        });
  
        /* ajax 게시판 처리  */
      	function selectQAlist() {
      		    		$.ajax({
      		    			url:"ajaxlist.qabo",
      		    			dataType:"json",
      		    			success:function(list){
      		    				
      		    				console.log(list);
      		    				var $rightContent = $("#right-content");
      		    				
      		    				$rightContent.html("");
      		    				

      							$.each(list, function(index, value) {
      									addQAList(value, index);
      		    				});
      		    				
      		    			},error:function() {
      		    				console.log("통신 연결 실패");
      		    			}
      		    		});
      		 }

        /* 조회수 높은 게시판 처리 */
        $(function(){
                  	$("#re3").click(function(){
             		var $rightContent = $("#right-content").val();
             		
             		$.ajax({
                 		url:"ajaxlookup.qabo",
                 		dataType:"json",
                 		success:function(list){
                 			console.log(list);
     	
                 			var $rightContent = $("#right-content");
                 			$rightContent.html("");
                 			
                 			$.each(list, function(index, value){
                 				addQAList(value, index);
                 			});
                 		},error:function(){
                 			console.log("서버통신 실패");
                 		}
                 	});
             		
             		
             	});
             }); 
        
        /* 추천수 높은거 */
		        $(function(){
                  	$("#re2").click(function(){
             		var $rightContent = $("#right-content").val();
             		
             		$.ajax({
                 		url:"ajaxgoodup.qabo",
                 		dataType:"json",
                 		success:function(list){
                 			console.log(list);
     	
                 			var $rightContent = $("#right-content");
                 			$rightContent.html("");
                 			
                 			$.each(list, function(index, value){
                 				addQAList(value, index);
                 			});
                 		},error:function(){
                 			console.log("서버통신 실패");
                 		}
                 	});
             		
             		
             	});
             }); 
        
        /* 답변 많은거 */
		        $(function(){
                  	$("#re4").click(function(){
             		var $rightContent = $("#right-content").val();
             		
             		$.ajax({
                 		url:"ajaxreplyup.qabo",
                 		dataType:"json",
                 		success:function(list){
                 			console.log(list);
     	
                 			var $rightContent = $("#right-content");
                 			$rightContent.html("");
                 			
                 			$.each(list, function(index, value){
                 				addQAList(value, index);
                 			});
                 		},error:function(){
                 			console.log("서버통신 실패");
                 		}
                 	});
             		
             		
             	});
             }); 
        
        /* 최근글 다시 */
          $(function(){
                  	$("#re").click(function(){
             		var $rightContent = $("#right-content").val();
             		
             		$.ajax({
                 		url:"ajaxlately.qabo",
                 		dataType:"json",
                 		success:function(list){
                 			console.log(list);
     	
                 			var $rightContent = $("#right-content");
                 			$rightContent.html("");
                 			
                 			$.each(list, function(index, value){
                 				addQAList(value, index);
                 			});
                 		},error:function(){
                 			console.log("서버통신 실패");
                 		}
                 	});
             		
             		
             	});
             }); 
        
        
        /* 게시판 div 따오기  */
        function addQAList(value, index) {
        	
        	
        	console.log(index);
        	var $div = $("#right-content");
    		var text = new Array();
    		
    		text[0] = '<div class="right-borard-list">';
    		text[1] = '<div class="board-left">';

    		text[2] = '<div class="board-left-top"><label onclick=qaBoardLikeBtn('+value.qaNo+ ',' + index +');>▲</label></div>';
    		text[3] = '<div class="board-left-bottom">' +value.qaLikeCount + '</div></div>';
    		
    		text[4] = '<div class="board-right">';
    		text[5] = '<div class="board-right-top"><p><a href="detail.qabo?qaNo='+value.qaNo+'">'+value.qaTitle+'</a></p></div>';
    		text[6] = '<div class="board-right-bottom"><p><a href="detail.qabo?qaNo='+ value.qaNo +'">답변'+ value.qareplyCount +'개</a> ·'+ value.qaView+'명이 읽음 · '+<%=loginUser.getmNo()%>+ '게시됨</p><a  class="delete" href="QAdelete.qabo?qaNo='+value.qaNo+'&mNo='+index+'"><img src="<%=contextPath%>/resources/image/chul/delete1.png"></a></div></div></div>'; 
    																																													
    		var totalText = "";
    		for (var i = 0; i < text.length; ++i) {
    			totalText += text[i];
    		}

    		$div.append(totalText);
        }
                
 </script>
</body>
</html>