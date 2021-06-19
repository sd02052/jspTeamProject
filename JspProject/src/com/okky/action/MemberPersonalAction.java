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
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.LikeDAO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPersonalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int num = Integer.parseInt(request.getParameter("num").trim());

		MemberDAO memDAO = MemberDAO.getInstance();
		BoardDAO boardDAO = BoardDAO.getInstance();
		CategoryDAO cateDAO = CategoryDAO.getInstance();
		LikeDAO likeDAO = LikeDAO.getInstance();
		CommentDAO comDAO = CommentDAO.getInstance();
		CompanyDAO companyDAO = CompanyDAO.getInstance();

		// 페이징 작업
		int rowsize = 10; // 한 페이지당 보여질 게시물의 수
		int block = 5; // 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)

		int page = 0; // 현재 페이지 변수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "전체 게시물" a 태그를 클릭한 경우 1로 저장
		}

		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);

		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;

		int totalRecord_board = boardDAO.getSearchListCount(num); // 작성글 전체수
		int totalRecord_com = comDAO.getCommentListCount(num); // 작성 댓글 전체수
		int totalRecord_scrap = likeDAO.getScrapListCount(num);	// 회원이 스크랩한 모든 글 수
		
		int allPage = (int) (Math.ceil(totalRecord_board / (double) rowsize)); // 작성글

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		MemberDTO memDTO = memDAO.getMember(num); // 회원정보를 조회하는 메서드
		CompanyDTO companyDTO = companyDAO.getMemCompanyList(num);

		// 작성글
		List<BoardDTO> boardList = boardDAO.getMemberBoardList(num, startNo, endNo); // 회원이 작성한 모든 글을 조회하는 메서드
		List<CategoryDTO> cateList = cateDAO.getCategoryList(boardList); // 회원이 작성한 모든 글의 카테고리를 조회하는 메서드

		String[] big_category = new String[cateList.size()];
		String[] small_category = new String[cateList.size()];

		for (int i = 0; i < cateList.size(); i++) {
			if (cateList.get(i).getCate_num() == 2) {
				big_category[i] = "'menu1'";
				small_category[i] = "'menu1-2'";
			} else if (cateList.get(i).getCate_num() == 3) {
				big_category[i] = "'menu1'";
				small_category[i] = "'menu1-3'";
			} else if (cateList.get(i).getCate_num() == 5) {
				big_category[i] = "'menu2'";
				small_category[i] = "'menu2-2'";
			} else if (cateList.get(i).getCate_num() == 6) {
				big_category[i] = "'menu2'";
				small_category[i] = "'menu2-3'";
			} else if (cateList.get(i).getCate_num() == 8) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-2'";
			} else if (cateList.get(i).getCate_num() == 9) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-3'";
			} else if (cateList.get(i).getCate_num() == 10) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-4'";
			} else if (cateList.get(i).getCate_num() == 11) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-5'";
			} else if (cateList.get(i).getCate_num() == 12) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-6'";
			} else if (cateList.get(i).getCate_num() == 13) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-7'";
			} else if (cateList.get(i).getCate_num() == 14) {
				big_category[i] = "'menu3'";
				small_category[i] = "'menu3-8'";
			} else if (cateList.get(i).getCate_num() == 15) {
				big_category[i] = "'menu4'";
				small_category[i] = "'menu4-1'";
			} else if (cateList.get(i).getCate_num() == 17) {
				big_category[i] = "'menu5'";
				small_category[i] = "'menu5-2'";
			} else if (cateList.get(i).getCate_num() == 18) {
				big_category[i] = "'menu5'";
				small_category[i] = "'menu5-3'";
			} else if (cateList.get(i).getCate_num() == 19) {
				big_category[i] = "'menu5'";
				small_category[i] = "'menu5-4'";
			}
		}

		request.setAttribute("memDTO", memDTO);
		request.setAttribute("companyDTO", companyDTO);

		request.setAttribute("boardList", boardList);
		request.setAttribute("cateList", cateList);
		
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord_board", totalRecord_board);
		request.setAttribute("totalRecord_com", totalRecord_com);
		request.setAttribute("totalRecord_scrap", totalRecord_scrap);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/member_personal.jsp");

		return forward;
	}

}
