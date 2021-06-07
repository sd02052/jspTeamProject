package com.okky.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static MemberDAO instance = null;

	private MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
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

	public int memberCheck(String id, String pwd) {
		int result = 0;

		try {
			openConn();

			sql = "select * from okky_member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("mem_pwd").equals(pwd)) {
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

	public MemberDTO getMember(String id) {
		MemberDTO dto = new MemberDTO();

		try {
			openConn();

			sql = "select * from okky_member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_nick(rs.getString("mem_nick"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_image(rs.getString("mem_image"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_regdate(rs.getString("mem_regdate"));
				dto.setMem_emailCheck(rs.getString("mem_emailcheck"));
				dto.setMem_check(rs.getString("mem_check"));
				dto.setMem_score(rs.getInt("mem_score"));
				dto.setMem_company(rs.getInt("mem_company"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public MemberDTO getMember(int num) {
		MemberDTO dto = new MemberDTO();

		try {
			openConn();

			sql = "select * from okky_member where mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_nick(rs.getString("mem_nick"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_image(rs.getString("mem_image"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_regdate(rs.getString("mem_regdate"));
				dto.setMem_emailCheck(rs.getString("mem_emailcheck"));
				dto.setMem_check(rs.getString("mem_check"));
				dto.setMem_score(rs.getInt("mem_score"));
				dto.setMem_company(rs.getInt("mem_company"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		try {
			openConn();

			sql = "select * from okky_member order by mem_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_nick(rs.getString("mem_nick"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_image(rs.getString("mem_image"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_regdate(rs.getString("mem_regdate"));
				dto.setMem_emailCheck(rs.getString("mem_emailcheck"));
				dto.setMem_check(rs.getString("mem_check"));
				dto.setMem_score(rs.getInt("mem_score"));
				dto.setMem_company(rs.getInt("mem_company"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public List<String> getMemTag(int num) {
		List<String> list = new ArrayList<String>();

		try {
			openConn();

			sql = "select * from okky_mem_tag where tag_target = ? order by tag_num";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String tag = rs.getString("tag_name");
				list.add(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
}
