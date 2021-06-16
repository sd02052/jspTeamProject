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

public class MemberQnACommentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDAO dao = MemberDAO.getInstance();
		int login_num = Integer.parseInt(request.getParameter("com_writer"));
		
		int com_target = Integer.parseInt(request.getParameter("com_target").trim());
		String com_content = request.getParameter("com_content").trim();
		
		CommentDAO dao1= CommentDAO.getInstance();
		CommentDTO comment_dto = new CommentDTO();
		comment_dto.setCom_writer(login_num);
		comment_dto.setCom_content(com_content);
		comment_dto.setCom_target(com_target);
		
		BoardDAO dao2 = BoardDAO.getInstance();
		
		int result = dao1.writeComment(comment_dto);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(result > 0) {
			dao2.setBoardComment();
			dao.commentUpScore(login_num);
			forward.setRedirect(true);
			forward.setPath("member_qna_board_content.do?num=" + com_target + "&hit='no'");
		} else {
			out.println("<script>");
			out.println("alert('댓글 등록에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
