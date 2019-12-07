package com.kh.qa.model.vo;

import java.sql.Date;

public class QAImage {
	int imgNo;		//이미지 번호
	int qaNo;		// 글번호
	String imgPath;	// 이미지파일경로
	Date imgDate;	// 이미지 등록일
	
	public QAImage() {}

	public QAImage(int imgNo, int qaNo, String imgPath, Date imgDate) {
		super();
		this.imgNo = imgNo;
		this.qaNo = qaNo;
		this.imgPath = imgPath;
		this.imgDate = imgDate;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
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
		return "QAImage [imgNo=" + imgNo + ", qaNo=" + qaNo + ", imgPath=" + imgPath + ", imgDate=" + imgDate + "]";
	}
}
