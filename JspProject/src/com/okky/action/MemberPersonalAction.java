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
import com.okky.model.LikeDAO;
import com.okky.model.LikeDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPersonalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int num = Integer.parseInt(request.getParameter("num").trim());

		MemberDAO memDAO = MemberDAO.getInstance();
		BoardDAO boardDAO = BoardDAO.getInstance();
		CategoryDAO cateDAO = CategoryDAO.getInstance();
		CommentDAO comDAO = CommentDAO.getInstance();
		LikeDAO likeDAO = LikeDAO.getInstance();

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

		int totalRecord1 = boardDAO.getSearchListCount(num);	// 작성글
		int totalRecord2 = boardDAO.getSearchListCount(num);	// 작성 댓글
		int totalRecord3 = boardDAO.getSearchListCount(num);	// 스크랩

		int allPage1 = (int) (Math.ceil(totalRecord1 / (double) rowsize));	// 작성글
		int allPage2 = (int) (Math.ceil(totalRecord2 / (double) rowsize));	// 작성댓글
		int allPage3 = (int) (Math.ceil(totalRecord3 / (double) rowsize));	// 스크랩

		if (endBlock > allPage1) {
			endBlock = allPage1;
		}
		
		if (endBlock > allPage2) {
			endBlock = allPage2;
		}
		
		if (endBlock > allPage3) {
			endBlock = allPage3;
		}
	
		MemberDTO memDTO = memDAO.getMember(num);										// 회원정보를 조회하는 메서드
		
		// 작성글
		List<BoardDTO> boardList = boardDAO.getMemberBoardList(num, startNo, endNo);	// 회원이 작성한 모든 글을 조회하는 메서드
		List<CategoryDTO> cateList = cateDAO.getCategoryList(boardList);				// 회원이 작성한 모든 글의 카테고리를 조회하는 메서드
		
		// 작성댓글
		List<CommentDTO> comList = comDAO.getMemberCommentList(num, startNo, endNo);	// 회원이 작성한 모든 댓글을 조회하는 메서드
		List<BoardDTO> cbList = boardDAO.getBoardList(comList);							// 회원이 작성한 모든 댓글이 달린 게시글을 조회하는 메서드
		List<MemberDTO> cmList = memDAO.getMemberList(cbList);							// 회원이 작성한 댓글이 달린 글 작성자 정보를 조회하는 메서드
		
		// 스크랩
		List<LikeDTO> likeList = likeDAO.getScrapList(num, startNo, endNo);				// 회원이 스크랩한 글 번호를 조회하는 메서드
		List<BoardDTO> lbList = boardDAO.getScrapBoardList(likeList);					// 회원이 스크랩한 글의 정보를 조회하는 메서드
		List<MemberDTO> lmList = memDAO.getMemberList(cbList);							// 회원이 스크랩한 글 작성자 정보를 조회하는 메서드
		
		request.setAttribute("memDTO", memDTO);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("cateList", cateList);
		
		request.setAttribute("comList", comList);
		request.setAttribute("cbList", cbList);
		request.setAttribute("cmList", cmList);
		
		request.setAttribute("lbList", lbList);
		request.setAttribute("lmList", lmList);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord1", totalRecord1);
		request.setAttribute("totalRecord2", totalRecord2);
		request.setAttribute("totalRecord3", totalRecord3);
		request.setAttribute("allPage1", allPage1);
		request.setAttribute("allPage2", allPage2);
		request.setAttribute("allPage3", allPage3);
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
