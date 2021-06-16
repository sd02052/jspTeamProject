package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CommentDAO;

public class MemberQnACommentEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int com_num = Integer.parseInt(request.getParameter("com_num").trim());
		String com_content = request.getParameter("com_content").trim();
		int com_target = Integer.parseInt(request.getParameter("com_target").trim());

		CommentDAO dao = CommentDAO.getInstance();
		int result = dao.editComment(com_num, com_content);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (result > 0) {
			forward.setRedirect(true);
			forward.setPath("member_qna_board_content.do?num=" + com_target + "&hit='no'");
		} else {
			out.println("<script>");
			out.println("alert('댓글 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
