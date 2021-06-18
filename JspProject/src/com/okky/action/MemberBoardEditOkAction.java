package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;

public class MemberBoardEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num").trim());
		int board_category = Integer.parseInt(request.getParameter("edit_category").trim());
		String board_title = request.getParameter("edit_title").trim();
		String board_content = request.getParameter("edit_content").trim();
		
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = new BoardDTO();
		dto.setBoard_category(board_category);
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
		dto.setBoard_num(board_num);
		
		CategoryDAO dao1 = CategoryDAO.getInstance();
		CategoryDTO dto1 = dao1.getCategory(board_category);
		int result = dao.editBoard(dto);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (result > 0) {
			if(dto1.getCate_group() != 1) {
				forward.setRedirect(true);
				forward.setPath("member_board_content.do?num=" + board_num + "&hit='no'");
			} else if(dto1.getCate_group() == 1) {
				forward.setRedirect(true);
				forward.setPath("member_qna_board_content.do?num=" + board_num + "&hit='no'");
			}
		} else {
			out.println("<script>");
			out.println("alert('게시물 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
