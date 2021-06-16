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
import com.okky.model.CommentDAO;
import com.okky.model.CommentDTO;
import com.okky.model.MemberDTO;

public class MemberQnABoardListSortAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sort = request.getParameter("sort").trim();
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		CommentDAO comDAO = CommentDAO.getInstance();
		CategoryDAO dao2 = CategoryDAO.getInstance();

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
			category = dao2.getCategoryAll(cate_num);
			
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
			category = dao2.getCategory(cate_num);
			
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
		
		List<MemberDTO> list2 = boardDAO.getMemberList(list);
		List<CategoryDTO> list3 = boardDAO.getCategoryAllList(list);
		List<CommentDTO> comList = comDAO.getCommentList(list);
		List<Integer> selectList = comDAO.getSelectedList(list);	// 채택된 답변이 있는지 조회하는 메서드

		request.setAttribute("boardList", list);
		request.setAttribute("memberList", list2);
		request.setAttribute("categoryList", list3);
		request.setAttribute("comList", comList);
		request.setAttribute("selectList", selectList);
		
		request.setAttribute("category", category);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("type", type);
		request.setAttribute("sort", sort);
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
		forward.setPath("view/member/qna_board.jsp");

		return forward;
	}

}
