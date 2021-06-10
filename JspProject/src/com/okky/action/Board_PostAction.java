package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;

public class Board_PostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("등록 누름");
		ActionForward forward = new ActionForward();
		
//		받은걸 확인한다.
//		DB에 넣는다.
//		DB에 잘 들어갔는지 확인을 해본다.
		
		String board_category = request.getParameter("category").trim();
		String board_title = request.getParameter("title").trim();
//		String board_write = request.getParameter("write").trim();
		String board_write = "abcd";
		String board_content = request.getParameter("content").trim();
		
		BoardDTO dto = new BoardDTO();
		
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
		dto.setBoard_regdate(board_category);
		
		BoardDAO dao = BoardDAO.getInstance();
		int res = dao.getBoardPost(dto);
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('게시물 추가 성공!!!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}
		
		
		
		forward.setRedirect(false);
		forward.setPath("view/member/board.jsp");

		return forward;
	}

}
