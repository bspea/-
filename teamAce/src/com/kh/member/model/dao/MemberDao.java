package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.BoardImage;
import com.kh.member.model.vo.Alram;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SearchHistory;

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("../../../sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ------------------------------------------------------
	/**
	 * 濡쒓렇�씤 泥섎━ (李⑥쥌�솚)
	 * @param conn
	 * @param id
	 * @param pwd
	 * @param type : email �샊�� phone�쑝濡� �꽆�뼱�삤硫�, 濡쒓렇�씤 諛⑹떇�쓣 李얘린 �쐞�빐 �궗�슜
	 * @return
	 */
	public Member loginMember(Connection conn, String id, String pwd, String type) {
		Member instance = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// �븘�씠�뵒 �삎�떇�씠 �씠硫붿씪�씤吏� 寃��궗 (�븘�땲硫� �빖�뱶�룿 踰덊샇)
		String sql = null;
		if (type.equals("email"))
			sql = prop.getProperty("selectMemberEmail");
		else
			sql = prop.getProperty("selectMemberPhone");
		
		try {
			System.out.println(sql);
			System.out.println(id);
			System.out.println(pwd);
			System.out.println(type);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				instance = new Member(rset.getInt("MNO"),
									  rset.getString("MNAME"),
									  rset.getString("EMAIL"),
									  rset.getString("PHONE"),
									  rset.getString("PASSWORD"),
									  rset.getString("BIRTH"),
									  rset.getString("PROFILEIMAGE"),
									  rset.getString("COVERIMAGE"),
									  rset.getString("INTRODUCETEXT"),
									  rset.getString("WEBSITE"),
									  rset.getString("SOCIALLINK"),
									  rset.getString("ADDRESS"),
									  rset.getString("HOMETOWN"),
									  rset.getString("GENDER"),
									  rset.getDate("MDATE"),
									  rset.getString("STATUS"),
									  rset.getString("REGURL")
									  );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return instance;
	}
	
	/**
	 * �굹�뿉寃� 移쒓뎄�떊泥��븳 �궗�엺�뱾�쓣 遺덈윭�삤�뒗 硫붿냼�뱶 
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId �쁽�옱 濡쒓렇�씤以묒씤 �궗�엺
	 * @return
	 */
	public ArrayList<Member> selectAddFriends(Connection conn, int mId) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddFriends");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member instance = new Member();
				instance.setmNo(rset.getInt("MNOSEND"));
				instance.setmName(rset.getString("MNAME"));
				instance.setmDate(rset.getDate("REQUESTDATE"));
				instance.setProfileImage(rset.getString("ProfileIMAGE"));
				instance.setGender(rset.getString("Gender"));
				list.add(instance);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	/**
	 * 移쒓뎄 異붽��븳 �궗�엺�뱾�쓣 �솗�씤�븯吏� �븡�� 理쒕� �닔瑜� 援ы빐�샃�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int selectFriendsNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFriendsNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}
	
	/**
	 * 移쒓뎄 異붽��쓽 �븣�엺 �몴�떆 �빐�젣�븯�뒗 湲곕뒫
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int updateFriendsNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFriendsNew");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 移쒓뎄 �닔�씫�쓣 �닃���쓣 �븣 移쒓뎄 異붽��빐二쇰뒗 硫붿냼�뱶
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param recvId : 移쒓뎄 �슂泥� 諛쏆� �궗�엺
	 * @param requestId : 移쒓뎄 �슂泥� 蹂대궦 �궗�엺
	 * @return
	 */
	public int friendInsert(Connection conn, String recvId, String requestId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFriend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recvId));
			pstmt.setInt(2, Integer.parseInt(requestId));
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 移쒓뎄 嫄곗젅�쓣 �닃���쓣 �븣 諛쒖깮�븯�뒗 硫붿냼�뱶
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param recvId : 移쒓뎄 �슂泥� 諛쏆� �궗�엺
	 * @param requestId : 移쒓뎄 �슂泥� 蹂대궦 �궗�엺
	 * @return
	 */
	public int friendRefusal(Connection conn, String recvId, String requestId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("refusalFriend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recvId));
			pstmt.setInt(2, Integer.parseInt(requestId));
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * �븣由� �떊泥� 由ъ뒪�듃瑜� 諛쏆븘�삤�뒗 硫붿냼�뱶
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mNo
	 * @return
	 */
	public ArrayList<Alram> selectAlram(Connection conn, int mNo) {
		ArrayList<Alram> list = new ArrayList<Alram>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAlram");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Alram(rset.getInt("MNOAOTHER"),
						  rset.getString("MNAME"),
						  rset.getString("GENDER"),
						  rset.getString("ACONTENT"),
						  rset.getString("PROFILEIMAGE"),
						  rset.getString("AIMAGE"),
						  rset.getDate("ADATE"),
						  rset.getString("LNEW"))
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * �씫吏� �븡�� 硫붿꽭吏��쓽 理쒕� �닔瑜� 媛��졇�샃�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int selectAlramNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAlramNew");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}
	
	/**
	 * �궡寃� �벑濡앸맂 �븣�엺�쓣 �뿴�엺�뻽�쓣 �븣, 鍮④컙�깋 �븘�씠肄섏쓽 �븣�엺 �몴�떆瑜� �빐�젣�빐二쇰뒗 湲곕뒫�엯�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int updateAlramNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAlramNew");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	/**
	 * �옄�떊�씠 寃��깋�뻽�뜕 �삁�쟾 湲곕줉�뱾�쓣 遺덈윭�삤�뒗 硫붿냼�뱶�엯�땲�떎.
	 * author : 李⑥쥌�솚
	 * @param conn
	 * @param mId
	 * @return
	 */
	public ArrayList<SearchHistory> selectSearchHistory(Connection conn, int mId) {
		ArrayList<SearchHistory> list = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectSearchHistory");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, mId);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				SearchHistory instance = new SearchHistory();
//				instance.setfKeyword(rset.getString("FKEYWORD"));
//				
//				list.add(instance);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
		
		return list;
	}
	
	public int friendAddInsert(Connection conn, int recvId, int sendId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("addFriendInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recvId);
			pstmt.setInt(2, sendId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int addFriendsCheck(Connection conn, int recvId, int sendId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("addFriendCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recvId);
			pstmt.setInt(2, sendId);
			pstmt.setInt(3, sendId);
			pstmt.setInt(4, recvId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int alramInsert(Connection conn, int mNo, int mNoAother, String aContent, String aImage) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAlram");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNoAother);
			pstmt.setString(3, aContent);
			
			if (aImage == "null")
				pstmt.setNull(4, Types.VARCHAR);
			else
				pstmt.setString(4, aImage);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	// ---------------------------------------------------------------------------------------------------
	// sira
	
	/**
	 * Author : 시라
	 * 1. 아이디 중복 체크
	 * @param conn
	 * @param lHId
	 * @return
	 */
	public int idCheck(Connection conn, String lHId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lHId);
			pstmt.setString(2, lHId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * Author : 시라
	 * 2. 로그인 조회
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("MNO"),
									   rset.getString("MNAME"),
									   rset.getString("EMAIL"),
									   rset.getString("PHONE"),
									   rset.getString("PASSWORD"),
									   rset.getString("BIRTH"),
									   rset.getString("PROFILEIMAGE"),
									   rset.getString("COVERIMAGE"),
									   rset.getString("INTRODUCETEXT"),
									   rset.getString("WEBSITE"),
									   rset.getString("SOCIALLINK"),
									   rset.getString("ADDRESS"),
									   rset.getString("HOMETOWN"),
									   rset.getString("GENDER"),
									   rset.getDate("MDATE"),
									   rset.getString("STATUS"),
									   rset.getString("REGURL"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return loginUser;
	}

	/**
	 * Author : 시라
	 * 3. 회원가입 서비스
	 * @param conn
	 * @param member
	 * @param random
	 * @return
	 */
	public int insertMember(Connection conn, Member member, String random) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		
		String sql = null;
		if(member.getEmail()==null) {
			sql = prop.getProperty("insertPhoneMember");
		}else {
			sql = prop.getProperty("insertEmailMember");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(sql==prop.getProperty("insertPhoneMember")) {
				pstmt.setString(1, member.getmName());
				pstmt.setString(2, member.getPhone());
				pstmt.setString(3, member.getPassword());
				pstmt.setString(4, member.getBirth());
				pstmt.setString(5, member.getGender());
				pstmt.setString(6, random);
			}else {
				pstmt.setString(1, member.getmName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getPassword());
				pstmt.setString(4, member.getBirth());
				pstmt.setString(5, member.getGender());
				pstmt.setString(6, random);
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/**
	 * Author : 시라
	 * 4. 회원가입 코드인증, 계정찾기 코드인증 조회
	 * @param conn
	 * @param email
	 * @param phone
	 * @param code
	 * @return
	 */
	public ArrayList<Member> loginCodeSelect(Connection conn, String email, String phone, String code) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginCodeSelect");
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			if(email != null) {
				pstmt.setString(1, email);
				pstmt.setString(2, code);
			}else {
				pstmt.setString(1, phone);
				pstmt.setString(2, code);
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new Member(rset.getString("email"),
									rset.getString("phone"),
									rset.getString("REGURL")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	
	/**
	 * Author : 시라
	 * 5. 비밀번호 업데이트
	 * @param conn
	 * @param email
	 * @param phone
	 * @param pwd
	 * @return
	 */
	public int pwdUpdate(Connection conn, String email, String phone, String pwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("pwdUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(email != null) {
				pstmt.setString(1, pwd);
				pstmt.setString(2, email);
			}else {
				pstmt.setString(1, pwd);
				pstmt.setString(2, phone);
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * Author : 시라
	 * 6. 커버이미지 사진 업데이트
	 * @param conn
	 * @param mNo
	 * @param mb
	 * @return
	 */
	public int coverImageUpdate(Connection conn, int mNo, Member mb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("coverImageUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getCoverImage());
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	/**
	 * Author : 시라
	 * 7. 프로필 사진 업데이트
	 * @param conn
	 * @param mNo
	 * @param mb
	 * @return
	 */
	public int profileImageUpdate(Connection conn, int mNo, Member mb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("profileImageUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getProfileImage());
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	/**
	 * Author : 시라
	 * 8. 친구 클릭시 친구정보조회
	 * @param conn
	 * @param mNo
	 * @return
	 */
	public Member memberAll(Connection conn, int mNo) {
		Member mem = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MNO"),
									   rset.getString("MNAME"),
									   rset.getString("EMAIL"),
									   rset.getString("PHONE"),
									   rset.getString("PASSWORD"),
									   rset.getString("BIRTH"),
									   rset.getString("PROFILEIMAGE"),
									   rset.getString("COVERIMAGE"),
									   rset.getString("INTRODUCETEXT"),
									   rset.getString("WEBSITE"),
									   rset.getString("SOCIALLINK"),
									   rset.getString("ADDRESS"),
									   rset.getString("HOMETOWN"),
									   rset.getString("GENDER"),
									   rset.getDate("MDATE"),
									   rset.getString("STATUS"),
									   rset.getString("REGURL"));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return mem;
		
	}
	
	
	/**
	 * Author : 시라
	 * 9. 내 타임라인 게시글 이미지 첨부 저장
	 * @param conn
	 * @param mNo
	 * @param bImg
	 * @return
	 */
	public int boardImgInsert(Connection conn, int mNo, BoardImage bImg) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("boardImgInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
				pstmt.setString(1, bImg.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
//	/**
//	 * 알림 신청 리스트를 받아오는 메소드
//	 * author : 차종환
//	 * @param conn
//	 * @param mNo
//	 * @return
//	 */
//	public ArrayList<Alram> selectAlram(Connection conn, int mNo) {
//		ArrayList<Alram> list = new ArrayList<Alram>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectAlram");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, mNo);
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				list.add(new Alram(rset.getInt("MNOAOTHER"),
//						  rset.getString("MNAME"),
//						  rset.getString("GENDER"),
//						  rset.getString("ACONTENT"),
//						  rset.getString("PROFILEIMAGE"),
//						  rset.getString("AIMAGE"),
//						  rset.getDate("ADATE"),
//						  rset.getString("LNEW"))
//						);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
}
