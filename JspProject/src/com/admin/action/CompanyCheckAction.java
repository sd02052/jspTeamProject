package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CompanyDAO;

public class CompanyCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("parameter2 >>> " + request.getParameter("num"));
		
		int company_num = Integer.parseInt(request.getParameter("num").trim());
		int check = Integer.parseInt(request.getParameter("check").trim());
		
		CompanyDAO dao = CompanyDAO.getInstance();
		
		int result = dao.updateCompanyCheck(company_num, check);
		
		PrintWriter out = response.getWriter();
		ActionForward foward = new ActionForward();
		
		if(result > 0) {			
			foward.setRedirect(true);
			foward.setPath("admin_verify_cont.do?num="+company_num);
		}else {
			out.println("<script>");
			out.println("alert('인증상태 변경 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return foward;
	}

}
