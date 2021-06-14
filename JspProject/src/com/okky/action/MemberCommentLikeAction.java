package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CommentDAO;

public class MemberCommentLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*int num = Integer.parseInt(request.getParameter("com_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		CommentDAO dao = CommentDAO.getInstance();
		int check = dao.checkCommentLike(num,login_mem);
		int like = 0;
		if(check == 0) { // 좋아요 누른적 없을때
			dao.update_Like(num,login_mem);
			dao.setCommentLike();
			like=dao.select_Like(num);
			response.getWriter().print(like);
		} else {
			like = -1;
			response.getWriter().print(like);
		}
		return null;*/
		
		int num = Integer.parseInt(request.getParameter("com_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		CommentDAO dao = CommentDAO.getInstance();
		
		dao.update_Like(num, login_mem);
		dao.setCommentLike();
		int like = dao.select_Like(num);
		response.getWriter().print(like);

		return null;
	}

}
