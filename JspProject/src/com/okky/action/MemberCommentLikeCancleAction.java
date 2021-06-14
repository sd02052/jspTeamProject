package com.okky.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CommentDAO;

public class MemberCommentLikeCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("com_num"));
		int login_mem = Integer.parseInt(request.getParameter("login_num"));
		CommentDAO dao = CommentDAO.getInstance();
		
		dao.update_Like_cancle(num, login_mem);
		dao.setCommentLike();
		int like = dao.select_Like(num);
		response.getWriter().print(like);
			
		return null;
	}

}
