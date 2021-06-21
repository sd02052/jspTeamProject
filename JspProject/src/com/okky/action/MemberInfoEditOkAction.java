package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;
import com.okky.model.TagDAO;
import com.okky.model.TagDTO;

public class MemberInfoEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int mem_num = Integer.parseInt(request.getParameter("num").trim());
		String mem_nick = request.getParameter("mem_nick").trim();
		String tag_name = request.getParameter("mem_tag").trim();
		System.out.println(request.getParameter("mem_emailCheck")); 
		String email_check = request.getParameter("mem_emailCheck");
		System.out.println("넘어온 이메일 체크 >>> " + email_check);
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(mem_num);
		dto.setMem_nick(mem_nick);
		
		MemberDTO dto1 = dao.getMember(mem_num);
		if(dto1.getMem_emailCheck().equals("yes")) {
			if(email_check == null) {
				email_check = "no";
			} else {
				email_check = "yes";
			}
		} else if(dto1.getMem_emailCheck().equals("no")) {
			if(email_check == null) {
				email_check = "no";
			} else if(email_check.equals("no")){
				email_check = "yes";
			}
		}
		System.out.println(email_check);
		/*if(email_check == null) {
			if(dto1.getMem_emailCheck().equals("yes")) {
				email_check = "no";
			} else if(dto1.getMem_emailCheck().equals("no")){
				email_check = "yes";
			}
		}*/
		dto.setMem_emailCheck(email_check);
		TagDTO tdto = new TagDTO();
		tdto.setTag_name(tag_name);

		
		int res = dao.infoEdit(dto);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (res > 0) { // 닉네임 중복이 아닐경우
			TagDAO tdao = TagDAO.getInstance();
			int tresult = tdao.addTag(mem_num, tag_name);
			if(tresult > 0) {
				forward.setRedirect(true);
				forward.setPath("member_info_edit.do?num=" + mem_num);
			} else {
				out.println("<script>");
				out.println("alert('태그 수정에 실패했습니다')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else if (res == -1) { // 닉네임 중복일 경우
			out.println("<script>");
			out.println("alert('이미 존재하는 닉네임입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
