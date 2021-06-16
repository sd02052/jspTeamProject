package com.okky.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.CommentDAO;
import com.okky.model.MemberDTO;

public class MemberBoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();

		String sort = "";

		if (request.getParameter("sort") == null) {
			sort = "date";
		} else {
			sort = request.getParameter("sort");
		}

		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		String search_data = request.getParameter("data").trim();

		BoardDAO boardDAO = BoardDAO.getInstance();
		CommentDAO comDAO = CommentDAO.getInstance();
		CategoryDAO categoryDAO = CategoryDAO.getInstance();

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

		List<BoardDTO> list = new ArrayList<BoardDTO>();
		CategoryDTO category = new CategoryDTO();
		String type = "";

		if (cate_step == 0) {
			type = "all";
			totalRecord = boardDAO.getSearchBoardListALLCount(cate_group, search_data); // 전체 게시글 수를 조회하는 메서드
			list = boardDAO.getSearchListALL(cate_group, search_data, startNo, endNo); // 전체 게시글을 조회하는 메서드
			category = categoryDAO.getCategoryAll(cate_group); // 전체 카테고리를 조회하는 메서드
		} else {
			type = "detail";
			totalRecord = boardDAO.getSearchBoardListCount(cate_num, search_data);
			list = boardDAO.getSearchList(cate_num, search_data, startNo, endNo);
			category = categoryDAO.getCategory(cate_num);
		}

		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		boardDAO.setBoardLike();
		boardDAO.setBoardScrap();
		boardDAO.setBoardComment();

		List<MemberDTO> list2 = boardDAO.getMemberList(list);
		List<CategoryDTO> list3 = boardDAO.getCategoryAllList(list);

		List<Integer> selectList = comDAO.getSelectedList(list); // 채택된 답변이 있는지 조회하는 메서드

		request.setAttribute("boardList", list);
		request.setAttribute("memberList", list2);
		request.setAttribute("categoryList", list3);
		request.setAttribute("selectList", selectList);

		request.setAttribute("category", category);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("type", type);
		request.setAttribute("sort", sort);
		request.setAttribute("data", search_data);
		request.setAttribute("cate_group", cate_group);
		request.setAttribute("cate_step", cate_step);

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
		forward.setPath("view/member/board_search_list.jsp");

		return forward;
	}

}
