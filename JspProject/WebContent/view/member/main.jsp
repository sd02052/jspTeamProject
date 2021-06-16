<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div class="content">
				<div id="main" class="content clearfix" role="main">
					<div class="col-sm-6 main-block-left">
					
						<!-- 공지사항 -->
						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-flag"></i> 공지사항
							</h4>
							<div class="panel panel-default">
								<ul class="list-group">
								<c:if test="${!empty noticeList }">
								<c:forEach items="${noticeList }" var="dto" varStatus="status" end="4">
									<c:if test="${dto.getBoard_comment() != 0 }">
									<li class="list-group-item list-group-has-note clearfix">
									</c:if>
									<c:if test="${dto.getBoard_comment() == 0 }">
									<li class="list-group-item list-group-no-note clearfix">
									</c:if>
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="<%=request.getContextPath()%>/member_personal.do?num=${noticeMember[status.index].getMem_num() }" class="avatar-photo"> <img src="<%=request.getContextPath() %>/images/${noticeMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${noticeMember[status.index].getMem_num() }">${noticeMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${noticeMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</h5>
										</div>
									</li>
								</c:forEach>
								</c:if>
								<c:if test="${empty noticeList }">
									<li class="list-group-item clearfix">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												등록된 게시물이 없습니다.
											</h5>
										</div>
									</li>
								</c:if>
								</ul>

							</div>
						</div>
					</div>
					<!-- 공지사항 -->

					<div class="col-sm-6 main-block-right">
						<!-- Weekly Best -->
						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-star"></i> Weekly Best
							</h4>
							<div class="panel panel-default">
								<ul class="list-group">
								<c:if test="${!empty bestList }">
									<c:forEach items="${bestList }" var="dto" varStatus="status" end="4">
									<c:if test="${dto.getBoard_comment() != 0 }">
									<li class="list-group-item list-group-has-note clearfix">
									</c:if>
									<c:if test="${dto.getBoard_comment() == 0 }">
									<li class="list-group-item list-group-no-note clearfix">
									</c:if>
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="" class="avatar-photo">
															<img src="<%=request.getContextPath() %>/images/${bestMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="">${bestMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${bestMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</h5>
										</div>
									</li>
									</c:forEach>
								</c:if>
								<c:if test="${empty bestList }">
									<li class="list-group-item clearfix">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												등록된 게시물이 없습니다.
											</h5>
										</div>
									</li>
								</c:if>
								</ul>

							</div>
						</div>
					</div>
					<!-- /Weekly Best -->

					<div class="col-sm-8 main-block-left">
						<!-- Q&A / 커뮤니티 -->
						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-database"></i> Q&A <a href="<%=request.getContextPath() %>/member_qna_board_list_all.do?cate_num=1&big='menu1'&small='menu1-1'" class="main-more-btn pull-right"> 
								<i class="fas fa-ellipsis-h"></i>
								</a>
							</h4>
							<div class="panel panel-default">
								<ul class="list-group">
								<c:if test="${!empty qnaList }">
									<c:forEach items="${qnaList }" var="dto" varStatus="status" end="9">
									<c:if test="${dto.getBoard_comment() != 0 }">
									<li class="list-group-item list-group-has-note clearfix">
									</c:if>
									<c:if test="${dto.getBoard_comment() == 0 }">
									<li class="list-group-item list-group-no-note clearfix">
									</c:if>
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												<a href="<%=request.getContextPath() %>/member_qna_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="" class="avatar-photo"> <img
															src="<%=request.getContextPath() %>/images/${qnaMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="">${qnaMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${qnaMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</h5>
										</div>
									</li>
									</c:forEach>
								</c:if>	
								<c:if test="${empty qnaList }">
									<li class="list-group-item clearfix">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												등록된 게시물이 없습니다.
											</h5>
										</div>
									</li>
								</c:if>
								</ul>
							</div>
						</div>

						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-comments"></i> 커뮤니티 <a href="<%=request.getContextPath() %>/member_board_list_all.do?cate_num=3&big='menu3'&small='menu3-1'"
									class="main-more-btn pull-right"> <i
									class="fas fa-ellipsis-h"></i>
								</a>
							</h4>
							<div class="panel panel-default">
								<ul class="list-group">
								<c:if test="${!empty communityList }">
									<c:forEach items="${communityList }" var="dto" varStatus="status">
									<c:if test="${dto.getBoard_category() != 8 && dto.getBoard_category() != 14}">
										<c:if test="${dto.getBoard_comment() != 0 }">
										<li class="list-group-item list-group-has-note clearfix">
										</c:if>
										<c:if test="${dto.getBoard_comment() == 0 }">
										<li class="list-group-item list-group-no-note clearfix">
										</c:if>
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="" class="avatar-photo"> <img
															src="<%=request.getContextPath() %>/images/${communityMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="">${communityMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${communityMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</h5>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty communityList }">
									<li class="list-group-item clearfix">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">
												등록된 게시물이 없습니다.
											</h5>
										</div>
									</li>
								</c:if>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Q&A & 커뮤니티 -->

					<div class="col-sm-4 main-block-right">
						<!-- Tech & 칼럼 & 학원/홍보 -->
						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-code"></i> Tech <a href="<%=request.getContextPath() %>/member_board_list_all.do?cate_num=2&big='menu2'&small='menu2-1'"
									class="main-more-btn pull-right"> <i
									class="fas fa-ellipsis-h"></i>
								</a>
							</h4>
							<div class="panel panel-default">
								<div class="panel-body">
									<c:if test="${!empty techList }">
										<c:forEach items="${techList }" var="dto" varStatus="status" end="2">
											<div class="article-middle-block clearfix">
												<div class="list-tag clearfix">
													<a href="" class="list-group-item-text item-tag label label-info"> <i class="fas fa-code"></i> ${techCategory[status.index].getCate_name() }
													</a>
												</div>
												<h5>
													<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num()}&hit='yes'">${dto.getBoard_title() }</a>
												</h5>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="" class="avatar-photo"> <img src="<%=request.getContextPath() %>/images/${techMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="">${techMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${techMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${empty techList }">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">등록된 게시물이 없습니다.</h5>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /Tech -->

						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-quote-left"></i> 칼럼 <a href="<%=request.getContextPath() %>/member_board_list_all.do?cate_num=4&big='menu4'&small='menu4-1'"
									class="main-more-btn pull-right"> <i
									class="fas fa-ellipsis-h"></i>
								</a>
							</h4>
							<div class="panel panel-default">
								<div class="panel-body">
									<c:if test="${!empty columnList }">
										<c:forEach items="${columnList }" var="dto" varStatus="status" end="0">
											<div class="article-middle-block clearfix">
												<div class="list-tag clearfix">
													<a href="" class="list-group-item-text item-tag label label-info"><i class="fas fa-quote-left"></i> ${columnCategory[status.index].getCate_name() } </a>
												</div>
												<h5>
													<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num()}&hit='yes'">${dto.getBoard_title() }</a>
												</h5>
												<div class="etc"><p class="main-block-desc"><a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num()}&hit='yes'">${dto.getBoard_content() }</a></p></div>
												<div class="list-group-item-author pull-right clearfix">
													<div class="avatar clearfix avatar-x-small">
														<a href="" class="avatar-photo"> <img src="<%=request.getContextPath() %>/images/${columnMember[status.index].getMem_image() }">
														</a>
														<div class="avatar-info">
															<a class="nickname" href="">${columnMember[status.index].getMem_nick() }</a>
															<div class="activity">
																<span class=""><i class="fas fa-bolt"></i> ${columnMember[status.index].getMem_score() }</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${empty columnList }">
										<div class="list-title-wrapper">
											<h5 class="list-group-item-heading">등록된 게시물이 없습니다.</h5>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /칼럼 -->

						<div class="main-block">
							<h4 class="main-header">
								<i class="fas fa-book"></i> 학원/홍보 <a href="<%=request.getContextPath() %>/member_board_list.do?cate_num=14&big='menu3'&small='menu3-8'"
									class="main-more-btn pull-right"> <i
									class="fas fa-ellipsis-h"></i>
								</a>
							</h4>
							<div class="panel panel-default">
								<ul class="list-group">
									<c:if test="${!empty academyList }">
										<c:forEach items="${academyList }" var="dto" varStatus="status" end="2">
											<c:if test="${dto.getBoard_comment() != 0 }">
												<li class="list-group-item list-group-has-note clearfix">
											</c:if>
											<c:if test="${dto.getBoard_comment() == 0 }">
												<li class="list-group-item list-group-no-note clearfix">
											</c:if>
											<div class="list-title-wrapper">
												<h5 class="list-group-item-heading">
													<a href="<%=request.getContextPath() %>/member_board_content.do?num=${dto.getBoard_num() }&hit='yes'">${dto.getBoard_title() }</a>
													<div class="list-group-item-author pull-right clearfix">
														<div class="avatar clearfix avatar-x-small">
															<a href="" class="avatar-photo"> <img src="<%=request.getContextPath() %>/images/${academyMember[status.index].getMem_image() }">
															</a>
															<div class="avatar-info">
																<a class="nickname" href="">${academyMember[status.index].getMem_nick() }</a>
																<div class="activity">
																	<span class=""><i class="fas fa-bolt"></i> ${academyMember[status.index].getMem_score() }</span>
																</div>
															</div>
														</div>
													</div>
												</h5>
											</div>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${empty academyList }">
										<li class="list-group-item clearfix">
											<div class="list-title-wrapper">
												<h5 class="list-group-item-heading">등록된 게시물이 없습니다.</h5>
											</div>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
						<!-- /학원홍보 -->
					</div>
					<!-- /Tech & 칼럼 & 학원/홍보 -->
				</div>
				<!-- /container -->
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>