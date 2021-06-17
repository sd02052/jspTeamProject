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
import com.okky.model.MemberDAO;

public class MemberBoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		int board_writer = Integer.parseInt(request.getParameter("board_writer").trim());
		int board_category = Integer.parseInt(request.getParameter("board_category").trim());
		String board_title = request.getParameter("board_title").trim();
		String board_content = request.getParameter("board_content").trim();

		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = new BoardDTO();
		dto.setBoard_writer(board_writer);
		dto.setBoard_category(board_category);
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);

		CategoryDAO dao1 = CategoryDAO.getInstance();
		CategoryDTO dto1 = dao1.getCategory(board_category);
		int result = dao.writeBoard(dto);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (result > 0) {
			MemberDAO dao2 = MemberDAO.getInstance();
			dao2.boardUpScore(board_writer);
			if(dto1.getCate_group() != 1) {
				forward.setRedirect(true);
				forward.setPath("member_board_list.do?cate_num=" + board_category + "&big=" + big_category + "&small="
						+ small_category + "&cate_group=" + dto1.getCate_group() + "&cate_step=" + dto1.getCate_step());
			} else if(dto1.getCate_group() == 1) {
				forward.setRedirect(true);
				forward.setPath("member_qna_board_list.do?cate_num=" + board_category + "&big=" + big_category + "&small="
						+ small_category + "&cate_group=" + dto1.getCate_group() + "&cate_step=" + dto1.getCate_step());
			}
		} else {
			out.println("<script>");
			out.println("alert('게시물 등록에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
