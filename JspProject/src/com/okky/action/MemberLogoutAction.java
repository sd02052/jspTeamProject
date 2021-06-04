package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/login.jsp");

		return forward;
	}

}
