package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class AdminVerifyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		CompanyDAO comDAO = CompanyDAO.getInstance();
		MemberDAO memDAO = MemberDAO.getInstance();
		
		// 페이징 작업
		int rowsize = 10;	// 한 페이지당 보여질 게시물의 수
		int block = 5;		// 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0;	// 전체 페이지 수
				
		int page = 0;		// 현재 페이지 변수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}

		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
				
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		
		totalRecord = comDAO.getListCount();
		
		allPage = (int)(Math.ceil(totalRecord / (double)rowsize)); 
						
		if(endBlock > allPage) {	
			endBlock = allPage;
		}
		
		// 페이지에 해당하는 게시글을 가져오는 메서드
		List<CompanyDTO> pageList = comDAO.getCompanyList(startNo, endNo);

		// 회사 테이블의 회사번호와 동일한 회사번호를 가지는 멤버 정보를 조회하는 메서드
		List<MemberDTO> memList = memDAO.getCompanyMemberList(pageList);
				
		// 5) 작업했던 값들을 키로 저장하여 view 페이지로 넘기기
		request.setAttribute("memList", memList);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);
		
			
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/admin/admin_verify_list.jsp");
		
		return forward;
	}

}
