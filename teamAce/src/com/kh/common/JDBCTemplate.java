package com.kh.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * Oracle 연결의 기본 세팅과 처리를 담당하는 클래스입니다.
 * 이 클래스는 싱글톤 형식으로 사용합니다.
 * 
 * @author 차종환
 *
 */
public class JDBCTemplate {
	
	/**
	 * 1. Connection 객체를 생성해주는 클래스 
	 * @return 생성된 Connection을 반환한다.
	 */
	public static Connection getConnection() {
	
		Connection conn = null;
		
		Properties prop = new Properties();
		
		String fileName = JDBCTemplate.class.getResource("../sql/driver.properties").getPath();
		
		System.out.println(fileName);
		
		try {
			prop.load(new FileReader(fileName));

			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			
			Class.forName(driver);	// 다중 캐치
			
			conn = DriverManager.getConnection(url, user, password); // 다중 캐치		
			
			conn.setAutoCommit(false);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	
	
	// 이하 닫는 클래스.
	// close를 실행했을 때 try catch문으로 인해 코드가 지저분해 지는 것을 방지하고자 따로 지정한다.
	/**
	 * 2. Connection 객체를 닫는 클래스
	 * @param conn
	 */
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 3. Statement, PreparedStatement 객체를 닫는 클래스
	 * @param stmt
	 */
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 4. ResultSet 객체를 닫는 클래스
	 * @param rset
	 */
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 5. Oracle에 실행된 결과를 적용하는 클래스
	 * @param conn
	 */
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 6. Oracle에 실행된 결과를 취소하는 클래스
	 * @param conn
	 */
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}
