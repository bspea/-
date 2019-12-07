package com.kh.board.model.vo;

import java.sql.Date;

/**
 *  2019-10-08 수정
 * @author hyen1
 *
 */
public class Board { 
	

	private int bNo;		// 게시글 고유 번호
	private int mNo;		// 게시글 글쓴이 번호
	private String mName;	// 글쓴이 이름
	private String profileimage; 
	private String bContent;// 게시글 내용
	private Date bDate;		// 게시글 작성일
	private String bStatus;	// 게시글 상태(Y,N)
	private int bLike;		// 게시글 좋아요수
	private int imgNo;		// 게시글 대표이미지
	private String imgPath; // 게시글 대표이미지 경로
	private int replyCount;
	
	public Board() {
		
	}
	
	public Board(int bNo, int mNo, String mName, String profileimage, String bContent, Date bDate, String bStatus,
			int bLike) {
		super();
		this.bNo = bNo;
		this.mNo = mNo;
		this.mName = mName;
		this.profileimage = profileimage;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bStatus = bStatus;
		this.bLike = bLike;
	}
	

	public Board(int bNo, int mNo, String mName, String profileimage, String bContent, Date bDate, String bStatus,
			int bLike, int replyCount) {
		super();
		this.bNo = bNo;
		this.mNo = mNo;
		this.mName = mName;
		this.profileimage = profileimage;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bStatus = bStatus;
		this.bLike = bLike;
		this.replyCount = replyCount;
	}



	public Board(int bNo, int mNo, String mName, String profileimage, String bContent, Date bDate, String bStatus,
			int bLike, int imgNo, String imgPath, int replyCount) {
		super();
		this.bNo = bNo;
		this.mNo = mNo;
		this.mName = mName;
		this.profileimage = profileimage;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bStatus = bStatus;
		this.bLike = bLike;
		this.imgNo = imgNo;
		this.imgPath = imgPath;
		this.replyCount = replyCount;
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

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getbLike() {
		return bLike;
	}

	public void setbLike(int bLike) {
		this.bLike = bLike;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", mNo=" + mNo + ", mName=" + mName + ", profileimage=" + profileimage
				+ ", bContent=" + bContent + ", bDate=" + bDate + ", bStatus=" + bStatus + ", bLike=" + bLike
				+ ", imgNo=" + imgNo + ", imgPath=" + imgPath + ", replyCount=" + replyCount + "]";
	}

	
	
	
	
}
