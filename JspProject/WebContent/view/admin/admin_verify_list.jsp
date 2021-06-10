<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<form method="post" action="<%=request.getContextPath() %>/search_verify.do" class="from-control">				
									<div class="input-group">
										<span class="input-group-btn">
											<select name="field" class="search-btn btn btn-default dropdown-toggle">	
												<option value="all">-전체검색-</option>
												<option value="name">회사명</option>
												<option value="nick">등록회원</option>
												<option value="check">상태</option>
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
										<div class="col-xs-3">등록회원</div>					
										<div class="col-xs-2">등록일</div>					
										<div class="col-xs-1">상태</div>
									</li>
								</ul>
							</div>
						</div>	

						<div class="row">
							<div class="admin-verify-list-content col-xs-12 table table-hover">
								<ul class="list-group com-list">
					
								<c:if test="${!empty List }">
									<c:forEach items="${List }" var="comDTO" varStatus="status">
										<li class="admin-verify-list-li list-group-item list-group-item-question list-group-has-note clearfix">
											<div class="col-xs-1 margin-auto">${comDTO.getCompany_num() }</div>				
											<div class="col-xs-3 margin-auto">
												<a href="<%=request.getContextPath() %>/admin_verify_cont.do?num=${comDTO.getCompany_num() }">${comDTO.getCompany_name() }</a>
											</div>		
											<div class="col-xs-2 margin-auto">${comDTO.getCompany_license_num() }</div>		
												<div class="cont-member col-xs-3 margin-auto">			
													<div>
														<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
															<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
															
														
														<div class="cont-mem-info">
															<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">${memList[status.index].getMem_nick() }</a><br>
															<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;${memList[status.index].getMem_score() }</span><br>
														</div>
													</div>	
												</div>	
	
											<div class="cont-regdate col-xs-2">${boardList[status.index].getBoard_regdate().substring(0,10) }</div>
											<c:if test="${comDTO.getCompany_check() eq 0 }">			
												<div class="col-xs-1 margin-auto"><span class="badge badge-waitting">대기</span></div>
											</c:if>	
											<c:if test="${comDTO.getCompany_check() eq 1 }">			
												<div class="col-xs-1 margin-auto"><span class="badge badge-success">승인</span></div>
											</c:if>	
											<c:if test="${comDTO.getCompany_check() eq 2 }">			
												<div class="col-xs-1 margin-auto"><span class="badge badge-reject">거절</span></div>
											</c:if>	
										</li>
								
									</c:forEach>
								</c:if>
								
								<c:if test="${empty List }">
									<li class="admin-verify-list-li list-group-item list-group-item-question list-group-has-note clearfix">
										조회된 회사 인증 목록이 없습니다.
									</li>
								</c:if>

								
								</ul>
							</div>
						</div>
		
						<c:if test="${!empty List }">
							<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="admin_verify_list.do?page=1" aria-label="Previous">
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
								   		<li class="active"><a href="admin_verify_list.do?page=${i }">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="admin_verify_list.do?page=${i }">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="admin_verify_list.do?page=${allPage }" aria-label="Next">
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