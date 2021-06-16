<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board1</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.table-bordered {
	padding: 5px 10px;
}

.label1 {
	background-color: #bbb;
}

.h {
	margin: 3px 0px;
}

.padding {
	padding: 1.8px 5.4px 2.7px;
}

.font {
	font-size: 12px;
}

.font1 {
	font-size: 10px;
}

/* .font_style {
	font-weight: bold;
} */
.box {
	width: 400px;
	height: 40px;
}

.size {
	width: 803px;
	height: 53px;
}

.img {
	width: 14px;
	height: 14px;
}

.li1 {
	font-size: 13px;
	color: gray;
}

.pa {
	padding: 20px;
}

.a1 {
	font-size: 12px;
}

.li2 {
	font-size: 3px;
	color: gray;
}

.font2 {
	font-size: 3px;
	color: gray;
}

.span {
	font-size: 10px;
}

.img1 {
	padding-top: 12px;
}

.a2 {
	padding-top: 12px;
}
.list-sort a{
	color: #bbb;
    font-size: 12px;
}
.list-sort .active {
	color: #555;
    font-weight: bold;
    text-decoration: underline;
}
</style>

</head>
<c:set var="big_category" value="${big_category }" />
<c:set var="small_category" value="${small_category }" />
<script type="text/javascript">
	
	$(function(){
		$("#"+${big_category }).css("border-right","5px solid #e67d3e");
		$("#"+${small_category }).css("color","#fff");
		
		<%String sort = (String)request.getAttribute("sort");

		if (sort.equals("'date'")) {%>
		$(function(){
			$("#sort-date").addClass('active');
		});
		<%} else if (sort.equals("'like'")) {%>
		$(function(){
			$("#sort-like").addClass('active');
		});
		<%} else if (sort.equals("'comment'")) {%>
		$(function(){
			$("#sort-comment").addClass('active');
		});
		<%} else if (sort.equals("'scrap'")) {%>
		$(function(){
			$("#sort-scrap").addClass('active');
		});
		<%} else if (sort.equals("'hit'")) {%>
		$(function(){
			$("#sort-hit").addClass('active');
		});
		<%}%>
	})
	
</script>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<!-- 본문 시작-->


			<div class="content">
				<div class="container-fluid">
					<c:set var="list" value="${boardList }" />
					<c:set var="cate" value="${category }" />
					<div class="row">
						<div class="row">
							<div class="col-xs-12 col-md-8">
								<h4>${cate.getCate_name() }</h4>
							</div>
							<div class="col-xs-12 col-md-4" align="right">
								<button type="button" class="btn btn-success"
									onclick="location.href='<%=request.getContextPath()%>/member_board_write.do'">
									<i class="fas fa-pencil-alt"></i>새 글 쓰기
								</button>
							</div>
						</div>

						<br>

						<form class="form-inline" method="post" action="<%=request.getContextPath()%>/member_board_search.do">
							<div class="row">
								<c:if test="${type == 'all' }">
									<div class="col-md-6 list-sort">
										<a href="<%=request.getContextPath() %>/member_board_list_all.do?cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-date">최신순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_all_sort.do?sort='like'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-like">추천순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_all_sort.do?sort='comment'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-comment">댓글순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_all_sort.do?sort='scrap'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-scrap">스크랩순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_all_sort.do?sort='hit'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-hit">조회순</a>
										&nbsp;
									</div>
								</c:if>
								<c:if test="${type == 'detail' }">
									<div class="col-md-6 list-sort">
										<a href="<%=request.getContextPath() %>/member_board_list.do?cate_num=${cate_num }&big=${big_category}&small=${small_category}" id="sort-date">최신순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_sort.do?sort='like'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-like">추천순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_sort.do?sort='comment'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-comment">댓글순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_sort.do?sort='scrap'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-scrap">스크랩순</a>
										&nbsp;
										<a href="<%=request.getContextPath() %>/member_board_list_sort.do?sort='hit'&cate_num=${cate_num}&big=${big_category}&small=${small_category}" id="sort-hit">조회순</a>
										&nbsp;
									</div>
								</c:if>
								<div class="col-md-6" align="right">
									<div class="form-group">
										<label class="sr-only" for="exampleInputAmount"></label>
										<div class="input-group">
											<input type="hidden" name="cate_num" value="${cate.getCate_num() }">
											<input type="hidden" name="big" value="${big_category }">
											<input type="hidden" name="small" value="${small_category }">
											<input type="hidden" name="cate_group" value="${cate.getCate_group() }">
											<input type="hidden" name="cate_step" value="${cate.getCate_step() }">
											<input type="search" class="form-control" id="search-field" name="data" placeholder="검색어">
											<span class="input-group-addon">
												<button type="submit" class="btn btn-link btn-xs">
													<i class="fas fa-search"></i>
												</button>
											</span>
										</div>
										
									</div>
								</div>
							</div>
						</form>
						
						<br>

						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto" varStatus="status">
								<div class="row <c:if test='${dto.getBoard_comment() > 0 }'>commented</c:if> <c:if test='${dto.getBoard_comment() eq 0 }'>uncommented</c:if>"
									style="border: 1px solid #ddd; border-bottom-width: 0.5px;">
									<div class="col-sm-7">
										<div class="row">
											<span class="list-group-item-text article-id font">#${dto.getBoard_num() }</span>
											<a class="list-group-item-text item-tag label label-info padding">${categoryList[status.index].getCate_name()}</a>
										</div>
										<div class="row">
											<h5 class="list-group-item-heading list-group-item-evaluate h">
												<a class="font_style" href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }">${dto.getBoard_title() }</a>
											</h5>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="row">
											<div class="col-sm-12">
												<ul class="list-inline">
													<li class="list-unstyled li1 <c:if test="${dto.getBoard_comment() eq 0 }">item-icon-disabled</c:if>"><i class="fas fa-comment img"></i> ${dto.getBoard_comment() }</li>
													<li class="list-unstyled li1 <c:if test="${dto.getBoard_like() eq 0 }">item-icon-disabled</c:if>"><i class="fas fa-thumbs-up img"></i> ${dto.getBoard_like() }</li>
													<li class="list-unstyled li1 <c:if test="${dto.getBoard_hit() eq 0 }">item-icon-disabled</c:if>"><i class="far fa-eye"></i> ${dto.getBoard_hit() }</li>

													<li class="list-unstyled li1  img1">
														<a class="text-left" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }"> 
															<img class="mem-logo" src="<%=request.getContextPath()%>/images/profile/${memberList[status.index].getMem_image() }">
														</a>
													</li>
													<li class="list-unstyled li1 a2">
														<div>
															<a class="a1" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }">${memberList[status.index].getMem_nick() }</a> &nbsp;
															<div style="font-size: 10px; display: inline-block;">
																<i class="fas fa-bolt i1"></i>
																${memberList[status.index].getMem_score() }
															</div>
															<p class="span">${dto.getBoard_regdate() }</p>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>

						<c:if test="${empty list }">
							<div class="row "
								style="border: 1px solid #ddd; border-bottom-width: 0.5px;">
								<h4 style="text-align: center;">등록된 게시물이 없습니다.</h4>
							</div>
						</c:if>

					</div>
					<!-- 본문 끝 -->
					
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
</body>

</html>
