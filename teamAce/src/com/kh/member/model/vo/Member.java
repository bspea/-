package com.kh.member.model.vo;

import java.sql.Date;

/**
 * 멤버 클래스입니다.
 * @author 차종환
 *
 */
public class Member {
	int mNo;				// 고유번호. SEQ_MEMBER.NEXTVAL로 생성합니다.
	String mName;			// 성명
	String email;			// 이메일 주소 (이메일 주소와 핸드폰 번호 중 1개로 로그인할 수 있습니다)
	String phone;			// 핸드폰 번호 (이메일 주소와 핸드폰 번호 중 1개로 로그인할 수 있습니다)
	String password;		// 비밀번호
	String birth; // 생년월일
	String profileImage;	// 타임라인의 동그란 부분에 걸리는 나의 사진
	String coverImage;		// 타임라인의 위에 전체를 차지하는 곳에 걸리는 나의 사진
	String introduceText;	// 나를 소개하는 글
	String website;			// 정보란의 웹사이트 입력하는 값
	String socialLink;		// 정보란의 소셜링크 입력하는 값
	String address;			// 현주소
	String hometown;		// 본적
	String gender;			// M 혹은 F를 입력합니다.
	Date mDate;				// 가입한 날짜
	String status;			// 현재 탈퇴했는지 아닌지 여부. N이면 탈퇴상태입니다.
	String regURL;			// 이메일 혹은 핸드폰번호 인증할 때 사용되는 URL 입니다. 통과시 'Y' 입니다.
	
	public Member() {}
	
	
	public Member(int mNo, String mName, String email, String phone, String password, String birth, String profileImage, String coverImage,
			String introduceText, String website, String socialLink, String address, String hometown, String gender,
			Date mDate, String status, String regURL) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.birth = birth;
		this.profileImage = profileImage;
		this.coverImage = coverImage;
		this.introduceText = introduceText;
		this.website = website;
		this.socialLink = socialLink;
		this.address = address;
		this.hometown = hometown;
		this.gender = gender;
		this.mDate = mDate;
		this.status = status;
		this.regURL = regURL;
	}
	
	
	/**
	 * Author : 시라
	 * 1. ajaxJoinServlet(회원가입) 매개변수 생성자
	 * @param mName
	 * @param email
	 * @param phone
	 * @param password
	 * @param birth
	 * @param gender
	 */
	public Member(String mName, String email, String phone, String password, String birth, String gender) {
		super();
		this.mName = mName;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.birth = birth;
		this.gender = gender;
	}

	/**
	 * Author : 시라
	 * 2. 코드인증 매개변수 생성자
	 * @param email
	 * @param phone
	 * @param regURL
	 */
	public Member(String email, String phone, String regURL) {
		super();
		this.email = email;
		this.phone = phone;
		this.regURL = regURL;
	}
	


	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public String getIntroduceText() {
		return introduceText;
	}

	public void setIntroduceText(String introduceText) {
		this.introduceText = introduceText;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getSocialLink() {
		return socialLink;
	}

	public void setSocialLink(String socialLink) {
		this.socialLink = socialLink;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegURL() {
		return regURL;
	}

	public void setRegURL(String regURL) {
		this.regURL = regURL;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mName=" + mName + ", email=" + email + ", phone=" + phone + ", password="
				+ password + ", birth=" + birth +", profileImage=" + profileImage + ", coverImage=" + coverImage + ", introduceText="
				+ introduceText + ", website=" + website + ", socialLink=" + socialLink + ", address=" + address
				+ ", hometown=" + hometown + ", gender=" + gender + ", mDate=" + mDate + ", status=" + status
				+ ", regURL=" + regURL + "]";
	}

	
}
