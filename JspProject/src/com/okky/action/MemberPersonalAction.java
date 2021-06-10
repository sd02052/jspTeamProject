package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class MemberPersonalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int num = Integer.parseInt(request.getParameter("num").trim());

		MemberDAO memDAO = MemberDAO.getInstance();
		BoardDAO boardDAO = BoardDAO.getInstance();

		// 페이징 작업
		int rowsize = 10; // 한 페이지당 보여질 게시물의 수
		int block = 5; // 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0; // 전체 페이지 수

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

		totalRecord = boardDAO.getSearchListCount(num);

		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		// 회원정보를 불러오는 메서드
		MemberDTO memDTO = memDAO.getMember(num);

		// 회원의 활동과 관련한 모든 글을 불러오는 메서드
		List<BoardDTO> boardList = boardDAO.getMemberBoardList(num, startNo, endNo);
		List<MemberDTO> memList = memDAO.getMemberList(boardList);

		request.setAttribute("memDTO", memDTO);
		request.setAttribute("boardList", boardList);
		request.setAttribute("memList", memList);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/member_personal.jsp");

		return forward;
	}

}
