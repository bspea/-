package com.kh.board.model.vo;

import java.sql.Date;

/**
 * 2019-10-10 수정
 * @author hyen1
 *
 */
public class BoardLike {
	private int lNo;	// 좋아요 번호
	private int mNo;	// 회원 번호
	private String mName; // 회원명
	private int bNo;	// 글 번호
	private Date lDate; // 좋아요한 날짜
	private int lCount;	// 좋아요 총갯수
	
	public BoardLike() {}
	
	

	public BoardLike(int lNo, int mNo, String mName, int bNo, Date lDate) {
		super();
		this.lNo = lNo;
		this.mNo = mNo;
		this.mName = mName;
		this.bNo = bNo;
		this.lDate = lDate;
	}



	public BoardLike(int lNo, int mNo, String mName, int bNo, Date lDate, int lCount) {
		super();
		this.lNo = lNo;
		this.mNo = mNo;
		this.mName = mName;
		this.bNo = bNo;
		this.lDate = lDate;
		this.lCount = lCount;
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

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	public int getlCount() {
		return lCount;
	}

	public void setlCount(int lCount) {
		this.lCount = lCount;
	}

	@Override
	public String toString() {
		return "BoardLike [lNo=" + lNo + ", mNo=" + mNo + ", mName=" + mName + ", bNo=" + bNo + ", lDate=" + lDate
				+ ", lCount=" + lCount + "]";
	}

	
	
}
