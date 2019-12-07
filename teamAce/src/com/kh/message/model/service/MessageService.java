package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.vo.Member;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

public class MessageService {

	/**
	 * 메세지 목록을 List로 반환하는 메소드
	 * @param mNo
	 * @return
	 */
	public ArrayList<Message> selectMessage(int mNo) {
		ArrayList<Message> list = null;
		Connection conn = getConnection();
		
		list = new MessageDao().selectMessage(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 동그랗고 빨간 아이콘
	 * author : 차종환
	 * @param mId
	 * @return
	 */
	public int selectMessageNew(int mNo) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MessageDao().selectMessageNew(conn, mNo);
		
		close(conn);
		
		return result;
	}
	
	public int updateMessageNew(int mId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MessageDao().updateMessageNew(conn, mId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	public ArrayList<Member> selectMessenger(int mNo) {
		ArrayList<Member> list = null;
		Connection conn = getConnection();
		
		list = new MessageDao().selectMessenger(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	public Member selectMemberInfo(int mNo) {
		Member instnace = null;
		Connection conn = getConnection();
		
		instnace = new MessageDao().selectMemberInfo(conn, mNo);
		
		close(conn);
		
		return instnace;
	}
	
	public ArrayList<Message> selectMessageContent(int mNo) {
		ArrayList<Message> list = null;
		Connection conn = getConnection();
		
		list = new MessageDao().selectMessageContent(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	public int insertMessage(String text, int sendNo, int recvNo) {
		int result = 0;
		Connection conn = getConnection();

		result = new MessageDao().insertMessage(conn, text, sendNo);
		if (result <= 0) {
			rollback(conn);
			close(conn);
			
			return result;
		}
		
		result = new MessageDao().insertPrivateMessage(conn, recvNo);
		
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}
}
