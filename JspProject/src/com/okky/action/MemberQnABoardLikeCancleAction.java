package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;

public class MemberQnABoardLikeCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("board_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		BoardDAO dao = BoardDAO.getInstance();

		dao.update_Like_cancle(num, login_mem);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("member_qna_board_content.do?num=" + num + "&hit='no'");
		return forward;
	}

}
