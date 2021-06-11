package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDTO;

public class MemberPwdEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("비밀번호 변경 멤버 번호 >>> "+request.getParameter("num").trim());
		
		int mem_num = Integer.parseInt(request.getParameter("num").trim()); // 회원 번호
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(mem_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("view/member/member_pwd.jsp");
		
		return forward;
	}

}
