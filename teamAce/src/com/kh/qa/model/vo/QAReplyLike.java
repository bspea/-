package com.kh.qa.model.vo;

import java.sql.Date;

public class QAReplyLike {
	int bNo;
	int rNo;
	int mNo;
	Date lDate;
	
	public QAReplyLike() {}

	public QAReplyLike(int bNo, int rNo, int mNo, Date lDate) {
		super();
		this.bNo = bNo;
		this.rNo = rNo;
		this.mNo = mNo;
		this.lDate = lDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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
		return "QAReplyLike [bNo=" + bNo + ", rNo=" + rNo + ", mNo=" + mNo + ", lDate=" + lDate + "]";
	}
}
