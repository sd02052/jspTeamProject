<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="sidebar">
		<h1>
			<div class="logo">
			<a href="main.jsp">
				<img src="../../images/okjsp_logo.png">
			</a>
			</div>
		</h1>
		
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
			<ul class="nav nav-sidebar">
				<li>
					<a href="#" class="link">
						<i class="fas fa-sign-in-alt"></i>
						<span class="nav-sidebar-label">로그인</span>
					</a>
				</li>
				<li>
					<a href="#" class="link">
						<i class="fas fa-user"></i>
						<span class="nav-sidebar-label">회원가입</span>
					</a>
				</li>
			</ul>
		</div>
		
		<ul class="nav nav-sidebar nav-main">
			<li>
				<a href="#" class="link">
					<i class="nav-icon fas fa-database"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span>
				</a>
			</li>
			<li>
				<a href="#" class="link">
					<i class="nav-icon fas fa-code"></i>
					<span class="nav-sidebar-label nav-sidebar-category-label">Tech</span>
				</a>
			</li>
			<li>
				<a href="#" class="link">
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