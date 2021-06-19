<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


};
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
					<c:if test="${loginNum != null }">
                        <a class="create btn btn-success btn-wide pull-right" href="<%=request.getContextPath()%>/member_board_write.do?cate_num=${cate.getCate_num()}&big=${big_category}&small=${small_category}">
                            <i class="fas fa-pencil-alt"></i> 새 글 쓰기
                        </a>
                    </c:if>
						<h4>${cate.getCate_name() }</h4>
						<!-- 네비 -->
						<form method="post" action="<%=request.getContextPath()%>/member_qna_search.do">
							<div class="category-filter-wrapper">
								<!-- 검색 -->
								<div class="category-filter-query pull-right">
									<div class="input-group input-group-sm">
										<input type="hidden" name="cate_num" value="${cate.getCate_num() }">
										<input type="hidden" name="big" value="${big_category }">
										<input type="hidden" name="small" value="${small_category }">
										<input type="hidden" name="cate_group" value="${cate.getCate_group() }">
										<input type="hidden" name="cate_step" value="${cate.getCate_step() }">
										<input type="search" class="form-control" id="search-field" name="data" placeholder="검색어">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</span>
									</div>
								</div>
								<!-- 정렬 -->
								<ul class="list-sort pull-left">
									<li><a href="<%=request.getContextPath() %>/member_qna_board_list.do?cate_num=${cate_num}&big=${big_category}&small=${small_category}&cate_group=${cate_group}&cate_step=${cate_step}" id="sort-date">최신순</a></li>
									<li><a href="<%=request.getContextPath() %>/member_qna_board_list_sort.do?sort=<%=like %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}&cate_group=${cate_group}&cate_step=${cate_step}" id="sort-like">추천순</a></li>
									<li><a href="<%=request.getContextPath() %>/member_qna_board_list_sort.do?sort=<%=comment %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}&cate_group=${cate_group}&cate_step=${cate_step}" id="sort-comment">댓글순</a></li>
									<li><a href="<%=request.getContextPath() %>/member_qna_board_list_sort.do?sort=<%=scrap %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}&cate_group=${cate_group}&cate_step=${cate_step}" id="sort-scrap">스크랩순</a></li>
									<li><a href="<%=request.getContextPath() %>/member_qna_board_list_sort.do?sort=<%=hit %>&cate_num=${cate_num}&big=${big_category}&small=${small_category}&cate_group=${cate_group}&cate_step=${cate_step}" id="sort-hit">조회순</a></li>
								</ul>
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
									<li class="list-group-item list-group-item-question <c:if test='${dto.getBoard_comment() > 0 }'>commented</c:if> 
									<c:if test='${dto.getBoard_comment() eq 0 }'>uncommented</c:if> clearfix">
										<div class="list-title-wrap clearfix">
											<div class="list-tag clearfix">
												<span class="list-group-item-text article-id">#${dto.getBoard_num() }</span> 
												<a class="list-group-item-text item-tag label label-info padding" href="<%=request.getContextPath()%>/member_qna_board_list.do?cate_num=${categoryList[status.index].getCate_num()}&big=${big[status.index] }&small=${small[status.index] }&cate_group=${categoryList[status.index].getCate_group()}&cate_step=${categoryList[status.index].getCate_step()}">
												${categoryList[status.index].getCate_name()}</a>
											</div>
											<h5 class="list-group-item-heading list-group-item-evaluate">
												<a class="font_style" href="<%=request.getContextPath() %>/member_qna_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
											</h5>
										</div>
	
										<div class="list-summary-wrapper clearfix">
											<div class="list-group-item-summary qna-list-evaluate clearfix">
												<ul>
													<li class="list-evaluate">
														<i class="item-icon fas fa-thumbs-up img"></i> ${dto.getBoard_like() }
													</li>
													
													<c:if test="${selectList[status.index] > 0 }">
														<li class="list-evaluate qna-selected-wrapper">
															<div class="qna-selected">
																<i class="fas fa-check-circle"></i> ${dto.getBoard_comment() }
															</div>
														</li>
													</c:if>
													
													<c:if test="${dto.getBoard_comment() > 0 && selectList[status.index] eq 0 }">
															<li class="list-evaluate qna-deselected-wrapper">
																<div class="qna-deselected">
																	<i class="fas fa-exclamation-circle"></i> ${dto.getBoard_comment() }
																</div>
															</li>
													</c:if>
													
													<c:if test="${dto.getBoard_comment() eq 0 }">
														<li class="list-evaluate qna-no-comment-wrapper">
															<div class="qna-no-comment">
																<i class="fas fa-question-circle"></i> ${dto.getBoard_comment() }
															</div>
														</li>
													</c:if>
												</ul>
											</div>
										</div>
										<!-- 프로필 -->
										<div class="list-group-item-author clearfix">
										<%-- 탈퇴회원이 아닌 경우 --%>
										<c:if test="${memberList[status.index].getMem_check() eq 'no' }">
											<div class="avatar clearfix avatar-list">
												<a href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }" class="avartar-photo"> 
													<img class="avatar-photo" src="<%=request.getContextPath()%>/images/profileUpload/${memberList[status.index].getMem_image() }">
												</a>
												<div class="avatar-info">
													<a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }">${memberList[status.index].getMem_nick() }</a>
													<div class="activity">
														<span><i class="fas fa-bolt"></i> ${memberList[status.index].getMem_score() }</span>
													</div>
													<div class="date-created">
														<span class="timeago">${dto.getBoard_regdate() }</span>
													</div>
												</div>
											</div>
										</c:if>
										
										<%-- 탈퇴회원인 경우 --%>
										<c:if test="${memberList[status.index].getMem_check() eq 'yes' }">
											<div class="avatar clearfix avatar-list">
												<img class="avatar-photo" src="<%=request.getContextPath()%>/images/profileUpload/${memberList[status.index].getMem_image() }">
												<div class="avatar-info">
													<span class="nickname" >${memberList[status.index].getMem_nick() }</span>
													<div class="activity">
														<span><i class="activity-img fas fa-lock"></i></span>
													</div>
													<div class="date-created">
														<span class="timeago">${dto.getBoard_regdate() }</span>
													</div>
												</div>
											</div>
										</c:if>
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

					
					<%-- pagination --%>
					<c:if test="${!empty list }">
					<c:if test="${sort eq 'date' }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_qna_board_list.do?page=1&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Previous">
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
								   		<li class="active"><a href="member_qna_board_list.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_qna_board_list.do?page=${i }&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_qna_board_list.do?page=${allPage }&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Next">
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
					
					<c:if test="${!empty list }">
					<c:if test="${sort eq 'like' }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=1&sort=<%=like %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Previous">
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
								   		<li class="active"><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=like %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=like %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=${allPage }&sort=<%=like %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Next">
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
				
					<c:if test="${!empty list }">
					<c:if test="${sort eq 'comment' }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=1&sort=<%=comment %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Previous">
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
								   		<li class="active"><a href="member_qna_search.do?page=${i }&sort=<%=comment %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=comment %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=${allPage }&sort=<%=comment %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Next">
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
					
					<c:if test="${!empty list }">
					<c:if test="${sort eq 'scrap' }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=1&sort=<%=scrap %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Previous">
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
								   		<li class="active"><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=scrap %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=scrap %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=${allPage }&sort=<%=scrap %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Next">
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
					
					<c:if test="${!empty list }">
					<c:if test="${sort eq 'hit' }">
						<nav>
							<div align="center">
							  <ul class="pagination">
							  
							  <c:if test="${page > 1 }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=1&sort=<%=hit %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Previous">
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
								   		<li class="active"><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=hit %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
								    
								    <c:if test="${i != page }">
									    <li><a href="member_qna_board_list_sort.do?page=${i }&sort=<%=hit %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}">${i }</a></li>
								    </c:if>
							    </c:forEach>
							    
							    <c:if test="${page < allPage }">
								    <li>
								      <a href="member_qna_board_list_sort.do?page=${allPage }&sort=<%=hit %>&cate_num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step}" aria-label="Next">
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