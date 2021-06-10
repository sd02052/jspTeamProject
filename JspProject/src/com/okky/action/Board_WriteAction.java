package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class Board_WriteAction implements Action {

	private BoardDTO board_num;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("글쓰기로가기누름");
		ActionForward forward = new ActionForward();
		
		BoardDAO dao = BoardDAO.getBoardPost;
		
		forward.setRedirect(false);
		forward.setPath("view/member/board_write.jsp");

		return forward;
	}

}
