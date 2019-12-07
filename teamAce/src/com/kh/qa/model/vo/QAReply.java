package com.kh.qa.model.vo;

import java.sql.Date;

public class QAReply {
	private int rNo;			// 댓글번호
	private int qaNo;			// 글번호
	private int mNo;			// 회원번호
	private String rComment;	// 내용
	private Date rDate;			// 등록일
	private Date qaDate;
	private String rStatus;		// 상태 보여지는지
	
	
	// 내가 필요한 정보들
	private String profileImage;
	private int likeCount;
	private String mName;
	
	public QAReply() {}
	
	public QAReply(int qaNo, int mNo, String rComment) {
		super();
		this.qaNo = qaNo;
		this.mNo = mNo;
		this.rComment = rComment;
	}
	
	public QAReply(String profileImage, String mName, String rComment, Date rDate, int likeCount) {
		super();
		this.profileImage = profileImage;
		this.rComment = rComment;
		this.rDate = rDate;
		this.likeCount = likeCount;
		this.mName = mName;
	}



	public QAReply(int rNo, int qaNo, int mNo, String rComment, Date rDate, Date qaDate, String rStatus) {
		super();
		this.rNo = rNo;
		this.qaNo = qaNo;
		this.mNo = mNo;
		this.rComment = rComment;
		this.rDate = rDate;
		this.qaDate = qaDate;
		this.rStatus = rStatus;
	}
	

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	public String getrComment() {
		return rComment;
	}

	public void setrComment(String rComment) {
		this.rComment = rComment;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	public String getDate() {
		return "" + (qaDate.getYear() +1900) + "년 " + (qaDate.getMonth() +1) + "월 " + (qaDate.getDate()) + "일";
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	
	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public Date getQaDate() {
		return qaDate;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "QAReply [rNo=" + rNo + ", qaNo=" + qaNo + ", mNo=" + mNo + ", rComment=" + rComment + ", rDate=" + rDate
				+ ", qaDate=" + qaDate + ", rStatus=" + rStatus + ", profileImage=" + profileImage + ", likeCount="
				+ likeCount + "]";
	}

	
}
