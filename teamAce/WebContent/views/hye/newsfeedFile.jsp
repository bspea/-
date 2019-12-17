<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*,com.kh.member.model.vo.*,java.util.ArrayList" %>
<%
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	ArrayList<BoardImage> plist = (ArrayList<BoardImage>)request.getAttribute("plist");
	
	Board b = (Board)request.getAttribute("b");

	ArrayList<BoardImage> polist = (ArrayList<BoardImage>)request.getAttribute("polist");
	
	int i = 0; //인덱스확인변수
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(function(){
	
		// 처음에 보이지않게 숨겨주기
		//$(".newMenu").hide(); // 메뉴창 
		$(".menuOpen").hide(); // 메뉴창
		$(".cPhotoPreview").hide(); // 댓글 사진올리기 미리보기창
		$(".mainOuter").hide(); // 사진 상세보기창
		$(".updateNew").hide(); // 공유하기(수정)창 
		$(".cancleOuter").hide(); // 삭제여부창
		$(".successOuter").hide(); // 완료알람창
		
		/* 스크롤내려도 화면 중간에 오도록 */
        var winWidth = window.innerWidth / 2;
        var winHeight = window.innerHeight / 2;
        $(".shareOuter").css("margin-left", winWidth - 250);
        $(".shareOuter").css("margin-top", winHeight - 250);
        
        $(".successOuter").css("margin-left", winWidth - 250);
        $(".successOuter").css("margin-top", winHeight - 100);
        
	});
	
	
</script>


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
          /* width:500px; */
          height:1020px;
          background:rgb(233,235,238);
          padding-top:20px;
	      display: flex;
      }
     .lOuterTest{
    	width: 350px;
	    height: 1020px;
	    background: rgb(233,235,238);
      }
      .rOuterTest{
      	width: 610px;
	    height: auto;
	    background: rgb(233,235,238);
	    /* padding-top: 300px; */

	    
	   /*  display:flex; */
      }
      /* 왼쪽 메뉴바영역 */
      .lOuter{
          width:300px;
          height:200px;
          position:fixed !important;
          z-index: 2;
          padding-top:30px;
      }
      .lOuter>div{width:100%;}
      .upOuter{height:30%;}
      .downOuter{height:70%;}
      .navi{
          list-style-type:none;
          padding:0;
          margin:0;
          height:100%;
      }
      .navi>div{
          width:100%;
          text-align:center;
      }
      .upOuter{height:30%;}
      .downOuter{height:70%;}

      .upOuter>div{
          width:100%;
          height:100%;
      }
      .downOuter>div{
          width:100%;
          height:33%;
      }
      .navi li a{
          text-decoration: none;
          font-size:14px;
          color:black;
          /* display: inline-block;/* a태그 크기조절을위해 */
          display:block;
          width:80%;
          height:100%;
          margin:auto;
          line-height: 100%;
          
      }
      .navi li div{
          width:80%;
          height:100%;
          display:table;
      }
    
      .imgArea{
          width:100%;
      }
      .mName > span{
         display:table-cell;
         vertical-align: middle;
         text-align: left;
         width:70%;
     } 
      .navi li a:hover{
          background:#f5f6f7;
          border:1px solid #dddfe2;
          border-radius: 2px;
          font-weight:900;
      }
      #userImg{
          border-radius: 20px;
          border: 1.5px solid #ccd0d5;
          margin:auto;
          bottom:0;
          top:0;
          right:0;
          left:0;
          height: 40px;
    	  width: 40px;
      }

      /* 뉴스피드 영역 */
      .newsfeedArea{
	/* 	 padding-top: 300px; */
		 
      } 
      .rOuter{
          width:600px;
          height:auto;
          z-index: 1;
          margin:auto;
          /* padding:2% 1%; */
      }
      .rIn{
          background:white;
          width: 98%;
          height:auto;
          margin-left: auto;
          margin-right: auto;
          padding:2% 1%; 
          border:1px solid rgb(218, 221, 225);
          border-top-left-radius: 4px;
          border-top-right-radius: 4px;
          margin-bottom: 20px;
      }
      .rIn > div, .upIn > div, .mTopArea>div, .mTopArea2>div{width:100%;}
      
      /* 댓글부분전까지 */
      .upIn,.upIn2{
          /* border-bottom:1px solid #dddfe2; */
          border-bottom-left-radius: 4px;
          border-bottom-right-radius: 4px;
      }
      .upIn{
          height:80%;
      }
      .upIn2{
          height:35%;
          padding: 2%;
      }
      
      /* 댓글부분전체 */
      .downIn{
          height:20%;
      }
      .downIn2{
          height:55%;
      }
      .top{
          height:10%;
          display:flex;
      }
      .top2{
          height:25%;
          display:flex;
      }
      .middle{
          height:75%;
      }
      .middle2{height:35%;}
      .bottom{
          height:15%;
          border-top: 1px solid #dddfe2;
          border-bottom: 1px solid #dddfe2;
      }
      .bottom2{
          height:40%;
          border-top: 1px solid #dddfe2;
      }
      .top > div, .top2>div{height:100%;}
      .lTopArea{width:15%;}
      .mTopArea{width:55%;}
      .lTopArea2{width:20%;}
      .mTopArea2{width:50%;}
      .rTopArea{width:30%;}
      
      /* 작성자 정보영역 */
      .lTopArea > div{
          width:80%;
          height:100%;
          margin:auto;
      }
      #wImg{
          border-radius: 35px;
          width:40px;
          height:40px;
          max-height: 70px;
      }
      .mTopArea>div, .mTopArea2>div{
          height:50%;
      }
      .mTopArea2>div{
          padding:2%;
      }
      .mTopArea a:hover, .mTopArea2 a:hover{
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
      .middle>div, .middle2>div{
          width: 100%;
          height:100%;
      }
      .contentArea>div{
          width:100%;
      }
      .textArea{
          height:20%;
      }
      .textArea2{
          height:100%;
      }
      .textArea>div{
          padding:2%;
          overflow:hidden;
          height:auto;
      }
      .photoArea{
          height:80%;
          margin:auto;
          display:flex;
      }
      .photoArea>div{
          width:100%;
          height:100%;
      }
      #contentPt{
          max-height: 408px;
          max-width: 554px;
          width: 100%;
          margin: auto;
      }
      .contentPt1{
          border:1px solid red;
          width: 100%;
          height:50%;
      }
      .contentPt1>img{ 
          max-height: 200px;
          max-width: 554px;
          width:100%;
      }
      .contentPt2{
          border:1px solid red;
          width:50%;
          height:100%;
      }
      .contentPt2>img{
          max-width: 554px;
          max-height: 408px;
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
      .line{
          border-top: 1.5px solid #dddfe2;
          width:90%;
          margin: auto;
      }
      .line2{
          width:90%;
          margin: auto;
      }
      .cLike, .cLike2{
          width:60%;
          display:table;
      }
      .cComment{
          width:40%;
          text-align: end;
          display: table;
      }
      .cLike > span,.cLike2 > span {
         display:table-cell;
         vertical-align: middle;
         width:100%;
         height:100%;
     } 
     .cLike >div{
         padding-top: 30%;
         width:100%;
     }
     .cLike2 >div{
         width:60%;
         height: 80%;
         display: flex;
         padding-top:10%; 
     }
     .cComment >span{
         width:50%;
         height:100%;
         vertical-align: middle;
         display:table-cell;
     }
     .cComment span:hover{
          text-decoration: underline;
          cursor:pointer;
      }
      .cComment span{
          color: #616770;
          vertical-align: middle;
      }
      .btnsArea>div{
          height: 100%;
          /* width: 33%; */
          margin: 0;
          width: 50%;
      }
      .line{width:90%; height:5%}
      .btns{width:100%; height:95%; }
      
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
      #btnImg{
          margin-left: 50%;
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
     /* .downIn>div, .downIn2>div{
         width:100%;
     } */
     .cSort{
      height:15%;
      color:rgb(96, 103, 112);
     }
     .cSort2{
      height:10%;
      padding: 2%;
     }
     .cSort2>span{
         vertical-align: middle;
     }
     .myComment{
      height:30%;
      display: flex;
      height:auto;
     }
     .myComment2{
      height:10%;
      display: flex;
      background-color: #f2f3f5;
     }
     .youComment{
      height:35%;
      display:flex;
      background:white;
      padding-top: 1%;
     }
     .youComment2{
      height:15%;
      display:flex;
      padding: 2%;
     }
     .cMore{
      height:20%;
      display: flex;
     }
     .cAddArea{
       /*   height:auto;
         margin:0; */
     }
     .cAddArea>div{
         padding:1%;
         margin: 0;
     }
     .myComment>div, .myComment2>div{
      height: auto;
      display: flex;
      padding: 1%;
      }
     .mImgArea, .yImgArea{
      width:10%;
      display: flex;
     }
     .mImgArea2, .yImgArea2{
      width:15%;
      display: flex;
     }
     #userImg2{
          border-radius: 20px;
          border: 1.5px solid #ccd0d5;
          margin:auto;
          width:80%;
      }
     .cWriteArea{
      width:90%;
     }
     .cWriteArea2{
      width:85%;
     }
     .cWrite{
      background-color: #f2f3f5;
      border: 1.5px solid #ccd0d5;
      border-radius: 45px;
      display: flex;
      justify-content: flex-end;
      width:95%;
      height:80%;
     }
     .cWrite >div, .cWrite2>div{height:100%;}
     .cWrite>.cText{
      width:90%;
      padding: 1% 3%;
     }
     .cWrite2_1>.cText{
     	width:85%;
      padding: 2% 3%;
     }
     .cText:hover{
      cursor:text;
     }
    /*  .cText>div{
      outline: none;
      user-select: text;
      padding: 0% 0% 5%;
     } */
     .addReply{
     	outline: none;
	    border: none;
	    color: rgb(96, 103, 112);
	    background-color: #f2f3f5;
	    font-family: inherit;
        font-size: 16px;
        width: 390px;
     }
     
     .cIcon:hover,  .cIcon2:hover{
     	cursor:pointer;
     }
     .cIcon, .cIcon2{
      padding: 2% 3%;
	  text-align: end;
     } 
     .cIcon{width:10%;}
     .cIcon2{width:15%;}
     .hidden_elem, .hidden_elem2{
     	display:none;
     }
     [contenteditable=true]:empty:before{
      content: attr(placeholder);
      display: block; 
      }
      .cPhotoPreview{
      	width:95%;
 		border: 1px solid #ccd0d5;
 		padding-bottom:2px;
      }
      .cPhotoPreview>span{
      	float:right;
      	cursor:pointer;
      }
      .cPhotoPreview>img{
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
      	ertical-align: bottom;
		position: absolute;
		width: 23px;
      }
      #reLikecNum{
      	padding-left: 5%;
		vertical-align: top;
      }
      .ycBottom{height:20%; width:100%;}
      .cWrite_1{height:70%; width:max-content;}
      .ycBottom2{height:30%; width:100%; }
      .cWrite2_1{height:100%; width:95%;}
      .ycBottom>span:hover, .ycBottom2>span:hover, .cView:hover, .cSort>span:hover, .cSort2>span:hover{
          cursor: pointer;
          text-decoration: underline;
      }
      .ycBottom>span, .ycBottom2>span{
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
          line-height:50px;
          text-align: left;
          padding-top: 2%;
          padding-bottom: 2%;
          position: absolute;
          }
          .menuOpen>div{
          font-weight: 550;
          padding: 0 12px;
          }
          .menuOpen>div div{
          font-size:10px; 
          color: rgb(144, 148, 156);
          display: block;
          line-height: 16px;
          }
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
		    position:fixed;
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
        
        
        
        /* 공유하기화면 */
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
            height:20%;
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
            white-space: pre-wrap;
            overflow-wrap: break-word;
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
        }
        .sContent>img{
            max-width: 460px;
            max-height:300px;
            display:flex;
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
        
        /* 삭제 완료창 */
        .successOuter{
            width: 445px;
            height:70px;  
        }
        
            
</style>

</head>
<body>
	<%@ include file="/views/jong/menubar.jsp" %>

	<%-- 메인페이지 전체 영역 --%>
    <div class="outer">
    <div class="lOuterTest">
        <div class="lOuter"> <!-- 왼쪽 메뉴바영역 -->
            <ul class="navi">
                <div class="upOuter">
                    <div class="lMenu" id="userName">
                        <li>
                            <a href="<%=contextPath %>/timeLines.bo">
                                <div class="mName">
                                    <div class="imgArea">
                                        <img  id="userImg" src="<%= loginUser.getProfileImage() %>" alt="">
                                    </div>
                                    <span><%=loginUser.getmName() %></span> 
                                </div>
                            </a>
                        </li>
                    </div>
                </div> <!-- upOuter 끝 -->
                <div class="downOuter">
                    <div class="lMenu" id="newsfeed">
                        <li>
                            <a href="<%= contextPath %>/test.me">
                                <div class="mName">
                                    <div>
                                        <img  id="nfImg" src="<%=contextPath%>/resources/image/hye/뉴스피드.PNG" alt="">
                                    </div>
                                    <span>뉴스피드</span> 
                                </div>
                            </a>
                        </li>
                    </div> <%-- lMenu(newsfeed) 끝 --%>
                    
                    <div class="lMenu" id="messenger">
                        <li>
                            <a href="#메신저로">
                                <div class="mName">
                                    <div>
                                        <img  id="mImg" src="<%=contextPath%>/resources/image/hye/메신저.png" alt="">
                                    </div>
                                    <span>Messenger</span> 
                                </div>
                            </a>
                        </li>
                    </div> <%-- lMenu(messenger) 끝 --%>
          
                    <div class="lMenu" id="searchFriend" >
                        <li>
                        	<a href="#친구찾기로">
                                <div class="mName">
                                    <div>
                                        <img id="fImg" src="<%=contextPath%>/resources/image/hye/친구.png" alt="">
                                    </div>
                                    <span>친구찾기</span>
                                </div>
                            </a>
                        </li>
                    </div> <%-- lMenu(searchFriend) 끝 --%>
                </div> <%-- downOuter 끝 --%>
            </ul>
        </div> <%-- lOuter 끝 --%>
        </div> <%-- lOuterTest 끝 --%>
        
     
       <!-- 뉴스피드영역 -->
     <div class="rOuterTest">
       <% if(list.isEmpty()){ %> 
       		<div>표시할 뉴스피드가 존재하지않습니다.</div>
       <% }else { %>    
        <% for(Board n : list) { %>
       <div class="newsfeedArea">
         	<div class="rOuter">
            	<div class="rIn">
                	<div class="upIn">
                    	<div class="top">
                        	<div class="lTopArea">
                            	<div>
                                	<img  id="wImg" src="<%= n.getProfileimage()%>" alt="">    
                            	</div>
                        	</div> <%-- lTopArea 끝 --%>
                        	
                        	<div class="mTopArea">
                            	<div id="wName">
                                    <a href="#맛집뉴스로"><%= n.getmName() %></a> 
                                    <%-- <img src="<%=contextPath%>/resources/image/hye/play-mini-fill.png" alt="" style="vertical-align: middle">
                                    <a href="#내페이지로" > 상대방 이름 </a> --%>
                            	</div> <%-- wName 끝 --%>
                            
                            	<div id="wDate">
                                	<a href="#맛집뉴스로"> <%= n.getbDate() %>  ·</a>
                                	<img id="" src="<%=contextPath%>/resources/image/hye/earth-fill.png" alt="" style="vertical-align: middle">
                            	</div>
                        	</div> <%-- mTopArea 끝 --%>
                        	
                        	<div class="rTopArea">
                            	<button class="menuOpenBtn">
                                	<img src="<%=contextPath%>/resources/image/hye/more-fill.png" alt="">
                            	</button>
                            	<div class="menuOpen newMenu">
                            		<input type="hidden" value="<%=n.getbNo() %>"> <!-- 해당 글번호 숨겨주기  -->
                                    <div>
                                        <img src="<%=contextPath%>/resources/image/hye/user-unfollow-line.png" alt="">
                                        	친구 팔로우 취소
                                        <div>친구 사이를 유지하고 게시물은 보지 않습니다.</div>
                                    </div>
                                    <div id="bDeclareBtn">
                                        <img src="<%=contextPath%>/resources/image/hye/error-warning-line.png" alt="">
                                       	 게시물 신고
                                    </div>
                                    <div>
                                        <img src="<%=contextPath%>/resources/image/hye/file-excel-line.png" alt="">
                                        	게시물 숨기기
                                        <div>이 게시물을 뉴스피드에 표시하지않습니다.<br></div>
                                    </div>
                                    <% if(loginUser.getmNo()==n.getmNo()) { %>
                                    <div id="bUpdateBtn">
                                        <img src="<%=contextPath%>/resources/image/hye/edit-box-fill.png" alt="">
                                        	게시물 수정 
                                    </div>
                                    <div id="deleteBtn">
                                        <img src="<%=contextPath%>/resources/image/hye/close-circle-fill.png" alt="">
                                        	삭제
                                    </div>  <!--  클릭시 게시물을 삭제하시겠어요? 창띄우기-->
                                    <% } %>
                                </div> <%-- menuOpen 끝 --%>
                        	</div> <%-- rTopArea 끝 --%>
                    	</div> <%-- Top 끝 --%>
                    	
                    	<div class="middle">
                        	<div class="contentArea">
                            	<div class="textArea">
                               		<div><%= n.getbContent() %></div> 
                            	</div>
                      			<% if(plist.isEmpty()) { %>
                           		<!-- 사진없이 글만작성한 경우 -->
                           		
                       			<% }else {%>
                            	<div class="photoArea">
                       	  			<% for(BoardImage p : plist) { %> 
                            			<% if(n.getbNo() == p.getbNo()) { %>
                                	<img onclick="goDetailView(<%=n.getbNo()%>,<%=p.getImgNo() %>);" id="contentPt" src="<%=contextPath %><%=p.getImgPath()%>" data-align="center" data-scale="best-fit-down" alt="">                           	
                        				<% } %>
                        			<% } %>
                                </div> <%-- photoArea 끝 --%>
                            </div>
                      			<% } %> 
                        </div> <%-- middle 끝 --%>
                    </div> <%-- upIn 끝 --%>
                    
                    <div class="bottom">
                        <div class="countsArea">
                            <div class="cLike"></div>
                            <div class="cComment"></div>
                        </div> <%-- countsArea 끝 --%>
                        <div class="line"></div>
                        <div class="btnsArea">
                            <div class="btns">
                                <div class="btn likeBtn" id="likeBtn" style="font-size: 14px" onclick="boardLikeBtn(<%=n.getbNo()%>, <%= i%>);">
                                <input type="hidden" value="<%=n.getbNo()%>">
                                    <div>
                                        <img class="likeImage" src="<%=contextPath%>/resources/image/hye/좋아요.png" id="btnImg" width="30" height="30" alt="">
                                    </div>
                                    <span class="likeName">좋아요</span>
                                </div> <%-- btn 끝 --%>
                            </div> <%-- btns 끝 --%>
                            
                            <div>
                                <div class="btn commentBtn" onclick="boardCommentBtn(<%=n.getbNo()%>, <%= i%>);">
                                    <input type="hidden" class="hiddenBno" value="<%=n.getbNo() %>">
                                    <div>
                                        <img src="<%=contextPath%>/resources/image/hye/댓글.png" id="btnImg" width="30" height="30" alt="">
                                    </div>
                                    <span>댓글</span>
                                </div>
                            </div>
                        </div> <%-- btnsArea 끝 --%>
                    </div> <%-- bottom 끝 --%>

                	<div class="downIn">
                    	<div class="cSort">
                        	<span>
                        		최신 댓글순 
                        		<img src="<%=contextPath%>/resources/image/hye/arrow-bottom-s-fill.png" style="vertical-align:bottom;">
                        	</span>
                    	</div>
                    	<form class="uploadForm" <%-- action="<%= contextPath %>/rinsert.new" --%> method="post">
                    	<div class="myComment">
                        	<div class="mImgArea">
                            	<img  id="userImg" src="<%= loginUser.getProfileImage() %>" alt="">
                        	</div>
                        	
                        	<div class="cWriteArea">
                            	<div class="cWrite"> 
                                	<div class="cText">
                                		<input class="addReply" name="replyContent" placeholder="댓글을 입력하세요..."></input>
                                	</div>
                                	<div class="cIcon">
                                    	<img class="cameraIcon" src="<%=contextPath%>/resources/image/hye/camera-fill.png">
                                	</div>               
                                    <input class="hidden_elem" name="replyImg" type="file" onchange="loadImg(this, 1, <%=i %>);" >
                                    <span data-hover="tooltip">
                                        <a aria-label="사진 또는 동영상 첨부" ></a>
                                    </span>
                                    <input type="hidden" name="bNo" value="<%=n.getbNo()%>">
									<input type="hidden" name="mNo" value="<%=loginUser.getmNo()%>">    
                       			</div> 
                        	</div> <%-- cWriteArea 끝 --%>    	
                    	</div> <%-- myComment 끝 --%>
                    	</form>
                        <div class="cPhotoPreview">
                        	<span class="pPreClose" >X</span>
                        	<img class="titleImg">
                        </div>

                    <%-- 	<div class="youComment">
                    		ajax로!!
                    	</div> youcomment 끝
                    	 --%>
                    	<div class="cAddArea"></div>
                    	<div class="cMore">
                        	<div class="cView" onclick="selectRlist(<%=n.getbNo()%>, <%= i%>);">
                        		&nbsp;댓글 더 보기
                        	</div>
                        	<div class="cCount">
                        	</div>
                    	</div> <%-- cMore 끝 --%>
                	</div> <%-- downIn 끝 --%>
                 </div> <%-- rIn 끝 --%>
            </div> <%-- rOuter 끝 --%>
      </div><%-- newsfeedArea 끝 --%>
			<% i++; %>
            <% } %>
          <% } %>
      </div> <%-- rOuterTest 끝 --%>
      </div> <%-- 왼쪽메뉴바 바탕 끝 --%>
        

	<% if(b != null) { %>
	<!-- 수정하기화면 -->
	<div class="sMainOuter updateNew">
    	<div class="shareOuter">
        	<div class="shareIn">
        		<form action="<%= contextPath%>/update.news" method="post">
            		<div class="shareUp">
                		<div class="sTitle" id="sTitle">
                			<img src="<%=contextPath%>/resources/image/hye/pencil-line.png" alt=""">
                			게시물 수정                                          	
                		</div> <%-- sTitle 끝 --%>
                		
                		<div class="sXbtn">
                    		<a href="#이전페이지로"">
                        		<img src="<%=contextPath%>/resources/image/hye/취소아이콘.png" alt="">
                    		</a>
                		</div> <%-- sXbtn 끝 --%>
            		</div> <%-- shareUp 끝 --%>
            		
            		<div class="shareDown">
                		<div class="sTextArea">
                    		<div class="sTextOut">
                        		<div contenteditable="true" placeholder="하고 싶은 말을 남겨주세요...">
                        		<%= b.getbContent() %>
                        		</div>
                    		</div> <%-- sTextOut 끝 --%>
                		</div> <%-- sTextArea 끝 --%>
                		
                		<div class="sPhotoArea">                    
                    		<div class="sContent">
                        		<img src="<%=contextPath%>" alt="">
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
                            		<span id="levelName">친구</span>
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
	                                <div>
	                                	<img src="<%=contextPath%>/resources/image/hye/group-line.png" alt="">
	                                	<span>친구</span>
	                                    <div>회원님의 Acebook 친구</div>
	                                </div>
	                                <div>
	                                	<img src="<%=contextPath%>/resources/image/hye/lock-line.png" alt="">
	                                	<span>나만보기</span>
	                                    <div>나만 보기<br></div>
	                                </div>
	                        	</div>  <%--menuOpen sharelevel 끝 --%>
	                        	<button class="grayBtn shareCancel" id="" type="submit" >취소</button>
	                        	<button class="blueBtn sharePrint" type="submit">게시</button>
                    		</div>  <%--srightBtn 끝 --%>
                		</div>  <%--sBtns 끝 --%>
            		</div>  <%-- shareDown 끝 --%>
        		</form>
        	</div>  <%-- shareIn 끝 --%>
    	</div>  <%-- shareOuter 끝 --%>
	</div>  <%-- sMainOuter 끝 --%>
	<% } %>
	
	
	<!-- 게시물 삭제 질문창 -->
	<div class="cancleOuter bgAll">
    	<div class="cancleInner bgAll2">
                <div class="shareUp">
                    <div class="sTitle">
                        <span id="qText">게시물을 삭제하시겠어요?</span>
                    </div>
                    <div class="sXbtn">
                        <img src="<%=contextPath%>/resources/image/hye/취소아이콘.png" alt="">
                    </div>
                </div>
                <div class="shareDown">
                    <div class="sTextArea">
                        <div class="sTextOut">
                            <span id="qcText">변경해야 할 사항이 있는 경우 수정할 수 있습니다.<br>이 게시물을 만든사람이 회원님이 아니라면 지금 바로 계정을 보호하세요.</span>
                        </div>
                    </div>
                    
                    <div class="sPhotoArea" style="padding-bottom: 1%">
                        <button class="grayBtn qView" onclick="backMain();">취소</button> 
                        <button class="blueBtn qView" onclick="deleteBoard();">삭제</button>
                    </div>
                </div>
    	</div>
	</div>
	
	
	<!-- 완료 알람창 -->
	<div class="successOuter bgAll">
	    <div class="successInner bgAll2">
	        <div style="padding:5%;">삭제가 완료되었습니다.</div>
	    </div>
	</div>
		
	
	
	
	<script>
		var selectBId = -1;
		// 공개대상 클릭시
		$(".sLevelBtn").click(function(){ // 게시물 공개 대상창 열리도록
			$(".shareLevel").show();
		
			
			$("#all").click(function(){	// 전체공개 클릭시			
				var $allName = $(this).children().eq(1).text(); // 전체공개 이름담고
				var $allImg = $(this).children().eq(0).attr("src"); // 전체공개 이미지담고

				$(".sLevelBtn").children().eq(1).text($allName); // 전체공개 이름 넣어주기
				$(".sLevelBtn").children().children().eq(0).attr("src",$allImg); // 전체공개 이미지 넣어주기
				
			}); 
		
			return false; // 다른부분누르면 창닫히게
		});	
		
		
		// 메뉴버튼 클릭시
	 	$(".menuOpenBtn").click(function(){
	 		$(this).parent().children().eq(1).show(); // 메뉴창열리도록
	 		
	 		$(this).parent().children().eq(1).children().eq(4).click(function(){ //수정하기 버튼 클릭시
	 			var bNo = $(this).parent().children().eq(0).val(); // 글번호 넘겨주기
	 			
	 			location.href = "<%=contextPath%>/updateForm.news?bNo=" + bNo;  

	
	 		});
	 		
	 		$(this).parent().children().eq(1).children().eq(5).click(function(){ // 삭제하기 버튼 클릭시
	 			var bNo = $(this).parent().children().eq(0).val();
	 			selectBId = bNo;	
	 		
	 			$(".cancleOuter").show(); // 삭제여부창 보여주기 
	 		
	 	
	 		});
	 		return false; //중요
	 	
	 	});
		// 메뉴버튼 외에 영역 클릭시 창꺼지도록
	     $(document).click(function(e){ //문서 body를 클릭했을때
	 		if(e.target.className =="rTopArea"){return false} //내가 클릭한 요소(target)를 기준으로 상위요소에 클래스이름이 .rTopArea 없으면 (갯수가 0이라면)
	 		$(".newMenu").fadeOut(500); // 창꺼주기
	 		if(e.target.className == "sRightBtns"){return false}
	 		$(".shareLevel").fadeOut(500);
		 }); 
		
		$(".sXbtn").click(function(){ // 삭제여부 묻는 창에서 x버튼 클릭시
			$(".cancleOuter").hide(); // 수정하기창 숨기기
		});
		
		
	     
		

		
		
	   // 사진미리보기창(cPhotoPreview) 꺼주기
			$(".pPreClose").click(function(){ 
				$(this).parent().hide();
				$(".titleImg").removeAttr("src");
			});
		
		
		// 카메라아이콘 클릭할 때 파일 첨부 창이 뜨도록
		$(function(){
			
			$(".cameraIcon").click(function(){
				$(this).parent().parent().children().eq(2).click(); // 사진등록창 뜨도록
			});
		
		});
		
		

	 	// this->value, 숫자->num, 몇번째인지->index  
		function loadImg(value, num, index){
		
			// 파일의 존재 유무
			if(value.files && value.files[0]){ // 파일선택시 하나만 담기기때문에 0번인덱스값
				// 파일읽어들이기
				var reader = new FileReader(); 
				
				// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e){
					$(".pPreClose").eq(index).parent().show();

					
					switch(num){
					case 1: $(".titleImg").eq(index).attr("src", e.target.result); // data:URL
							break;
					}
				}	
				
				// 파일 읽기 메소드
				reader.readAsDataURL(value.files[0]);		
			}
		}
   
		
		
		// 이미지 클릭시 상세보기 페이지로 넘어가도록(BoardDetailServlet->photoDetailView.jsp)
		function goDetailView( bNo,imgNo ){ 
	     	
	    	   location.href = "<%=contextPath%>/detail.news?bNo=" + bNo + "&imgNo=" + imgNo; 
	    	//  $(".mainOuter").show();
	     }
		
		
		//--------------------삭제 기능-------------------
		function deleteBoard(){ // 삭제여부창에서 삭제클릭시
			location.href = "<%=contextPath%>/delete.news?bNo=" + selectBId;
			
			$(".successOuter").show();
	        $(".successOuter").fadeOut(5000); // 서서히 창없어지도록
			
			
		};
		
		function backMain(){ // 삭제여부창에서 취소클릭시
			$(".cancleOuter").hide();
		};
		
	
	 
	    //------------------댓글기능-------------------	  

	     $(function() { // 댓글수조회
			   
			   var $btn = $(".commentBtn>input");
			   
			   for (var index = 0; index < $btn.length; ++index) {
				   selectRcountList($btn.eq(index).val(), index); // 댓글수조회
				   
			   }
		   });	 
	    
	    
	    function boardCommentBtn(bNo, index){ // 댓글버튼 클릭시
	    	
	    	$(".addReply")[index].focus();  // 클릭한 글의 div 초점 맞추기  
	    	  console.log(index);
	    	  selectRlist(bNo, index);
	    	  selectRcountList(bNo, index);
	    	  
	    	  setInterval(function(){
	    			selectRlist(bNo, index);
	    			selectRcountList(bNo, index);
	    		},100000);
	 
    		  $(".addReply").eq(index).keydown(function(key){
    			 if(key.keyCode == 13){
    				 console.log($(".addReply").eq(index));
    				 var form = $(".uploadForm")[index];
    				 var formData = new FormData(form);
    				 var content = $(".addReply").eq(index).val();
    				 
    				 $.ajax({
							url:"rinsert.new",
							type: "POST",
         					enctype: 'multipart/form-data',
							data: formData,
							contentType : false,
    	 					processData : false, 
							success:function(status){
								
								if(status == "success"){
									selectRlist(bNo, index);
									selectRcountList(bNo, index);
									$(".addReply")[idx].val("");
									
									$(".cPhotoPreview")[idx].hide();
									$(".addReply")[idx].focus();
									
								}else{
									alert("댓글작성실패!!");
									
								}
							},error:function(request,status,error){
						 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							 		console.log("selectRlist 통신 실패!!");
						 	}
					});
     
    				 
    			 } 
    		  });
	    	  
	    	
	    };
	    
	    // 댓글삭제기능
	    function deleteReply(rNo,bNo, index){
	    	
	    	 $.ajax({
	 			url:"deleteReply.news",
	 			data:{rNo:rNo},
	 			dataType:"text",
	 			success:function(){
	 			
	 			},error:function(request,status,error){
	 		 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			 		console.log("deleteReply 통신 실패!!");
	 		 	}
	 		 });
	 	 }
	    
	    
	    // 댓글 총 갯수 구하기
	     function selectRlist(bNo, index){
			  
			  $.ajax({
				 	url:"rlist.new",
				 	data:{bNo:bNo},
				 	dataType:"json",
				 	success:function(list){
				 		var $cAddArea= $(".cAddArea").eq(index); // 댓글담는 <div> </div>
				 		console.log($cAddArea);
				 		
	 			 		$cAddArea.html(""); // 기존 테이블 정보 초기화 
				 		
				 		$.each(list,function(index, value){
				 			console.log(index);
				 			console.log(value);
							var imgpath = '/teamace'+ value.imgPath; // 댓글 이미지경로
							
							var $youComment2 = $("<div>").css({"height":"auto", "display":"flex","padding-left":"10px"});
				 			var $yImgArea2 = $("<div>").css({"width":"10%" });
				 			var $userImg2 = $("<img>").attr("src",value.profileImage).css({"border-radius":"20px","margin":"auto","border": "0.5px solid #ccd0d5","width":"40px", "height":"40px"});
				 			
				 			var $cWriteArea2 = $("<div>").css({"width":"85%","height":"auto","padding-left":"10px"});
				 			
				 			var $cWrite2 = $("<div>").css({"background-color":"#f2f3f5", "display":"flow-root","border-radius":"18px","padding":"10px", "width":"max-content","align-items":"center"});
				 			var $replyBtnArea = $("<div>").css({"display":"none"});
				 			var $replyBtn = $("<button>").css("display","flex");
				 			var $replyBtnImg = $("<img>").attr("src","<%=contextPath%>/resources/image/hye/more-fill.png");
				 			var $rBtnDiv = $("<div>").css({"display":"none","margin-left":"30px", "background":"rgb(242, 243, 245)","border-radius":"8px","cursor":"pointer"}).text("삭제");
				 			var $deleteImg = $("<img>").attr("src","<%=contextPath%>/resources/image/hye/delete-bin-line.png");
				 			var $hiddenRno = $("<input>").val(value.rNo).css("display","none");
				 			$rBtnDiv.append($deleteImg);
				 			$replyBtnArea.append($rBtnDiv);
				 			$replyBtnArea.append($hiddenRno);
				 			
				 			
				 			var $comment1 = $("<a>").text(value.mName).css({"color":"#385898", "font-weight":"900", "display":"flex"});
				 			var $content1 = $("<div>").text(value.rComment).css({"height":"100%", "display":"flex"});
				 			var $imgDiv = $("<div>").css({"display":"inline-block"});
				 			var $imgArea = $("<img>").attr("src", imgpath).css({"max-width":"200px", "max-height":"200px"});
				 			
				 			var $ycBottom2 =$("<div>").css({"height":"20%", "width":"100%","display":"flex"});
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
				 				$cWrite2.attr("display","flex");
				 				$imgDiv.append($imgArea);
				 				$cWrite2.append($imgDiv);
				 				
				  			}
			 	 			
				 			$cWriteArea2.append($cWrite2);
				 			$reLikeArea.append($replyBtnArea);
				 			$replyBtnArea.append($replyBtn);
				 			$replyBtn.append($replyBtnImg);
				 			
				 			$reLikeArea.append($reLikeCount);
				 			$reLikeArea.append($reLikeNum);
				 			
				 			$cWriteArea2.append($ycBottom2);
				 			
				 			
				 			$yImgArea2.append($userImg2);
				 			$youComment2.append($yImgArea2);
				 			$ycBottom2.append($reLikeArea);
				 			$youComment2.append($cWriteArea2);
				 		
				 			$cAddArea.append($youComment2); 
				 			
				 			
				 			$($rlikeBtn).click(function(){ // 댓글 좋아요 클릭시
				 		   	    $(this).css("color","rgb(32, 120, 244)");
								
				 		   	 }).mouseenter(function(){
				 		   		 $(this).css({"cursor":"pointer","text-decoration":"underline"});
				 		   	 }).mouseleave(function(){
				 		   		$(this).css({"cursor":"none","text-decoration":"none"});
				 		   	 });
				 			
				 			
				 			$($ycBottom2).mouseenter(function(){ // 댓글에있는 버튼 나오도록
				 				$replyBtnArea.css("display","block");
				 			}).mouseleave(function(){
				 				$replyBtnArea.css("display","none");
				 			}).click(function(){
				 				$rBtnDiv.css("display","block");
				 			});
				 			
				 			
				 			$($rBtnDiv).click(function(){ // 삭제 버튼 클릭시
				 				
				 			 	var rNo = $(this).next().val(); // 해당 댓글번호 가져오기
				 				deleteReply(rNo, bNo, index); // 댓글 삭제 ajax
				 				$(this).css({"cursor":"pointer"});
				 				//alert(rNo);
				 				
				 			}); 
				 			
				 			
				 		});
				 		
				 	},error:function(request,status,error){
				 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 		console.log("selectRlist 통신 실패!!");
				 	}
				 	
			  });
		  } 
	     
	     
     function selectRcountList(bNo, index){ //댓글총갯수 
		 
		 $.ajax({
			url:"clist.new",
			data:{bNo:bNo},
			dataType:"json",
			success:function(clist){
				
				
				var $countsArea = $(".cComment").eq(index); // 카운트수 담는 div
				
				$countsArea.html(""); // 초기화
					 
					 var text = new Array();
					    
				     text[0] =     '<span class="replyAreaView" style="font-size:16px; padding-top:10px";>댓글 ' + clist  +'개 ';     
			         text[1] =     '</span>';
			         
			         var totalText = "";
			         for (var i = 0; i < text.length; ++i) {
			            totalText += text[i];
			         }
			         $countsArea.append(totalText);
			         
			
			},error:function(request,status,error){
		 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 		console.log("selectRcountList 통신 실패!!");
		 	}
		 });
	 }
     
 
		 
	//-------------- 좋아요 -----------------	   
	   $(function() {
		   
		   var $btn = $(".likeBtn>input");
		   
		   for (var index = 0; index < $btn.length; ++index) {
			   
			   selectLcountList($btn.eq(index).val(), index); // 좋아요수조회
			   boardLikeImgChange($btn.eq(index).val(), index); // 좋아요 색깔 변경하는 ajax에 글번호와 인덱스번호 같이 보내주기
			   console.log($btn.eq(index).val(), index);
		   }
		   
	   });
		   
	//--------- 좋아요기능 ------------	   
	function boardLikeBtn(bNo, index){
		var mNo = <%= loginUser.getmNo()%>;
		
		$.ajax({
			url:"boardLike.news",
			data:{bNo:bNo,mNo:mNo},
		 	dataType:"text",
		 	type:"post",
		 	success:function(){
		 		console.log("갱신완료!");
		 		boardLikeImgChange(bNo, index);
		 		selectLcountList(bNo, index); 
		 	},error:function(request,status,error){
		 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 		console.log("boardLikeBtn 통신 실패!!");
		 	}
		});
	};

	// 좋아요 색깔 바꾸는 기능
	function boardLikeImgChange(bNo, index){ //좋아요 이미지 변경
		var mNo = <%= loginUser.getmNo()%>;
		
		$.ajax({
			url:"boardLikeChange.news",
			data:{bNo:bNo,mNo:mNo},
		 	dataType:"text",
		 	type:"post",
		 	success:function(msg){
		 		var i = <%=list.size()%>;
		 		console.log(index);
		 		
		 		if(msg=="success"){
		 			$(".likeImage").eq(index).attr("src","<%=contextPath%>/resources/image/hye/좋아요클릭.png"); 
		 			$(".likeName").eq(index).css("color","rgb(32, 120, 244)"); // 좋아요글자 색깔 바꾸기

		 		}else{
		 			$(".likeImage").eq(index).attr("src","<%=contextPath%>/resources/image/hye/좋아요.png"); 
		 			$(".likeName").eq(index).css("color","rgb(96, 103, 112)"); // 좋아요글자 색깔 바꾸기

		 		}
		 		console.log("갱신완료!");
		 	},error:function(){
		 		console.log("boardLikeBtn 통신 실패!!");
		 	}
		});

	}
	
	
	function selectLcountList(bNo, index){ //좋아요총갯수 
		 
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
	 }


	  

		
	</script>
	
</body>
</html>