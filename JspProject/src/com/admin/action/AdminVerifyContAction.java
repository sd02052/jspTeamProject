package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class AdminVerifyContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int num = Integer.parseInt(request.getParameter("num").trim());
		
		CompanyDAO comDAO = CompanyDAO.getInstance();
		MemberDAO memDAO = MemberDAO.getInstance();
		
		// �듅�젙 踰덊샇�뿉 �빐�떦�븯�뒗 �쉶�궗 �젙蹂대�� 媛��졇�삤�뒗 硫붿꽌�뱶
		CompanyDTO comList = comDAO.getCompanyList(num);
		MemberDTO memList = memDAO.getMemberList(num);
		
		request.setAttribute("comList", comList);
		request.setAttribute("memList", memList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/admin/admin_verify_cont.jsp");
		
		return forward;
	}

}
