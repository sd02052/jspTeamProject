<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

.font_style {
	font-weight: bold;
}

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
.ul1{
	padding: 20px;
}
</style>
<script type="text/javascript">
	/* $(function(){
		$(".nav-sidebar-category-label").css("display","none");
		$(".sidebar").css("width","58px");
		$("#search-google-form").css("display","none");
		$("#search-google-icon").css("display","block").css("height","65px").css("vertical-align","middle");
		$(".nav-sidebar-label").css("display","none");
		$(".nav-user").find("li").css("width","100%").css("float","none").css("border","none");
		
		$('.sidebar').addClass('sidebar-category');
		
	}); */
</script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div style="width: 805px; min-height: 800px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-md-8">
							<h4>커뮤니티</h4>
						</div>
						<div class="col-xs-12 col-md-4">
							<button type="button" class="btn btn-success">
								<i class="fas fa-pencil-alt"></i>새 글 쓰기
							</button>
						</div>
					</div>
					<br>
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
						<div class="col-md-4">
							<form class="form-inline">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount"></label>
									<div class="input-group">
										<input type="search" class="form-control" id="search-field"
											placeholder="검색어">
										<div class="input-group-addon">
											<button type="button" class="btn btn-link btn-xs">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<table class="table table-bordered">
					<td>
						<div class="col-md-6">

							<div class="panel panel-default">
								<ul class="list-group">
									<li
										class="list-group-item list-group-item-question list-group-has-note clearfix size">
										<div class="list-title-wrapper clearfix box">
											<div class="list-tag clearfix">
												<span class="list-group-item-text article-id font">#953490</span>
												<a
													class="list-group-item-text item-tag label label-info padding">
													<i class="fas fa-comment"></i> 공지사항
												</a> &nbsp; <a
													class="list-group-item-text item-tag label label1 padding font1">설문조사</a>
												<a
													class="list-group-item-text item-tag label label1 padding font1">jobs</a>
												<a
													class="list-group-item-text item-tag label label1 padding font1">프리랜서</a>
												<a
													class="list-group-item-text item-tag label label1 padding font1">개발자</a>
												<a
													class="list-group-item-text item-tag label label1 padding font1">okky</a>
											</div>
											<h5
												class="list-group-item-heading list-group-item-evaluate h">
												<a class="font_style">[OKKY Jobs] 프리랜서 개발자 대상 설문조사 결과 공유
													!</a>
											</h5>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-3">
							<div class="list-summary-wrapper clearfix">
								<div class="list-group-item-summary clearfix" align="center">
									<ul class="list-inline ul1" >
										<li class="list-unstyled">
										<a> <i class="fas fa-comment img"></i> 11</a>
										</li>
										<li class="list-unstyled">
										<a> <i class="fas fa-thumbs-up img"></i> 11</a>
										</li>
										<li class="list-unstyled">
										<a> <i class="far fa-eye"></i> 6k </a>
										</li>
									</ul>
								</div>
							</div>

						</div>
						<!-- img_okky -->
						<div class="col-md-3">
							<div class="list-group-item-author clearfix okky">
								<div class="avatar clearfix avatar-list ">
									<a class="avatar-photo"> <img width="30" height="30"
										class="img-circle"
										src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
									</a>
									<div class="avatar-info" align="center">
										<a>OKKY</a>
										<div class="activity">
											<i class="fas fa-bolt"></i> 2k
										</div>
										<div class="date-created">
											<span>2021-05-27 09:27:16</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</table>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>