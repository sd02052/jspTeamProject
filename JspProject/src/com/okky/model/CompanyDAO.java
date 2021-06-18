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

public class CompanyDAO {
	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 객체

	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = -1;
	public static final int ADMIN_LOGIN_NONEXIST = -2;

	private static CompanyDAO instance = null;

	private CompanyDAO() {

	}

	public static CompanyDAO getInstance() {
		if (instance == null) {
			instance = new CompanyDAO();
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

	// okky_company의 전체 목록을 가져오는 메서드
	public List<CompanyDTO> getCompanyList() {
		List<CompanyDTO> list = new ArrayList<CompanyDTO>();

		try {
			openConn();
			sql = "select * from okky_company order by company_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyDTO dto = new CompanyDTO();

				dto.setCompany_num(rs.getInt("company_num"));
				dto.setCompany_name(rs.getString("company_name"));
				dto.setCompany_license_num(rs.getString("company_license_num"));
				dto.setCompany_license_image(rs.getString("company_license_image"));
				dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
				dto.setCompany_boss_email(rs.getString("company_boss_email"));
				dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
				dto.setCompany_charge_email(rs.getString("company_charge_email"));
				dto.setCompany_charge_name(rs.getString("company_charge_name"));
				dto.setCompany_emp(rs.getString("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				dto.setCompany_regdate(rs.getString("company_regdate"));

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

	// 특정 번호에 해당하는 okky_company의 전체 목록을 가져오는 메서드
	public CompanyDTO getCompanyList(int num) {
		CompanyDTO dto = new CompanyDTO();

		try {
			openConn();
			sql = "select * from okky_company where company_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setCompany_num(rs.getInt("company_num"));
				dto.setCompany_name(rs.getString("company_name"));
				dto.setCompany_license_num(rs.getString("company_license_num"));
				dto.setCompany_license_image(rs.getString("company_license_image"));
				dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
				dto.setCompany_boss_email(rs.getString("company_boss_email"));
				dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
				dto.setCompany_charge_email(rs.getString("company_charge_email"));
				dto.setCompany_charge_name(rs.getString("company_charge_name"));
				dto.setCompany_emp(rs.getString("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				dto.setCompany_regdate(rs.getString("company_regdate"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	// okky_company의 전체 게시글 수를 가져오는 메서드
	public int getListCount() {
		int result = 0;

		try {
			openConn();
			sql = "select count(*) from okky_company";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// okky_company 테이블에서 페이지에 해당하는 글 목록을 가져오는 메서드
	public List<CompanyDTO> getCompanyList(int startNo, int endNo) {
		List<CompanyDTO> list = new ArrayList<>();

		try {
			openConn();
			sql = "select * from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c) "
					+ "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyDTO dto = new CompanyDTO();

				dto.setCompany_num(rs.getInt("company_num"));
				dto.setCompany_name(rs.getString("company_name"));
				dto.setCompany_license_num(rs.getString("company_license_num"));
				dto.setCompany_license_image(rs.getString("company_license_image"));
				dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
				dto.setCompany_boss_email(rs.getString("company_boss_email"));
				dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
				dto.setCompany_charge_email(rs.getString("company_charge_email"));
				dto.setCompany_charge_name(rs.getString("company_charge_name"));
				dto.setCompany_emp(rs.getString("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				dto.setCompany_regdate(rs.getString("company_regdate"));

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

	// okky_company 테이블에서 페이지에 해당하는 검색 목록의 전체 수를 가져오는 메서드
	public int getSearchListCount(String field, String data) {
		int count = 0;
		String check_data = "";

		if (data.equals("대기")) {
			check_data = "0";
		} else if (data.equals("승인")) {
			check_data = "1";
		} else if (data.equals("거절")) {
			check_data = "2";
		}

		try {
			openConn();

			if (field.equals("all")) { // 전체검색의 경우(회사명, 작성회원, 상태)

				sql = "select count(*) from okky_company where company_name like ? or company_check like ? "
						+ "or company_target in (select mem_num from okky_member where mem_nick like ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
				pstmt.setString(2, check_data);
				pstmt.setString(3, "%" + data + "%");
			} else if (field.equals("name")) { // 회사명 검색의 경우
				sql = "select count(*) from okky_company where company_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
			} else if (field.equals("nick")) { // 작성회원 검색의 경우
				sql = "select count(*) from okky_company where company_target in (select mem_num from okky_member where mem_nick like ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
			} else if (field.equals("check")) { // 상태 검색의 경우
				sql = "select count(*) from okky_company where company_check in ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, check_data);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

			return count;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return count;
	}

	// okky_company 에서 페이지에 맞는 검색결과를 조회하는 메서드
	public List<CompanyDTO> getSearchCompanyList(String field, String data, int startNo, int endNo) {
		List<CompanyDTO> list = new ArrayList<>();
		String check_data = "";

		if (data.equals("대기")) {
			check_data = "0";
		} else if (data.equals("승인")) {
			check_data = "1";
		} else if (data.equals("거절")) {
			check_data = "2";
		}

		try {
			openConn();
			if (field.equals("all")) { // 전체검색의 경우(회사명, 작성회원, 상태)
				sql = "select * from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
						+ "where company_name like ? or company_check like ? or company_target in "
						+ "(select mem_num from okky_member where mem_nick like ?))"
						+ "where rnum >= ? and rnum <= ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
				pstmt.setString(2, check_data);
				pstmt.setString(3, "%" + data + "%");
				pstmt.setInt(4, startNo);
				pstmt.setInt(5, endNo);
				
			} else if (field.equals("name")) { // 회사명 검색의 경우
				sql = "select * from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
						+ "where company_name like ?) where rnum >= ? and rnum <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);

			} else if (field.equals("nick")) { // 작성회원 검색의 경우
				sql = "select * from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
						+ "where company_target in" + "(select mem_num from okky_member where mem_nick like ? ))"
						+ "where rnum >= ? and rnum <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + data + "%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);

			} else if (field.equals("check")) { // 상태 검색의 경우
				sql = "select * from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c "
						+ "where company_check like ?)" + "where rnum >= ? and rnum <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, data);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompanyDTO dto = new CompanyDTO();

				dto.setCompany_num(rs.getInt("company_num"));
				dto.setCompany_name(rs.getString("company_name"));
				dto.setCompany_license_num(rs.getString("company_license_num"));
				dto.setCompany_license_image(rs.getString("company_license_image"));
				dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
				dto.setCompany_boss_email(rs.getString("company_boss_email"));
				dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
				dto.setCompany_charge_email(rs.getString("company_charge_email"));
				dto.setCompany_charge_name(rs.getString("company_charge_name"));
				dto.setCompany_emp(rs.getString("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				dto.setCompany_regdate(rs.getString("company_regdate"));

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

	// 회사의 인증 상태를 바꾸는 메서드
	public int updateCompanyCheck(int num, int check) {
		int result = 0;

		try {
			openConn();
			sql = "update okky_company set company_check = ? where company_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, check);
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

	// 특정회원이 가진 회사의 내용을 조회하는 메서드
	public CompanyDTO getMemCompanyList(int num) {
		CompanyDTO dto = new CompanyDTO();
		
		try {
			openConn();
			sql = "select * from okky_company where company_target = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCompany_num(rs.getInt("company_num"));
				dto.setCompany_name(rs.getString("company_name"));
				dto.setCompany_license_num(rs.getString("company_license_num"));
				dto.setCompany_license_image(rs.getString("company_license_image"));
				dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
				dto.setCompany_boss_email(rs.getString("company_boss_email"));
				dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
				dto.setCompany_charge_email(rs.getString("company_charge_email"));
				dto.setCompany_charge_name(rs.getString("company_charge_name"));
				dto.setCompany_emp(rs.getString("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				dto.setCompany_regdate(rs.getString("company_regdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
			
		return dto;
	}
	
	// 게시판에서 특정 회원이 가진 회사의 내용을 조회하는 메서드
	public List<CompanyDTO> getCompanyList(List<BoardDTO> boardList) {
		List<CompanyDTO> list = new ArrayList<>();
		
		try {
			openConn();
			
			for(int i=0; i<boardList.size(); i++) {
				sql = "select * from okky_company where company_target = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, boardList.get(i).getBoard_writer());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					CompanyDTO dto = new CompanyDTO();

					dto.setCompany_num(rs.getInt("company_num"));
					dto.setCompany_name(rs.getString("company_name"));
					dto.setCompany_license_num(rs.getString("company_license_num"));
					dto.setCompany_license_image(rs.getString("company_license_image"));
					dto.setCompany_boss_phone(rs.getString("company_boss_phone"));
					dto.setCompany_boss_email(rs.getString("company_boss_email"));
					dto.setCompany_charge_phone(rs.getString("company_charge_phone"));
					dto.setCompany_charge_email(rs.getString("company_charge_email"));
					dto.setCompany_charge_name(rs.getString("company_charge_name"));
					dto.setCompany_emp(rs.getString("company_emp"));
					dto.setCompany_homepage(rs.getString("company_homepage"));
					dto.setCompany_logo(rs.getString("company_logo"));
					dto.setCompany_content(rs.getString("company_content"));
					dto.setCompany_check(rs.getInt("company_check"));
					dto.setCompany_target(rs.getInt("company_target"));

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
	
	// 회사 인증글을 추가하는 메서드
	public int insertComapny(CompanyDTO dto) {
		int count = 0;
		
		try {
			openConn();
			sql = "select max(company_num) from okky_company";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}else {
				count = 1;
			}
			
			sql = "insert into okky_company values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getCompany_name());
			pstmt.setString(3, dto.getCompany_license_num());
			pstmt.setString(4, dto.getCompany_license_image());
			pstmt.setString(5, dto.getCompany_boss_phone());
			pstmt.setString(6, dto.getCompany_boss_email());
			pstmt.setString(7, dto.getCompany_charge_phone());
			pstmt.setString(8, dto.getCompany_charge_email());
			pstmt.setString(9, dto.getCompany_charge_name());
			pstmt.setString(10, dto.getCompany_emp());
			pstmt.setString(11, dto.getCompany_homepage());
			pstmt.setString(12, dto.getCompany_logo());
			pstmt.setString(13, dto.getCompany_content());
			pstmt.setInt(14, dto.getCompany_target());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insertComapny 오류발생");
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}
	
	
}
