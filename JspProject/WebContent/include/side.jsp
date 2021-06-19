<%@page import="com.okky.model.MemberDAO"%>
<%@page import="com.okky.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String imgPath = request.getContextPath()+"/images/profileUpload/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int loginUser = 0;
	String loginType = null;
	MemberDTO dto1 = null;
	MemberDTO dto2 = null;

	if (session.getAttribute("loginNum") != null) {
		loginUser = (int) session.getAttribute("loginNum");
		loginType = (String) session.getAttribute("loginType");
	}
	System.out.println(loginUser);
	System.out.println(loginType);

	if (loginUser != 0) { // 로그인한 사람이 있을때
		if (loginType.equals("member")) { // 사용자일때
			MemberDAO dao = MemberDAO.getInstance();
			dto1 = new MemberDTO();
			dto1 = dao.getMember(loginUser);
%>
<script type="text/javascript">
	$(function() {
		$(".login-view").css("display", "block");
		$(".nav-user.nav-sidebar ul").css("display", "none");
		$(".admin-menu").css("display", "none");
		$(".nav1").css("display","none");
	});
</script>
<%
	} else if (loginType.equals("admin")) { // 관리자일때
			MemberDAO dao = MemberDAO.getInstance();
			dto2 = new MemberDTO();
			dto2 = dao.getMember(loginUser);
%>
<script type="text/javascript">
	$(function() {
		$(".login-view").css("display", "block");
		$(".nav-user.nav-sidebar ul").css("display", "none");
		$(".admin-menu").css("display", "block");
		$(".nav1").css("display","none");
	});
</script>
<%
	}
	} else { // 로그인한 사람이 없을때
%>
<script type="text/javascript">
	$(function() {
		$(".login-view").css("display", "none");
		$(".nav-user.nav-sidebar ul").css("display", "block");
		$(".admin-menu").css("display", "none");
		$(".nav1").css("display","block");
	});
</script>
<%
	}
%>

</head>
<body>
	
	<div class="sidebar">
		<h1>
			<div class="logo">
				<a href="<%=request.getContextPath() %>/view/member/start.jsp">
					<img src="<%=request.getContextPath() %>/images/okjsp_logo.png">
				</a>
			</div>
		</h1>
		<ul id="search-google-icon" class="nav nav-sidebar-search-wrapper">
			<li class="nav-sidebar-search">
				<a href="#" class="link" id="search-google">
					<i class="fas fa-search"></i>
				</a>
			</li>
		</ul>
		<form id="search-google-form" class="nav-sidebar-form" action="https://www.google.com/search?q" target="_blank">
			<div class="input-group">
				<input type="text" class="form-control input-sm" placeholder="Google 검색" name="q">
				<span class="input-group-btn">
					<button class="btn btn-default btn-sm" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		
		<div class="nav-user nav-sidebar">
			<%-- 로그인 전 --%>
			<ul class="nav nav-sidebar">
				<li>
					<a href="<%=request.getContextPath() %>/view/member/login.jsp" class="link">
						<i class="fas fa-sign-in-alt"></i>
						<span class="nav-sidebar-label">로그인</span>
					</a>
				</li>
				<li>
					<a href="<%=request.getContextPath() %>/view/member/member_sign_up.jsp" class="link">
						<i class="fas fa-user"></i>
						<span class="nav-sidebar-label">회원가입</span>
					</a>
				</li>
			</ul>
			
			<%-- 로그인 후 --%>
			<div class="login-view">
				<div class="avatar clearfix avatar-medium">
				<% if(dto1 != null){ %> <!-- 사용자로 로그인 후 -->
					<a href="<%=request.getContextPath()%>/member_personal.do?num=<%=dto1.getMem_num() %>" class="avatar-photo"><img src="<%=imgPath %><%=dto1.getMem_image() %>"></a>
					<div class="avatar-info">
						<a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=<%=dto1.getMem_num() %>"><%=dto1.getMem_nick() %></a>
						<div class="activity block">
							<span class="fas fa-bolt"></span> <%=dto1.getMem_score() %>
						</div>
					</div>
					<%} else if(dto2 != null){%> <!-- 관리자로 로그인 후 -->
					<a href="<%=request.getContextPath()%>/member_personal.do?num=<%=dto2.getMem_num() %>" class="avatar-photo"><img src="<%=imgPath %><%=dto2.getMem_image() %>"></a>
					<div class="avatar-info">
						<a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=<%=dto2.getMem_num() %>"><%=dto2.getMem_nick() %></a>
					</div>
					<%} %>
				</div>
	
				<div class="nav-user-action">
					<div class="nav-user-func">
						<a href="<%=request.getContextPath() %>/member_logout.do" id="user-func" tabindex="0"> <i id="user-func-icon" class="fas fa-sign-out-alt"></i>
						</a>
					</div>
					<% if(dto1 !=null) {%>
					<div class="nav-user-func">
						<a href="<%=request.getContextPath() %>/member_info_edit.do?num=<%=dto1.getMem_num() %>" id="user-notification" tabindex="0"> <i id="user-notification-icon" class="fas fa-cog"></i>
						</a>
					</div>
					<%} %>
				</div>
			</div>
		</div>
		
		<ul class="nav nav-sidebar nav-main">
			<li>
				<a href="#" id="menu1" class="link" data-toggle="collapse" data-target="#demo1">
					<i class="nav-icon fas fa-database"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span>
				</a>
				<div id="demo1" class="collapse">
					<ul>
						<li><a id="menu1-1" href="<%=request.getContextPath() %>/member_qna_board_list.do?cate_num=1&big='menu1'&small='menu1-1'&cate_group=1&cate_step=0">All</a></li>
						<li><a id="menu1-2" href="<%=request.getContextPath() %>/member_qna_board_list.do?cate_num=2&big='menu1'&small='menu1-2'&cate_group=1&cate_step=1">Tech Q&A</a></li>
						<li><a id="menu1-3" href="<%=request.getContextPath() %>/member_qna_board_list.do?cate_num=3&big='menu1'&small='menu1-3'&cate_group=1&cate_step=2">Blockchain Q&A</a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#" id="menu2" class="link" data-toggle="collapse" data-target="#demo2">
					<i class="nav-icon fas fa-code"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Tech</span>
				</a>
				<div id="demo2" class="collapse">
					<ul>
						<li><a id="menu2-1" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=4&big='menu2'&small='menu2-1'&cate_group=2&cate_step=0">All</a></li>
						<li><a id="menu2-2" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=5&big='menu2'&small='menu2-2'&cate_group=2&cate_step=1">IT News & 정보</a></li>
						<li><a id="menu2-3" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=6&big='menu2'&small='menu2-3'&cate_group=2&cate_step=2">Tips & 강좌</a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#" id="menu3" class="link" data-toggle="collapse" data-target="#demo3">
					<i class="nav-icon fas fa-comments"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span>
				</a>
				<div id="demo3" class="collapse">
					<ul>
						<li><a id="menu3-1" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=7&big='menu3'&small='menu3-1'&cate_group=3&cate_step=0">All</a></li>
						<li><a id="menu3-2" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=8&big='menu3'&small='menu3-2'&cate_group=3&cate_step=1">공지사항</a></li>
						<li><a id="menu3-3" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=9&big='menu3'&small='menu3-3'&cate_group=3&cate_step=2">사는얘기</a></li>
						<li><a id="menu3-4" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=10&big='menu3'&small='menu3-4'&cate_group=3&cate_step=3">포럼</a></li>
						<li><a id="menu3-5" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=11&big='menu3'&small='menu3-5'&cate_group=3&cate_step=4">IT 행사</a></li>
						<li><a id="menu3-6" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=12&big='menu3'&small='menu3-6'&cate_group=3&cate_step=5">기술 서적 리뷰</a></li>
						<li><a id="menu3-7" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=13&big='menu3'&small='menu3-7'&cate_group=3&cate_step=6">정기모임/스터디</a></li>
						<li><a id="menu3-8" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=14&big='menu3'&small='menu3-8'&cate_group=3&cate_step=7">학원/홍보</a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#" id="menu4" class="link" data-toggle="collapse" data-target="#demo4">
					<i class="nav-icon fas fa-quote-left"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span>
				</a>
				<div id="demo4" class="collapse">
					<ul>
						<li><a id="menu4-1" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=15&big='menu4'&small='menu4-1'&cate_group=4&cate_step=0">All</a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#" id="menu5" class="link" data-toggle="collapse" data-target="#demo5">
					<i class="nav-icon fas fa-users"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span>
				</a>
				<div id="demo5" class="collapse">
					<ul>
						<li><a id="menu5-1" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=16&big='menu5'&small='menu5-1'&cate_group=5&cate_step=0">All</a></li>
						<li><a id="menu5-2" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=17&big='menu5'&small='menu5-2'&cate_group=5&cate_step=1">구인</a></li>
						<li><a id="menu5-3" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=18&big='menu5'&small='menu5-3'&cate_group=5&cate_step=2">구직</a></li>
						<li><a id="menu5-4" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=19&big='menu5'&small='menu5-4'&cate_group=5&cate_step=3">좋은회사/나쁜회사</a></li>
					</ul>
				</div>
			</li>
			<!-- 관리자 메뉴 -->
			<li class="admin-menu">
				<a href="#" id="menu6" class="link" data-toggle="collapse" data-target="#demo6">
					<i class="nav-icon fas fa-tools"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">관리자 메뉴</span>
				</a>
				<div id="demo6" class="collapse">
					<ul>
						<li><a id="menu6-1" href="<%=request.getContextPath() %>/admin_member_list.do">회원 관리</a></li>
						<li><a id="menu6-2" href="<%=request.getContextPath() %>/admin_verify_list.do">회사 인증관리</a></li>
					</ul>
				</div>
			</li>
		</ul>
		
		<ul class="nav nav-sidebar nav-bottom">
			<li>
				<a href="https://github.com/sd02052/jspTeamProject" class="link" target="_blank">
					<i class="fab fa-github"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- 반응형 사이드바 -->
	<nav class="navbar navbar-blue navbar-fixed-top">
		<div class="container-fluid" style="padding-left: 10px; padding-right: 10px;">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-head">
				<button type="button" class="navbar-toggle collapsed" style="float: left;" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar" style="border: 1px solid #fff;"></span> <span class="icon-bar" style="border: 1px solid #fff;"></span> <span class="icon-bar" style="border: 1px solid #fff;"></span>
				</button>
				
				<a class="navbar-brand" href="<%=request.getContextPath() %>/view/member/start.jsp"><img src="<%=request.getContextPath() %>/images/okjsp_logo.png" style="height: 25px;"></a>
				
				<!-- 로그인 전 -->
				<ul class="nav1">
					<li><a href="<%=request.getContextPath() %>/view/member/login.jsp" class="link"><i class="fas fa-sign-in-alt"></i></a></li>
					<li><a href="<%=request.getContextPath() %>/view/member/member_sign_up.jsp" class="link"><i class="fa fa-user"></i></a></li>
				</ul>
				
				<!-- 로그인 후 -->
				<div class="login-view">
					<div class="nav-user-action">
						<div class="nav-user-func">
							<a href="<%=request.getContextPath() %>/member_logout.do" id="user-func" tabindex="0"> <i id="user-func-icon" class="fas fa-sign-out-alt"></i>
							</a>
						</div>
						<% if(dto1 !=null) {%>
						<div class="nav-user-func">
							<a href="<%=request.getContextPath() %>/member_info_edit.do?num=<%=dto1.getMem_num() %>" id="user-notification" tabindex="0"> <i id="user-notification-icon" class="fas fa-cog"></i>
							</a>
						</div>
						<%} %>
					</div>
				</div>
				
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse" id="navbar-collapse">
				<form id="search-google-form" class="nav-sidebar-form" action="https://www.google.com/search?q" target="_blank">
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="Google 검색" name="q">
						<span class="input-group-btn">
							<button class="btn btn-default btn-sm" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<ul class="navbar-menu" style="margin-bottom: 15px;">
					<li>
						<a href="#" id="menu1" class="link" data-toggle="collapse" data-target="#demo11"> <i class="nav-icon fas fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span>
						</a>
						<div id="demo11" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu1-1" href="<%=request.getContextPath()%>/member_qna_board_list.do?cate_num=1&big='menu1'&small='menu1-1'&cate_group=1&cate_step=0">All</a></li>
								<li><a class="dropdown-item" id="menu1-2" href="<%=request.getContextPath()%>/member_qna_board_list.do?cate_num=2&big='menu1'&small='menu1-2'&cate_group=1&cate_step=1">Tech Q&A</a></li>
								<li><a class="dropdown-item" id="menu1-3" href="<%=request.getContextPath()%>/member_qna_board_list.do?cate_num=3&big='menu1'&small='menu1-3'&cate_group=1&cate_step=2">Blockchain Q&A</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#" id="menu2" class="link" data-toggle="collapse" data-target="#demo12"> <i class="nav-icon fas fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span>
						</a>
						<div id="demo12" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu2-1" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=4&big='menu2'&small='menu2-1'&cate_group=2&cate_step=0">All</a></li>
								<li><a class="dropdown-item" id="menu2-2" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=5&big='menu2'&small='menu2-2'&cate_group=2&cate_step=1">IT News & 정보</a></li>
								<li><a class="dropdown-item" id="menu2-3" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=6&big='menu2'&small='menu2-3'&cate_group=2&cate_step=2">Tips & 강좌</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#" id="menu3" class="link" data-toggle="collapse" data-target="#demo13"> <i class="nav-icon fas fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span>
						</a>
						<div id="demo13" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu3-1" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=7&big='menu3'&small='menu3-1'&cate_group=3&cate_step=0">All</a></li>
								<li><a class="dropdown-item" id="menu3-2" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=8&big='menu3'&small='menu3-2'&cate_group=3&cate_step=1">공지사항</a></li>
								<li><a class="dropdown-item" id="menu3-3" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=9&big='menu3'&small='menu3-3'&cate_group=3&cate_step=2">사는얘기</a></li>
								<li><a class="dropdown-item" id="menu3-4" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=10&big='menu3'&small='menu3-4'&cate_group=3&cate_step=3">포럼</a></li>
								<li><a class="dropdown-item" id="menu3-5" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=11&big='menu3'&small='menu3-5'&cate_group=3&cate_step=4">IT 행사</a></li>
								<li><a class="dropdown-item" id="menu3-6" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=12&big='menu3'&small='menu3-6'&cate_group=3&cate_step=5">기술 서적 리뷰</a></li>
								<li><a class="dropdown-item" id="menu3-7" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=13&big='menu3'&small='menu3-7'&cate_group=3&cate_step=6">정기모임/스터디</a></li>
								<li><a class="dropdown-item" id="menu3-8" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=14&big='menu3'&small='menu3-8'&cate_group=3&cate_step=7">학원/홍보</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#" id="menu4" class="link" data-toggle="collapse" data-target="#demo14"> <i class="nav-icon fas fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span>
						</a>
						<div id="demo14" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu4-1" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=15&big='menu4'&small='menu4-1'&cate_group=4&cate_step=0">All</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#" id="menu5" class="link" data-toggle="collapse" data-target="#demo15"> <i class="nav-icon fas fa-users"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span>
						</a>
						<div id="demo15" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu5-1" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=16&big='menu5'&small='menu5-1'&cate_group=5&cate_step=0">All</a></li>
								<li><a class="dropdown-item" id="menu5-2" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=17&big='menu5'&small='menu5-2'&cate_group=5&cate_step=1">구인</a></li>
								<li><a class="dropdown-item" id="menu5-3" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=18&big='menu5'&small='menu5-3'&cate_group=5&cate_step=2">구직</a></li>
								<li><a class="dropdown-item" id="menu5-4" href="<%=request.getContextPath()%>/member_board_list.do?cate_num=19&big='menu5'&small='menu5-4'&cate_group=5&cate_step=3">좋은회사/나쁜회사</a></li>
							</ul>
						</div>
					</li>
					<li class="admin-menu">
						<a href="#" id="menu6" class="link" data-toggle="collapse" data-target="#demo16"> <i class="nav-icon fas fa-tools"></i> <span class="nav-sidebar-label nav-sidebar-category-label">관리자 메뉴</span>
						</a>
						<div id="demo16" class="collapse">
							<ul>
								<li><a class="dropdown-item" id="menu6-1" href="<%=request.getContextPath()%>/admin_member_list.do">회원 관리</a></li>
								<li><a class="dropdown-item" id="menu6-2" href="<%=request.getContextPath()%>/admin_verify_list.do">회사 인증관리</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</body>
</html>