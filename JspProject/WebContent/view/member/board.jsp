<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style/style.css">
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
</style>
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
						<div class="col-xs-6 col-md-4">
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
					<table class="table table-hover">
						<ul class="list-group">
							<li class="list-group-item list-group-item-question list-group-has-note clearfix">
								<div class="list-title-wrapper clearfix">
									<div class="list-tag clearfix">
										<span class="list-group-item-text article-id">#953490</span>
										<a class="list-group-item-text item-tag label label-info">
											<i class="fas fa-comment"></i>
											" 공지사항"
										</a>
										<a class="list-group-item-text item-tag label label-info ">설문조사</a>
										<a class="list-group-item-text item-tag label label-gray ">jobs</a>
										<a class="list-group-item-text item-tag label label-gray ">프리랜서</a>
										<a class="list-group-item-text item-tag label label-gray ">개발자</a>
										<a class="list-group-item-text item-tag label label-gray ">okky</a>
									</div>								
								</div>
							</li>
						</ul>
					</table>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>