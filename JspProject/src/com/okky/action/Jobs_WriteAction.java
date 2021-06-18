package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class Jobs_WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int cate_num = Integer.parseInt(request.getParameter("num").trim());
		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		
		HttpSession session = request.getSession();
		CategoryDAO categoryDAO = CategoryDAO.getInstance();
		
		if(session.getAttribute("loginNum") != null) {
			int mem_num = (int) session.getAttribute("loginNum");
			MemberDAO memDAO = MemberDAO.getInstance();
			MemberDTO login_mem = memDAO.getMember(mem_num);
			
			CompanyDAO companyDAO = CompanyDAO.getInstance();
			CompanyDTO companyDTO = companyDAO.getMemCompanyList(mem_num);
			
			request.setAttribute("login_mem", login_mem);
			request.setAttribute("companyDTO", companyDTO);
		}

		List<CategoryDTO> categoryList = categoryDAO.getCategoryList(cate_group);
		
		request.setAttribute("cate_step", cate_step);
		request.setAttribute("cate_group", cate_group);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		
		request.setAttribute("categoryList", categoryList);
		
		
		ActionForward forward = new ActionForward();		
		forward.setRedirect(false);
		forward.setPath("view/member/jobs_write.jsp");

		return forward;
	}

}
