<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				                        <img src="<%=request.getContextPath() %>/images/29a87623405c294d79bd2b4728996363.png">
				                    </a>
				                </div>
				                <div class="user-info col-sm-9">
				                    <div class="clearfix">
				                        <h2 class="pull-left">NickName</h2>
				                        <button class="btn btn-success pull-right btn-wide disabled">
				                            <i class="fas fa-plus"></i>팔로우
				                        </button>
				                    </div>
				                    <div class="user-points">
				                        <div class="user-point">
				                            <div class="user-point-label"><i class="fas fa-bolt"></i> 활동점수</div>
				                            <div class="user-point-num">0</div>
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
				
				        <div class="col-sm-2 user-info-nav pull-right"> <!-- activity Chech -->
				            <ul class="nav">
				                <li><a href="">최근 활동</a></li>
				                <li><a href="">게시물</a></li>
				                <li><a href="">스크랩</a></li>
				            </ul>
				        </div> <!-- /activity Check-->
				
				        <div class="col-sm-10 main-block-left pull-left"> <!-- activity List -->
				            <ul class="list-group">
				                <li class="list-group-item list-group-has-note">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-angle-up"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">(게시물번호) 게시물을 추천 하였습니다.</span>
				                            <span class="date">(게시물 작성 일자)</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                            <a href="">신입 개발자를 위한 간단한 포트폴리오 작성 팁</a>
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                    <a href="" class="avatar-photo">
				                                        <img src="<%=request.getContextPath() %>/images/437ec94ff99317bcb4a15730e1b5cf61.png">
				                                    </a>
				                                    <div class="avatar-info">
				                                        <a class="nickname" href="">(사용자1)</a>
				                                        <div class="activity">
				                                            <span class=""><i class="fas fa-bolt"></i> 73</span>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </h5>
				                        
				                    </div>
				                </li>
				
				                <li class="list-group-item list-group-has-note">
				                    <div class="list-icon-wrapper pull-left">
				                        <i class="fas fa-angle-up"></i>
				                    </div>
				                    <div class="list-title-wrapper list-activity">
				                        <div class="list-activity-desc">
				                            <span class="list-activity-desc-text">(게시물번호) 게시물을 추천 하였습니다.</span>
				                            <span class="date">(게시물 작성 일자)</span>
				                        </div>
				
				                        <h5 class="list-group-item-heading">
				                            <a href="">신입 개발자를 위한 간단한 포트폴리오 작성 팁</a>
				                            <div class="list-group-item-author pull-right clearfix">
				                                <div class="avatar clearfix avatar-x-small">
				                                    <a href="" class="avatar-photo">
				                                        <img src="<%=request.getContextPath() %>/images/437ec94ff99317bcb4a15730e1b5cf61.png">
				                                    </a>
				                                    <div class="avatar-info">
				                                        <a class="nickname" href="">(사용자1)</a>
				                                        <div class="activity">
				                                            <span class=""><i class="fas fa-bolt"></i> 73</span>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </h5>
				                    </div>
				                </li>
				            </ul>
				            
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
				        </div> <!-- /activity list -->
				    </div> <!-- /container -->
			    </div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>