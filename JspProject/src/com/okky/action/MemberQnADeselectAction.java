package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CommentDAO;

public class MemberQnADeselectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int com_num = Integer.parseInt(request.getParameter("com_num").trim());
		int board_num = Integer.parseInt(request.getParameter("board_num").trim());
		
		CommentDAO comDAO = CommentDAO.getInstance();
		int res = comDAO.commentDeselect(com_num);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("member_qna_board_content.do?num="+board_num);
		}else {
			out.println("<script>");
			out.println("alert('답변 선택 취소 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
