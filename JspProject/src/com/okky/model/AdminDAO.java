package com.okky.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static AdminDAO instance = null;

	private AdminDAO() {

	}

	public static AdminDAO getInstance() {
		if (instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	public void openConn() {
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();

			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// DB에 연결된 객체를 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int adminCheck(String id, String pwd) {
		int result = 0;

		try {
			openConn();

			sql = "select * from okky_admin where admin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("admin_pwd").equals(pwd)) {
					result = 1;
				} else {
					result = -1;
				}
			} else {
				result = -2;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public AdminDTO getAdmin(String id) {
		AdminDTO dto = new AdminDTO();
		
		try {
			openConn();
			
			sql = "select * from okky_admin where admin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setAdmin_num(rs.getInt("admin_num"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	public AdminDTO getAdmin(int num) {
		AdminDTO dto = new AdminDTO();
		
		try {
			openConn();
			
			sql = "select * from okky_admin where admin_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setAdmin_num(rs.getInt("admin_num"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
}
