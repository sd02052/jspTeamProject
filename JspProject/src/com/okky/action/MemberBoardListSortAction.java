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
import com.okky.model.MemberDTO;

public class MemberBoardListSortAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sort = request.getParameter("sort").trim();
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		BoardDAO dao1 = BoardDAO.getInstance();

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
		totalRecord = dao1.getBoardListCount(cate_num);

		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		dao1.setBoardLike();
		dao1.setBoardScrap();
		dao1.setBoardComment();

		List<BoardDTO> list = null;
		
		if(sort.equals("like")) {
			list = dao1.getBoardListSortLike(cate_num, startNo, endNo);
		} else if(sort.equals("comment")) {
			list = dao1.getBoardListSortComment(cate_num, startNo, endNo);
		} else if(sort.equals("scrap")) {
			list = dao1.getBoardListSortScrap(cate_num, startNo, endNo);
		} else if(sort.equals("hit")) {
			list = dao1.getBoardListSortHit(cate_num, startNo, endNo);
		}
		List<MemberDTO> list2 = dao1.getMemberList(list);
		List<CategoryDTO> list3 = dao1.getCategoryAllList(list);

		CategoryDAO dao2 = CategoryDAO.getInstance();

		CategoryDTO category = dao2.getCategory(cate_num);

		String type="detail";
		
		request.setAttribute("boardList", list);
		request.setAttribute("memberList", list2);
		request.setAttribute("categoryList", list3);
		request.setAttribute("category", category);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("type", type);
		request.setAttribute("sort", sort);
		
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
