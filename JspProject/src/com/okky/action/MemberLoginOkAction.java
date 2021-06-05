package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String mem_id = request.getParameter("mem_id").trim();
		String mem_pwd = request.getParameter("mem_pwd").trim();

		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.memberCheck(mem_id, mem_pwd);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		if (check > 0) {
			MemberDTO dto = dao.getMember(mem_id);

			session.setAttribute("loginNum", dto.getMem_num());

			forward.setRedirect(false);
			forward.setPath("view/member/main.jsp");
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

		return forward;
	}

}
