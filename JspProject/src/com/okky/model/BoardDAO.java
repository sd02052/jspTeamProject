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
	public static BoardDAO getBoardPost;

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
	public List<BoardDTO> getCompanyBoardList(List<CompanyDTO> pageList) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			openConn();

			for (int i = 0; i < pageList.size(); i++) {
				int company_num = pageList.get(i).getCompany_num();

				sql = "select * from okky_board where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pageList.get(i).getCompany_num());
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

	public void boardHit(int num) {
		try {
			openConn();
			sql = "update okky_board set board_hit = board_hit + 1 where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public void setBoardLike() {
		int board_count = 0;
		try {
			openConn();

			sql = "select count(*) from okky_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board_count = rs.getInt(1);
			}

			for (int i = 1; i <= board_count; i++) {
				int like_count = 0;
				sql = "select count(*) from okky_like where like_target = ? and like_flag = 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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
			while (rs.next()) {
				board_count = rs.getInt(1);
			}

			for (int i = 1; i <= board_count; i++) {
				int scrap_count = 0;
				sql = "select count(*) from okky_like where like_target = ? and like_flag = 3";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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

	public List<CategoryDTO> getCategoryAllList(List<BoardDTO> boardList) {
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();

		try {
			openConn();

			for (int i = 0; i < boardList.size(); i++) {
				int board_category = boardList.get(i).getBoard_category();
				sql = "select * from okky_category where cate_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_category);
				rs = pstmt.executeQuery();

				while (rs.next()) {
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

	// 특정 회원이 작성한 댓글이 달린 모든 게시글을 조회하는 메서드
	public List<BoardDTO> getBoardList(List<CommentDTO> comList) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			for (int i = 0; i < comList.size(); i++) {
				sql = "select * from okky_board where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, comList.get(i).getCom_target());
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	// 특정 회원이 스크랩한 모든 글을 조회하는 메서드
	public List<BoardDTO> getScrapBoardList(List<LikeDTO> likeList) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			openConn();

			for (int i = 0; i < likeList.size(); i++) {
				sql = "select * from okky_board where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, likeList.get(i).getLike_target());
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	// 카테고리에 맞는 전체 게시글 수를 조회하는 메서드
	public int getBoardListCount(int num) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_board where board_category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// 카테고리에 맞는 전체 게시글 수를 조회하는 메서드
	public int getBoardListAllCount(int num) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_board where board_category in (select cate_num from okky_category where cate_group = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// 페이지에 맞는 게시글을 불러오는 메서드
	public List<BoardDTO> getBoardList(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	public List<BoardDTO> getBoardListSortLike(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_like desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	public List<BoardDTO> getBoardListSortLike(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_like desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ? and (board_title like ? or board_content like ?)) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);

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

	public List<BoardDTO> getBoardListAllSortLike(int group, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_like desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category in (select cate_num from okky_category where cate_group = ?) "
					+ " and (board_title like ? or board_content like ?)) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);

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

	public List<BoardDTO> getBoardListSortComment(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_comment desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	public List<BoardDTO> getBoardListSortComment(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_comment desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ? and (board_title like ? or board_content like ?)) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);

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

	public List<BoardDTO> getBoardListSortScrap(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_scrap desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	public List<BoardDTO> getBoardListSortScrap(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_scrap desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ? and (board_title like ? or board_content like ?)) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);

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

	public List<BoardDTO> getBoardListSortHit(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_hit desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	public List<BoardDTO> getBoardListSortHit(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_hit desc, board_num desc) rnum, b.* from okky_board b "
					+ "where board_category = ? and (board_title like ? or board_content like ?)) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);

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

	public List<BoardDTO> getBoardListAll(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?)) "
					+ "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getBoardListAllSortLike(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_like desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?)) "
					+ "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getBoardListAllSortComment(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_comment desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?)) "
					+ "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getBoardListAllSortComment(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_comment desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?) "
					+ "and (board_title like ? or board_title like ?)) " + "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
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

	public List<BoardDTO> getBoardListAllSortScrap(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_scrap desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?)) "
					+ "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getBoardListAllSortScrap(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_scrap desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?) "
					+ "and (board_title like ? or board_content like ?)) " + "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
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

	public List<BoardDTO> getBoardListAllSortHit(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_hit desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?)) "
					+ "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getBoardListAllSortHit(int num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			openConn();

			sql = "select * from (select row_number() over(order by board_hit desc, board_num desc) rnum, "
					+ "b.* from okky_board b where board_category in (select cate_num from okky_category where cate_group = ?) "
					+ "and (board_title like ? or board_content like ?)) " + "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
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

	// 특정회원이 작성한 모든 글 수를 조회하는 메서드
	public int getSearchListCount(int num) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_board where board_writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	public BoardDTO getBoardCont(int num) {
		BoardDTO dto = new BoardDTO();

		try {
			openConn();
			sql = "select * from okky_board where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public MemberDTO getWriter(int num) {
		MemberDTO dto = new MemberDTO();

		try {
			openConn();
			sql = "select board_writer from okky_board where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int board_writer = rs.getInt("board_writer");
				sql = "select * from okky_member where mem_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_writer);
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	// 특정 회원이 작성한 모든 글 정보를 불러오는 메서드
	public List<BoardDTO> getMemberBoardList(int num, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by board_regdate) rnum, b.* from okky_board b where board_writer = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
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

	public List<BoardDTO> getWeekBestBoardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String start = null, end = null;
		try {
			openConn();
			sql = "select to_char(a.s_date, 'yy/mm/dd') monday, to_char(a.s_date+1, 'yy/mm/dd') tuesday, "
					+ "to_char(a.s_date+2, 'yy/mm/dd') wednesday, to_char(a.s_date+3, 'yy/mm/dd') thursday, "
					+ "to_char(a.s_date+4, 'yy/mm/dd') friday, to_char(a.s_date+5, 'yy/mm/dd') saturday, "
					+ "to_char(a.s_date+6, 'yy/mm/dd') sunday from (select sysdate - (to_number(to_char(sysdate,'d'))-2) s_date from dual) a";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				start = rs.getString("monday");
				end = rs.getString("sunday");
			}

			sql = "select * from okky_board where board_regdate between ? and ? order by board_like desc , board_hit desc, board_comment desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
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

	public int getBoardPost(BoardDTO dto, MemberDTO mdto) {
		int result = 0, board_num = 0;
		
		mdto.getMem_nick();
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

	// 회사에서 작성한 게시글을 조회하는 메서드
	public List<BoardDTO> getJobBoardList(List<JobDTO> jobList) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			openConn();
			for (int i = 0; i < jobList.size(); i++) {
				sql = "select * from okky_board where board_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, jobList.get(i).getJob_target());
				rs = pstmt.executeQuery();

				if (rs.next()) {
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
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public boolean getBoardLike(int mem_num, int board_num) {
		boolean status = false;

		try {
			openConn();
			sql = "select count(*) from okky_like where like_target = ? and like_writer = ? and like_flag = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, mem_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt(1) > 0) {
					status = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return status;
	}

	public void update_Like(int num, int login_mem) {
		int count = 0;
		try {
			openConn();
			sql = "select count(*) from okky_like";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into okky_like values(?,?,?,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, num);
			pstmt.setInt(3, login_mem);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public void update_Like_cancle(int num, int login_mem) {
		int like_num = 0;
		try {
			openConn();
			sql = "select like_num from okky_like where like_target = ? and like_writer = ? and like_flag = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				like_num = rs.getInt(1);
			}

			sql = "delete from okky_like where like_target = ? and like_writer = ? and like_flag = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			pstmt.executeUpdate();

			sql = "update okky_like set like_num = like_num - 1 where like_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, like_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public int select_Like(int num) {
		openConn();
		String sql = "select board_like from okky_board where board_num= ?";
		int like = 0;
		try {
			pstmt = con.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로 사용할수있음
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				like = rs.getInt("board_like");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return like;
	}

	// ALL 게시판에서 검색한 게시물 수를 조회하는 메서드
	public int getSearchBoardListALLCount(int cate_group, String data) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_board where board_category in (select cate_num from okky_category where cate_group = ?) "
					+ "and (board_title like ? or board_content like ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_group);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// 특정 카테고리 게시판에서 검색한 게시물 수를 조회하는 메서드
	public int getSearchBoardListCount(int cate_num, String data) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_board where board_category = ? and (board_title like ? or board_content like ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// ALL 게시판에서 검색한 게시물을 조회하는 메서드
	public List<BoardDTO> getSearchListALL(int cate_group, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by board_regdate desc) rnum, b.* from okky_board b "
					+ "where board_category in (select cate_num from okky_category where cate_group = ?) and "
					+ "(board_title like ? or board_content like ?)) " + "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_group);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
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

	// 특정 카테고리 게시판에서 검색한 게시물을 조회하는 메서드
	public List<BoardDTO> getSearchList(int cate_num, String data, int startNo, int endNo) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by board_regdate desc) rnum, b.* from okky_board b "
					+ "where board_category = ? and " + "(board_title like ? or board_content like ?)) "
					+ "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_num);
			pstmt.setString(2, "%" + data + "%");
			pstmt.setString(3, "%" + data + "%");
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
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

	public boolean getBoardScrap(int mem_num, int board_num) {
		boolean status = false;
		try {
			openConn();
			sql = "select count(*) from okky_like where like_target = ? and like_writer = ? and like_flag = 3";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, mem_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt(1) > 0) {
					status = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return status;
	}

	public void update_scrap(int num, int login_mem) {
		int count = 0;
		try {
			openConn();
			sql = "select count(*) from okky_like";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into okky_like values(?,?,?,3)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, num);
			pstmt.setInt(3, login_mem);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public void update_scrap_cancle(int num, int login_mem) {
		int like_num = 0;
		try {
			openConn();
			sql = "select like_num from okky_like where like_target = ? and like_writer = ? and like_flag = 3";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				like_num = rs.getInt(1);
			}

			sql = "delete from okky_like where like_target = ? and like_writer = ? and like_flag = 3";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			pstmt.executeUpdate();

			sql = "update okky_like set like_num = like_num - 1 where like_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, like_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public int deleteBoard(int num) {
		int result = 0, list_size = 0;

		try {
			openConn();
			sql = "delete from okky_board where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			sql = "select count(*) from okky_like where like_target = ? and like_flag in(1,3)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list_size = rs.getInt(1);
			}
			int like[] = new int[list_size];
			sql = "select like_num from okky_like where like_target = ? and like_flag in (1,3) order by like_num";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
				for (int i = 0; i < list_size; i++) {
					rs.next();
					like[i] = rs.getInt("like_num");
				}
			
			sql = "delete from okky_like where like_target = ? and like_flag in(1,3)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			for (int i = 0; i < list_size; i++) {
				sql = "update okky_like set like_num = like_num - 1 where like_num > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, like[i] - i);
				pstmt.executeUpdate();
			}
			
			sql = "update okky_board set board_num = board_num - 1 where board_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "update okky_like set like_target = like_target - 1 where like_flag in(1,3)";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
}
