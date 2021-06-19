<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - 회사정보 보기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div style="width: 805px; min-height: 800px;">
				
				<div id="user" class="clearfix">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="avatar avatar-big clearfix col-sm-3 text-center">
								<a href="<%=request.getContextPath() %>/member_company_cont.do?com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }" class="avatar-photo avatar-company"> <img src="<%=request.getContextPath() %>/images/company/${comDTO.getCompany_logo()}">
								</a>
							</div>
							<div class="user-info col-sm-9">
								<div class="clearfix">
									<h2 class="pull-left">${comDTO.getCompany_name() }</h2>
								</div>
								<hr>
								<div class="clearfix">
									<h4>회사 소개</h4>
									<p>${comDTO.getCompany_content() }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<hr>
				
				<h3>구인 이력</h3>
				<ul class="list-group">
				
				<c:if test="${!empty boardList }">
				<c:forEach items="${boardList }" var="dto" varStatus="status">
					<li class="list-group-item clearfix">
						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">#${dto.getBoard_num() }</span> 
								<c:if test="${jobList[status.index].getJob_contract() eq 0}">
									<a href="#"><span class="label label-success">정규직</span></a> 
								</c:if>
								<c:if test="${jobList[status.index].getJob_contract() eq 1}">
									<a href="#"><span class="label label-primary">계약직</span></a> 
								</c:if>
								<span>${jobList[status.index].getJob_location() }</span>
							</div>

							<h5 class="list-group-item-heading list-group-item-evaluate">
								<a href="<%=request.getContextPath()%>/member_board_content.do?num=${dto.getBoard_num()}&hit='yes'"> ${dto.getBoard_title() } </a>
							</h5>
						</div>

						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class="<c:if test="${dto.getBoard_comment() eq 0 }">item-icon-disabled</c:if>">
										<i class="item-icon fa fa-comment "></i> ${dto.getBoard_comment() }</li>
									<li class="<c:if test="${dto.getBoard_like() eq 0 }">item-icon-disabled</c:if>"><i class="item-icon fa fa-thumbs-up"></i> ${dto.getBoard_like() }</li>
									<li class="<c:if test="${dto.getBoard_hit() eq 0 }">item-icon-disabled</c:if>"><i class="item-icon fa fa-eye"></i> ${dto.getBoard_hit() }</li>
								</ul>
							</div>
						</div>

						<div class="list-group-item-author clearfix">
							<div class="avatar avatar-list clearfix">
								<a href="<%=request.getContextPath() %>/member_company_cont.do?com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }" class="avatar-photo avatar-company"> <img src="<%=request.getContextPath() %>/images/company/${comDTO.getCompany_logo() }">
								</a>
								<div class="avatar-info">
									<a class="nickname" href="<%=request.getContextPath() %>/member_company_cont.do?com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }" title="${comDTO.getCompany_name() }">${comDTO.getCompany_name() }</a>

									<div class="date-created">
										<span class="timeago" title="${dto.getBoard_regdate() }">${dto.getBoard_regdate() }</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
					</c:if>	
					
					<c:if test="${empty boardList }">
						<li class="list-group-item clearfix">
							<div class="list-title-wrapper clearfix">
								구인 이력이 없습니다.
							</div>
						</li>
					</c:if>				
				</ul>
				
				
				<c:if test="${!empty boardList }">
							<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_company_cont.do?page=1&com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }" aria-label="Previous">
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
								   		<li class="active"><a href="member_company_cont.do?page=${i }&com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_company_cont.do?page=${i }&com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_company_cont.do?page=${allPage }&com_num=${comDTO.getCompany_num() }&mem_num=${mem_num }" aria-label="Next">
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
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>