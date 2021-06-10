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

	// 회원 가입(멤버추가)
	public int signUp(MemberDTO dto) {

		int result = 0, count = 0;

		try {

			openConn();

			sql = "select count(*) from okky_member";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into okky_member values(?,?,?,?,?,?,sysdate,default,default,default,default)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMem_id());
			pstmt.setString(3, dto.getMem_nick());
			pstmt.setString(4, dto.getMem_pwd());
			pstmt.setString(5, dto.getMem_image());
			pstmt.setString(6, dto.getMem_email());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // signUp() 메서드 end

	// 특정 회사번호를 가지는 멤버를 조회하는 메서드
	public MemberDTO getMemberList(int num) {
		MemberDTO dto = new MemberDTO();

		try {
			openConn();

			sql = "select * from okky_member where mem_company = ? order by mem_num desc";
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

	// 멤버 전체 수를 조회하는 메서드
	public int getListCount() {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from okky_member order by mem_num desc";
			pstmt = con.prepareStatement(sql);
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

	// 페이지에 해당하는 멤버 조회하는 메서드
	public List<MemberDTO> getMemberList(int startNo, int endNo) {
		List<MemberDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by mem_num desc) rnum, "
					+ "m.* from okky_member m) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);

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

	// okky_company의 페이지에 출력되는 회사정보를 작성한 멤버 정보를 가져오는 메서드
	public List<MemberDTO> getCompanyMemberList(List<CompanyDTO> pageList) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		try {
			openConn();

			for (int i = 0; i < pageList.size(); i++) {
				int company_num = pageList.get(i).getCompany_num();

				sql = "select * from okky_member where mem_company = ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, company_num);
				ResultSet rs = pstmt.executeQuery();

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

	// 검색된 회원 수를 조회하는 메서드
	public int getSearchListCount(String field, String data) {
		int count = 0;

		try {
			openConn();

			if (field.equals("all")) {

				String check_data = "";

				if (data.equals("회원")) {
					check_data = "no";
				} else if (data.equals("탈퇴")) {
					check_data = "yes";
				}

				sql = "select count(*) from okky_member where mem_id like ? or mem_nick like ? or mem_check like ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
				pstmt.setString(2, "%" + data + "%");
				pstmt.setString(3, "%" + check_data + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt(1);
				}

				return count;

			} else if (field.equals("id")) {
				sql = "select count(*) from okky_member where mem_id like ?";
			} else if (field.equals("nick")) {
				sql = "select count(*) from okky_member where mem_nick like ?";
			} else if (field.equals("check")) {
				sql = "select count(*) from okky_member where mem_check like ?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + data + "%");

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

	// 검색한 회원의 정보를 조회하는 메서드
	public List<MemberDTO> getSearchMemberList(String field, String data, int startNo, int endNo) {
		List<MemberDTO> list = new ArrayList<>();

		openConn();

		if (field.equals("all")) {

			String check_data = "";

			if (data.equals("회원")) {
				check_data = "no";
			} else if (data.equals("탈퇴")) {
				check_data = "yes";
			}

			sql = "select * from (select row_number() over(order by mem_num desc) rnum, m.* from okky_member m "
					+ "where mem_id like ? or mem_nick like ? or mem_check like ?) where rnum >= ? and rnum <= ?";

			try {
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + data + "%");
				pstmt.setString(2, "%" + data + "%");
				pstmt.setString(3, "%" + check_data + "%");
				pstmt.setInt(4, startNo);
				pstmt.setInt(5, endNo);

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

				return list;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("id")) {
			sql = "select * from (select row_number() over(order by mem_num desc) rnum, m.* from okky_member m "
					+ "where mem_id like ?) where rnum >= ? and rnum <= ?";
		} else if (field.equals("nick")) {
			sql = "select * from (select row_number() over(order by mem_num desc) rnum, m.* from okky_member m "
					+ "where mem_nick like ?) where rnum >= ? and rnum <= ?";
		} else if (field.equals("check")) {
			sql = "select * from (select row_number() over(order by mem_num desc) rnum, m.* from okky_member m "
					+ "where mem_check like ?) where rnum >= ? and rnum <= ?";
		}

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + data + "%");
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

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

	// 회원을 강제탈퇴시키는 메서드
	public int updateMemberCheck(String[] num) {

		int res = 0;

		try {
			openConn();

			for (int i = 0; i < num.length; i++) {
				sql = "update okky_member set mem_check = 'yes' where mem_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, num[i]);
				res = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return res;
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

}
