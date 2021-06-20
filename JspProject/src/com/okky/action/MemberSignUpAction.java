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
		String mem_emailCheck = request.getParameter("mem_emailCheck");
		if(mem_emailCheck == null) {
			mem_emailCheck = "no";
		}
		
		int random_count = (int)((Math.random()*10000)%5);
		String mem_image = "dpro"+random_count+".png";
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(mem_id);
		dto.setMem_pwd(mem_pwd);
		dto.setMem_email(mem_email);
		dto.setMem_nick(mem_nick);
		dto.setMem_image(mem_image);
		dto.setMem_emailCheck(mem_emailCheck);
		
		MemberDAO dao = MemberDAO.getInstance();
		int res = dao.signUp(dto);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(res > 0) {
			request.setAttribute("mem_id", mem_id);
			forward.setRedirect(false);
			forward.setPath("view/member/login.jsp");
		}else if( res == -1){ // 닉네임 중복
			out.println("<script>");
			out.println("alert('중복된 아이디 입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else if( res == -2){ // 닉네임 중복
			out.println("<script>");
			out.println("alert('중복된 닉네임 입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원가입실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
