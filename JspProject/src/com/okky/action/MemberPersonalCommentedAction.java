package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CommentDAO;
import com.okky.model.CommentDTO;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.LikeDAO;
import com.okky.model.LikeDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPersonalCommentedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int num = Integer.parseInt(request.getParameter("num").trim());

		MemberDAO memDAO = MemberDAO.getInstance();
		BoardDAO boardDAO = BoardDAO.getInstance();
		CommentDAO comDAO = CommentDAO.getInstance();
		LikeDAO likeDAO = LikeDAO.getInstance();
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

		int allPage = (int) (Math.ceil(totalRecord_com / (double) rowsize)); // 작성댓글
		
		if (endBlock > allPage) {
			endBlock = allPage;
		}

		MemberDTO memDTO = memDAO.getMember(num); // 회원정보를 조회하는 메서드
		CompanyDTO companyDTO = companyDAO.getMemCompanyList(num);
		
		List<BoardDTO> boardList = boardDAO.getMemberBoardList(num, startNo, endNo); // 회원이 작성한 모든 글을 조회하는 메서드
		List<LikeDTO> likeList = likeDAO.getScrapList(num, startNo, endNo); // 회원이 스크랩한 글 번호를 조회하는 메서드

		// 작성댓글
		List<CommentDTO> comList = comDAO.getMemberCommentList(num, startNo, endNo); // 회원이 작성한 모든 댓글을 조회하는 메서드
		List<BoardDTO> cbList = boardDAO.getBoardList(comList); // 회원이 작성한 모든 댓글이 달린 게시글을 조회하는 메서드

		request.setAttribute("memDTO", memDTO);
		request.setAttribute("companyDTO", companyDTO);

		request.setAttribute("boardList", boardList);
		request.setAttribute("likeList", likeList);
		
		request.setAttribute("comList", comList);
		request.setAttribute("cbList", cbList);

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
		forward.setPath("view/member/member_personal_commented.jsp");

		return forward;
	}

}
