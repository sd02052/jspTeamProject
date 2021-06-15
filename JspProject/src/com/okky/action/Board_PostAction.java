package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;

public class Board_PostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("등록 누름");
				

//		2DB에 넣는다.
//		3DB에 잘 들어갔는지 확인을 해본다.
		
		BoardDTO dto = new BoardDTO();		
		
//		1받은걸 확인한다.
		int board_category = Integer.parseInt(request.getParameter("category").trim());	// 카테고리 
		String board_title = request.getParameter("title").trim();			// 글 제목
		String board_content = request.getParameter("content").trim();		// 글 내용		
//		String board_write = request.getParameter("writer").trim(); 작성자		
//		int board_writer = Integer.getInteger(request.getParameter("login_mem"));
		
		dto.setBoard_category(board_category);
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
//		dto.setBoard_writer(board_writer); System.out.println(dto);
		
		BoardDAO dao = BoardDAO.getInstance();
		int res = dao.getBoardPost(dto);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("view/member/board.jsp");
		System.out.println("게시물 추가 성공");
		/*if(res > 0) {
		}else {
			out.println("<script>");
			out.println("alert('게시물 추가 실패!!!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}*/
		
		return forward;
	}

}
