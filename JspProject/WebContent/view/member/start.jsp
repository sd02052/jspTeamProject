<%@page import="com.okky.model.CategoryDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.okky.model.CategoryDTO"%>
<%@page import="com.okky.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.okky.model.BoardDTO"%>
<%@page import="com.okky.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html; charset=UTF-8");

	BoardDAO dao = BoardDAO.getInstance();
	CategoryDAO cateDAO = CategoryDAO.getInstance();
	
	List<BoardDTO> noticeList = dao.getBoardList(8);
	List<MemberDTO> noticeMember = dao.getMemberList(noticeList);
	
	request.setAttribute("noticeList", noticeList);
	request.setAttribute("noticeMember", noticeMember);
	
	List<BoardDTO> qnaList = dao.getBoardListAll(1);
	List<MemberDTO> qndMember = dao.getMemberList(qnaList);
	
	request.setAttribute("qnaList", qnaList);
	request.setAttribute("qnaMember", qndMember);
	
	List<BoardDTO> communityList = dao.getBoardListAll(3);
	List<MemberDTO> communityMember = dao.getMemberList(communityList);
	
	request.setAttribute("communityList", communityList);
	request.setAttribute("communityMember", communityMember);
	
	List<BoardDTO> techList = dao.getBoardListAll(2);
	List<MemberDTO> techMember = dao.getMemberList(techList);
	List<CategoryDTO> techCategory = dao.getCategoryAllList(techList);
	List<CategoryDTO> cateList = cateDAO.getCategoryList(techList);

	String[] big_categorys = new String[cateList.size()];
	String[] small_categorys = new String[cateList.size()];

	for (int i = 0; i < cateList.size(); i++) {
		if (cateList.get(i).getCate_num() == 2) {
			big_categorys[i] = "'menu1'";
			small_categorys[i] = "'menu1-2'";
		} else if (cateList.get(i).getCate_num() == 3) {
			big_categorys[i] = "'menu1'";
			small_categorys[i] = "'menu1-3'";
		} else if (cateList.get(i).getCate_num() == 5) {
			big_categorys[i] = "'menu2'";
			small_categorys[i] = "'menu2-2'";
		} else if (cateList.get(i).getCate_num() == 6) {
			big_categorys[i] = "'menu2'";
			small_categorys[i] = "'menu2-3'";
		} else if (cateList.get(i).getCate_num() == 8) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-2'";
		} else if (cateList.get(i).getCate_num() == 9) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-3'";
		} else if (cateList.get(i).getCate_num() == 10) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-4'";
		} else if (cateList.get(i).getCate_num() == 11) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-5'";
		} else if (cateList.get(i).getCate_num() == 12) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-6'";
		} else if (cateList.get(i).getCate_num() == 13) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-7'";
		} else if (cateList.get(i).getCate_num() == 14) {
			big_categorys[i] = "'menu3'";
			small_categorys[i] = "'menu3-8'";
		} else if (cateList.get(i).getCate_num() == 15) {
			big_categorys[i] = "'menu4'";
			small_categorys[i] = "'menu4-1'";
		} else if (cateList.get(i).getCate_num() == 17) {
			big_categorys[i] = "'menu5'";
			small_categorys[i] = "'menu5-2'";
		} else if (cateList.get(i).getCate_num() == 18) {
			big_categorys[i] = "'menu5'";
			small_categorys[i] = "'menu5-3'";
		} else if (cateList.get(i).getCate_num() == 19) {
			big_categorys[i] = "'menu5'";
			small_categorys[i] = "'menu5-4'";
		}
	}
	
	request.setAttribute("techList", techList);
	request.setAttribute("techMember", techMember);
	request.setAttribute("techCategory", techCategory);
	request.setAttribute("small", small_categorys);
	request.setAttribute("big", big_categorys);
	
	List<BoardDTO> columnList = dao.getBoardListAll(4);
	List<MemberDTO> columnMember = dao.getMemberList(columnList);
	List<CategoryDTO> columnCategory = dao.getCategoryAllList(columnList);
	
	request.setAttribute("columnList", columnList);
	request.setAttribute("columnMember", columnMember);
	request.setAttribute("columnCategory", columnCategory);
	
	List<BoardDTO> academyList = dao.getBoardList(14);
	List<MemberDTO> academyMember = dao.getMemberList(academyList);
	
	request.setAttribute("academyList", academyList);
	request.setAttribute("academyMember", academyMember);
	

	List<BoardDTO> bestList = dao.getWeekBestBoardList();
	List<MemberDTO> bestMember = dao.getMemberList(bestList);
	
	request.setAttribute("bestList", bestList);
	request.setAttribute("bestMember", bestMember);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

<jsp:forward page="main.jsp"/>

</body>
</html>