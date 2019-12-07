package com.kh.member.model.vo;

import java.sql.Date;

public class SearchHistory {
	private int fId;
	private int mNo;
	private String fKeyword;
	private Date fDate;
	private String fState;
	
	public SearchHistory() {}

	public SearchHistory(int fId, int mNo, String fKeyword, Date fDate, String fState) {
		super();
		this.fId = fId;
		this.mNo = mNo;
		this.fKeyword = fKeyword;
		this.fDate = fDate;
		this.fState = fState;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getfKeyword() {
		return fKeyword;
	}

	public void setfKeyword(String fKeyword) {
		this.fKeyword = fKeyword;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}

	public String getfState() {
		return fState;
	}

	public void setfState(String fState) {
		this.fState = fState;
	}

	@Override
	public String toString() {
		return "SearchHistory [fId=" + fId + ", mNo=" + mNo + ", fKeyword=" + fKeyword + ", fDate=" + fDate
				+ ", fState=" + fState + "]";
	}
}
