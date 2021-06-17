<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board1</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

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
	font-size: 1.5em;
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

</style>

</head>
<c:set var="big_category" value="${big_category }" />
<c:set var="small_cattegory" value="${small_category }" />
<script type="text/javascript">
	
	$(function(){
		$("#"+${big_category }).css("border-right","5px solid #e67d3e");
		$("#"+${small_category }).css("color","#fff");
	});

</script>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<!-- 본문 시작-->


			<div style="width: 805px; min-height: 800px;">
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
								onclick="location.href='<%=request.getContextPath()%>/member_board_write.do'" >
									<i class="fas fa-pencil-alt"></i>새 글 쓰기
								</button>
							</div>
						</div>
						<br>

						<form class="form-inline">
							<div class="row">
								<div class="col-md-6">
									<button type="button" class="btn btn-link btn-xs">
										<p class="text-muted">최신순</p>
									</button>
									&nbsp;
									<button type="button" class="btn btn-link btn-xs">
										<p class="text-muted">추천순</p>
									</button>
									&nbsp;
									<button type="button" class="btn btn-link btn-xs">
										<p class="text-muted">댓글순</p>
									</button>
									&nbsp;
									<button type="button" class="btn btn-link btn-xs">
										<p class="text-muted">스크랩순</p>
									</button>
									&nbsp;
									<button type="button" class="btn btn-link btn-xs">
										<p class="text-muted">조회순</p>
									</button>
									&nbsp;
								</div>
								<div class="col-md-6" align="right">
									<div class="form-group">
										<label class="sr-only" for="exampleInputAmount"></label>
										<div class="input-group">
											<input type="search" class="form-control" id="search-field" placeholder="검색어">
											<div class="input-group-addon">
												<button type="button" class="btn btn-link btn-xs">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>

								</div>
							</div>
						</form>
						
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto" varStatus="status">
								<div class="row <c:if test='${dto.getBoard_comment() > 0 }'>commented</c:if> <c:if test='${dto.getBoard_comment() eq 0 }'>uncommented</c:if>" style="border: 1px solid #ddd; border-bottom-width: 0.5px;">
									<div class="col-xs-7">
										<div class="row">
											<span class="list-group-item-text article-id font">#${dto.getBoard_num() }</span>
											<a class="list-group-item-text item-tag label label-info padding">${categoryList[status.index].getCate_name()}</a>
										</div>
										<div class="row">
											<h5 class="list-group-item-heading list-group-item-evaluate h">
												<a class="font_style" href="<%=request.getContextPath() %>/member_qna_board_content.do?num=${dto.getBoard_num() }">${dto.getBoard_title() }</a>
											</h5>
										</div>
									</div>
									<div class="col-xs-5">
										<div class="row">
											<div class="col-md-12">
												<ul class="list-inline">
													<li class="list-unstyled li1"><i class="fas fa-thumbs-up img"></i>&nbsp;&nbsp;${dto.getBoard_like() }</li>
													<c:if test="${dto.getBoard_comment() > 0 && comList[status.index].getCom_selected().equals('yes')}">
															<li class="list-unstyled li1">
																<div class="answer-count">
																		<i class="fas fa-check-circle"></i>
																	&nbsp;&nbsp;${dto.getBoard_comment() }
																</div>
															</li>
													</c:if>
													
													<c:if test="${dto.getBoard_comment() > 0 && comList[status.index].getCom_selected().equals('no') }">
															<li class="list-unstyled li1">
																<div class="answer-count">
																	<i class="fas fa-exclamation-circle"></i>
																		&nbsp;&nbsp;${dto.getBoard_comment() }
																</div>
															</li>
													</c:if>
													
													<c:if test="${dto.getBoard_comment() eq 0 }">
														<li class="list-unstyled li1">
															<div class="answer-count">
																<i class="fas fa-question-circle"></i>
																&nbsp;&nbsp;${dto.getBoard_comment() }
															</div>
														</li>
													</c:if>

													<li class="list-unstyled li1  img1"></li>
														<a class="avatar-photo text-left" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }"> 
															<img width="30" height="30" class="img-circle " src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
														</a>
													</li>
													<li class="list-unstyled li1 a2">
														<div>
															<a class="a1" href="<%=request.getContextPath()%>/member_personal.do?num=${memberList[status.index].getMem_num() }">${memberList[status.index].getMem_nick() }</a> &nbsp;
															<div style="font-size: 10px; display: inline-block;">
																<i class="fas fa-bolt i1"></i> ${memberList[status.index].getMem_score() }
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
							<div class="row " style="border: 1px solid #ddd; border-bottom-width: 0.5px;">
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
								      <a href="member_board_list_all.do?page=1&cate_num=${cate_num }&big=${big_category }&small=${small_category }" aria-label="Previous">
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