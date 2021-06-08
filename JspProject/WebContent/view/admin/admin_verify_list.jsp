<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회사인증관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#menu6").css("border-right","5px solid #e67d3e");
	$("#menu6-2").css("color","#fff");
});
</script>
<style type="text/css">

/* css 파일 따로 작성시 부트스트랩 디자인 먼저 적용되므로 여기서 작성! */
/* 회사 인증 상태 - 대기 */
.badge-waitting {
    color: #fff;
    background-color: #0059AB;
}

/* 회사 인증 상태 - 승인 */
.badge-success {
    color: #fff;
    background-color: #449D44;
}

/* 회사 인증 상태 - 거절 */
.badge-reject {
    color: #fff;
    background-color: #ccc;
}

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
								<ul class="admin-verify-list-title list-group list-title com-list-title">
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
							<div class="admin-verify-list-content col-xs-12 table table-hover">
								<ul class="list-group com-list">
									<li class="admin-verify-list-li list-group-item list-group-item-question list-group-has-note clearfix">
										<div class="col-xs-1">(인증글 번호)</div>				
										<div class="col-xs-3">
											<a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">(회사명)</a>
										</div>		
										<div class="col-xs-2">(사업자등록번호)</div>		
											<div class="cont-member col-xs-3">			
												<div>
													<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
														<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
														
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(글작성자 닉네임)</a><br>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;(활동점수)</span><br>
													</div>
												</div>	
											</div>	

										<div class="cont-regdate col-xs-2">(작성일자)</div>				
										<div class="col-xs-1"><span class="badge badge-waitting">대기</span></div>
									</li>
				
									<li class="admin-verify-list-li list-group-item list-group-item-question list-group-has-note clearfix">
										<div class="col-xs-1">2</div>				
										<div class="col-xs-3">
											<a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">필그림소프트</a>
										</div>		
										<div class="col-xs-2">000-00-00000</div>		
											<div class="cont-member col-xs-3">			
												<div>
													<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
														<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
														
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">홍길동홍길동</a><br>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;13</span><br>
													</div>
												</div>	
											</div>	

										<div class="cont-regdate col-xs-2">2021-06-07</div>				
										<div class="col-xs-1"><span class="badge badge-reject">거절</span></div>
									</li>
									
									<li class="admin-verify-list-li list-group-item list-group-item-question list-group-has-note clearfix">
										<div class="col-xs-1">1</div>				
										<div class="col-xs-3">
											<a href="<%=request.getContextPath() %>/view/admin/admin_verify_cont.jsp">필그림소프트</a>
										</div>		
										<div class="col-xs-2">000-00-00000</div>		
											<div class="cont-member col-xs-3">			
												<div>
													<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
														<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
														
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">홍길동</a><br>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;13</span><br>
													</div>
												</div>	
											</div>	

										<div class="cont-regdate col-xs-2">2021-06-07</div>				
										<div class="col-xs-1"><span class="badge badge-success">승인</span></div>
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