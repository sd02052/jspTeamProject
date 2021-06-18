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

public class Job_PostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int cate_num = Integer.parseInt(request.getParameter("num").trim());
		int cate_group = Integer.parseInt(request.getParameter("cate_group").trim());
		int cate_step = Integer.parseInt(request.getParameter("cate_step").trim());
		String big_category = request.getParameter("big").trim();
		String small_category = request.getParameter("small").trim();
		
		HttpSession session = request.getSession();
		
		int mem_num = 0;
		
		if(session.getAttribute("loginNum") != null) {
			mem_num = (int) session.getAttribute("loginNum");
		}
		
		// board 
		int board_category = Integer.parseInt(request.getParameter("category").trim());	// 카테고리 
		String board_title = request.getParameter("title").trim();			// 글 제목
		String board_content = request.getParameter("content").trim();		// 글 내용		
		
		board_content = board_content.replace("\n", "<br>");
		
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
		
		// okky_board 테이블에 새로운 글을 추가하고, 글 번호를 반환받는 메서드
		int board_num = boardDAO.setBoard(boardDTO);
		
		JobDTO jobDTO = new JobDTO();
		jobDTO.setJob_contract(contract);
		jobDTO.setJob_location(location);
		jobDTO.setJob_do(doing);
		jobDTO.setJob_mincareer(mincareer);
		jobDTO.setJob_maxcareer(maxcareer);
		jobDTO.setJob_mincost(mincost);
		jobDTO.setJob_maxcost(maxcost);
		jobDTO.setJob_target(board_num);
		
		// okky_job 테이블에 새로운 글을 추가하는 메서드
		int res = jobDAO.setJob(jobDTO);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("member_board_list.do?cate_num="+cate_num+"&big="+big_category+"&small="+small_category+"&cate_group="+cate_group+"&cate_step="+cate_step);
		}else {
			out.println("<script>");
			out.println("alert('게시물 추가 실패!!!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
