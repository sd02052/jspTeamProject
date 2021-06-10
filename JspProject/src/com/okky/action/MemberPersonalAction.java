package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPersonalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int num = Integer.parseInt(request.getParameter("num").trim());
		
		MemberDAO memDAO = MemberDAO.getInstance();
		MemberDTO memDTO = memDAO.getMember(num);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> boardList = boardDAO.getMemberBoardList(num);
		
		request.setAttribute("memDTO", memDTO);
		request.setAttribute("boardList", boardList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/member_personal.jsp");
		
		return forward;
	}

}
