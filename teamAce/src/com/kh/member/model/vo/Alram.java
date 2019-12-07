package com.kh.member.model.vo;

import java.sql.Date;

/**
 * 그냥 알림입니다..
 * 
 * @author 차종환
 *
 */
public class Alram {
	int mnoAother;			// 다른 사람에 의해 뜬 알람일 경우 그 상대를 뜻합니다.
	String mName;				// 그 사람의 이름
	String gender;
	String aContent;		// 알람 내용입니다.
	String profileImage;	// 그 사람의 프로필 이미지
	String aImage;			// 이미지를 올린 것에 의한 알람일 경우 그 이미지를 뜻합니다.
	Date aDate;				// 알람이 등록된 날짜
	String aNew;			// 그 알람이 새로운 알람인지 아닌지. 기본값 N
	
	public Alram() {}
	
	public Alram(int mnoAother, String mName, String gender, String aContent, String profileImage, String aImage, Date aDate,
			String aNew) {
		super();
		this.mnoAother = mnoAother;
		this.mName = mName;
		this.gender = gender;
		this.aContent = aContent;
		this.profileImage = profileImage;
		this.aImage = aImage;
		this.aDate = aDate;
		this.aNew = aNew;
	}

	public int getMnoAother() {
		return mnoAother;
	}

	public void setMnoAother(int mnoAother) {
		this.mnoAother = mnoAother;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getaImage() {
		return aImage;
	}

	public void setaImage(String aImage) {
		this.aImage = aImage;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getaNew() {
		return aNew;
	}

	public void setaNew(String aNew) {
		this.aNew = aNew;
	}
}