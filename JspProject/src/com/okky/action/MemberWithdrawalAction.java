package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDTO;

public class MemberWithdrawalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int mem_num = Integer.parseInt(request.getParameter("num"));
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMem_num(mem_num);

		request.setAttribute("num", dto);

		ActionForward forward = new ActionForward();

		forward.setRedirect(false);

		forward.setPath("view/member/member_withdrawal.jsp");

		return forward;
	}

}
