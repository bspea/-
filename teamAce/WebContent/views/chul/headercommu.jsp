<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    html, body{
        padding: 0;
        margin: 0;
        font-family:"Arial";
    }
    #header{
        width: 100%;
        height: 75px;
        background: #ffc101;
    }

    #logo{
        float: left;
        width: 15%;
        height: 100%;
        background-color: #ffc101;
        color: rgb(50, 0, 100);
        margin-top: 15px;

    }
   .logoCursor{
       width: 122px;    
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
    #top{
        width: 1000px;
        height: 60px;
        margin: auto;
    }
    #top p {
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
        margin-top: -5px;
        color: rgb(50, 0, 100);
        line-height: 30px;
        margin-left: 20px;
    }
    #bicon:hover{
        color: rgb(50, 0, 100);
        font-weight: bold;
    }
    #sicon {
        width: 40px;
        float: left;
        background: #ffffff85;
        margin-top: 10px;
        height: 32px;
        text-align: center;
      	margin-left:10px;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
        cursor:pointer;
    }
    #sicon img{
        margin-top: 8px;
        vertical-align: middle;
        width: 16px;
        height: 16px;
    }
    #search1{
        margin-top: 10px;
        width: 550px;
        height: 30px;
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
    #toptop {
        margin-bottom: 15px;   
        height: 100%;

    }
    #home:hover {
        cursor: pointer;
    }

    </style>
</head>
<body>
 <%@ include file="/views/dataPage.jsp" %>
                <div id="header">
                        <div id="top">
                            <div id="toptop">
                                <div id="logo">
                                    <div class="logoCursor" onclick="gocommunity();">
                                        <img src="<%=contextPath%>/resources/image/chul/logo.png" id="logo1">고객 커뮤니티
                                    </div>
                                </div>
                                <div id="search">
                                        
                                    <div id="sicon">
                                            <img src="<%=contextPath%>/resources/image/chul/search.png" id="scon" onclick="">
                                    </div>
                                    <input type="text" placeholder="검색" id="search1">
                                </div>
                                <div id="back">
                                    <div class="biconCusor">
                                    <div id="bicon" onclick="location.href='<%=contextPath%>';">
                                        <img src="<%=contextPath%>/resources/image/chul/loginbox.png" id="bicon1"> Facebook으로 돌아가기
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
       <script>
       function gocommunity(){
     	   location.href="<%=contextPath%>/list.qabo";
    
        }
       </script>

</body>
</html>