package com.kh.search.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.Alram;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.SearchHistory;
import com.kh.qa.model.dao.QADao;

public class SearchDao {
	Properties prop = new Properties();
	
	public SearchDao() {
		String fileName = QADao.class.getResource("../../../sql/search/search-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ------------------------------------------------------
	
	/**
	 * 자신이 검색했던 예전 기록들을 불러오는 메소드입니다.
	 * author : 차종환
	 * @param conn
	 * @param mId
	 * @return
	 */
	public ArrayList<Member> selectSearch(Connection conn, String keyword, int mNo) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member instance = new Member();
				instance.setmNo(rset.getInt("MNO"));
				instance.setmName(rset.getString("MNAME"));
				instance.setProfileImage(rset.getString("PROFILEIMAGE"));
				instance.setIntroduceText(rset.getString("ITEXT"));
				instance.setBirth(rset.getString("BIRTH"));
				
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
	
	public int insertSearchHistory(Connection conn, String keyword, int mNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setString(2, keyword);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public ArrayList<Member> selectMember(Connection conn, String keyword) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member instance = new Member();
				instance.setmNo(rset.getInt("MNO"));
				instance.setmName(rset.getString("MNAME"));
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
}
