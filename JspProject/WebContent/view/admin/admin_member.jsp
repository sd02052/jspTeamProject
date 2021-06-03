<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">




	<div class="div">
		<h3>회원관리</h3>
		
		<form method="post" action="*.do">
			<table>
				<tr>
					<select name="search">
						<option value="all">-전체검색-</option>
						<option value="id">아이디</option>
						<option value="nick">닉네임</option>
						<option value="email">이메일</option>
					</select>
					<input type="text" name="data" placeholder="검색어">
					<input type="submit" value="검색">
				</tr>
			</table>
		</form>
		
		<br>
		
		<form method="post" action="">
			<table border="1" cellspacing="0" width="800">
				<tr>
					<th></th>
					<th>번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>관리</th>				
				</tr>
				
				<tr>
					<th><input type="checkbox"></th>
					<td>2</td>
					<td>가</td>
					<td>
					<a href="<%=request.getContextPath()%>/view/user/member_personal.jsp"><img src="@" width="40" height="40"></a>
					<a href="<%=request.getContextPath()%>/view/user/member_personal.jsp">홍길동</a></td>
					<td>aaa@gmail.com</td>
					<td><input type="submit" value="탈퇴"></td>
				</tr>
				
				<tr>
					<th><input type="checkbox"></th>
					<td>1</td>
					<td>가</td>
					<td>
					<a href="<%=request.getContextPath()%>/view/user/member_personal.jsp"><img src="@" width="40" height="40"></a>
					<a href="<%=request.getContextPath()%>/view/user/member_personal.jsp">홍길동</a></td>
					<td>aaa@gmail.com</td>
					<td><input type="submit" value="탈퇴"></td>
				</tr>
		
			</table>
		</form>
		
		<br><br>
		
		<table border="1" cellspacing="0">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>1</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		
		
	 </div>
	 
					</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

</body>
</html>