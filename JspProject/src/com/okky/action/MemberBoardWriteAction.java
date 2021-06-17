package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		int loginNum = (int)session.getAttribute("loginNum");
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMember(loginNum);
		request.setAttribute("dto", dto);
		
		CategoryDAO dao1 = CategoryDAO.getInstance();
		CategoryDTO dto1 = dao1.getCategory(cate_num);
		List<CategoryDTO> cate_list = dao1.getBoardWriteCategoryList(dto1.getCate_group());
		
		request.setAttribute("cate_list", cate_list);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("category", dto1);
		
		ActionForward forward = new ActionForward();		
		forward.setRedirect(false);
		forward.setPath("view/member/board_write.jsp");

		return forward;
	}

}