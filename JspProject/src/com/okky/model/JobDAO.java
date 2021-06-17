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

public class JobDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static JobDAO instance = null;

	private JobDAO() {

	}

	public static JobDAO getInstance() {
		if (instance == null) {
			instance = new JobDAO();
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

	public void setBoardLike() {
		int board_count = 0;
		try {
			openConn();

			sql = "select count(*) from okky_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board_count = rs.getInt(1);
			}

			for (int i = 1; i <= board_count; i++) {
				int like_count = 0;
				sql = "select count(*) from okky_like where like_target = ? and like_flag = 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					like_count = rs.getInt(1);
				}

				sql = "update okky_board set board_like = ? where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, like_count);
				pstmt.setInt(2, i);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public void setBoardScrap() {
		int board_count = 0;
		try {
			openConn();

			sql = "select count(*) from okky_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board_count = rs.getInt(1);
			}

			for (int i = 1; i <= board_count; i++) {
				int scrap_count = 0;
				sql = "select count(*) from okky_like where like_target = ? and like_flag = 3";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					scrap_count = rs.getInt(1);
				}

				sql = "update okky_board set board_scrap = ? where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, scrap_count);
				pstmt.setInt(2, i);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public void setBoardComment() {
		int board_count = 0;
		try {
			openConn();

			sql = "select count(*) from okky_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board_count = rs.getInt(1);
			}

			for (int i = 1; i <= board_count; i++) {
				int comment_count = 0;
				sql = "select count(*) from okky_comment where com_target = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					comment_count = rs.getInt(1);
				}

				sql = "update okky_board set board_comment = ? where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, comment_count);
				pstmt.setInt(2, i);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public List<MemberDTO> getMemberList(List<BoardDTO> boardList) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		try {
			openConn();

			for (int i = 0; i < boardList.size(); i++) {
				int board_writer = boardList.get(i).getBoard_writer();
				sql = "select * from okky_member where mem_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_writer);
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public List<BoardDTO> getBoardListAll(int num) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from okky_board where board_category in (select cate_num from okky_category where cate_group = ?) order by board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getInt("board_writer"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_like(rs.getInt("board_like"));
				dto.setBoard_scrap(rs.getInt("board_scrap"));
				dto.setBoard_category(rs.getInt("board_category"));
				dto.setBoard_regdate(rs.getString("board_regdate"));
				dto.setBoard_comment(rs.getInt("board_comment"));

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

	public List<BoardDTO> getBoardList(int num) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from okky_board where board_category = ? order by board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getInt("board_writer"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_like(rs.getInt("board_like"));
				dto.setBoard_scrap(rs.getInt("board_scrap"));
				dto.setBoard_category(rs.getInt("board_category"));
				dto.setBoard_regdate(rs.getString("board_regdate"));
				dto.setBoard_comment(rs.getInt("board_comment"));

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

	public int getBoardPost(BoardDTO dto) {
		int result = 0, board_num = 0;

		System.out.println("1");

		try {
			openConn();
			sql = "select max(board_num) from okky_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board_num = rs.getInt(1) + 1;
			}

			System.out.println("2");
			// (select nvl(max(board_num), 0) + 1 from okky_board 최대숫자 +1
			sql = "insert into okky_board " + "(board_num, board_title, board_writer, "
					+ "board_content, board_category, board_regdate) "
					+ "values ((select nvl(max(board_num), 0) + 1 from okky_board),?,?,?,?,SYSDATE)";
			System.out.println("3");
			pstmt = con.prepareStatement(sql);
			System.out.println(dto.getBoard_num());
			pstmt.setString(1, dto.getBoard_title());
			System.out.println("b");
			pstmt.setInt(2, dto.getBoard_writer());
			System.out.println("c");
			pstmt.setString(3, dto.getBoard_content());
			System.out.println("d");
			pstmt.setInt(4, dto.getBoard_category());
			System.out.println("4");

			result = pstmt.executeUpdate();
			System.out.println("result 값  : " + result);
			System.out.println("5");
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	// 특정 회사가 작성한 게시물을 조회하는 메서드
	public List<JobDTO> getCompanyJobList(int target, int startNo, int endNo) {
		List<JobDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by job_target desc) rnum, j.* from okky_job j "
					+ "where job_target in (select board_num from okky_board where board_writer = ?)) "
					+ "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, target);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JobDTO dto = new JobDTO();
				
				dto.setJob_num(rs.getInt("job_num"));
				dto.setJob_target(rs.getInt("job_target"));
				dto.setJob_contract(rs.getInt("job_contract"));
				dto.setJob_mincost(rs.getInt("job_mincost"));
				dto.setJob_maxcost(rs.getInt("job_maxcost"));
				dto.setJob_location(rs.getString("job_location"));
				dto.setJob_do(rs.getString("job_do"));
				dto.setJob_mincareer(rs.getInt("job_mincareer"));
				dto.setJob_maxcareer(rs.getInt("job_maxcareer"));
				
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
	
	// 특정회사가 작성한 전체 구인 게시글 수를 조회하는 메서드
	public int getCompanyJobCount(int com_num) {
		int count = 0;
		
		try {
			openConn();
			sql = "select count(*) from okky_job where job_target in (select board_num from okky_board where board_writer = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, com_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}

}
