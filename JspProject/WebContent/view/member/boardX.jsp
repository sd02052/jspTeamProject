<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String imgPath = request.getContextPath()+"/images/profileUpload/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<c:set var="big_category" value="${big_category }" />
<c:set var="small_category" value="${small_category }" />
<script type="text/javascript">
$(function(){
	$("#"+${big_category }).css("border-right","5px solid #e67d3e");
	$("#"+${small_category }).css("color","#fff");
	
	<%String sort = (String)request.getAttribute("sort");

	if (sort.equals("date")) {%>
	$(function(){
		$("#sort-date").addClass('active');
	});
	<%} else if (sort.equals("like")) {%>
	$(function(){
		$("#sort-like").addClass('active');
	});
	<%} else if (sort.equals("comment")) {%>
	$(function(){
		$("#sort-comment").addClass('active');
	});
	<%} else if (sort.equals("scrap")) {%>
	$(function(){
		$("#sort-scrap").addClass('active');
	});
	<%} else if (sort.equals("hit")) {%>
	$(function(){
		$("#sort-hit").addClass('active');
	});
	<%}%>
});
<%
	String date = "date";
	String like = "like";
	String comment = "comment";
	String scrap = "scrap";
	String hit = "hit";
%>
</script>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div class="content">
				<div id="list-aticle" class="content scaffold-list">
					<c:set var="list" value="${boardList }" />
					<c:set var="cate" value="${category }" />
					<!-- 카테고리 헤더 -->
					<div class="nav">
						<button type="button"
							class="create btn btn-success btn-wide pull-right "
							onclick="location.href='<%=request.getContextPath()%>/member_board_write.do'">
							<i class="fas fa-pencil-alt"></i> 새 글 쓰기
						</button>
						<h4>${cate.getCate_name() }</h4>
						<!-- 네비 -->
						<form id="category-filter-form" name="category-filter-form">
							<div class="category-filter-wrapper">
								<!-- 검색 -->
								<div class="category-filter-query pull-right">
									<div class="input-group input-group-sm">
										<input type="search" name="query" id="search-field"
											class="form-control" placeholder="검색어"> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</span>
									</div>
								</div>
								<!-- /검색 -->
								<c:if test="${type == 'all' }">
									<ul class="list-sort pull-left">
										<li><a
											href="<%=request.getContextPath() %>/member_board_list.do?cate_num=${cate_num }&big=${big_category}&small=${small_category}"
											id="sort-date">최신순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=like %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-like">추천순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=comment %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-comment">댓글순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=scrap %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-scrap">스크랩순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=hit %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-hit">조회순</a></li>
									</ul>
								</c:if>
								<c:if test="${type == 'detail' }">
									<ul class="list-sort pull-left">
										<li><a
											href="<%=request.getContextPath() %>/member_board_list.do?cate_num=${cate_num }&big=${big_category}&small=${small_category}"
											id="sort-date">최신순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=like %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-like">추천순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=comment %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-comment">댓글순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=scrap %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-scrap">스크랩순</a></li>
										<li><a
											href="<%=request.getContextPath() %>/member_board_list_sort.do?sort=<%=hit %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}"
											id="sort-hit">조회순</a></li>
									</ul>
								</c:if>
							</div>
						</form>
					</div>
					<!-- /카테고리 헤더 -->

					<!-- 게시판 -->
					<div class="content-wrapper">
						<div class="panel panel-default">
							<ul class="list-group">
							<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto" varStatus="status">
									<li class="list-group-item list-group-item-question list-group-no-note clearfix">
										<div class="list-title-wrap clearfix">
											<div class="list-tag clearfix">
												<span class="list-group-item-text article-id">#${dto.getBoard_num() }</span> 
												<a class="list-group-item-text item-tag label label-info padding">${categoryList[status.index].getCate_name()}</a>
											</div>
											<h5 class="list-group-item-heading list-group-item-evaluate">
												<a class="font_style" href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }">
													${dto.getBoard_title()} </a>
											</h5>
										</div>
	
										<div class="list-summary-wrapper clearfix">
											<div class="list-group-item-summary clearfix">
												<ul>
													<li class="list-unstyled li1">
														<i class="item-icon fas fa-comment img"></i> ${dto.getBoard_comment() }</li>
													<li class="list-unstyled li1">
														<i class="item-icon fas fa-thumbs-up img"></i> ${dto.getBoard_like() }</li>
													<li class="list-unstyled li1">
														<i class="item-icon far fa-eye"></i> ${dto.getBoard_hit() }</li>
												</ul>
											</div>
										</div>
										<!-- 프로필 -->
										<div class="list-group-item-author clearfix">
											<div class="avatar clearfix avatar-list">
												<a href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }" class="avartar-photo"> <img src="<!-- 프로필사진 -->"></a>
												<div class="avatar-info">
													<a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }">${memberList[status.index].getMem_nick() }</a>
													<div class="activity">
														<span class=""><i class="fas fa-bolt"></i> ${memberList[status.index].getMem_score() }</span>
													</div>
													<div class="date-created">
														<span class="timeago">${dto.getBoard_regdate() }</span>
													</div>
												</div>
											</div>
										</div> <!-- /프로필 -->
									</li>
								</c:forEach>
							</c:if>
							
							<!-- DB에 글 정보가 없을 경우 -->
							<c:if test="${empty list }">
								<div class="panel panel-default">
									<h4 style="text-align: center;">등록된 게시물이 없습니다.</h4>
								</div>
							</c:if>
							</ul>
						</div>
					</div> <!-- /게시판 -->
					
					<%-- 카테고리가 all 인 경우 --%>
					<c:if test="${cate.getCate_step() eq 0 }">
					<c:if test="${!empty list }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="<%=request.getContextPath() %>/member_board_list_all.do?page=1&cate_num=${cate_num }&big=${big_category }&small=${small_category }" aria-label="Previous">
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
								   		<li class="active"><a href="member_board_list_all.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_board_list_all.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_board_list_all.do?page=${allPage }&cate_num=${cate_num }&big=${big_category }&small=${small_category }" aria-label="Next">
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
				</c:if>
				
				<%-- 세부 카테고리인 경우 --%>
				<c:if test="${cate.getCate_step() ne 0 }">
					<c:if test="${!empty list }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_board_list.do?page=1&cate_num=${cate_num }&big=${big_category }&small=${small_category }" aria-label="Previous">
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
								   		<li class="active"><a href="member_board_list.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_board_list.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_board_list.do?page=${allPage }&cate_num=${cate_num }&big=${big_category }&small=${small_category }" aria-label="Next">
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
				</c:if>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>