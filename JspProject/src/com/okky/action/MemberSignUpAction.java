package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberSignUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원가입 폼 페이지(member_sign_up)에서 넘어온 데이터들을 DB에 저장하는 컨트롤러 클래스.
		
		String mem_id = request.getParameter("mem_id").trim();
		String mem_pwd = request.getParameter("mem_pwd").trim();
		String mem_email = request.getParameter("mem_email").trim();
		String mem_nick = request.getParameter("mem_nick").trim();
		//String mem_emailCheck = request.getParameterValues("mem_emailCheck")[0];
		String mem_image = "dpro.png";
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(mem_id);
		dto.setMem_pwd(mem_pwd);
		dto.setMem_email(mem_email);
		dto.setMem_nick(mem_nick);
		dto.setMem_image(mem_image);
		//dto.setMem_emailCheck(mem_emailCheck);
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.signUp(dto);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("main.do");
		}else {
			out.println("<script>");
			out.println("alert('회원가입실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
