package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.JobDAO;
import com.okky.model.JobDTO;
import com.okky.model.MemberDTO;

public class MemberBoardListSortAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sort = request.getParameter("sort").trim();
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		CategoryDAO categoryDAO = CategoryDAO.getInstance();

		// 페이징 작업
		int rowsize = 10; 	// 한 페이지당 보여질 게시물의 수
		int block = 5; 		// 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0;	// 전체 페이지 수

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
		List<BoardDTO> list = null;
		String type = "";
		CategoryDTO category = new CategoryDTO();
		
		if (cate_step == 0) {
			type = "all";
			totalRecord = boardDAO.getBoardListAllCount(cate_group); // 전체 게시글 수를 조회하는 메서드
			category = categoryDAO.getCategoryAll(cate_group);
			
			if(sort.equals("like")) {
				list = boardDAO.getBoardListAllSortLike(cate_group, startNo, endNo);
			} else if(sort.equals("comment")) {
				list = boardDAO.getBoardListAllSortComment(cate_group, startNo, endNo);
			} else if(sort.equals("scrap")) {
				list = boardDAO.getBoardListAllSortScrap(cate_group, startNo, endNo);
			} else if(sort.equals("hit")) {
				list = boardDAO.getBoardListAllSortHit(cate_group, startNo, endNo);
			}
			
		}else {
			type = "detail";
			totalRecord = boardDAO.getBoardListCount(cate_num);
			category = categoryDAO.getCategory(cate_num);
			
			if(sort.equals("like")) {
				list = boardDAO.getBoardListSortLike(cate_num, startNo, endNo);
			} else if(sort.equals("comment")) {
				list = boardDAO.getBoardListSortComment(cate_num, startNo, endNo);
			} else if(sort.equals("scrap")) {
				list = boardDAO.getBoardListSortScrap(cate_num, startNo, endNo);
			} else if(sort.equals("hit")) {
				list = boardDAO.getBoardListSortHit(cate_num, startNo, endNo);
			}
		}

		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		boardDAO.setBoardLike();
		boardDAO.setBoardScrap();
		boardDAO.setBoardComment();
		
		if(cate_num == 16 || cate_num == 17 || cate_num == 18 || cate_num == 19) {	// 구인 게시판인 경우
			CompanyDAO companyDAO = CompanyDAO.getInstance();
			JobDAO jobDAO = JobDAO.getInstance();
			
			List<CompanyDTO> list2 = companyDAO.getCompanyList(list);
			List<JobDTO> jobList = jobDAO.getJobList(list);
			
			request.setAttribute("companyList", list2);
			request.setAttribute("jobList", jobList);
			
		}else {													// 구인게시판이 아닌 경우
			List<MemberDTO> list2 = boardDAO.getMemberList(list);
			request.setAttribute("memberList", list2);
		}


		List<CategoryDTO> list3 = boardDAO.getCategoryAllList(list);
		List<CategoryDTO> cateList = categoryDAO.getCategoryList(list);

		String[] big_categorys = new String[cateList.size()];
		String[] small_categorys = new String[cateList.size()];

		for (int i = 0; i < cateList.size(); i++) {
			if (cateList.get(i).getCate_num() == 2) {
				big_categorys[i] = "'menu1'";
				small_categorys[i] = "'menu1-2'";
			} else if (cateList.get(i).getCate_num() == 3) {
				big_categorys[i] = "'menu1'";
				small_categorys[i] = "'menu1-3'";
			} else if (cateList.get(i).getCate_num() == 5) {
				big_categorys[i] = "'menu2'";
				small_categorys[i] = "'menu2-2'";
			} else if (cateList.get(i).getCate_num() == 6) {
				big_categorys[i] = "'menu2'";
				small_categorys[i] = "'menu2-3'";
			} else if (cateList.get(i).getCate_num() == 8) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-2'";
			} else if (cateList.get(i).getCate_num() == 9) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-3'";
			} else if (cateList.get(i).getCate_num() == 10) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-4'";
			} else if (cateList.get(i).getCate_num() == 11) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-5'";
			} else if (cateList.get(i).getCate_num() == 12) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-6'";
			} else if (cateList.get(i).getCate_num() == 13) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-7'";
			} else if (cateList.get(i).getCate_num() == 14) {
				big_categorys[i] = "'menu3'";
				small_categorys[i] = "'menu3-8'";
			} else if (cateList.get(i).getCate_num() == 15) {
				big_categorys[i] = "'menu4'";
				small_categorys[i] = "'menu4-1'";
			} else if (cateList.get(i).getCate_num() == 17) {
				big_categorys[i] = "'menu5'";
				small_categorys[i] = "'menu5-2'";
			} else if (cateList.get(i).getCate_num() == 18) {
				big_categorys[i] = "'menu5'";
				small_categorys[i] = "'menu5-3'";
			} else if (cateList.get(i).getCate_num() == 19) {
				big_categorys[i] = "'menu5'";
				small_categorys[i] = "'menu5-4'";
			}
		}
		
		request.setAttribute("boardList", list);
		
		request.setAttribute("categoryList", list3);
		request.setAttribute("category", category);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("type", type);
		request.setAttribute("sort", sort);
		
		request.setAttribute("cate_group", cate_group);
		request.setAttribute("cate_step", cate_step);
		request.setAttribute("small", small_categorys);
		request.setAttribute("big", big_categorys);
		
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
		forward.setPath("view/member/board.jsp");

		return forward;
	}

}
