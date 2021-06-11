package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPwdEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("비밀번호 변경 완료 멤버 번호 >>> "+request.getParameter("num").trim());
		
		int mem_num = Integer.parseInt(request.getParameter("num").trim()); // 회원 번호
		String password = request.getParameter("password").trim(); // 입력한 현재 비밀번호 
		
		String newPassword = request.getParameter("newPassword").trim(); // 입력한 새 비밀번호
		String passwordConfirm = request.getParameter("passwordConfirm").trim(); // 입력한 새 비밀번호 확인

		MemberDTO dto = new MemberDTO();
		dto.setMem_num(mem_num);
		dto.setMem_pwd(password);
		
		MemberDAO dao = MemberDAO.getInstance();
		int res = dao.pwdEdit(dto,newPassword);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(newPassword.equals(passwordConfirm)) { // 새 비밀번호와 새 비밀번호 확인이 같을 경우
			if(res > 0) { // 현재 비밀번호를 맞게 입력한 경우
				forward.setRedirect(true);
				forward.setPath("member_info_edit.do?num=" + mem_num);
			}else if(res == -1){ // 현재 비밀번호를 다르게 입력한 경우
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else { // 새 비밀번호와 새 비밀번호 확인이 다를 경우
			out.println("<script>");
			out.println("alert('새 비밀번호 확인이 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
