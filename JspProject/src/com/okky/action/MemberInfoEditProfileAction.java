package com.okky.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.okky.controller.Action;
import com.okky.controller.ActionForward;
import com.okky.model.MemberDAO;
import com.okky.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberInfoEditProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 첨부파일이 저장될 위치(경로)를 설정
		String saveFolder = "C:\\NCS\\workspace(JSP)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JspProject\\images\\profileUpload";

		// 첨부파일 용량(크기) 제한 - 파일 업로드 최대 크기
		int fileSize = 3 * 100 * 1024; // 300KB

		// 이진 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(request, // 일반적인 request 객체
				saveFolder, // 업로드 파일 저장 위치(경로)
				fileSize, // 업로드될 첨부파일 최대 크기
				"UTF-8", // 문자 인코딩 방식
				new DefaultFileRenamePolicy() // 파일 이름이 중복되는것을 처리
		);

		// getFilesystemName() : 서버상에 실제로 업로드 될 파일 이름을 문자열로 반환해주는 메서드
		String mem_image = multi.getFilesystemName("files");
		int mem_num = Integer.parseInt(multi.getParameter("num").trim());

		MemberDTO dto = new MemberDTO();
		dto.setMem_image(mem_image);
		dto.setMem_num(mem_num);

		MemberDAO dao = MemberDAO.getInstance();
		int res = dao.infoEditProfile(dto);

		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if (res > 0) {
			forward.setRedirect(true);
			forward.setPath("member_info_edit.do?num=" + mem_num);
		} else{
			out.println("<script>");
			out.println("alert('정보가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
