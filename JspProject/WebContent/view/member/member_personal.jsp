<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_personal.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div class="md_container" style="width: 805px; min-height: 800px;">
				    <div id="user" class="content clearfix" role="main">
				        <div class="panel panel-default">
				            <form class="panel-body">
				                <div class="avatar clearfix avatar-big col-sm-3 text-center">
				                    <a href="" class="avatar-photo">
				                        <img src="<%=request.getContextPath() %>/images/profileUpload/${memDTO.getMem_image() }">
				                    </a>
				                </div>
				                <div class="user-info col-sm-9">
				                    <div class="clearfix">
				                        <h2 class="pull-left">${memDTO.getMem_nick() }</h2>
				                        <button class="btn btn-success pull-right btn-wide disabled">
				                            <i class="fas fa-plus"></i>팔로우
				                        </button>
				                    </div>
				                    <div class="user-points">
				                        <div class="user-point">
				                            <div class="user-point-label"><i class="fas fa-bolt"></i> 활동점수</div>
				                            <div class="user-point-num">${memDTO.getMem_score() }</div>
				                        </div>
				                        <div class="user-point">
				                            <div class="user-point-label"><i class="fas fa-user"></i> 팔로잉</div>
				                            <div class="user-point-num">0</div>
				                        </div>
				                        <div class="user-point">
				                            <div class="user-point-label"><i class="fas fa-users"></i> 팔로워</div >
				                            <div class="user-point-num">0</div>
				                        </div>
				                    </div>
				
				                </div>
				            </form>
				        </div>
				
				        <div class="col-sm-2 user-info-nav pull-right"> <!-- activity Check -->
				            <ul class="nav">
				                <li class="selected"><a href="<%=request.getContextPath()%>/member_personal.do?num=${memDTO.getMem_num() }">게시물&nbsp;<span class="badge badge-muted"><c:if test="${totalRecord_board > 0 }">${totalRecord_board }</c:if></span></a></li>
				                <li><a href="<%=request.getContextPath()%>/member_personal_commented.do?num=${memDTO.getMem_num() }">댓글&nbsp;<span class="badge badge-muted"><c:if test="${totalRecord_com > 0 }">${totalRecord_com }</c:if></span></a></li>
				                <li><a href="<%=request.getContextPath()%>/member_personal_scrapped.do?num=${memDTO.getMem_num() }">스크랩&nbsp;<span class="badge badge-muted"><c:if test="${totalRecord_scrap > 0 }">${totalRecord_scrap }</c:if></span></a></li>
				            </ul>
				        </div> <!-- /activity Check-->
				
		<!-- 작성글 -->
				        <div class="col-sm-10 main-block-left pull-left"> <!-- activity List -->
				        <div id="boardList">
				            <ul class="list-group">
				           	 <c:if test="${!empty boardList }">
				     		   <c:forEach items="${boardList }" var="board" varStatus="status">
				                <li class="list-group-item list-group-item-small <c:if test="${board.getBoard_comment() > 0 }">list-group-has-note</c:if> <c:if test="${board.getBoard_comment() eq 0 }">list-group-has-note-empty</c:if>">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-pencil-alt" style="color: #449D44;"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">
				                            	<a class="list-group-item-text item-tag label label-info padding" href="<%=request.getContextPath() %>/member_board_list.do?cate_num=${cateList[status.index].getCate_num()}&big=${big_category[status.index] }&small=${small_category[status.index]}&cate_group=${cateList[status.index].getCate_group()}&cate_step=${cateList[status.index].getCate_step()}">
				                            	${cateList[status.index].getCate_name()}</a> 에 #${board.getBoard_num() } 게시물을 작성하였습니다.</span>
				                            <span class="date">${board.getBoard_regdate() }</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                        	<c:choose>
				                        		<c:when test="${board.getBoard_category() eq 1 || board.getBoard_category() eq 2 || board.getBoard_category() eq 3 }">
				                        			<a href="<%=request.getContextPath()%>/member_qna_board_content.do?num=${board.getBoard_num() }&hit='yes'">${board.getBoard_title() }</a>
				                        		</c:when>
				                        		<c:otherwise>
				                        			<a href="<%=request.getContextPath()%>/member_board_content.do?num=${board.getBoard_num() }&hit='yes'">${board.getBoard_title() }</a>
				                        		</c:otherwise>
				                        	</c:choose>
				                            
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                	<%-- 탈퇴회원인 경우 --%>
				                                	<c:if test="${memDTO.getMem_check() eq 'yes' }">
					                                        <img class="avatar-photo" src="<%=request.getContextPath() %>/images/profileUpload/${memDTO.getMem_image() }">
					                                    <div class="avatar-info">
					                                        <span class="nickname">${memDTO.getMem_nick() }</span>
					                                        <div class="activity">
					                                            <span class=""><i class="activity-img fas fa-lock"></i></span>
					                                        </div>
					                                    </div>
				                                    </c:if>
				                                    
				                                    <%-- 탈퇴회원이 아닌 경우 --%>
				                                    <c:if test="${memDTO.getMem_check() eq 'no' }">
					                                    <a href="" class="avatar-photo">
					                                        <img src="<%=request.getContextPath() %>/images/profileUpload/${memDTO.getMem_image() }">
					                                    </a>
					                                    <div class="avatar-info">
					                                        <a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${memDTO.getMem_num() }">${memDTO.getMem_nick() }</a>
					                                        <div class="activity">
					                                            <span class=""><i class="fas fa-bolt"></i>&nbsp;${memDTO.getMem_score() }</span>
					                                        </div>
					                                    </div>
				                                    </c:if>
				                                    
				                                </div>
				                            </div>
				                        </h5>

				                    </div>
				                </li>
				           	  </c:forEach>
				            </c:if>
				            <c:if test="${empty boardList }">
				            	<li class="list-group-item list-group-has-note-empty list-group-item-small">
				            		작성한 글이 없습니다.
				            	</li>
				            </c:if>
				           </ul>
				           
				           <div id="boardPage" style="text-align: center;">
							    <c:if test="${!empty boardList }">
									<nav>	<!-- pagination -->
										<div align="center">
										  <ul class="pagination">
										  
										  <c:if test="${page > 1 }">
											    <li class="page-item">
											      <a class="page-link" href="member_personal.do?page=1&num=${memDTO.getMem_num() }" aria-label="Previous">
											        <span aria-hidden="true">&laquo;</span>
											      </a>
											    </li>
										   </c:if>
										   
										   <c:if test="${page eq 1 }">
											    <li class="page-item">
											      <a aria-label="Previous" >
											        <span aria-hidden="true">&laquo;</span>
											      </a>
											    </li>
										   </c:if>
										    
										    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
											    <c:if test="${i == page }">
											   		<li class="active page-item"><a class="page-link" href="member_personal.do?page=${i }&num=${memDTO.getMem_num() }">${i }</a></li>
											    </c:if>
											    
											    <c:if test="${i != page }">
												    <li class="page-item"><a class="page-link" href="member_personal.do?page=${i }&num=${memDTO.getMem_num() }">${i }</a></li>
											    </c:if>
										    </c:forEach>
										    
										    <c:if test="${page < allPage }">
											    <li class="page-item">
											      <a class="page-link" href="member_personal.do?page=${allPage }&num=${memDTO.getMem_num() }" aria-label="Next">
											        <span aria-hidden="true">&raquo;</span>
											      </a>
											    </li>
										    </c:if>
										    
										    <c:if test="${page eq allPage }">
											    <li class="page-item">
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
					            
				        </div> <!-- /activity list -->
				    </div> <!-- /container -->
			    </div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>