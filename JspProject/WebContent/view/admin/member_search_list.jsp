<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function checkAll(){
	
}

$(function(){
	$("#menu6").css("border-right","5px solid #e67d3e");
	$("#menu6-1").css("color","#fff");
});
</script>
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
								<form method="post" action="<%=request.getContextPath() %>/search_member.do" class="">				
									<div class="input-group">
										<span class="search-list input-group-btn">
											<select name="field" class="btn btn-default dropdown-toggle">
												<option value="all" <c:if test="${find_field.equals('all') }">selected="selected"</c:if>>-전체검색-</option>
												<option value="id" <c:if test="${find_field.equals('id') }">selected="selected"</c:if>>아이디</option>
												<option value="nick" <c:if test="${find_field.equals('nick') }">selected="selected"</c:if>>닉네임</option>
												<option value="check" <c:if test="${find_field.equals('check') }">selected="selected"</c:if>>상태</option>
											</select>
										</span>
										<input type="text" class="form-control" name="data" placeholder="${find_data }" aria-describedby="basic-addon2">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</span>
										<span class="input-group-btn">
											<button type="button" class="btn btn-warning" onclick="location.href='<%=request.getContextPath()%>/admin_member_list.do'">
												<i class="fas fa-times-circle"></i>&nbsp;clear
											</button>
										</span>
									</div>				
								</form>
							</div>
						</div>		
	
						<br><br>
						
						<div class="row">
							<div class="col-xs-12">
								<ul class=" list-group list-title mem-list-title">
									<li class="member-list-title list-group-item list-group-item-question list-group-has-note clearfix ">
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
									
										<c:set var="list" value="${List }" />
										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="dto">
												<li class="member-list list-group-item list-group-item-question list-group-has-note clearfix ">
													<div class="col-xs-1"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></div>				
													<div class="col-xs-1">${dto.getMem_num() }</div>
													<div class="col-xs-2">${dto.getMem_id() }</div>					
													<div class="cont-member col-xs-3">	
														<div>
															<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
																<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
															<div class="cont-mem-info">
															<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">${dto.getMem_nick() }</a><br>
															<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;${dto.getMem_score() }</span>
															</div>
															
														</div>
													</div>					
													<div class="col-xs-2">${dto.getMem_email() }</div>					
													<div class="cont-regdate col-xs-2">${dto.getMem_regdate().substring(0, 10) }</div>
													<c:if test="${dto.getMem_check().equals('no') }">
														<div class="col-xs-1"><span class="label label-warning">회원</span></div>
													</c:if>
													<c:if test="${dto.getMem_check().equals('yes') }">
														<div class="col-xs-1"><span class="label label-default">탈퇴</span></div>
													</c:if>				
												</li>
											
										</c:forEach>
										</c:if>
										<c:if test="${empty list }">
											<li class="list-group-item list-group-item-question list-group-has-note clearfix">
													검색된 회원이 없습니다.
											</li>
										</c:if>
										
										
									</ul>
									<button type="submit" class="btn btn-default">강제탈퇴</button>
								</form>
							</div>
						</div>
	
					<c:if test="${!empty List }">
						<nav>
						<div align="center">
						  <ul class="pagination">
						  
						  <c:if test="${page > 1 }">
							    <li>
							      <a href="search_member.do?page=1&field=${find_field }&data=${find_data }" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						   </c:if>
						   
						   <c:if test="${page eq 1 }">
							    <li>
							      <a aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						   </c:if>
						    
						    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							    <c:if test="${i == page }">
							   		<li class="active"><a href="search_member.do?page=${i }&field=${find_field }&data=${find_data }">${i }</a></li>
							    </c:if>
							    
							    <c:if test="${i != page }">
								    <li><a href="search_member.do?page=${i }&field=${find_field }&data=${find_data }">${i }</a></li>
							    </c:if>
						    </c:forEach>
						    
						    <c:if test="${page < allPage }">
							    <li>
							      <a href="search_member.do?page=${allPage }" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    
						    <c:if test="${page eq allPage }">
							    <li>
							      <a aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						  </ul>
						  </div>
						</nav>
					</c:if>

					</div>
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

</body>
</html>