package com.kh.search.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.vo.Member;
import com.kh.search.model.dao.SearchDao;

public class SearchService {
	public ArrayList<Member> selectSearch(String keyword, int mNo) {
		ArrayList<Member> list = null;
		
		Connection conn = getConnection();
		
		list = new SearchDao().selectSearch(conn, keyword, mNo);
		
		close(conn);
		
		return list;
	}
	
	public int insertSearchHistory(String keyword, int mNo) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new SearchDao().insertSearchHistory(conn, keyword, mNo);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Member> selectMember(String keyword) {
		ArrayList<Member> list = null;
		Connection conn = getConnection();
		
		list = new SearchDao().selectMember(conn, keyword);
		
		close(conn);
		
		return list;
	}
}
