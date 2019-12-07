package com.kh.board.model.vo;

import java.sql.Date;

/**
 * 10.12 수정 카운트수 추가
 * @author hyem1
 *
 */
public class BoardReplyLike {
	int lNo;
	int mNo;
	int rNo;
	Date lDate;
	int lCount;
	
	public BoardReplyLike() {}

	public BoardReplyLike(int lNo, int mNo, int rNo, Date lDate) {
		super();
		this.lNo = lNo;
		this.mNo = mNo;
		this.rNo = rNo;
		this.lDate = lDate;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	@Override
	public String toString() {
		return "BoardReplyLike [lNo=" + lNo + ", mNo=" + mNo + ", rNo=" + rNo + ", lDate=" + lDate + "]";
	}
}
