package com.okky.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.BoardDAO;
import com.okky.model.BoardDTO;
import com.okky.model.CategoryDAO;
import com.okky.model.CategoryDTO;
import com.okky.model.CommentDAO;
import com.okky.model.CommentDTO;
import com.okky.model.CompanyDAO;
import com.okky.model.CompanyDTO;
import com.okky.model.JobDAO;
import com.okky.model.JobDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class Job_ContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("여기 들어옴");
		
		HttpSession session = request.getSession();
		int board_num = Integer.parseInt(request.getParameter("num").trim());
//		int job_num = Integer.parseInt(request.getParameter("num").trim());
		String hit = request.getParameter("hit").trim();
		
		BoardDAO dao = BoardDAO.getInstance();
		CategoryDAO dao1 = CategoryDAO.getInstance();
		CommentDAO dao2 = CommentDAO.getInstance();
		JobDAO dao4 = JobDAO.getInstance();
		CompanyDAO dao5 = CompanyDAO.getInstance(); 
		
		if(session.getAttribute("loginNum") != null) {
			int mem_num = (int) session.getAttribute("loginNum");
			MemberDAO dao3 = MemberDAO.getInstance();
			MemberDTO login_mem = dao3.getMember(mem_num);
			List<CommentDTO> like_list = dao2.getCommentLikeList(mem_num);
			List<CommentDTO> unlike_list = dao2.getCommentUnLikeList(mem_num);
			boolean like_status = dao.getBoardLike(mem_num, board_num);
			boolean scrap_status = dao.getBoardScrap(mem_num, board_num);
			
			request.setAttribute("login_mem", login_mem);
			request.setAttribute("commentLikeList", like_list);
			request.setAttribute("commentUnLikeList", unlike_list);
			request.setAttribute("like_status", like_status);
			request.setAttribute("scrap_status", scrap_status);
		}
		
		if(hit.equals("'yes'")) {
			dao.boardHit(board_num);
		}
		dao.setBoardComment();
		dao.setBoardLike();
		dao.setBoardScrap();
		dao2.setCommentLike();
		BoardDTO board_dto = dao.getBoardCont(board_num);
		MemberDTO board_writer = dao.getWriter(board_num);
		JobDTO job_dto = dao4.getJobCont(board_num);
				
		int board_category = board_dto.getBoard_category();
		CategoryDTO category = dao1.getCategory(board_category);

		List<CommentDTO> comment_list = dao2.getCommentList(board_num);
		List<MemberDTO> comment_writer_list = dao2.getCommentMemberList(comment_list);
		CompanyDTO companyDTO = dao5.getMemCompanyList(board_dto.getBoard_writer());
		
		String big_category = null;
		String small_category = null;
		
		System.out.println("if문 위");
		
		if (board_category == 2) {
			big_category = "'menu1'";
			small_category = "'menu1-2'";
		} else if (board_category == 3) {
			big_category = "'menu1'";
			small_category = "'menu1-3'";
		} else if (board_category == 5) {
			big_category = "'menu2'";
			small_category = "'menu2-2'";
		} else if (board_category == 6) {
			big_category = "'menu2'";
			small_category = "'menu2-3'";
		} else if (board_category == 8) {
			big_category = "'menu3'";
			small_category = "'menu3-2'";
		} else if (board_category == 9) {
			big_category = "'menu3'";
			small_category = "'menu3-3'";
		} else if (board_category == 10) {
			big_category = "'menu3'";
			small_category = "'menu3-4'";
		} else if (board_category == 11) {
			big_category = "'menu3'";
			small_category = "'menu3-5'";
		} else if (board_category == 12) {
			big_category = "'menu3'";
			small_category = "'menu3-6'";
		} else if (board_category == 13) {
			big_category = "'menu3'";
			small_category = "'menu3-7'";
		} else if (board_category == 14) {
			big_category = "'menu3'";
			small_category = "'menu3-8'";
		} else if (board_category == 15) {
			big_category = "'menu4'";
			small_category = "'menu4-1'";
		} else if (board_category == 17) {
			big_category = "'menu5'";
			small_category = "'menu5-2'";
		} else if (board_category == 18) {
			big_category = "'menu5'";
			small_category = "'menu5-3'";
		} else if (board_category == 19) {
			big_category = "'menu5'";
			small_category = "'menu5-4'";
		}

		request.setAttribute("dto", board_dto);
		request.setAttribute("writer", board_writer);
		request.setAttribute("big_category", big_category);
		request.setAttribute("small_category", small_category);
		request.setAttribute("category", category);
		request.setAttribute("commentList", comment_list);
		request.setAttribute("commentWriterList", comment_writer_list);
		request.setAttribute("board_num", board_dto.getBoard_num());
		request.setAttribute("jobdto", job_dto);
		request.setAttribute("companyDTO", companyDTO);
		
		System.out.println(board_dto);
		System.out.println(job_dto);
		
		System.out.println("Attribute 끝");		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/member/jobs_content.jsp");

		return forward;
	}

}
