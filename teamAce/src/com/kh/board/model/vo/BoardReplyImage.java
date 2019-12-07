package com.kh.board.model.vo;

import java.sql.Date;

/**
 * 10-12 등록상태컬럼추가 private모두  붙여줌
 * @author hyem1
 *
 */
public class BoardReplyImage {
	
	private int imgNo; // 댓글이미지 고유번호
	private int rNo; // 댓글고유번호
	private String imgPath; // 이미지명
	private Date imgDate; // 등록시간
	private String iStatus; // 등록상태
	
	public BoardReplyImage() {}

	public BoardReplyImage(int imgNo, int rNo, String imgPath, Date imgDate, String iStatus) {
		super();
		this.imgNo = imgNo;
		this.rNo = rNo;
		this.imgPath = imgPath;
		this.imgDate = imgDate;
		this.iStatus = iStatus;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public Date getImgDate() {
		return imgDate;
	}

	public void setImgDate(Date imgDate) {
		this.imgDate = imgDate;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	@Override
	public String toString() {
		return "BoardReplyImage [imgNo=" + imgNo + ", rNo=" + rNo + ", imgPath=" + imgPath + ", imgDate=" + imgDate
				+ ", iStatus=" + iStatus + "]";
	}

	
	
}
