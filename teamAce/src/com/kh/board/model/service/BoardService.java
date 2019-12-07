package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardImage;
import com.kh.board.model.vo.BoardLike;
import com.kh.board.model.vo.BoardReply;
import com.kh.board.model.vo.BoardReplyImage;
import com.kh.member.model.vo.Member;

public class BoardService {
	
	
	/**
	 * 1-hye. 뉴스피드 전체(리스트) 조회용 서비스
	 * @return 뉴스피드 전체 리스트
	 * 2019-10-06
	 */
	public ArrayList<Board> selectNewsfeedList(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectNewsfeedList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/** 2-hye. 뉴스피드 사진(리스트) 조회용 서비스
	 * @return 뉴스피드 전체 사진 리스트
	 * 2019-10-07
	 */
	public ArrayList<BoardImage> selectPhotoList(){
		Connection conn = getConnection();
		
		ArrayList<BoardImage> plist = new BoardDao().selectPhotoList(conn);
		
		close(conn);
		
		return plist;
	}
	
	
	/**
	 * 3-hye. 한개의 뉴스피드(글) 조회용 서비스
	 * @return 뉴스피드 한개의 해당글
	 * 2019-10-07
	 */
	public Board selectOneNewsfeed(int bno) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectOneNewsfeed(conn, bno);
		
		close(conn);
		
		return b;
		
	}
	
	/**
	 * 4-hye. 해당 글의 사진리스트 조회용 서비스
	 * @param bno
	 * @return
	 * 2019-10-08
	 */
	public ArrayList<BoardImage> selectOnePhotoList(int bno){
		Connection conn = getConnection();
		
		ArrayList<BoardImage> polist = new BoardDao().selectOnePhotoList(conn, bno);
		
		close(conn);
		
		return polist;
	}
	
	/**
	 * 5-hye. 댓글 작성용 서비스
	 * @param r -> 댓글 객체
	 * @return
	 * 2019-10-08
	 */
	public int insertReply(BoardReply r,BoardReplyImage bi) {
		Connection conn = getConnection();
		int result = 0;
		
		result = new BoardDao().insertReply(conn,r);

		if(result > 0) {
			commit(conn);
			if(bi != null) {
				int rNo = new BoardDao().selectReplyRno(conn); // 댓글에 댓글고유번호 조회
				
				result = new BoardDao().insertReplyImage(conn, bi ,rNo); // 댓글이미지 등록 
				
				System.out.println("====서비스=====");
				System.out.println(bi);
				System.out.println(rNo);
				System.out.println(result);
				
				if(result > 0) { // 댓글이미지 등록 성공시
					commit(conn);
				}else {
					rollback(conn);
				}
			}
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 6-hye. 뉴스피드 삭제 서비스
	 * @param bNo
	 * @return
	 * 2019-10-10
	 */
	public int deleteNewsfeed(int bNo) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().deleteNewsfeed(conn, bNo);
		int result2 = new BoardDao().deleteBoardImage(conn, bNo);
		
		int result = 0;
		if(result1 > 0 || result2 > 0) {
			commit(conn);
			result = 1;
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 7-hye. 댓글 조회 서비스
	 * @param bNo
	 * @return
	 */
	public ArrayList<BoardReply> selectRlist(int bNo){
		Connection conn = getConnection();
		
		ArrayList<BoardReply> list = new BoardDao().selectRlist(conn, bNo);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 8-hye. 글번호에따른 좋아요 목록
	 * @param bNo
	 * @return
	 */
	public ArrayList<BoardLike> selectOneLikeList(int bNo){
		Connection conn = getConnection();
		
		ArrayList<BoardLike> likeList = new BoardDao().selectOnteLikeList(conn, bNo);
		
		close(conn);
		
		return likeList;
	}
	
	/**
	 * 9-hye. 뉴스피드 수정 서비스
	 * @param bNo
	 * @return
	 */
//	public int updateNewsfeed(Board b, ArrayList<BoardImage> list) {
//		Connection conn = getConnection();
//		int result = 0;
//		
//		result = new BoardDao().updateNewsfeed(conn, b); // 글내용수정하기
//		System.out.println("9번 서비스" + b);
//		
//		if(result > 0) {
//			commit(conn);
//			if(list!= null) {
//				result = new BoardDao().updateBoardImage(conn,list, b);
//				
//				System.out.println("====서비스=====");
//				System.out.println(list);
//				System.out.println(b);
//				System.out.println(result);
//				
//				if(result > 0) { // 댓글이미지 등록 성공시
//					commit(conn);
//				}else {
//					rollback(conn);
//				}
//			}
//		}
//		close(conn);
//		
//		return result;
//	}
//	
	
	
	public int updateNewsfeed(Board b) {
		Connection conn = getConnection();
		int result = 0;
		
		result = new BoardDao().updateNewsfeed(conn, b); // 글내용수정하기
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
	
		close(conn);
		
		return result;
	}
	
	
	
	/**
	 * 10-hye. 댓글 총 갯수 조회용 서비스
	 * @param bNo
	 * @return
	 */
	public int selectCountReplyList(int bNo) {
		Connection conn = getConnection();
		
		int clist = new BoardDao().selectCountReplyList(conn, bNo);
		
		close(conn);
		
		return clist;
		
	}
	
	public int deleteBoardReply(int rNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoardReply(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 11-hye. 좋아요 총 갯수 조회용 서비스-글에따라
	 * @param bNo
	 * @return
	 */
	public int selectCountLikeList(int bNo) {
		Connection conn = getConnection();
		
		int llist = new BoardDao().selectCountLikeList(conn, bNo);
		
		close(conn);
		
		return llist;
	}
	
/*	*//**
	 * 12-hye. 좋아요 추가 기능
	 * @param blike
	 * @return
	 *//*
	public int insertLike(BoardLike blike) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertLike(conn, blike);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}*/
	
	

	
	
	public int boardLike(int bNo, int mNo) {
		Connection conn = getConnection();

		boolean alive = new BoardDao().selectOneLike(conn,bNo,mNo); // 해당 글번호와 사람이 동일한게 있는지 확인
		int result =0;
		
		if(alive==true) { // 이미 추천수를 누른 사람
			result = new BoardDao().deleteLike(conn, bNo, mNo); 
		}else { // 추천수를 누르지않은 사람
			result = new BoardDao().boardLike(conn, bNo, mNo);
		}
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	public boolean boardLikeChange(int bNo, int mNo) {
		Connection conn = getConnection();

		boolean result = new BoardDao().selectOneLike(conn, bNo, mNo);
		
		close(conn);
		
		return result;
	}
	
	
	
	
	/**
	 * Author : 시라
	 * 1. 소개 업데이트 리스트
	 * @param m
	 * @return
	 */
	public int introduceUpdate(Member m) {
		Connection conn = getConnection();
		
		int result = new BoardDao().introduceUpdate(conn, m);
		
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
	 * 2. 내 친구 조회
	 * @param mNo
	 * @return
	 */
	public ArrayList<Member> friendsAll(int mNo) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new BoardDao().friendsAll(conn, mNo);
		
		close(conn);
		
		return list;
	}


	
	

	
	

}
