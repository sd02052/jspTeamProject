package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberBoardEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int board_num = Integer.parseInt(request.getParameter("num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		
		BoardDAO board_dao = BoardDAO.getInstance();
		BoardDTO board_dto = board_dao.getBoardCont(board_num);
		
		MemberDAO mem_dao = MemberDAO.getInstance();
		MemberDTO mem_dto = mem_dao.getMember(board_dto.getBoard_writer());
		
		CategoryDAO cate_dao = CategoryDAO.getInstance();
		CategoryDTO cate_dto = cate_dao.getCategory(cate_num);
		List<CategoryDTO> cate_list = cate_dao.getBoardWriteCategoryList(cate_dto.getCate_group());
		
		request.setAttribute("board_dto", board_dto);
		request.setAttribute("mem_dto", mem_dto);
		request.setAttribute("cate_dto", cate_dto);
		request.setAttribute("cate_list", cate_list);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/board_edit.jsp");
		
		return forward;
	}

}
