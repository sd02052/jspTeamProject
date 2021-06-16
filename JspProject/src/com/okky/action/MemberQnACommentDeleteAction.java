package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.CommentDAO;
import com.okky.model.CommentDTO;
import com.okky.model.MemberDAO;

public class MemberQnACommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int com_num = Integer.parseInt(request.getParameter("num").trim());
		int board_num = Integer.parseInt(request.getParameter("board_num").trim());
		CommentDAO dao = CommentDAO.getInstance();
		MemberDAO dao1 = MemberDAO.getInstance();
		BoardDAO dao2 = BoardDAO.getInstance();
		CommentDTO dto = dao.getComment(com_num);
		int com_writer = dto.getCom_writer();

		int result = dao.deleteComment(com_num);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (result > 0) {
			dao2.setBoardComment();
			dao1.commentDownScore(com_writer);
			forward.setRedirect(true);
			forward.setPath("member_qna_board_content.do?num=" + board_num + "&hit='no'");
		} else {
			out.println("<script>");
			out.println("alert('댓글 삭제에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
