package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.MemberDTO;

public class MemberBoardListAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cate_num = Integer.parseInt(request.getParameter("cate_num"));
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		BoardDAO dao1 = BoardDAO.getInstance();
		
		dao1.setBoardLike();
		dao1.setBoardScrap();
		dao1.setBoardComment();
		
		List<BoardDTO> list = dao1.getBoardListAll(cate_num);
		List<MemberDTO> list2 = dao1.getMemberList(list);
		
		
		CategoryDAO dao2 = CategoryDAO.getInstance();
		
		CategoryDTO category = dao2.getCategory(cate_num);
		
		request.setAttribute("boardList", list);
		request.setAttribute("memberList", list2);
		request.setAttribute("category", category);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/board.jsp");
		
		return forward;
	}

}
