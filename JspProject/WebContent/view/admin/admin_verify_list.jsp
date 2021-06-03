<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회사인증관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

.badge-waitting {
    color: #fff;
    background-color: #0059AB;
}

.badge-success {
    color: #fff;
    background-color: #449D44;
}

.badge-reject {
    color: #fff;
    background-color: #ccc;
}

.list-group {
	text-align: center;
}

.activity {
	font-size: 0.5em;
}

.pagination {
	position: center;
}

.member_img {
	width: 30px;
	height: 30px;
}

<%-- .member_info .activity {
	display: inline-block;

}
--%>

</style>
</head>
<body>

<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">

					<div id="article" class="div">
						
						<div class="nav">		
							<h4>회사인증관리</h4>
						</div>
			
						<div class="row">
							<div class="col-xs-6"></div>		
							
							<div class="col-xs-6">
								<form method="post" action="" class="">				
									<div class="input-group">
										<span class="input-group-btn">
											<select name="search" class="btn btn-default dropdown-toggle">
												<option value="all">-전체검색-</option>
												<option value="id">아이디</option>
												<option value="nick">닉네임</option>
												<option value="email">이메일</option>
											</select>
										</span>
										<input type="text" class="form-control" name="data" placeholder="검색어" aria-describedby="basic-addon2">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</span>
									</div>				
								</form>
							</div>
						</div>	
		
						<br><br>
		
						<div class="row">
							<div class="col-xs-12">
								<ul class="list-group list-title">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<div class="col-xs-1">#</div>				
										<div class="col-xs-3">회사명</div>					
										<div class="col-xs-2">사업자 등록번호</div>					
										<div class="col-xs-3">신청자</div>					
										<div class="col-xs-2">등록일</div>					
										<div class="col-xs-1">상태</div>
									</li>
								</ul>
							</div>
						</div>	

						<div class="row">
							<div class="col-xs-12 table table-hover">
								<ul class="list-group">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix">
										<h5 class="col-xs-1">3</h5>				
										<h5 class="col-xs-3">
											<a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">(주)필그림소프트</a>
										</h5>					
										<h5 class="col-xs-2">000-00-00000</h5>					
										<h5 class="col-xs-3">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">신청자</a>
										</h5>					
										<h5 class="col-xs-2">2021-06-03</h5>					
										<h5 class="col-xs-1"><span class="badge badge-waitting">대기</span></h5>
									</li>
				
									<li class="list-group-item list-group-item-question list-group-has-note clearfix">
										<h5 class="col-xs-1">2</h5>				
										<h5 class="col-xs-3"><a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">캐빈시스템</a></h5>					
										<h5 class="col-xs-2">000-00-00000</h5>					
										<h5 class="col-xs-3">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">신청자</a>
										</h5>					
										<h5 class="col-xs-2">2021-06-03</h5>					
										<h5 class="col-xs-1"><span class="badge badge-success">승인</span></h5>
									</li>
									
									<li class="list-group-item list-group-item-question list-group-has-note clearfix">
										<h5 class="col-xs-1">1</h5>				
										<h5 class="col-xs-3"><a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">(주)필그림소프트</a></h5>					
										<h5 class="col-xs-2">000-00-00000</h5>					
										<h5 class="col-xs-3">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">신청자</a>
										</h5>					
										<h5 class="col-xs-2">2021-06-03</h5>					
										<h5 class="col-xs-1"><span class="badge badge-reject">거절</span></h5>
									</li>
								</ul>
							</div>
						</div>
		
						<nav>
						<div align="center">
						  <ul class="pagination">
						    <li>
						      <a href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="active"><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li>
						      <a href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						  </div>
						</nav>
		
					</div>
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

</body>
</html>