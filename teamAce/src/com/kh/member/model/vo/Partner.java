package com.kh.member.model.vo;

import java.sql.Date;

/**
 * 현재 연애중인지 약혼중인지 등등의 관계 상태를 나타내는 클래스입니다.
 * @author 차종환
 *
 */
public class Partner {
	int pNo;				// 고유번호. SEQ_PARTNER.NEXTVAL로 생성합니다.
	int mNo;				// Member의 고유번호 (나)
	int mNoPartner;			// Member의 고유번호 (상대방)
	String pReperences;		// 관계 상태 (연애, 약혼, 결혼, 결별 등등 문자값)
	Date pDate;				// 해당 관계가 된 날짜
	
	public Partner() {}
	
	public Partner(int pNo, int mNo, int mNoPartner, String pReperences, Date pDate) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.mNoPartner = mNoPartner;
		this.pReperences = pReperences;
		this.pDate = pDate;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmNoPartner() {
		return mNoPartner;
	}

	public void setmNoPartner(int mNoPartner) {
		this.mNoPartner = mNoPartner;
	}

	public String getpReperences() {
		return pReperences;
	}

	public void setpReperences(String pReperences) {
		this.pReperences = pReperences;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	@Override
	public String toString() {
		return "Partner [pNo=" + pNo + ", mNo=" + mNo + ", mNoPartner=" + mNoPartner + ", pReperences=" + pReperences
				+ ", pDate=" + pDate + "]";
	}
}
