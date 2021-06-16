package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CommentDAO;
import com.okky.model.CommentDTO;
import com.okky.model.MemberDAO;

public class MemberBoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("num").trim());
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		CommentDAO dao = CommentDAO.getInstance();
		List<CommentDTO> commentList = dao.getCommentList(board_num);

		MemberDAO dao1 = MemberDAO.getInstance();
		BoardDAO dao2 = BoardDAO.getInstance();
		BoardDTO board_dto = dao2.getBoardCont(board_num);
		int board_writer = board_dto.getBoard_writer();

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (commentList.size() == 0) {
			int result = dao2.deleteBoard(board_num);
			if (result > 0) {
				dao2.setBoardComment();
				dao1.boardDownScore(board_writer);
				forward.setRedirect(true);
				forward.setPath("member_board_list.do?cate_num=" + cate_num + "&big=" + big_category + "&small=" + small_category);
			} else {
				out.println("<script>");
				out.println("alert('댓글 삭제에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('댓글이 있는 글은 삭제하실 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
