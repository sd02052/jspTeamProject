package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberInfoEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("개인정보 변경 완료 멤버 번호 >>> "+request.getParameter("num").trim());
		
		int mem_num = Integer.parseInt(request.getParameter("num").trim());
		String mem_nick = request.getParameter("mem_nick").trim();
//		String tag_name = request.getParameter("mem_tag").trim();

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(mem_num);
		dto.setMem_nick(mem_nick);

//		TagDTO tdto = new TagDTO();
//		tdto.setTag_name(tag_name);

		int res = dao.infoEdit(dto);
//		int tres = dao.infoTagEdit(mem_num, tdto);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (res > 0) { // 닉네임 중복이 아닐경우
			forward.setRedirect(true);
			forward.setPath("member_info_edit.do?num=" + mem_num);
		} else if (res == -1) { // 닉네임 중복일 경우
			out.println("<script>");
			out.println("alert('이미 존재하는 닉네임입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
