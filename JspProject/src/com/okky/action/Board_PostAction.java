package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;

public class Board_PostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("등록 누름");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/board.jsp");

		return forward;
	}

}
