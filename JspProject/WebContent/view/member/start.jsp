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
	
	request.setAttribute("techList", techList);
	request.setAttribute("techMember", techMember);
	request.setAttribute("techCategory", techCategory);
	
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