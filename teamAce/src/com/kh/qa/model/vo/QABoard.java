package com.kh.qa.model.vo;

import java.sql.Date;

public class QABoard {
	int qaNo;			//글번호
	int mNo;			//회원번호
	String qaTitle;		//글제목
	String qaContent;	//글내용
	int qaView;			//조회수
	Date qaDate;		//게시일
	String status;		//상태 게시판 존재하는지
	
	//
	int qaLikeCount;	//좋아요 수
	int qareplyCount; 	//답변 수
	String profileImg;
	String mName;
	
	
	
	
	public QABoard(int qaNo, String qaTitle, String qaContent, int qaView, Date qaDate, int qaLikeCount, int qaReplyCount, String profileImg, String mName) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaView = qaView;
		this.qaDate = qaDate;
		this.qaLikeCount = qaLikeCount;
		this.qareplyCount = qaReplyCount;
		this.profileImg = profileImg;
		this.mName = mName;

	}

	
	public QABoard(int qaNo, int mNo) {
		super();
		this.qaNo = qaNo;
		this.mNo = mNo;
	}




	//예전데이터인데..
	public QABoard(int qaNo, String qaTitle, String qaContent, int qaView, Date qaDate, String status) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaView = qaView;
		this.qaDate = qaDate;
		this.status = status;
	}

	public QABoard(int mNo, String qaTitle, String qaContent) {
		super();
		this.mNo = mNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		
	}



	public QABoard() {
	}
	
	
	
	public QABoard(int qaNo, String qaTitle, int qaView, Date qaDate, int qaLikeCount, int qareplyCount) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaView = qaView;
		this.qaDate = qaDate;
		this.qaLikeCount = qaLikeCount;
		this.qareplyCount = qareplyCount;	
	}	
	

	public QABoard(int qaNo, int mNo, String qaTitle, String qaContent, int qaView, Date qaDate, int qaLikeCount,
			int qareplyCount, String status, String profileImg, String mName) {
		super();
		this.qaNo = qaNo;
		this.mNo = mNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaView = qaView;
		this.qaDate = qaDate;
		this.qaLikeCount = qaLikeCount;
		this.qareplyCount = qareplyCount;
		this.status = status;
		this.profileImg = profileImg;
		this.mName = mName;
		
		
	}



	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public int getQaView() {
		return qaView;
	}

	public void setQaView(int qaView) {
		this.qaView = qaView;
	}

	public Date getQaDate() {
		return qaDate;
	}
	
	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	public String getmName() {
		return mName;
	}



	public void setmName(String mName) {
		this.mName = mName;
	}



	public String getDate() {
		return "" + (qaDate.getYear() +1900) + "년 " + (qaDate.getMonth() +1) + "월 " + (qaDate.getDate()) + "일";
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	

	public int getQaLikeCount() {
		return qaLikeCount;
	}



	public void setQaLikeCount(int qaLikeCount) {
		this.qaLikeCount = qaLikeCount;
	}



	public int getQareplyCount() {
		return qareplyCount;
	}


	public void setQareplyCount(int qareplyCount) {
		this.qareplyCount = qareplyCount;
	}



	@Override
	public String toString() {
		return "QABoard [qaNo=" + qaNo + ", mNo=" + mNo + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent
				+ ", qaView=" + qaView + ", qaDate=" + qaDate + ", qaLikeCount=" + qaLikeCount + ", qareplyCount="
				+ qareplyCount + ", status=" + status + ", profileImg=" + profileImg + ", mName=" + mName + "]";
	}











	
	
}
