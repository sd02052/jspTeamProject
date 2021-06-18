package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CompanyVerifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String saveFolder = "C:\\NCS\\workspace(JSP)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JspProject\\images\\company";
		
		// 첨부파일의 최대 크기
		int fileSize = 10 * 1024 * 1024; // 10MB
				
		// 파일 업로드를 진행 시 이진 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
						request,						// 일반적인 request 객체 
						saveFolder,						// 업로드 파일 저장 위치 
						fileSize,						// 업로드할 파일의 최대 크기 
						"UTF-8",						// 문자 인코딩 방식
						new DefaultFileRenamePolicy());	// 파일 이름이 중복이 안 되도록 설정
		
		HttpSession session = request.getSession();
		CompanyDTO dto = new CompanyDTO();
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		String company_name = multi.getParameter("name").trim();
		String company_license_num = multi.getParameter("license_num").trim();
		company_license_num = company_license_num.substring(0, 3) + "-" + company_license_num.substring(3, 5) + "-" + company_license_num.substring(5);
		String company_boss_phone = multi.getParameter("boss_phone").trim();
		String company_boss_email = multi.getParameter("boss_email").trim();
		String company_charge_phone = multi.getParameter("charge_phone").trim();
		String company_charge_email = multi.getParameter("charge_email").trim();
		String company_charge_name = multi.getParameter("charge_name").trim();
		String company_emp = multi.getParameter("emp").trim();
		String company_content = multi.getParameter("content").trim();
		String company_homepage = "";
		
		
		if(multi.getParameter("homepage") != null) {
			company_homepage = multi.getParameter("homepage").trim();
		}else {
			company_homepage = "(없음)";
		}
		
		String company_license_image = company_name + "_" + multi.getFilesystemName("license_image");
		String company_logo = "";
		
		if(multi.getFilesystemName("logo") != null) {
			company_logo = company_name + "_" + multi.getFilesystemName("logo");
		}else {
			company_logo = "company_default.png";
		}
		
		int mem_num = 0;
		
		if(session.getAttribute("loginNum") != null) {
			mem_num = (int) session.getAttribute("loginNum");
		}
		
		int company_target = mem_num;
		
		dto.setCompany_name(company_name);
		dto.setCompany_license_num(company_license_num);
		dto.setCompany_boss_phone(company_boss_phone);
		dto.setCompany_boss_email(company_boss_email);
		dto.setCompany_charge_phone(company_charge_phone);
		dto.setCompany_charge_email(company_charge_email);
		dto.setCompany_charge_name(company_charge_name);
		dto.setCompany_emp(company_emp);
		dto.setCompany_content(company_content);
		dto.setCompany_homepage(company_homepage);
		dto.setCompany_license_image(company_license_image);
		dto.setCompany_logo(company_logo);
		dto.setCompany_target(company_target);
		
		CompanyDAO companyDAO = CompanyDAO.getInstance();
		int res = companyDAO.insertComapny(dto);
		memberDAO.updateMemberCompany(res, mem_num);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("admin_verify_cont.do?num="+res);
		
		return forward;
	}

}
