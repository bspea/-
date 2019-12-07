package com.kh.qa.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.qa.model.dao.QADao;
import com.kh.qa.model.vo.QABoard;
import com.kh.qa.model.vo.QAReply;

public class QAService {
	
	/**
	 * 1. QA게시판 전체(리스트) 조회용서비스
	 * @return
	 */
	public ArrayList<QABoard> selectList(){
		
		Connection conn = getConnection();
		
		ArrayList<QABoard> list = new QADao().selectList(conn);
		System.out.print("여기됨 가진온건데 ㅡㅡ");
		close(conn);
		
		return list;
		
	}

	/**
	 * 2. 게시글 작성용
	 * @param q
	 * @return
	 */


	public int insertQABoard(QABoard q) {
		
		Connection conn = getConnection();
		
		int result = new QADao().insertQABoard(conn, q);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 3. 게시글 보기
	 * @param qano --> 보고자하는 글번호
	 * @return
	 */
	public QABoard selectQABoard(int qano) {
		Connection conn = getConnection();
		
		// 증가용 dao 호출하기
		
		int result = new QADao().increaseCount(conn, qano);
		
		// 보고하자는 게시판  dao 호출
		
		QABoard qa = null;
		
		if(result>0) {
			commit(conn);
			qa = new QADao().selectQABoard(conn, qano);
		}else {
			rollback(conn);
		}
		
		return qa;
		
	}
	
	/**
	 * 댓글리스트 조회
	 * @param qaNo
	 * @return
	 */
	public ArrayList<QAReply> selectQARlist(int qaNo) {

		Connection conn = getConnection();

		ArrayList<QAReply> list = new QADao().selectQARlist(conn, qaNo);

		close(conn);

		return list;

	}

	/**
	 * 댓글 달기
	 * @param qa
	 * @return
	 */
	public int insertQAReply(QAReply qa) {
		Connection conn = getConnection();

		int result = new QADao().insertQAReply(conn, qa);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;

	}
	
	

	/**
	 * 게시판 조회수 많은거
	 * @param qaNo
	 * @return
	 */
	public ArrayList<QABoard> lookupQABoard() {
		
		Connection conn = getConnection();

		ArrayList<QABoard> list = new QADao().lookupQABoard(conn);
		
		close(conn);

		return list;
		
	}

	/**
	 * 리플수 많은거
	 * 게시판 좋아요 많은거
	 * @return
	 */
	public ArrayList<QABoard> replyQABoard(int qaNo) {
		
		Connection conn = getConnection();

		ArrayList<QABoard> list = new QADao().replyQABoard(conn, qaNo);
		
		close(conn);

		return list;
	}

	
	/**
	 * 좋아요많은거?
	 * @return
	 */
	public ArrayList<QABoard> goodupQABoard() {
		Connection conn = getConnection();

		ArrayList<QABoard> list = new QADao().goodupQABoard(conn);
		
		close(conn);

		return list;
	}

	/**
	 * 최근꺼 보기
	 * @return
	 */
	public ArrayList<QABoard> latelyQABoard() {
		Connection conn = getConnection();

		ArrayList<QABoard> list = new QADao().latelyQABoard(conn);
		
		close(conn);

		return list;
	}

	/**
	 * 좋아요해볼거.
	 * @param qaNo
	 * @param mNo
	 * @return
	 */
	public int qaboardLike(int qaNo, int mNo) {
		Connection conn = getConnection();

		int result = new QADao().qaboardLike(conn, qaNo, mNo);

		if (result > 0) {
			
			commit(conn);
			
		} else {
			rollback(conn);
		}

		return result;
		
	}

	public int deleteQaLike(int qaNo, int mNo) {
		Connection conn = getConnection();

		int result = new QADao().deleteQaLike(conn, qaNo, mNo);

		if (result > 0) {
			
			commit(conn);
			
		} else {
			rollback(conn);
		}

		return result;
	}

	/**
	 * 게시글삭제
	 * @param qaNo
	 * @return
	 */
	public int QABoardelete(int qaNo, int mNo) {
		Connection conn = getConnection();
		
		int result = new QADao().QABoardelete(conn, qaNo, mNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}



}
