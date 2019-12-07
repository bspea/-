package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Alram;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SearchHistory;

public class MemberService {
	/**
	 * 濡쒓렇�씤 泥섎━ (李⑥쥌�솚)
	 * author : 李⑥쥌�솚
	 * @param id
	 * @param pwd
	 * @param type : email �샊�� phone�쑝濡� �꽆�뼱�삤硫�, 濡쒓렇�씤 諛⑹떇�쓣 李얘린 �쐞�빐 �궗�슜
	 * @return
	 */
	public Member loginMember(String id, String pwd, String type) {
		Member instance = null;
		Connection conn = getConnection();
		
		// �씠硫붿씪 & �빖�뱶�룿踰덊샇 援щ텇�� Dao�뿉�꽌 吏꾪뻾�빀�땲�떎.
		instance = new MemberDao().loginMember(conn, id, pwd, type);
		
		close(conn);
		
		return instance;
	}
	
	/**
	 * �굹�뿉寃� 移쒓뎄�떊泥��븳 �궗�엺�뱾�쓣 遺덈윭�삤�뒗 硫붿냼�뱶
	 * author : 李⑥쥌�솚
	 * @param mId �쁽�옱 濡쒓렇�씤�븳 �궗�엺
	 * @return
	 */
	public ArrayList<Member> selectAddFriends(int mId) {
		ArrayList<Member> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = new MemberDao().selectAddFriends(conn, mId);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * �궡寃� 移쒓뎄 異붽��븳 �궗�엺�뱾�쓽 紐� �닔瑜� 援ы빐�삤�릺, �븣�엺 �솗�씤�쓣 �븯吏� �븡�� �궗�엺�쓽 �닔瑜� 援ы빐�샃�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param mId
	 * @return
	 */
	public int selectFriendsNew(int mId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().selectFriendsNew(conn, mId);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * �궡寃� �벑濡앸맂 �븣�엺 以�, �궡媛� �솗�씤�븯吏� �븡�� �븣�엺�쓽 媛쒖닔瑜� 援ы빐�샃�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param mId
	 * @return
	 */
	public int selectAlramNew(int mId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().selectAlramNew(conn, mId);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * �궡寃� �벑濡앸맂 �븣�엺�쓣 �뿴�엺�뻽�쓣 �븣, 鍮④컙�깋 �븘�씠肄섏쓽 �븣�엺 �몴�떆瑜� �빐�젣�빐二쇰뒗 湲곕뒫�엯�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param mId
	 * @return
	 */
	public int updateAlramNew(int mId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().updateAlramNew(conn, mId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 移쒓뎄 異붽��쓽 �븣�엺 �몴�떆 �빐�젣�븯�뒗 湲곕뒫
	 * author : 李⑥쥌�솚
	 * @param mId
	 * @return
	 */
	public int updateFriendsNew(int mId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().updateFriendsNew(conn, mId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 移쒓뎄 �닔�씫�쓣 �닃���쓣 �븣 �몮 �떎 移쒓뎄 �긽�깭濡� 留뚮뱾�뼱二쇰뒗 硫붿냼�뱶
	 * author : 李⑥쥌�솚
	 * @param recvId 移쒓뎄 �떊泥��쓣 諛쏆� �궗�엺
	 * @param requestId 移쒓뎄 �떊泥��쓣 蹂대궦 �궗�엺
	 * @return
	 */
	public int friendInsert(String recvId, String requestId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().friendInsert(conn, recvId, requestId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 移쒓뎄 嫄곗젅�쓣 �닃���쓣 �븣 �빐�떦 �궡�슜�쓣 �궘�젣�븯�뒗 硫붿냼�뱶
	 * @param recvId
	 * @param requestId
	 * @return
	 */
	public int friendRefusal(String recvId, String requestId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().friendRefusal(conn, recvId, requestId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * �븣�엺 紐⑸줉�쓣 List濡� 諛섑솚�븯�뒗 硫붿냼�뱶
	 * @param mNo
	 * @return
	 */
	public ArrayList<Alram> selectAlram(int mNo) {
		ArrayList<Alram> list = null;
		Connection conn = getConnection();
		
		list = new MemberDao().selectAlram(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * �옄�떊�씠 寃��깋�뻽�뜕 �삁�쟾 湲곕줉�뱾�쓣 遺덈윭�삤�뒗 硫붿냼�뱶�엯�땲�떎.
	 * @param mNo
	 * @return
	 */
	public ArrayList<SearchHistory> selectSearchHistory(int mNo) {
		ArrayList<SearchHistory> list = null;
		Connection conn = getConnection();
		
		list = new MemberDao().selectSearchHistory(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	public int friendAddInsert(int recvId, int sendId) {
		int result = 0;
		Connection conn = getConnection();
		
		// 移쒓뎄異붽� �꽔湲� �쟾�뿉 �꽔�쓣 �닔 �엳�뒗嫄댁� �솗�씤
		result = new MemberDao().addFriendsCheck(conn, recvId, sendId);
		if (result == 1) {
			rollback(conn);
			return 0;
		}
		
		result = new MemberDao().friendAddInsert(conn, recvId, sendId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	

	public int alramInsert(int mNo, int mNoAother, String aContent, String aImage) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().alramInsert(conn, mNoAother, mNo, aContent, aImage);
		
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int friendCheck(int recvNo, int sendNo) {
		int result = 0;
		Connection conn = getConnection();
		
		// 移쒓뎄異붽� �꽔湲� �쟾�뿉 �꽔�쓣 �닔 �엳�뒗嫄댁� �솗�씤
		result = new MemberDao().addFriendsCheck(conn, recvNo, sendNo);
		if (result == 1) {
			rollback(conn);
			return 0;
		} else {
			return 1;
		}
	}
	
	// ---------------------------------------------------------------
	// sira
	/**
	 * Author : 시라
	 * 1. 아이디 중복 체크
	 * @param lHId
	 * @return
	 */
	public int idCheck(String lHId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, lHId);
		
		close(conn);
		
		return result;
		
		
	}
	
	

	/**
	 * Author : 시라
	 * 2. 로그인 서비스
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		
		return loginUser;
	}

	
	
	/**
	 * Author : 시라
	 * 3. 회원가입 서비스
	 * @param member
	 * @param random
	 * @return
	 */
	public int insertMember(Member member, String random) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, member, random);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}


	/**
	 * Author : 시라
	 * 4. 계정찾기, 회원가입 인증코드 서비스
	 * @param email
	 * @param phone
	 * @param codeNo
	 * @return
	 */
	public ArrayList<Member> loginCodeSelect(String email, String phone, String codeNo) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().loginCodeSelect(conn, email, phone, codeNo);
		
		close(conn);
		
		return list;
	}



	/**
	 * Author : 시라
	 * 5. 비밀번호 변경 서비스
	 * @param email
	 * @param phone
	 * @param pwd
	 * @return
	 */
	public int pwdUpdate(String email, String phone, String pwd) {
		Connection conn = getConnection();
		
		
		int result = new MemberDao().pwdUpdate(conn, email, phone, pwd);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}

	/**
	 * Author : 시라
	 * 6. 커버사진 업데이트 서비스
	 * @param mNo
	 * @param mb
	 * @return
	 */
	public int coverImageUpdate(int mNo, Member mb) {
		Connection conn = getConnection();
		int result = new MemberDao().coverImageUpdate(conn, mNo, mb);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}

	/**
	 * Author : 시라
	 * 7. 프로필 사진 업데이트 서비스
	 * @param mNo
	 * @param mb
	 * @return
	 */
	public int profileImageUpdate(int mNo, Member mb) {
		Connection conn = getConnection();
		
		int result = new MemberDao().profileImageUpdate(conn, mNo, mb);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}

	/**
	 * Author : 시라
	 * 8. 친구눌렀을때 전체정보 조회해올 서비스
	 * @param mNo
	 * @return
	 */
	public Member memberAll(int mNo) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().memberAll(conn, mNo);
		
		close(conn);
		
		return mem;
	}

	/**
	 * Author : 시라
	 * 9. 내 타임라인 게시글에 첨부한 이미지 저장
	 * @param mNo
	 * @param bImg
	 * @return
	 */
	public int boardImgInsert(int mNo, BoardImage bImg) {
		Connection conn = getConnection();
		
		int result = new MemberDao().boardImgInsert(conn, mNo, bImg);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}



}
