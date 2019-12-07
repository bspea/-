package com.kh.board.model.vo;

import java.sql.Date;

/**
 * 2019-10-13 수정 이미지 좋아요수
 * @author hyen1
 *
 */
public class BoardReply {

	private int rNo; //댓글고유번호
	private int bNo; //글번호
	private int mNo; // 작성자번호
	private String mName; // 작성자이름
	private String profileImage; // 작성자 이미지
	private String rComment; // 댓글내용
	private Date rDate; // 댓글작성일
	private int rCount; // 댓글수
	private String rStatus; // 댓글상태
	private String imgPath; // 댓글 이미지
	private int lcount; // 좋아요수
	
	public BoardReply() {}

	public BoardReply(int rNo, int bNo, int mNo, String mName, String profileImage, String rComment, Date rDate,
			String rStatus, String imgPath) {
		super();
		this.rNo = rNo;
		this.bNo = bNo;
		this.mNo = mNo;
		this.mName = mName;
		this.profileImage = profileImage;
		this.rComment = rComment;
		this.rDate = rDate;
		this.rStatus = rStatus;
		this.imgPath = imgPath;
	}

	public BoardReply(int rNo, int bNo, int mNo, String mName, String profileImage, String rComment, Date rDate,
			int rCount, String rStatus, String imgPath, int lcount) {
		super();
		this.rNo = rNo;
		this.bNo = bNo;
		this.mNo = mNo;
		this.mName = mName;
		this.profileImage = profileImage;
		this.rComment = rComment;
		this.rDate = rDate;
		this.rCount = rCount;
		this.rStatus = rStatus;
		this.imgPath = imgPath;
		this.lcount = lcount;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
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

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getLcount() {
		return lcount;
	}

	public void setLcount(int lcount) {
		this.lcount = lcount;
	}

	@Override
	public String toString() {
		return "BoardReply [rNo=" + rNo + ", bNo=" + bNo + ", mNo=" + mNo + ", mName=" + mName + ", profileImage="
				+ profileImage + ", rComment=" + rComment + ", rDate=" + rDate + ", rCount=" + rCount + ", rStatus="
				+ rStatus + ", imgPath=" + imgPath + ", lcount=" + lcount + "]";
	}

	
	
}
