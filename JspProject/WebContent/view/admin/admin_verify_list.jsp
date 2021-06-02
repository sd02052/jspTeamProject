<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\\style\\style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="<%=request.getContextPath() %>/include/side.jsp"></jsp:include>

	<div width="881">
		<h3>회사인증관리</h3>
		
		<table>
			<tr>
				<input type="text" placeholder="검색어">
			</tr>
		</table>
		<br>
		<table border="1" cellspacing="0">
			<tr>
				<td>번호</td>
				<td>회사명</td>
				<td>사업자 등록번호</td>
				<td>신청자</td>
				<td>등록일</td>
				<td>상태</td>
			</tr>
			<tr>
				<td>1</td>
				<td>회사명</td>
				<td>000-00-00000</td>
				<td><a href="<%=request.getContextPath()%>/user/member_personal.jsp">신청자</a></td>
				<td>2021-06-02 15:52:09</td>
				<td>승인</td>
			</tr>
			<tr>
				<td>2</td>
				<td>회사명</td>
				<td>000-00-00000</td>
				<td>신청자</td>
				<td>2021-06-02 15:52:09</td>
				<td>승인</td>
			</tr>
		</table>
		<br><br>
		
		<table border="1" cellspacing="0">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>1</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		
	</div>
	
	<jsp:include page="<%=request.getContextPath() %>/include/footer.jsp"></jsp:include>

</body>
</html>