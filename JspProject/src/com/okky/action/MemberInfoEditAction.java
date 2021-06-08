package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberInfoEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int loginNum = Integer.parseInt(request.getParameter("num"));

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMember(loginNum);
		List<String> list = dao.getMemTag(loginNum);

		request.setAttribute("loginUser", dto);
		request.setAttribute("tagList", list);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/member_info.jsp");

		return forward;
	}

}
