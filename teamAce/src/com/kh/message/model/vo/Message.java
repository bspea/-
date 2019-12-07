package com.kh.message.model.vo;

import java.sql.Date;

public class Message {
	private int msgNo;
	private int mNo;
	private String mContent;
	private Date mDate;
	private String mStatus;
	
	// 기타 추가
	private int recvNo;
	private String mName;
	private String gender;
	private String profileImage;
	private int readCount;
	
	public Message() {
		
	}

	public Message(int msgNo, int mNo, String mContent, Date mDate, String mStatus, String mName, String gender,
			String profileImage, int readCount) {
		super();
		this.msgNo = msgNo;
		this.mNo = mNo;
		this.mContent = mContent;
		this.mDate = mDate;
		this.mStatus = mStatus;
		this.mName = mName;
		this.gender = gender;
		this.profileImage = profileImage;
		this.readCount = readCount;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getRecvNo() {
		return recvNo;
	}

	public void setRecvNo(int recvNo) {
		this.recvNo = recvNo;
	}
	
	
}