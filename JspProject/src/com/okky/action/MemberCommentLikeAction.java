package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CommentDAO;

public class MemberCommentLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int com_num = Integer.parseInt(request.getParameter("com_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		CommentDAO dao = CommentDAO.getInstance();

		dao.update_Like(com_num, login_mem);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("member_board_content.do?num=" + board_num  + "&hit='no'");
		return forward;
	}

}
