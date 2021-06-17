package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;

public class MemberWithdrawalOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int mem_num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int res = dao.memberWithdrawal(mem_num);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if (res > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginNum", null);
			forward.setRedirect(false);
			forward.setPath("login.do");
		} else {
			out.println("<script>");
			out.println("alert('회원 탈퇴 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
