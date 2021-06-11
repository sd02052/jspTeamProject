<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_personal.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function boardList() {
	document.getElementById("boardList").style.display = "block";
	document.getElementById("comList").style.display = "none";
	document.getElementById("scrapList").style.display = "none";
};

function comList() {
	document.getElementById("boardList").style.display = "none";
	document.getElementById("comList").style.display = "block";
	document.getElementById("scrapList").style.display = "none";
};

function scrapList() {
	document.getElementById("boardList").style.display = "none";
	document.getElementById("comList").style.display = "none";
	document.getElementById("scrapList").style.display = "block";
};

</script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">
				    <div id="user" class="content clearfix" role="main">
				        <div class="panel panel-default">
				            <form class="panel-body">
				                <div class="avatar clearfix avatar-big col-sm-3 text-center">
				                    <a href="" class="avatar-photo">
				                        <img src="<%=request.getContextPath() %>/images/profile/${memDTO.getMem_image() }">
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
				                <li><a onclick="boardList()">작성글&nbsp;<span class="badge badge-muted"><c:if test="${!empty boardList }">${boardList.size() }</c:if></span></a></li>
				                <li><a onclick="comList()">작성댓글&nbsp;<span class="badge badge-muted"><c:if test="${!empty comList }">${comList.size() }</c:if></span></a></li>
				                <li><a onclick="scrapList()">스크랩&nbsp;<span class="badge badge-muted">${likeList.size() }</span></a></li>
				            </ul>
				        </div> <!-- /activity Check-->
				
		<!-- 작성글 -->
				        <div class="col-sm-10 main-block-left pull-left"> <!-- activity List -->
				        <div class="boardList">
				            <ul class="list-group">
				           	 <c:if test="${!empty boardList }">
				     		   <c:forEach items="${boardList }" var="board" varStatus="status">
				                <li class="list-group-item list-group-has-note list-group-item-small">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-angle-up"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">
				                            	<a class="list-group-item-text item-tag label label-info padding">${cateList[status.index].getCate_name()}</a>
				                            	게시글에 #${board.getBoard_num() } 게시물을 작성하였습니다.</span></span>
				                            <span class="date">${board.getBoard_regdate() }</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                            <a href="<%=request.getContextPath()%>/member_board_content.do?num=${board.getBoard_num() }">${board.getBoard_title() }</a>
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                    <a href="" class="avatar-photo">
				                                        <img src="<%=request.getContextPath() %>/images/437ec94ff99317bcb4a15730e1b5cf61.png">
				                                    </a>
				                                    <div class="avatar-info">
				                                        <a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${memDTO.getMem_nick() }">${memDTO.getMem_nick() }</a>
				                                        <div class="activity">
				                                            <span class=""><i class="fas fa-bolt"></i>&nbsp;${memDTO.getMem_score() }</span>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </h5>

				                    </div>
				                </li>
				           	  </c:forEach>
				            </c:if>
				            <c:if test="${empty boardList }">
				            	<li class="list-group-item list-group-has-note list-group-item-small">
				            		작성한 글이 없습니다.
				            	</li>
				            </c:if>
				           </ul>
				           <div id="boardPage" style="text-align: center;">
					            <nav aria-label="Page navigation example"> <!-- pagination -->
					                <ul class="pagination">
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Previous">
					                            <span aria-hidden="true">&laquo;</span>
					                            <span class="sr-only">Previous</span>
					                        </a>
					                    </li>
					                    <li class="page-item"><a class="page-link" href="#">1</a></li>
					                    <li class="page-item"><a class="page-link" href="#">2</a></li>
					                    <li class="page-item"><a class="page-link" href="#">3</a></li>
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Next">
					                            <span aria-hidden="true">&raquo;</span>
					                            <span class="sr-only">Next</span>
					                        </a>
					                    </li>
					                </ul>
					            </nav> <!-- /pagination -->
					           </div>
					          </div>
					            
					            <!-- 작성댓글 -->
					      <div id="comList">
				            <ul class="list-group">
				           	 <c:if test="${!empty comList }">
				     		   <c:forEach items="${comList }" var="com" varStatus="status">
				                <li class="list-group-item list-group-has-note list-group-item-small">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-angle-up"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">
				                            	#${com.getCom_target() }
				                            	<a href="<%=request.getContextPath()%>/member_board_content.do?num=${cbList[status.index].getBoard_num() }">${cbList[status.index].getBoard_title() }</a>
				                            	게시글에 댓글을 남겼습니다.</span></span>
				                            <span class="date">${com.getCom_regdate() }</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                          	 ${com.getCom_content() }
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                    <a href="" class="avatar-photo">
				                                        <img src="<%=request.getContextPath() %>/images/437ec94ff99317bcb4a15730e1b5cf61.png">
				                                    </a>
				                                    <div class="avatar-info">
				                                        <a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${lmList[status.index].getMem_nick() }">${lmList[status.index].getMem_nick() }</a>
				                                        <div class="activity">
				                                            <span class=""><i class="fas fa-bolt"></i>&nbsp;${lmList[status.index].getMem_score() }</span>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </h5>

				                    </div>
				                </li>
				           	  </c:forEach>
				            </c:if>
				            <c:if test="${empty cbList }">
				            	<li class="list-group-item list-group-has-note list-group-item-small">
				            		작성한 댓글이 없습니다.
				            	</li>
				            </c:if>
				           </ul>
				            
				            <div style="text-align: center;">
					            <nav aria-label="Page navigation example"> <!-- pagination -->
					                <ul class="pagination">
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Previous">
					                            <span aria-hidden="true">&laquo;</span>
					                            <span class="sr-only">Previous</span>
					                        </a>
					                    </li>
					                    <li class="page-item"><a class="page-link" href="#">1</a></li>
					                    <li class="page-item"><a class="page-link" href="#">2</a></li>
					                    <li class="page-item"><a class="page-link" href="#">3</a></li>
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Next">
					                            <span aria-hidden="true">&raquo;</span>
					                            <span class="sr-only">Next</span>
					                        </a>
					                    </li>
					                </ul>
					            </nav> <!-- /pagination -->
				            </div>
				            </div>
				            
			<!-- 스크랩 -->
				<div id="scrapList">
				            <ul id="scrapList" class="list-group">
				           	 <c:if test="${!empty lbList }">
				     		   <c:forEach items="${lbList }" var="com" varStatus="status">
				                <li class="list-group-item list-group-has-note list-group-item-small">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-angle-up"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">
				                            	#${lbList.getBoard_num() } 게시물을 스크랩하였습니다.</span></span>
				                            <span class="date">${lbList.getBoard_regdate() }</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                            <a href="<%=request.getContextPath()%>/member_board_content.do?num=${lbList.getBoard_num() }">${lbList.getBoard_title() }</a>
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                    <a href="" class="avatar-photo">
				                                        <img src="<%=request.getContextPath() %>/images/437ec94ff99317bcb4a15730e1b5cf61.png">
				                                    </a>
				                                    <div class="avatar-info">
				                                        <a class="nickname" href="<%=request.getContextPath()%>/member_personal.do?num=${cmList[status.index].getMem_nick() }">${cmList[status.index].getMem_nick() }</a>
				                                        <div class="activity">
				                                            <span class=""><i class="fas fa-bolt"></i>&nbsp;${cmList[status.index].getMem_score() }</span>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </h5>

				                    </div>
				                </li>
				           	  </c:forEach>
				            </c:if>
				            <c:if test="${empty lbList }">
				            	<li class="list-group-item list-group-has-note list-group-item-small">
				            		스크랩한 글이 없습니다.
				            	</li>
				            </c:if>
				           </ul>
				            
				            <div style="text-align: center;">
					            <nav aria-label="Page navigation example"> <!-- pagination -->
					                <ul class="pagination">
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Previous">
					                            <span aria-hidden="true">&laquo;</span>
					                            <span class="sr-only">Previous</span>
					                        </a>
					                    </li>
					                    <li class="page-item"><a class="page-link" href="#">1</a></li>
					                    <li class="page-item"><a class="page-link" href="#">2</a></li>
					                    <li class="page-item"><a class="page-link" href="#">3</a></li>
					                    <li class="page-item">
					                        <a class="page-link" href="#" aria-label="Next">
					                            <span aria-hidden="true">&raquo;</span>
					                            <span class="sr-only">Next</span>
					                        </a>
					                    </li>
					                </ul>
					            </nav> <!-- /pagination -->
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