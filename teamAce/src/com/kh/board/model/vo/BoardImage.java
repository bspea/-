package com.kh.board.model.vo;

import java.sql.Date;

public class BoardImage {
	private int imgNo;
	private int bNo;
	private String imgPath;
	private Date imgDate;
	
	public BoardImage() {}

	public BoardImage(int imgNo, int bNo, String imgPath, Date imgDate) {
		super();
		this.imgNo = imgNo;
		this.bNo = bNo;
		this.imgPath = imgPath;
		this.imgDate = imgDate;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
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

	@Override
	public String toString() {
		return "BoardImage [imgNo=" + imgNo + ", bNo=" + bNo + ", imgPath=" + imgPath + ", imgDate=" + imgDate + "]";
	}

	
}
