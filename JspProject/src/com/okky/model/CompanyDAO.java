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
			
			while(rs.next()) {
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
				dto.setCompany_emp(rs.getInt("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				
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
	
	// okky_company 테이블의 회사번호 목록 가져오는 메서드
	public List<Integer> getNumber() {
		List<Integer> list = new ArrayList<Integer>();
		
		try {
			openConn();
			sql = "select company_num from okky_company order by company_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt("company_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	// okky_company의 회사번호를 동일하게 가지는 멤버 정보를 가져오는 메서드
	public List<MemberDTO> getMemberList(List<Integer> num) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		int count = 0;
		
		try {
			openConn();
			
			sql = "select company_num from okky_company";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				sql = "select * from okky_member " +
						" where mem_company = (select company_num from okky_company where company_num = ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num.get(count++));
				ResultSet rs1 = pstmt.executeQuery();
				
				while(rs1.next()) {
					MemberDTO dto = new MemberDTO();
					
					dto.setMem_num(rs1.getInt("mem_num"));
					dto.setMem_id(rs1.getString("mem_id"));
					dto.setMem_nick(rs1.getString("mem_nick"));
					dto.setMem_pwd(rs1.getString("mem_pwd"));
					dto.setMem_image(rs1.getString("mem_image"));
					dto.setMem_email(rs1.getString("mem_email"));
					dto.setMem_regdate(rs1.getString("mem_regdate"));
					dto.setMem_emailCheck(rs1.getString("mem_emailcheck"));
					dto.setMem_check(rs1.getString("mem_check"));
					dto.setMem_score(rs1.getInt("mem_score"));
					dto.setMem_company(rs1.getInt("mem_company"));
					
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
	
	// okky_company의 타겟 번호를 가져오는 메서드
	public List<Integer> getTarget() {
		List<Integer> list = new ArrayList<>();
		
		try {
			openConn();
			sql = "select company_target from okky_company order by company_target desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt("company_target"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}
	
	// okky_company의 전체 게시글 수를 가져오는 메서드
	public int getListCount() {
		int result = 0;
		
		try {
			openConn();
			sql = "select count(*) from okky_company";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(0);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<CompanyDTO> getCompanyList(int page, int rowsize) {
		List<CompanyDTO> list = new ArrayList<>();
		
		int startNo = (page * rowsize) - (rowsize - 1);	// 해당 페이지에서 시작 번호
		int endNo = (page * rowsize);					// 해당 페이지에서 마지막 번호
		
		try {
			openConn();
			sql = "select  from (select row_number() over(order by company_num desc) rnum, c.* from okky_company c"
					+ "where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
				dto.setCompany_emp(rs.getInt("company_emp"));
				dto.setCompany_homepage(rs.getString("company_homepage"));
				dto.setCompany_logo(rs.getString("company_logo"));
				dto.setCompany_content(rs.getString("company_content"));
				dto.setCompany_check(rs.getInt("company_check"));
				dto.setCompany_target(rs.getInt("company_target"));
				
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
