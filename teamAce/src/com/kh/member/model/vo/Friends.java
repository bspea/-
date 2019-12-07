package com.kh.member.model.vo;

import java.sql.Date;

/**
 * 친구 상태를 나타내는 클래스입니다.
 * 하나의 유저가 다수의 친구를 가질 수 있기 때문에 ArrayList로 넣어서 사용합니다.
 * @author 차종환
 *
 */
public class Friends {
	int fNo;			// 고유번호. SEQ_FRIENDS.NEXTVAL로 생성합니다.
	int mNoRecv;		// 친구 추가를 받은 사람
	int mNoSend;		// 친구 추가를 보낸 사람
	Date requestDate;	// 친구 추가를 보낸 날짜
	Date addDate;		// 친구 추가를 수락한 날짜 (수락 안한 상태는 null입니다)
	char status;		// 현재 친구인지 아닌지 체크. 기본값은 'N' 입니다.
	
	public Friends() {}
	
	public Friends(int fNo, int mNoRecv, int mNoSend, Date requestDate, Date addDate, char status) {
		super();
		this.fNo = fNo;
		this.mNoRecv = mNoRecv;
		this.mNoSend = mNoSend;
		this.requestDate = requestDate;
		this.addDate = addDate;
		this.status = status;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public int getmNoRecv() {
		return mNoRecv;
	}
	public void setmNoRecv(int mNoRecv) {
		this.mNoRecv = mNoRecv;
	}
	public int getmNoSend() {
		return mNoSend;
	}
	public void setmNoSend(int mNoSend) {
		this.mNoSend = mNoSend;
	}
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Friends [fNo=" + fNo + ", mNoRecv=" + mNoRecv + ", mNoSend=" + mNoSend + ", requestDate=" + requestDate
				+ ", addDate=" + addDate + ", status=" + status + "]";
	}
	
}
