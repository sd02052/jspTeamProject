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

public class BoardDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static BoardDAO instance = null;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
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

	// 회사번호와 동일한 글번호에 해당하는 정보를 조회하는 메서드
	public List<BoardDTO> getBoardList(int page, int rowsize) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();

		int startNo = (page * rowsize) - (rowsize - 1); // 해당 페이지에서 시작 번호
		int endNo = (page * rowsize); // 해당 페이지에서 마지막 번호

		try {
			openConn();
			sql = "select company_target from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c)"
					+ "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sql = "select * from okky_board where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt(1));
				ResultSet rs1 = pstmt.executeQuery();

				while (rs1.next()) {
					BoardDTO dto = new BoardDTO();

					dto.setBoard_num(rs1.getInt("board_num"));
					dto.setBoard_title(rs1.getString("board_title"));
					dto.setBoard_writer(rs1.getInt("board_writer"));
					dto.setBoard_content(rs1.getString("board_content"));
					dto.setBoard_hit(rs1.getInt("board_hit"));
					dto.setBoard_like(rs1.getInt("board_like"));
					dto.setBoard_scrap(rs1.getInt("board_scrap"));
					dto.setBoard_category(rs1.getInt("board_category"));
					dto.setBoard_regdate(rs1.getString("board_regdate"));

					list.add(dto);
				}

				rs1.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	// 검색해서 나온 회사번호와 동일한 글번호에 해당하는 정보를 조회하는 메서드
	public List<BoardDTO> getSearchBoardList(String field, String data, int page, int rowsize) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1); // 해당 페이지에서 시작 번호
		int endNo = (page * rowsize); // 해당 페이지에서 마지막 번호

		openConn();
		if (field.equals("all")) { // 전체검색의 경우(회사명, 작성회원, 상태)
			
			String check_data = "";

			if (data.equals("대기")) {
				check_data = "0";
			} else if (data.equals("승인")) {
				check_data = "1";
			} else if (data.equals("거절")) {
				check_data = "2";
			}
			
			sql = "select company_target from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
					+ "where company_name like ? or company_check like ? or company_target in "
					+ "(select board_num from okky_board where board_writer in "
					+ "(select mem_num from okky_member where mem_nick like ? )))" + "where rnum >= ? and rnum <= ?";

			try {
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + data + "%");
				pstmt.setString(2, check_data);
				pstmt.setString(3, "%" + data + "%");
				pstmt.setInt(4, startNo);
				pstmt.setInt(5, endNo);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					sql = "select * from okky_board where board_num = ? order by board_num desc";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, rs.getInt(1));
					ResultSet rs1 = pstmt.executeQuery();
					
					while(rs1.next()) {
						BoardDTO dto = new BoardDTO();

						dto.setBoard_num(rs1.getInt("board_num"));
						dto.setBoard_title(rs1.getString("board_title"));
						dto.setBoard_writer(rs1.getInt("board_writer"));
						dto.setBoard_content(rs1.getString("board_content"));
						dto.setBoard_hit(rs1.getInt("board_hit"));
						dto.setBoard_like(rs1.getInt("board_like"));
						dto.setBoard_scrap(rs1.getInt("board_scrap"));
						dto.setBoard_category(rs1.getInt("board_category"));
						dto.setBoard_regdate(rs1.getString("board_regdate"));

						list.add(dto);
					}
					rs1.close();
				}

				return list;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("name")) { // 회사명 검색의 경우
			sql = "select company_target from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
					+ "where company_name like ?) where rnum >= ? and rnum <= ? ";
		} else if (field.equals("nick")) { // 작성회원 검색의 경우
			sql = "select company_target from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
					+ "where company_target in" + "(select board_num from okky_board where board_writer in "
					+ "(select mem_num from okky_member where mem_nick like ? )))" + "where rnum >= ? and rnum <= ?";
		} else if (field.equals("check")) { // 상태 검색의 경우
			sql = "select company_target from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
					+ "where company_check like ?)" + "where rnum >= ? and rnum <= ?";
		}

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + data + "%");
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sql = "select * from okky_board where board_num = ? order by board_num desc";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt(1));
				ResultSet rs1 = pstmt.executeQuery();
				
				while(rs1.next()) {
					BoardDTO dto = new BoardDTO();

					dto.setBoard_num(rs1.getInt("board_num"));
					dto.setBoard_title(rs1.getString("board_title"));
					dto.setBoard_writer(rs1.getInt("board_writer"));
					dto.setBoard_content(rs1.getString("board_content"));
					dto.setBoard_hit(rs1.getInt("board_hit"));
					dto.setBoard_like(rs1.getInt("board_like"));
					dto.setBoard_scrap(rs1.getInt("board_scrap"));
					dto.setBoard_category(rs1.getInt("board_category"));
					dto.setBoard_regdate(rs1.getString("board_regdate"));

					list.add(dto);
				}
				rs1.close();
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
