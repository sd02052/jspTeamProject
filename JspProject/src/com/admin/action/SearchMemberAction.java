package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.CompanyDTO;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;

public class SearchMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String find_field = request.getParameter("field");
		String data = request.getParameter("data");

		String find_data = data;

		if (find_field.equals("check")) {
			if (data.equals("회원")) {
				find_data = "no";
			} else if (data.equals("탈퇴")) {
				find_data = "yes";
			}
		}

		MemberDAO dao = MemberDAO.getInstance();

		// 페이징 작업
		int rowsize = 10; // 한 페이지당 보여질 게시물의 수
		int block = 5; // 하단에 보여질 페이지의 최대 수 예) [1][2][3] / [4][5][6] (최대 3개씩)
		int totalRecord = 0;// DB상의 게시물 전체 수
		int allPage = 0; // 전체 페이지 수

		int page = 0; // 현재 페이지 변수
		if (request.getParameter("page") != null) {
			// request에 저장된 page 파라미터가 있을 경우 해당 수로 저장
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "전체 게시물" a 태그를 클릭한 경우 1로 저장
		}

		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);

		// 해당 페이지에서 마지막 번호
		int endNo = (page * rowsize);

		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;

		// 해당 페이지의 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;

		totalRecord = dao.getSearchListCount(find_field, find_data);

		// 3) 전체 페이지 수 구하기
		// Math.ceil() : 나머지가 있으면 무조건 올림하는 메서드
		allPage = (int) (Math.ceil(totalRecord / (double) rowsize));
		
		System.out.println("totalRecord >>> " + totalRecord);

		// 마지막 블럭 수를 최대 전체 페이지 수까지로 지정.
		if (endBlock > allPage) {
			endBlock = allPage;
		}

		List<MemberDTO> pageList = dao.getSearchMemberList(find_field, find_data, page, rowsize);
		
		find_data = data;	// 상태 검색어 복구

		// 5) 작업했던 값들을 키로 저장하여 view 페이지로 넘기기
		request.setAttribute("find_field", find_field);
		request.setAttribute("find_data", find_data);

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/admin/member_search_list.jsp");
		
		System.out.println("find_field >> " + find_field);
		System.out.println("find_data >> " + find_data);
		System.out.println("tatalRecord >> " + totalRecord);
		System.out.println("allPage >> " + allPage);
		System.out.println("page >> " + page);
		System.out.println("startNo >> " + startNo);
		System.out.println("endNo >> " + endNo);
		System.out.println("List >> " + pageList);

		return forward;
	}

}
