package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardImage;
import com.kh.board.model.vo.BoardLike;
import com.kh.board.model.vo.BoardReply;
import com.kh.board.model.vo.BoardReplyImage;
import com.kh.member.model.vo.Member;

public class BoardDao {
	Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("../../../sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ------------------------------------------------------
	
	
	/**
	 * 1-hye. 뉴스피드 전체(리스트) 조회용 서비스
	 * 2019-10-06
	 * @param conn
	 * @return
	 */
	public ArrayList<Board> selectNewsfeedList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectNewsfeedList");
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { // list담아주기
				list.add(new Board(rset.getInt("bno"),
								   rset.getInt("mno"),
								   rset.getString("mname"),
								   rset.getString("PROFILEIMAGE"),
								   rset.getString("bcontent"),
								   rset.getDate("bDATE"),
								   rset.getString("bstatus"),
								   rset.getInt("bLike"),
								   rset.getInt("replycount")
								   ));
								   
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
	 * 2-hye. 뉴스피드 사진(리스트) 조회용 서비스
	 * @param conn
	 * @return 사진리스트
	 * 2019-10-07
	 */
	public ArrayList<BoardImage> selectPhotoList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<BoardImage> plist = new ArrayList<>();
		
		String sql = prop.getProperty("selectPhotoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardImage bi = new BoardImage();
				bi.setImgNo(rset.getInt("imgno"));
				bi.setbNo(rset.getInt("bno"));
				bi.setImgPath(rset.getString("imgpath"));
				
				plist.add(bi);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return plist;
	}
	
	/**
	 * 3-hye. 뉴스피드 한개(board객체) 조회용 서비스
	 * 2019-10-07
	 * @param conn
	 * @param bno
	 * @return
	 */
	public Board selectOneNewsfeed(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String sql = prop.getProperty("selectOneNewsfeed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("bno"),
							  rset.getInt("mno"),
						   rset.getString("mname"),
						   rset.getString("PROFILEIMAGE"),
						   rset.getString("bcontent"),
						   rset.getDate("bDATE"),
						   rset.getString("bstatus"),
						   rset.getInt("NVL(T.BLIKE,0)")
						   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;	
	}
	
	/**
	 * 4-hye. 해당글  한개 중 사진리스트(BoardImagelist) 조회용 서비스
	 * @param conn
	 * @param bno
	 * @return
	 * 2019-10-08
	 */
	public ArrayList<BoardImage> selectOnePhotoList(Connection conn, int bno){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<BoardImage> polist = new ArrayList<>();
		
		String sql = prop.getProperty("selectOnePhotoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardImage bi = new BoardImage();
				bi.setImgNo(rset.getInt("imgno"));
				bi.setbNo(rset.getInt("bno"));
				bi.setImgPath(rset.getString("imgpath"));
				
				polist.add(bi);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return polist;
		
	}
	
	public int insertReply(Connection conn, BoardReply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReply");
		
		/*System.out.println("====다애아오밖=====");
		System.out.println(r.getmNo());
		System.out.println(r.getbNo());
		System.out.println(r.getrComment());*/
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getmNo());
			pstmt.setInt(2, r.getbNo());
			pstmt.setString(3, r.getrComment());
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNewsfeed(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteNewsfeed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteBoardImage(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBoardImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<BoardReply> selectRlist(Connection conn, int bNo){
		ArrayList<BoardReply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new BoardReply(rset.getInt("rno"),
										rset.getInt("bno"),
										rset.getInt("mno"),
										rset.getString("mName"),
										rset.getString("profileImage"),
										rset.getString("rcomment"),
										rset.getDate("rdate"),
										rset.getString("rstatus"),
										rset.getString("imgPath")
										));
			//	System.out.println(rset.getString("profileImage"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<BoardLike> selectOnteLikeList(Connection conn, int bNo){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<BoardLike> likeList = new ArrayList<>();
		
		String sql = prop.getProperty("selectOneLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardLike like = new BoardLike();
				like.setlNo(rset.getInt("lno"));
				like.setbNo(rset.getInt("bno"));
				like.setmNo(rset.getInt("mno"));
				like.setmName(rset.getString("mname"));
				like.setlDate(rset.getDate("ldate"));
				
				likeList.add(like);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return likeList;
	}
	
	
	public int updateNewsfeed(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateNewsfeed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getbContent());
			pstmt.setInt(2, b.getbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 10-hye. 댓글 총 갯수 조회용 서비스
	 * @param conn
	 * @param bNo
	 * @return
	 */
	public int selectCountReplyList(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int clist = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("replyCountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				clist = rset.getInt(1);
			}
		//	System.out.println("dao"+clist);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return clist;
	}
	
	
	/**
	 * 11-hye. 좋아요 총 갯수 조회용 서비스-글에따라
	 * @param conn
	 * @param bNo
	 * @return
	 */
	public int selectCountLikeList(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int llist = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeCountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				llist = rset.getInt(1);
			}
			//System.out.println("dao"+llist);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return llist;
	}
	
	/**
	 * 12-hye. 댓글객체 가져오기
	 * @param conn
	 * @return
	 */
	public int selectReplyRno(Connection conn) {
		PreparedStatement pstmt = null;
		int rNo = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyRno");		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			System.out.println("===  rno dao =====");
			System.out.println(rNo);
			
			if(rset.next()) {
				rNo = rset.getInt("rno");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rNo;
	}
	
	public int insertReplyImage(Connection conn, BoardReplyImage bi, int rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReplyImg");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			pstmt.setString(2, bi.getImgPath());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 댓글 삭제기능 
	 * @param conn
	 * @param rNo
	 * @return
	 */
	public int deleteBoardReply(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBoardReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertLike(Connection conn, BoardLike like) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertLike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, like.getbNo());
			pstmt.setInt(2, like.getmNo());
			
			result = pstmt.executeUpdate();
			System.out.println("dao" + like);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public boolean selectOneLike(Connection conn, int bNo, int mNo) {
		PreparedStatement pstmt = null;
		boolean alive = false;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, mNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			alive = true;	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return alive;
		
	}
	
	public int deleteLike(Connection conn,int bNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteLike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int boardLike(Connection conn, int bNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertLike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateBoardImage(Connection conn, ArrayList<BoardImage> list , Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoardImage");
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.size(); i++) {
				
				BoardImage bi = list.get(i);
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, bi.getImgPath());
				pstmt.setInt(2, bi.getImgNo());
				
				result += pstmt.executeUpdate(); // list이기 때문에 +=로
			
			}
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * Author : 시라
	 * 1. 소개 수정
	 * @param conn
	 * @param m
	 * @return
	 */
	public int introduceUpdate(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql =prop.getProperty("introduceUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getIntroduceText());
			pstmt.setInt(2, m.getmNo());
			
			System.out.println(m.getIntroduceText());
			System.out.println(m.getmNo());
			
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
	 * 2. 내 친구 조회
	 * @param conn
	 * @param mNo
	 * @return
	 */
	public ArrayList<Member> friendsAll(Connection conn, int mNo) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("friendsAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, mNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member instance = new Member();
				instance.setmNo(rset.getInt("mNo"));
				instance.setmName(rset.getString("MNAME"));
				instance.setProfileImage(rset.getString("PROFILEIMAGE"));
				
				list.add(instance);
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 close(rset);
			 close(pstmt);
		 }
		return list;
	}
	
	
}

	