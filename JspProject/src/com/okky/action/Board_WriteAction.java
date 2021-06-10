package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;

public class Board_WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("글쓰기로가기누름");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/board_write.jsp");

		return forward;
	}

}
