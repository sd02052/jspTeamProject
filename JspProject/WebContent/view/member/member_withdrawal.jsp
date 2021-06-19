<%@page import="com.okky.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("num");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - 회원탈퇴</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_withdrawal.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div class="md_container" style="width: 805px; min-height: 800px;">
				    <div id="create-user" class="content clearfix" role="main">
				    	<h3 class="content-header">회원 탈퇴</h3>
						<div class="panel panel-default panel-margin-10">
							<div class="panel-body panel-body-content text-center">
								<p class="lead">회원 탈퇴시 아래의 조취가 취해 집니다.</p>
								<ul class="text-left">
									<li>
										회원 탈퇴 일로부터 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)는
										<strong> '개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</strong>
										 60일이 경과된 후에는 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.
									</li>
									<li>
										<strong>작성된 게시물은 삭제되지 않으며, 익명처리 후 OKKY로 소유권이 귀속됩니다.</strong>
									</li>
									<li>
										<strong>게시물 삭제가 필요한 경우에는 관리자(admin@okky.kr)로 문의해 주시기 바랍니다.</strong>
									</li>
								</ul>
								<form method="post" action="<%=request.getContextPath() %>/member_withdrawal_ok.do">
								 <input type="hidden" value="<%=dto.getMem_num() %>" name="num">
									<a href="javascript:history.back()" class="btn btn-default">아니오</a>
									<button type="submit" class="btn btn-danger">예, 탈퇴하겠습니다.</button>
								</form>
							</div>
						</div>
				    </div> <!-- /container -->
			    </div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>