package com.okky.action;

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
import com.okky.model.JobDAO;
import com.okky.model.JobDTO;

public class CompanyContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int com_num = Integer.parseInt(request.getParameter("com_num").trim());
		int mem_num = Integer.parseInt(request.getParameter("mem_num").trim());

		CompanyDAO companyDAO = CompanyDAO.getInstance();
		JobDAO jobDAO = JobDAO.getInstance();
		BoardDAO boardDAO = BoardDAO.getInstance();

		// 페이징 작업
		int rowsize = 10; // 한 페이지당 보여질 게시물의 수
		int block = 5; // 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0; // 전체 페이지 수

		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}

		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);

		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;

		// 카테고리에 맞는 전체 게시글 수를 조회하는 메서드
		totalRecord = jobDAO.getCompanyJobCount(com_num);

		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		CompanyDTO dto = companyDAO.getCompanyList(com_num);
		List<JobDTO> jobList = jobDAO.getCompanyJobList(mem_num, startNo, endNo);
		List<BoardDTO> boardList = boardDAO.getJobBoardList(jobList);

		request.setAttribute("comDTO", dto);
		request.setAttribute("jobList", jobList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("mem_num", mem_num);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/company_content.jsp");

		return forward;
	}

}
