package com.okky.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TagDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static TagDAO instance = null;

	private TagDAO() {

	}

	public static TagDAO getInstance() {
		if (instance == null) {
			instance = new TagDAO();
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

	public int addTag(int num, String tag_list) {
		int result = 0, count = 0;
		try {
			openConn();
			sql = "select count(*) from okky_mem_tag where tag_target = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt(1) > 0) { // 회원 태그가 이미 있는 경우
					sql = "select * from okky_mem_tag where tag_target = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						int tag_num = rs.getInt("tag_num");
						if (tag_list.length() != 0) {
							sql = "update okky_mem_tag set tag_name = ? where tag_num = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, tag_list);
							pstmt.setInt(2, tag_num);
							result = pstmt.executeUpdate();
						} else if (tag_list.length() == 0) {
							sql = "delete from okky_mem_tag where tag_num = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, tag_num);
							result = pstmt.executeUpdate();

							sql = "update okky_mem_tag set tag_num = tag_num - 1 where tag_num > ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, tag_num);
							pstmt.executeUpdate();
						}
					}
				} else { // 회원 태그가 없는 경우
					if (tag_list.length() != 0) {
						sql = "select count(*) from okky_mem_tag";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							count = rs.getInt(1) + 1;
						}

						sql = "insert into okky_mem_tag values(?, ?, ?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, count);
						pstmt.setString(2, tag_list);
						pstmt.setInt(3, num);
						result = pstmt.executeUpdate();
					} else if (tag_list.length() == 0) {
						result = 1;
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
}
