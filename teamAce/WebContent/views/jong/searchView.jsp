<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> findList = (ArrayList<Member>)request.getAttribute("findList");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <title>Document</title>

    <style>
        html, body {
            margin: 0px;
            padding: 0px;
            background: rgb(245, 245, 245);
        }
        #searchFirstDiv {
            width: 600px;
            margin: auto;
        }
        /* --------------------  */
        .searchMainDiv {
            width: 100%;
            height: 125px;
            background: white;
            border-radius: 5px;
            border: 1px solid rgb(225, 225, 225);
            margin-top: 10px;
            transition-duration: 0.4s;
        }
        .searchMainDiv:hover {
            background: rgb(255, 255, 250);
            border: 1px solid rgb(240, 240, 235);
        }
        .searchMainDivNone {
        	display:none;
         	width: 100%;
            height: 125px;
            background: white;
            border-radius: 5px;
            border: 1px solid rgb(225, 225, 225);
            margin-top: 30px;
            transition-duration: 0.4s;
        }
        .searchLeft{
            width: 25%;
            height:100%;
            float: left;
            text-align: center;
            /* background: blue; */
        }
        .searchLeft>img {
            width: 65%;
            height: 75%;
            border-radius: 50%;
            margin-top: 13px;
            cursor: pointer;
        }
        .searchMiddle {
            float: left;
            width: 75%;
            height: 100%;
            cursor: pointer;
        }
        .searchName {
            font-size: 16px;
            display:block;
            color: black;
            text-decoration: none;
            line-height: 60px;
            font-weight: bold;
            cursor: pointer;
        }
        .searchHint {
            font-size: 13px;
            display:block;
            color: rgb(150, 150, 150);
            text-decoration: none;
            cursor: pointer;
        }
        .searchContent {
            width: 75%;
            border: none;
            font-size: 12px;
            background: none;
            overflow: hidden;
            resize: none;
            height: 40px;
            cursor: pointer;
        }
        .searchContent:focus{
            outline: none;
        }
        .friendsBtn {
            position: absolute;
            background: rgb(245, 245, 245);
            border: 1px solid rgb(200, 200, 200);
            border-radius: 3px;
            transition-duration: 0.2s;
            cursor:pointer;
            
            margin-top: 20px;
            margin-left: 340px;

            padding-top: 3px;
            padding-bottom: 3px;
            padding-left: 10px;
            padding-right: 10px;
            z-index: 9999;
        }
        .friendsBtn:hover {
            background: rgb(235, 235, 235);
        }
        .friendsBtn:focus {
            outline: none;
        }
        .friendsBtn>img {
            width: 15px;
            height: 15px;
            vertical-align: middle;
        }
        
        .searchNone {
            text-align: center;
        }
        .searchNone1 {
            margin-top: 35px;
            color: rgb(50, 50, 50);
        }
        .searchNone2 {
            color: rgb(150, 150, 150);
            font-size: 12px;
            margin-top: 5px;
        }
        .searchNone1, .searchNone2{
            display: block;
        }
    </style>
</head>
<body>
	<%@ include file="/views/jong/menubar.jsp" %>
	
	     <div id="searchFirstDiv">
	     
	     <% for (int i = 0; i < findList.size(); ++i) { %>
	        <div class="searchMainDiv">
	        <input class="searchMno" type="hidden" value="<%=findList.get(i).getmNo() %>">
            	<div class="searchLeft" onClick="location.href ='timeLines.bo?mNo=<%= findList.get(i).getmNo()%>'"><img src="<%=findList.get(i).getProfileImage()%>"></div>
            	<div class="searchMiddle">
                	<button class="friendsBtn" onClick="friendsBtn(<%=findList.get(i).getmNo()%>,<%=i%>)"><img src="<%=contextPath%>/resources/image/jong/iconFriends.png"> 친구 추가</button>
                	<label class="searchName"><%=findList.get(i).getmName() %></label>
                	<label class="searchHint">
                	19<%=findList.get(i).getBirth().substring(0,2)%>년 <%=findList.get(i).getBirth().substring(2,4)%>월 <%=findList.get(i).getBirth().substring(4,6) %>일생</label>
                	
                	<textarea class="searchContent" readonly><%=findList.get(i).getIntroduceText() %></textarea>
            	</div>
        	</div>
        <% } %>
	     
	    	<div class="searchMainDivNone">
	    		<div class="searchNone">
            	<label class="searchNone1">검색 결과가 없습니다.</label>
            	<label class="searchNone2">이름이나 전화번호, 이메일 번호로 검색해보세요.</label>
        		</div>
    		</div>
    	</div>
    	
    	
    	<script>
    		$(function() {
    			var size = <%=findList.size()%>;
    			
    			if (size == 0) {
    				$(".searchMainDivNone").css("display","block");
    			}
    		});
    		
    		function friendsBtn(mNo, index) {
    			var sendId = <%=loginUser.getmNo()%>;
    			$.ajax({
    				url:"friendAddInsert.me",
    				data:{recvId:mNo,sendId:sendId},
    				dataType:"text",
    				success:function(msg) {
    					
    					
    					if (msg == "complete")
    						location.reload();
    					else
    						console.log("안됨");
    				},
    				error:function() {
    					console.log("friendsBtn 통신 연결 실패");
    				}
    			});
    		}
    		
    		$(function() {
    			var $div = $(".friendsBtn");
    			var recvId = <%=loginUser.getmNo()%>;
    			var sendId = 0;
    			
    			console.log($div);
    			
    			for (var j = 0; j < <%=findList.size()%>; ++j) {
    				sendId = $(".searchMno").eq(j).val();
    				$.ajax({
        				url:"friendCheck.me",
        				data:{recvId:recvId,sendId:sendId},
        				dataType:"text",
        				async: false,
        				success:function(msg) {	
        					console.log(msg);
        					if (msg != "complete") {
        						$div.eq(j).css("display","none");
        					}
        				},
        				error:function() {
        					console.log("friendCheck 통신 연결 실패");
        				}
        			});
    			}
    		});
    	</script>
</body>
</html>