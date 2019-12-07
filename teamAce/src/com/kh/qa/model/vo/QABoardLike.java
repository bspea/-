package com.kh.qa.model.vo;

import java.sql.Date;

public class QABoardLike {
	int bNo;		// 좋아요번호
	int qaNo;		// 글번호
	int mNo;		// 회원번호
	Date lDate;		// 등록일 좋아요 누른날
	
	public QABoardLike() {}

	public QABoardLike(int bNo, int qaNo, int mNo, Date lDate) {
		super();
		this.bNo = bNo;
		this.qaNo = qaNo;
		this.mNo = mNo;
		this.lDate = lDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
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

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	@Override
	public String toString() {
		return "QABoardLike [bNo=" + bNo + ", qaNo=" + qaNo + ", mNo=" + mNo + ", lDate=" + lDate + "]";
	}
}
