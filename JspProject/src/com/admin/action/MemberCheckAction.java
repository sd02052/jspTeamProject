package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int page = Integer.parseInt(request.getParameter("page").trim());
		String[] mem_num = request.getParameterValues("check");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.updateMemberCheck(mem_num);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(result > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_member_list.do?page="+page);
		}else {
			out.println("<script>");
			out.println("alert('강제탈퇴 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
