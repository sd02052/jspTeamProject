package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.AdminDAO;
import com.okky.model.AdminDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String login_id = request.getParameter("mem_id").trim();
		String login_pwd = request.getParameter("mem_pwd").trim();
		String loginType = request.getParameter("optionsRadios").trim();
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		MemberDAO dao = MemberDAO.getInstance();
		
		if(loginType.equals("member")) { // 회원 로그인 선택한 경우
			int check = dao.memberCheck(login_id, login_pwd);
			
			if (check > 0) {
				HttpSession session = request.getSession();
				MemberDTO dto = dao.getMember(login_id);
				
				session.setAttribute("loginNum", dto.getMem_num());
				session.setAttribute("loginMember", dto);
				session.setAttribute("loginType", loginType);
				
				forward.setRedirect(false);
				forward.setPath("view/member/start.jsp");
			} else if (check == -1) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else if (check == -2) {
				out.println("<script>");
				out.println("alert('등록된 회원이 아닙니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('로그인 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else { // 관리자 로그인 선택한 경우
			/*AdminDAO dao = AdminDAO.getInstance();*/
			int check = dao.adminCheck(login_id, login_pwd);
			
			if (check > 0) {
				HttpSession session = request.getSession();
				MemberDTO dto = dao.getMember(login_id);
				
				session.setAttribute("loginNum", dto.getMem_num());
				session.setAttribute("loginType", loginType);
				
				forward.setRedirect(false);
				forward.setPath("view/member/start.jsp");
			} else if (check == -1) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else if (check == -2) {
				out.println("<script>");
				out.println("alert('등록된 관리자가 아닙니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('로그인 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
		return forward;
		
	}

}
