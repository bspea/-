package com.kh.qa.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.qa.model.vo.QABoard;
import com.kh.qa.model.vo.QAReply;

public class QADao {
	Properties prop = new Properties();
	
	public QADao() {
		String fileName = QADao.class.getResource("../../../sql/qa/qa-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ------------------------------------------------------

	public ArrayList<QABoard> selectList(Connection conn) {
		
		ArrayList<QABoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QABoard(rset.getInt("QANO"),
						 			 rset.getString("QATITLE"),
						 			 rset.getString("qaContent"),
						 			 rset.getInt("qaview"),
						 			 rset.getDate("qadate"),
						 			 rset.getInt("qalikeCount"),
						 			 rset.getInt("qareplyCount"),
						 			 rset.getString("PROFILEIMAGE"),
						 			 rset.getString("mName")));
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

	public int insertQABoard(Connection conn, QABoard q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQABoard");
	
		System.out.println("내용 : " + q);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getmNo());
			pstmt.setString(2, q.getQaTitle());
			pstmt.setString(3, q.getQaContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, int qano) {
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qano);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public QABoard selectQABoard(Connection conn, int qano) {
		
		QABoard qa = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQABoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, qano);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {

				qa = (new QABoard(rset.getInt("qaNo"),
						 rset.getString("qaTitle"),
						 rset.getString("qaContent"),
						 rset.getInt("qaView"),
						 rset.getDate("qadate"),
						 rset.getInt("qaLikeCount"),
						 rset.getInt("qareplyCount"),
						 rset.getString("profileImage"),
						 rset.getString("mName")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qa;
	}
	
	
	public ArrayList<QAReply> selectQARlist(Connection conn, int qaNo) {

		ArrayList<QAReply> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQARlist");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new QAReply(rset.getString("profileImage"),
								     rset.getString("MNAME"),
									 rset.getString("rComment"),
									 rset.getDate("rDate"),
									 rset.getInt("likeCount")));
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

	public int insertQAReply(Connection conn, QAReply qa) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertQAReply");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qa.getQaNo());
			pstmt.setInt(2, qa.getmNo());
			pstmt.setString(3, qa.getrComment());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public ArrayList<QAReply> lookupQAReply(Connection conn, int qaNo) {
		
		ArrayList<QAReply> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("lookupQAReply");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new QAReply(rset.getString("profileImage"),
								     rset.getString("MNAME"),
									 rset.getString("rComment"),
									 rset.getDate("rDate"),
									 rset.getInt("likeCount")));
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

	public ArrayList<QABoard> lookupQABoard(Connection conn) {
		
		ArrayList<QABoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("lookupQABoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QABoard(rset.getInt("QANO"),
						 			 rset.getString("QATITLE"),
						 			 rset.getString("qaContent"),
						 			 rset.getInt("qaview"),
						 			 rset.getDate("qadate"),
						 			 rset.getInt("qalikeCount"),
						 			 rset.getInt("qareplyCount"),
						 			 rset.getString("PROFILEIMAGE"),
						 			 rset.getString("mName")));
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

	public ArrayList<QABoard> goodupQABoard(Connection conn) {
		ArrayList<QABoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("goodupQABoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QABoard(rset.getInt("QANO"),
						 			 rset.getString("QATITLE"),
						 			 rset.getString("qaContent"),
						 			 rset.getInt("qaview"),
						 			 rset.getDate("qadate"),
						 			 rset.getInt("qalikeCount"),
						 			 rset.getInt("qareplyCount"),
						 			 rset.getString("PROFILEIMAGE"),
						 			 rset.getString("mName")));
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

	public ArrayList<QABoard> replyQABoard(Connection conn, int qaNo) {
		ArrayList<QABoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("replyQABoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QABoard(rset.getInt("QANO"),
						 			 rset.getString("QATITLE"),
						 			 rset.getString("qaContent"),
						 			 rset.getInt("qaview"),
						 			 rset.getDate("qadate"),
						 			 rset.getInt("qalikeCount"),
						 			 rset.getInt("qareplyCount"),
						 			 rset.getString("PROFILEIMAGE"),
						 			 rset.getString("mName")));
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

	public ArrayList<QABoard> latelyQABoard(Connection conn) {
		ArrayList<QABoard> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("latelyQABoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QABoard(rset.getInt("QANO"),
						 			 rset.getString("QATITLE"),
						 			 rset.getString("qaContent"),
						 			 rset.getInt("qaview"),
						 			 rset.getDate("qadate"),
						 			 rset.getInt("qalikeCount"),
						 			 rset.getInt("qareplyCount"),
						 			 rset.getString("PROFILEIMAGE"),
						 			 rset.getString("mName")));
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

	
	
	//좋아요인데...
	public int qaboardLike(Connection conn, int qaNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("insertQALike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaNo);
			pstmt.setInt(2, mNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteQaLike(Connection conn, int qaNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("deleteQaLike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaNo);
			pstmt.setInt(2, mNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int QABoardelete(Connection conn, int qaNo, int mNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteQABoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaNo);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	


	
}
