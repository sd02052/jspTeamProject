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

public class CategoryDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static CategoryDAO instance = null;

	private CategoryDAO() {

	}

	public static CategoryDAO getInstance() {
		if (instance == null) {
			instance = new CategoryDAO();
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

	public CategoryDTO getCategoryAll(int num) {
		CategoryDTO dto = new CategoryDTO();

		try {
			openConn();

			sql = "select * from okky_category where cate_group = ? and cate_step = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setCate_name(rs.getString("cate_name"));
				dto.setCate_group(rs.getInt("cate_group"));
				dto.setCate_step(rs.getInt("cate_step"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public CategoryDTO getCategory(int num) {
		CategoryDTO dto = new CategoryDTO();

		try {
			openConn();

			sql = "select * from okky_category where cate_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setCate_name(rs.getString("cate_name"));
				dto.setCate_group(rs.getInt("cate_group"));
				dto.setCate_step(rs.getInt("cate_step"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public List<CategoryDTO> getCategoryList(List<BoardDTO> boardList) {
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();

		try {
			openConn();
			for (int i = 0; i < boardList.size(); i++) {
				sql = "select * from okky_category where cate_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, boardList.get(i).getBoard_category());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					CategoryDTO dto = new CategoryDTO();
					dto.setCate_num(rs.getInt("cate_num"));
					dto.setCate_name(rs.getString("cate_name"));
					dto.setCate_group(rs.getInt("cate_group"));
					dto.setCate_step(rs.getInt("cate_step"));

					list.add(dto);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public List<CategoryDTO> getBoardWriteCategoryList(int cate_group) {
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();

		try {
			openConn();
			sql = "select * from okky_category where cate_group = ? and cate_step != 0 order by cate_num";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_group);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setCate_name(rs.getString("cate_name"));
				dto.setCate_group(rs.getInt("cate_group"));
				dto.setCate_step(rs.getInt("cate_step"));

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
}
