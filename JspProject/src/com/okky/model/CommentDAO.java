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

public class CommentDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static CommentDAO instance = null;

	private CommentDAO() {

	}

	public static CommentDAO getInstance() {
		if (instance == null) {
			instance = new CommentDAO();
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

	public void setCommentLike() {
		int comment_count = 0;
		try {
			openConn();

			sql = "select count(*) from okky_comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comment_count = rs.getInt(1);
			}

			for (int i = 1; i <= comment_count; i++) {
				int like_count = 0;
				sql = "select count(*) from okky_like where like_target = ? and like_flag = 2";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					like_count = rs.getInt(1);
				}

				sql = "update okky_comment set com_like = ? where com_num = ?";
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

	public CommentDTO getComment(int num) {
		CommentDTO dto = new CommentDTO();

		try {
			openConn();
			sql = "select * from okky_comment where com_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public List<CommentDTO> getCommentList(int num) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			openConn();
			sql = "select* from okky_comment where com_target = ? order by com_regdate";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));

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

	public List<CommentDTO> getPesonalCommentList(int num) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			openConn();
			sql = "select * from okky_comment where com_writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));

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

	public List<MemberDTO> getCommentMemberList(List<CommentDTO> commentList) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		try {
			openConn();

			for (int i = 0; i < commentList.size(); i++) {
				int comment_writer = commentList.get(i).getCom_writer();
				sql = "select * from okky_member where mem_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, comment_writer);
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

	public int writeComment(CommentDTO dto) {
		int result = 0, count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into okky_comment values(?,?,?,?,default,sysdate,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getCom_writer());
			pstmt.setString(3, dto.getCom_content());
			pstmt.setInt(4, dto.getCom_target());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int deleteComment(int num) {
		int result = 0;

		try {
			openConn();
			sql = "delete from okky_comment where com_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			sql = "delete from okky_like where like_target = ? and like_flag = 2";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			sql = "update okky_comment set com_num = com_num - 1 where com_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int editComment(int num, String content) {
		int result = 0;

		try {
			openConn();

			sql = "update okky_comment set com_content = ?, com_regdate = sysdate where com_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	// 특정회원이 단 전체 댓글을 조회하는 메서드
	public List<CommentDTO> getMemberCommentList(int num, int startNo, int endNo) {
		List<CommentDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by com_regdate desc) rnum,c.* from okky_comment c where com_writer = ?) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));

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

	// 특정회원이 작성한 댓글의 수를 조회하는 메서드
	public int getCommentListCount(int num) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_comment where com_writer = ?";
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

			sql = "insert into okky_like values(?,?,?,2)";
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
			sql = "select like_num from okky_like where like_target = ? and like_writer = ? and like_flag = 2";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				like_num = rs.getInt(1);
			}

			sql = "delete from okky_like where like_target = ? and like_writer = ? and like_flag = 2";
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
		String sql = "select com_like from okky_comment where com_num= ?";
		int like = 0;
		try {
			pstmt = con.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로 사용할수있음
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				like = rs.getInt("com_like");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return like;
	}

	public List<CommentDTO> getCommentLikeList(int login_mem) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			openConn();

			sql = "select * from okky_comment where com_num in (select like_target from okky_like where like_writer = ? and like_flag = 2)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, login_mem);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));
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

	public List<CommentDTO> getCommentUnLikeList(int login_mem) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			openConn();

			sql = "select * from okky_comment where not com_num in (select like_target from okky_like where like_writer = ? and like_flag = 2)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, login_mem);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCom_num(rs.getInt("com_num"));
				dto.setCom_writer(rs.getInt("com_writer"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_target(rs.getInt("com_target"));
				dto.setCom_like(rs.getInt("com_like"));
				dto.setCom_regdate(rs.getString("com_regdate"));
				dto.setCom_selected(rs.getString("com_selected"));
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
	
	public int checkCommentLike(int num, int login_mem) {
		int result = 0;

		try {
			openConn();
			sql = "select count(*) from okky_like where like_target = ? and like_writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, login_mem);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					result = 1;
				} else {
					result = 0;
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

	// 글목록에 해당하는 댓글목록을 조회하는 메서드
	public List<CommentDTO> getCommentList(List<BoardDTO> boardList) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			openConn();
			for (int i = 0; i < boardList.size(); i++) {
				sql = "select* from okky_comment where com_target = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, boardList.get(i).getBoard_num());
				rs = pstmt.executeQuery();

				while (rs.next()) {
					CommentDTO dto = new CommentDTO();

					dto.setCom_num(rs.getInt("com_num"));
					dto.setCom_writer(rs.getInt("com_writer"));
					dto.setCom_content(rs.getString("com_content"));
					dto.setCom_target(rs.getInt("com_target"));
					dto.setCom_like(rs.getInt("com_like"));
					dto.setCom_regdate(rs.getString("com_regdate"));
					dto.setCom_selected(rs.getString("com_selected"));

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
	
	// 답글 선택하는 메서드
	public int commentSelect(int num) {
		int result = 0;
		
		try {
			openConn();
			sql = "update okky_comment set com_selected = 'yes' where com_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
	
	// 답글 선택을 취소하는 메서드
		public int commentDeselect(int num) {
			int result = 0;
			
			try {
				openConn();
				sql = "update okky_comment set com_selected = 'no' where com_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
		}

}
