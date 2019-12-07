package com.kh.message.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import com.kh.message.model.vo.Message;

public class MessageDao {
	private Properties prop = new Properties();
	
	public MessageDao() {
		String fileName = MessageDao.class.getResource("../../../sql/message/message-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// ------------------------------------------------------
	
	/**
	 * 메세지 목록을 List로 반환하는 메소드
	 * author : 차종환
	 * @param conn
	 * @param mNo
	 * @return
	 */
	public ArrayList<Message> selectMessage(Connection conn, int mNo) {
		ArrayList<Message> list = new ArrayList<Message>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message instance = new Message();
				instance.setMsgNo(rset.getInt("MSGNO"));
				instance.setmName(rset.getString("MNAME"));
				instance.setGender(rset.getString("GENDER"));
				instance.setmContent(rset.getString("MCONTENT"));
				instance.setProfileImage(rset.getString("PROFILEIMAGE"));
				instance.setmDate(rset.getDate("MDATE"));
				instance.setReadCount(rset.getInt("READCOUNT"));
				
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
	 * 친구 추가한 사람들을 확인하지 않은 최대 수를 구해옵니다.
	 * author : 차종환
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int selectMessageNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageNew");
		
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
	 * 읽지 않은 메세지들을 읽음 처리해주는 메소드입니다.
	 * author : 차종환
	 * @param conn
	 * @param mId
	 * @return
	 */
	public int updateMessageNew(Connection conn, int mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMessageNew");
		
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
	
	public ArrayList<Member> selectMessenger(Connection conn, int mNo) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessenger");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member instance = new Member();
				instance.setmNo(rset.getInt("mNo"));
				instance.setmName(rset.getString("mName"));
				instance.setProfileImage(rset.getString("PROFILEIMAGE"));
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
	
	public Member selectMemberInfo(Connection conn, int mNo) {
		Member instance = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				instance.setmNo(mNo);
				instance.setmName(rset.getString("MNAME"));
				instance.setProfileImage(rset.getString("PROFILEIMAGE"));
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
	
	public ArrayList<Message> selectMessageContent(Connection conn, int mNo) {
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message instance = new Message();
				instance.setmNo(rset.getInt("MNO"));
				instance.setRecvNo(rset.getInt("RECVNO"));
				instance.setmContent(rset.getString("MCONTENT"));
				
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
	
	public int insertMessage(Connection conn, String text, int sendNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sendNo);
			pstmt.setString(2, text);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertPrivateMessage(Connection conn, int recvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPrivateMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recvNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
