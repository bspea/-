<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	ArrayList<Member> list3 = (ArrayList<Member>)request.getSession().getAttribute("friendsList");
	Member member3 = (Member)request.getSession().getAttribute("member");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <style>
 	/* 친구부분 */
 	img{
 		border:0;
 	}
 	.fr_2w3{
 		margin:10px 0 0 0;
 		width: 851px;
 	}
 	.fr_30f{
 		background:#fff;
 		border:1px solid #ccd0d5;
 		border-radius:3px;
 		margin-bottom:10px;
 		position:relative;
 	}
 	.fr_3cz{
 		background:#f5f6f7;
 		border-bottom:1px solid #d3d6db;
 		border-radius:2px 2px 0 0;
 		margin-bottom:15px;
 		min-height:40px;
 		padding-top:16px;
 	}
 	.fr_clearfix{
 		zoom:1;
 	}
 	.fr_3c-{
 		display:inline-block;
 		font-size:20px;
 		font-weight:bold;
 		height:24px;
 		line-height:1;
 		margin:0 12px 5px;
 		width:100px;
 	}
 	.fr_51sx{
 		vertical-align:middle;
 	}
	.fr_ohe{
		float:left;
	}
	h3{
		color:#1c1e21;
		padding:0;
	}
	.fr_51sw{
		margin:0 9px 0 0;
		vertical-align:middle;
	}
	.fr_Img{
		border:border-radius:0;
		display:inline-block;
		bottom:1px;
		position:relative;
		vertical-align:middle;
	}
	.fr_3i9{
		padding:0 14px 0 15px;
	}
	.fr_262m{
		margin-left:-13px;
	}
	.fr_30f2{
 		background:#fff;
 		border-radius:3px;
 		margin-bottom:10px;
 		position:relative;
 	}
	
	
	/* 친구박스 */
	.fr_698{/*--------------------------------------------  */
		border:1px solid #e9ebee;
		display:inline-block;
		margin:0 0 13px 13px;
		padding:0 10px 0 0;
		position:relative;
		vertical-align:top;
		width:388px;
	}
	.fr_5qo4{
		margin:-1px;
	}
	.fr_5q6s{
		position:relative;
	}
	.fr_8o{
		display:block;
	}
	.fr_8t{
		margin-right:10px;
	}
	a{
		color:#385898;
		cursor:pointer;
		text-decoration:none;
	}
	.fr_rv{
		height:100px;
		width:100px;
	}
	.fr_1x2_{
		margin-top:1px;
	}
	.fr_42ef{
		overflow:hidden;
	}
	.fr_6a{
		display:inline-block;
	}
	.fr_ohf{
		float:right;
	}
	.fr_6b{
		vertical-align:middle;
	}
	.fr_5t4x{
		margin-left:10px;
	}
	.fr_FriendButton{
		display:inline-block;
		vertical-align:top;
	}
	.fr_42ft{
		margin-left:4px;
	}
	.fr_4jy0{
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
	.fr_2agf{
		display:inline-flex;
		word-wrap:normal;
	}
	.fr_4o_4{
		display:inline-flex;
	}
	.fr_friendButton{
		cursor:default;
	}
	.fr_enableFriendListFlyout{
		cursor:default;
	}
	.fr_4jy3{
		line-height:22px;
	}
	.fr_517h{
		background-color:#f5f6f7;
		border-color:#ccd0d5;
		color:#4b4f56;
	}
	.fr_3-8_{
		margin-right:4px;
	}
	.fr_sp_U-ZrA51p6aB_1_5x{
		background-position:-368px -222px;
		background-size:500px 254px;
		background-repeat:no-repeat;
		display:inline-block;
		height:12px;
		width:12px;
		margin-top:4px;
	}
	.fr_sx_426ff8{
		background-position:-368px -222px;
	}
	.fr_55pe{
		display:inline-block;
		overflow:hidden;
		text-overflow:ellipsis;
		vertical-align:top;
		white-space:nowrap;
	}
	.fr_uiProfileBlockContent{
		overflow:hidden;
		
	}
	.fr_fcb{
		clor:#333;
	}
	.fr_fwb{
		font-weight:600;
	}
	.fr_fsl{
		font-size:14px;
	}
	.test333{
		cursor:pointer;
	}
 </style>
</head>
<body>
                                            
                                            
                                            
	<!-- 친구 목록 전체 div -->
	<div class="fr_36d" id="timeline-medley">
	
		<!-- 위 마진 -->
		<div class="fr_2w3">
			<!-- 친구목록 전체 contents -->
			<div class="fr_5h60 fr_30f" id="fr_pagelet_timeline_medley_friends"
				style="min-height:0px;">
				
				
				<!-- 친구 타이틀 마진 -->
				<div class="fr_3cz">
					<!-- 친구 타이틀 위치 가로줄 -->
					<div class="fr_clearfix">
						<!-- 친구 아이콘이미지+타이틀 div -->
						<h3 class="fr_3c- fr_1float fr_ohe" id="fr_medley_header_friends">
							<!-- 아이콘이미지 -->
							<img class="fr_51sw fr_Img" style="width:26px; height:26px;" src="resources/image/sira/friends.png">
							<span class="fr_51sx">친구</span>
						</h3>
					</div>
				</div>
				
				
				
				
				<!-- 친구 밑에 목록 영역 패딩 -->
				<div class="fr_3i9">
					<!-- 목록contents -->
					<div class="fr_5h60 fr_30f2">
						<!-- 오른쪽 마진 -->
						<div class="fr_uiList fr_262m fr_4kg">
						
						
						
						
						
						<!-- for문 돌려야될곳 -->
							<!-- 친구버튼과 박스 오른쪽 패딩, 박스 왼쪽,아래 마진 -->
							<% if(list3.isEmpty()){ %>
							
								<h4> 아직 친구가 없습니다.</h4>
							
							<% }else{ %>
								<% for(Member mm : list3) { %>
								<div class="fr_698" style="height:98px;">
								
									<!-- 박스contents(사진,이름,친구버튼)div -->
									<div class="fr_clearfix fr_5qo4">
									
										<!-- 사진 클릭시 링크이동, 사진이미지 오른쪽마진  -->
										<div class="fr_5q6s fr_8o fr_8t fr_ohe">
											<!-- 이미지 -->
											 <input type="hidden" id="mNoF2" value="<%= mm.getmNo() %>">
											<img class="fr_s0 fr_4ooo fr_1x2_ fr_1ve7 fr_rv fr_Img test333" src="<%= mm.getProfileImage() %>">
											
										</div>
										
											<script>
													$(function(){
														$(".test333").click(function(){
															location.href="<%=contextPath%>/timeLines.bo?mNo=" + $(this).prev().val();
														});
													});
												</script>
										
										
										<!-- 이름,친구버튼 영역 -->
										<div class="fr_clearfix fr_42ef">
											<!-- 친구버튼 영역 -->
											<div class="fr_6a fr_rfloat fr_ohf">
												<!-- 친구버튼바깥 높이간격 -->
												<div class="fr_6a fr_6b" style="height:100px"></div>
												<!-- 친구버튼영역 정렬 -->
												<div class="fr_6a fr_6b">
													<!-- 친구버튼영역 왼쪽 마진 -->
													<div class="fr_5t4x">
														<!-- 친구버튼 div -->
														<div class="fr_FriendButton" id="fr_FrBtn">
															<!-- 친구버튼 -->
															<a class="fr_42ft fr_4jy0 fr_55pi fr_2agf fr_4o_4 fr_FriendRequestFriends fr_friendButton fr_enableFriendListFlyout fr_4jy3 fr_517h fr_51sy"
															href="" style="max-width:200px;">
																<!-- 아이콘 오른쪽 글씨 사이 간격 -->
																<span class="fr_-xe fr_3-8_">
																	<!-- 체크 아이콘 -->
																	<img class="fr_Img fr_sp_U-ZrA51p6aB_1_5x fr_sx_426ff8 fr_customimg" src="resources/image/sira/check-line.png">
																</span>
																<!-- 친구글씨 버튼세로간격-->
																<span class="fr_55pe">
																	<!-- 친구글씨 -->
																	<span>친구</span>
																</span>
															</a>
														</div>
													</div>
												</div>
											</div>
											
											
											<!-- 친구목록에있는 친구이름 -->
											<div class="fr_uiProfileBlockContent">
												<div class="fr_6a">
													<div class="fr_6a fr_6n" style="height:40px"></div>
													<div class="fr_fsl fr_fwb fr_fcb">
														<a href="">
															<%= mm.getmName() %>
														</a>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
								<% } %>
							<% }%>	
							
							
							
							
							
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 페이징 바 처리 -->
		<div class="fr_pagingArea" align="center">
			
			<!-- 맨 처음으로(<<) -->
			
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/timelinefd.bo?currentPage=1';"> &lt;&lt; </button> --%>
			
			<!-- 이전 페이지로(<) -->
<%-- 			<% if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/timelinefd.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<% } %> --%>
			
			<!-- 10개의 페이지 목록 -->
			
			<!-- 다음 페이지로(>) -->
			
			<!-- 맨끝으로(>>) -->
			
		</div>
		
	</div>
	
	
	
	
	
	<script>
		
		
		
	</script>
	
</body>
</html>