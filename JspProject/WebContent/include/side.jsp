<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int loginUser = 0;
	String loginType = null;
	if (session.getAttribute("loginNum") != null) {
		loginUser = (int) session.getAttribute("loginNum");
		loginType = (String) session.getAttribute("loginType");
	}
	System.out.println(loginUser);
	System.out.println(loginType);

	if (loginUser != 0) { // 로그인한 사람이 있을때
		if (loginType.equals("member")) { // 사용자일때
%>
<script type="text/javascript">
	$(function() {
		$(".login-view").css("display", "block");
		$(".nav-user.nav-sidebar ul").css("display", "none");
		$(".admin-menu").css("display", "none");
	});
</script>
<%
	} else if (loginType.equals("admin")) { // 관리자일때
%>
<script type="text/javascript">
	$(function() {
		$(".login-view").css("display", "block");
		$(".nav-user.nav-sidebar ul").css("display", "none");
		$(".admin-menu").css("display", "block");
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
				<a href="<%=request.getContextPath() %>/view/member/main.jsp">
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
		<form id="search-google-form" class="nav-sidebar-form" action="https://www.google.com/search">
			<div class="input-group">
				<input type="text" class="form-control input-sm" placeholder="Google 검색">
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
					<a href="#" class="avatar-photo"><img src="https://lh3.googleusercontent.com/a/AATXAJxAd1fAgDKwhOBObrDhui25mDjfXTPhhjFs_Nv7=s96-c"></a>
					<div class="avatar-info">
						<a class="nickname" href="/user/info/121432" title="이성욱">이성욱</a>
						<div class="activity block">
							<span class="fas fa-bolt"></span> 0
						</div>
					</div>
				</div>
	
				<div class="nav-user-action">
					<div class="nav-user-func">
						<a href="<%=request.getContextPath() %>/member_logout.do" id="user-func" tabindex="0"> <i id="user-func-icon" class="fas fa-sign-out-alt"></i>
						</a>
					</div>
					<div class="nav-user-func">
						<a href="#" id="user-notification" tabindex="0"> <i id="user-notification-icon" class="fas fa-cog"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<ul class="nav nav-sidebar nav-main">
			<li class="dropdown dropright">
				<a href="#" id="navbarDroprightMenuLink" class="link" data-toggle="collapse" data-target="#demo1">
					<i class="nav-icon fas fa-database"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span>
				</a>
				<div id="demo1" class="collapse">
				<ul>
					<li><a href="#">All</a></li>
					<li><a href="#">Tech Q&A</a></li>
					<li><a href="#">Blockchain Q&A</a></li>
				</ul>
				</div>
			</li>
			<li>
				<a href="#" class="link">
					<i class="nav-icon fas fa-code"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Tech</span>
				</a>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/view/member/board.jsp" class="link">
					<i class="nav-icon fas fa-comments"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span>
				</a>
			</li>
			<li>
				<a href="#" class="link">
					<i class="nav-icon fas fa-quote-left"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span>
				</a>
			</li>
			<li>
				<a href="#" class="link">
					<i class="nav-icon fas fa-users"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span>
				</a>
			</li>
			<!-- 관리자 메뉴 -->
			<li class="admin-menu dropdown dropright">
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
				<a href="#" class="link">
					<i class="fab fa-github"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span>
				</a>
			</li>
		</ul>
	</div>

</body>
</html>