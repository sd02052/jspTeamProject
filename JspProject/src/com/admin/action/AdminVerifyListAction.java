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
import com.okky.model.MemberDTO;

public class AdminVerifyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		CompanyDAO comDAO = CompanyDAO.getInstance();
		
		// 회사 테이블 전체를 조회하는 메서드
		List<CompanyDTO> comList = comDAO.getCompanyList();
		
		// 회사 번호를 내림차순으로 가져오는 메서드
		List<Integer> comNum = comDAO.getNumber();

		// 회사 테이블의 회사번호와 동일한 회사번호를 가지는 멤버 정보를 조회하는 메서드
		List<MemberDTO> memList = comDAO.getMemberList(comNum);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		// 회사 타겟 번호를 내림차순으로 가져오는 메서드
		List<Integer> comTarget = comDAO.getTarget();
		
		// 회사 테이블의 참조번호와 동일한 글번호를 가지는 게시글 정보를 조회하는 메서드
		List<BoardDTO> boardList = boardDAO.getBoardList(comTarget);
		
		System.out.println("boardList >>> " + boardList);
		
		request.setAttribute("comList", comList);
		request.setAttribute("memList", memList);
		request.setAttribute("boardList", boardList);
		
		int rowsize = 20;	// 한 페이지당 보여질 게시물의 수
		int block = 10;		// 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0;	// 전체 페이지 수
				
		int page = 0;		// 현재 페이지 변수
		if(request.getParameter("page") != null) {
			// request에 저장된 page 파라미터가 있을 경우 해당 수로 저장
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;	// 처음으로 "전체 게시물" a 태그를 클릭한 경우 1로 저장
		}

		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
				
		// 해당 페이지에서 마지막 번호
		int endNo = (page * rowsize);
				
		// 해당 페이지의 시작 블럭 
		int startBlock = (((page - 1) / block) * block) + 1;
				
		// 해당 페이지의 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		totalRecord = comDAO.getListCount();
		List<CompanyDTO> pageList = comDAO.getCompanyList(page, rowsize);
		
			
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/admin/admin_verify_list.jsp");
		
		return forward;
	}

}
