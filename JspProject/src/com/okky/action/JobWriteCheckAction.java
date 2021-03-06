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
import com.okky.model.MemberDTO;

public class JobWriteCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big");
		String small_category = request.getParameter("small");
		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		
		HttpSession session = request.getSession();
		
		request.setAttribute("cate_step", cate_step);
		request.setAttribute("cate_group", cate_group);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(session.getAttribute("loginNum") != null) {
			int mem_num = (int) session.getAttribute("loginNum");
			MemberDAO memDAO = MemberDAO.getInstance();
			MemberDTO login_mem = memDAO.getMember(mem_num);
			
			if(login_mem.getMem_company() != 0) {	// 회사가 있는 회원인 경우
				CompanyDAO companyDAO = CompanyDAO.getInstance();
				CompanyDTO companyDTO = companyDAO.getCompanyList(login_mem.getMem_company());
				
				if(companyDTO.getCompany_check() == 1) {	// 회사 인증이 통과된 회원인 경우
					forward.setRedirect(true);
					forward.setPath("member_job_write.do?num="+cate_num+"&big="+big_category+"&small="+small_category+"&cate_group="+cate_group+"&cate_step="+cate_step);
					
				}else if(companyDTO.getCompany_check() == 0) {	// 회사 인증이 대기 중인 회원인 경우
					out.println("<script>");
					out.println("alert('회사 인증 대기중입니다.')");
					out.println("location.href='admin_verify_cont.do?num="+companyDTO.getCompany_num()+"'");
					out.println("</script>");
					
				}else if(companyDTO.getCompany_check() == 2) {	// 회사 인증이 거절된 회원인 경우
					out.println("<script>");
					out.println("alert('회사 인증이 거절되었습니다. 다시 등록해주세요.')");
					out.println("location.href='view/member/company_verify.jsp'");
					out.println("</script>");
				}
			}else {	// 회사가 없는 회원인 경우
				forward.setRedirect(false);
				forward.setPath("view/member/company_verify.jsp");
			}
		}
		
		return forward;
	}

}
