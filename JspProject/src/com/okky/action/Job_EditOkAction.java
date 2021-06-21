package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.JobDAO;
import com.okky.model.JobDTO;
import com.okky.model.MemberDAO;

public class Job_EditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int board_num = Integer.parseInt(request.getParameter("num").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		int cate_num = Integer.parseInt(request.getParameter("cate_num").trim());

		HttpSession session = request.getSession();

		int mem_num = 0;

		if (session.getAttribute("loginNum") != null) {
			mem_num = (int) session.getAttribute("loginNum");
		}

		// board
		int board_category = Integer.parseInt(request.getParameter("category").trim()); // 카테고리
		String board_title = request.getParameter("title").trim(); // 글 제목
		String board_content = request.getParameter("content").trim(); // 글 내용

		// job
		int contract = Integer.parseInt(request.getParameter("contract").trim());
		String location = request.getParameter("location").trim();
		String doing = request.getParameter("doing").trim();
		int mincareer = Integer.parseInt(request.getParameter("mincareer").trim());
		int maxcareer = Integer.parseInt(request.getParameter("maxcareer").trim());
		int mincost = Integer.parseInt(request.getParameter("mincost").trim());
		int maxcost = Integer.parseInt(request.getParameter("maxcost").trim());

		BoardDAO boardDAO = BoardDAO.getInstance();
		JobDAO jobDAO = JobDAO.getInstance();

		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBoard_category(board_category);
		boardDTO.setBoard_title(board_title);
		boardDTO.setBoard_content(board_content);
		boardDTO.setBoard_writer(mem_num);
		boardDTO.setBoard_num(board_num);
		
		System.out.println(boardDTO);

		// okky_board 테이블에 새로운 글을 추가하고, 글 번호를 반환받는 메서드
		JobDTO jobDTO = new JobDTO();
		jobDTO.setJob_contract(contract);
		jobDTO.setJob_location(location);
		jobDTO.setJob_do(doing);
		jobDTO.setJob_mincareer(mincareer);
		jobDTO.setJob_maxcareer(maxcareer);
		jobDTO.setJob_mincost(mincost);
		jobDTO.setJob_maxcost(maxcost);
		jobDTO.setJob_target(board_num);

		// okky_job 테이블에 글 수정하는 메서드
		int res = jobDAO.editJob(jobDTO);
		int res2 = boardDAO.editBoard(boardDTO);

		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();

		if (res > 0 && res2 > 0) {
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.boardUpScore(mem_num);
			forward.setRedirect(true);
			forward.setPath("member_job_content.do?num=" + board_num + "&hit='no'");
		} else if(res < 0 && res2 > 0) {
			out.println("<script>");
			out.println("alert('게시물 수정 실패(1)')");
			out.println("history.back()");
			out.println("</script>");
		} else if(res2 < 0 && res > 0) {
			out.println("<script>");
			out.println("alert('게시물 수정 실패(2)')");
			out.println("history.back()");
			out.println("</script>");
		} else if(res2 < 0 && res < 0) {
			out.println("<script>");
			out.println("alert('게시물 수정 실패(3)')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
