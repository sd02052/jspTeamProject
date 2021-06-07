<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function checkAll(){
	
}

</script>
<style type="text/css">

.list-group {
	text-align: center;
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
							<h4>회원관리</h4>
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
										<div class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></div>				
										<div class="col-xs-1">#</div>
										<div class="col-xs-2">아이디</div>					
										<div class="col-xs-3">닉네임</div>					
										<div class="col-xs-2">이메일</div>					
										<div class="col-xs-2">가입일</div>					
										<div class="col-xs-1">상태</div>
									</li>
								</ul>
							</div>
						</div>	
						<div class="row">
							<div class="col-xs-12">
								<form name="mem_magage" method="post" action="">
									<ul class="list-group list-title">
									
										<c:set var="list" value="${member_list }" />
										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="dto">
												<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
													<h5 class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></h5>				
													<h5 class="col-xs-1">${dto.getMem_num() }</h5>
													<h5 class="col-xs-2">${dto.getMem_id() }</h5>					
													<h5 class="col-xs-3">
														<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
														<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">${dto.getMem_nick() }</a>
													</h5>					
													<h5 class="col-xs-2">${dto.getMem_email() }</h5>					
													<h5 class="col-xs-2">${dto.getMem_regdate().substring(0, 10) }</h5>
													<c:if test="${dto.getMem_check().equals('no') }">
														<h5 class="col-xs-1"><span class="label label-warning">회원</span></h5>
													</c:if>
													<c:if test="${dto.getMem_check().equals('yes') }">
														<h5 class="col-xs-1"><span class="label label-default">탈퇴</span></h5>
													</c:if>				
												</li>
											
										</c:forEach>
										</c:if>
										<c:if test="${empty list }">
											<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
													등록된 회원이 없습니다.
												</li>
										</c:if>
										
										
										<%-- <li class="list-group-item list-group-item-question list-group-has-note clearfix ">
											<h5 class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></h5>				
											<h5 class="col-xs-1">3</h5>
											<h5 class="col-xs-2">aaaaa1111</h5>					
											<h5 class="col-xs-3">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">홍길동</a>
											</h5>					
											<h5 class="col-xs-2">aaa@gmail.com</h5>					
											<h5 class="col-xs-2">2021-06-03</h5>					
											<h5 class="col-xs-1"><span class="label label-warning">회원</span></h5>
										</li>
										
										<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
											<h5 class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></h5>				
											<h5 class="col-xs-1">2</h5>
											<h5 class="col-xs-2">aaaaa1111</h5>					
											<h5 class="col-xs-3">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">홍길동</a>
											</h5>					
											<h5 class="col-xs-2">aaa@gmail.com</h5>					
											<h5 class="col-xs-2">2021-06-03</h5>					
											<h5 class="col-xs-1"><span class="label label-default">탈퇴</span></h5>
										</li>
	
										<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
											<h5 class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></h5>				
											<h5 class="col-xs-1">1</h5>
											<h5 class="col-xs-2">aaaaa1111</h5>					
											<h5 class="col-xs-3">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp"><img src="@" class="member_img"></a>
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">홍길동</a>
											</h5>					
											<h5 class="col-xs-2">aaa@gmail.com</h5>					
											<h5 class="col-xs-2">2021-06-03</h5>					
											<h5 class="col-xs-1"><span class="label label-warning">회원</span></h5>
										</li> --%>
									</ul>
									<button type="submit" class="btn btn-default">강제탈퇴</button>
								</form>
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