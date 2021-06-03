<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회사인증관리</title>
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
	<h3>회사인증관리</h3>
	
	<br>
		
		<table border="1" cellspacing="0" width="800">
		
			<tr>
				<td rowspan="2" colspan=><a href="<%=request.getContextPath()%>/view/member/view/user/member_personal.jsp"><img src="@" width="40" height="40"></a></td>
				<td><a href="<%=request.getContextPath()%>/view/member/view/user/member_personal.jsp">닉네임</a>&nbsp; 활동점수</td>
				
				<td colspan="4" rowspan="2"></td>
			<tr>
			
			<tr>
				<td></td>
				<td colspan="2">2021-06-02 16:54:58</td>		
				<td colspan="3"></td>		
			</tr>
		
			<tr>
				<td colspan="6">#1</td>
			</tr>
			<tr>
				<td colspan="4"><h3>회사명</h3></td>
				<td>대기</td>
				<td rowspan="2">
					<form method="post" action="">
						<select>
							<option value="0">대기</option>
							<option value="1">승인</option>
							<option value="2">거절</option>
						</select>
						<br>
						<input type="submit" value="확인">
					</form>
				</td>
			</tr>
			
			<tr>
				<th>회사명</th>
				<td>이브레인</td>
				<td> &nbsp;&nbsp;&nbsp;</td>
				<th>직원수</th>
				<td>5명 미만</td>

			</tr>
			
			<tr>
				<th>사업자 등록번호</th>
				<td>00-000-00000</td>
				<td></td>
				<th>담당자명</th>
				<td>홍길동</td>
				<td></td>
			</tr>
			
			<tr>
				<th>대표 연락처</th>
				<td>000-0000-0000</td>
				<td></td>
				<th>담당자 연락처</th>
				<td>000-0000-0000</td>
				<td></td>
			</tr>
			
			<tr>
				<th>대표 이메일</th>
				<td>0000000@gmail.com</td>
				<td></td>
				<th>담당자 이메일</th>
				<td>0000000@gmail.com</td>
				<td></td>
			</tr>
			
			<tr>
				<th>회사 홈페이지</th>
				<td>0000000@gmail.com</td>
				<td colspan="4"></td>
			</tr>
			
			<tr>
				<th>회사 로고</th>
				<td colspan="2"></td>
				<th>사업자등록증</td>
				<td colspan="3"></td>
			</tr>
			
			<tr>
				<td colspan="3">
					<img src="image">
				</td>
				<td colspan="3">
					<img src="img">
				</td>
			</tr>
		</table>
		
		<br>
		
		<table border="1" cellspacing="0">
			<tr>
				<td>회사소개</td>
			</tr>
			<tr>
				<td>
				<textarea rows="10" cols="111">(주)씨인플러스는 IT서비스 / HR soulsion / AI machine runnung / deep running / System Integration / System Maintenance / trade business 등 사업영역을 확장하고 적극적인 인재채용으로 성장하는 회사 입니다.</textarea>
				</td>
			</tr>
		</table>
	
	</div>
	
						</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

</body>
</html>