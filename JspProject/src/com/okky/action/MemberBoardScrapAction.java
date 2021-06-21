package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.JobDAO;

public class MemberBoardScrapAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("board_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		BoardDAO dao = BoardDAO.getInstance();
		JobDAO jobDAO = JobDAO.getInstance();

		dao.update_scrap(num, login_mem);
		int check = jobDAO.getCheckJob(num);

		ActionForward forward = new ActionForward();

		if (check == 0) {
			System.out.println("check 0");
			forward.setRedirect(true);
			forward.setPath("member_job_content.do?num=" + num + "&hit='no'");
		} else {
			forward.setRedirect(true);
			System.out.println("check 1");
			forward.setPath("member_board_content.do?num=" + num + "&hit='no'");
		}

		return forward;
	}

}
