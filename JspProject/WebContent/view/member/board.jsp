<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
			<!-- 본문 시작-->


			<div style="width: 805px; min-height: 800px;">
				<div class="container-fluid">
					<div class="row">
						<div class="row">
							<div class="col-xs-12 col-md-8">
								<h4>커뮤니티</h4>
							</div>
							<div class="col-xs-12 col-md-4" align="right">
								<button type="button" class="btn btn-success">
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
										<div class="input-group" >
											<input type="search" class="form-control" id="search-field"
												placeholder="검색어">
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
						<div class="row " style="border: 1px solid gray; border-bottom-width: 0.5px;">

							<div class="col-xs-6">
								<div class="row">
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
								<div class="row">
									<h5 class="list-group-item-heading list-group-item-evaluate h">
										<a class="font_style">[OKKY Jobs] 프리랜서 개발자 대상 설문조사 결과 공유 !</a>
									</h5>
								</div>
							</div>
							<div class="col-xs-5">
								<div class="row">
									<div class="col-md-12">
										<ul class="list-inline">
											<li class="list-unstyled li1"><a class="li1"> <i
													class="fas fa-comment img"></i> 11
											</a></li>
											<li class="list-unstyled li1"><a class="li1"> <i
													class="fas fa-thumbs-up img"></i> 11
											</a></li>
											<li class="list-unstyled li1"><a class="li1"> <i
													class="far fa-eye"></i> 6k
											</a></li>

											<li class="list-unstyled li1  img1"></li>
											<a class="avatar-photo text-left"> <img width="30"
												height="30" class="img-circle "
												src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
											</a>
											</li>
											<li class="list-unstyled li1 a2">
												<div class="text-right">
													<a class="a1">OKKY</a><i class="fas fa-bolt i1"></i> 2k
													<p class="span">2021-05-27 09:27:16</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 두번째 -->

						<div class="row " style="border: 1px solid gray; border-top-width: 0.5px;">

							<div class="col-xs-6">
								<div class="row">
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
								<div class="row">
									<h5 class="list-group-item-heading list-group-item-evaluate h">
										<a class="font_style">[OKKY Jobs] 프리랜서 개발자 대상 설문조사 결과 공유 !</a>
									</h5>
								</div>
							</div>
							<div class="col-xs-5">
								<div class="row">
									<div class="col-md-12">
										<ul class="list-inline">
											<li class="list-unstyled li1"><a class="li1"> <i
													class="fas fa-comment img"></i> 11
											</a></li>
											<li class="list-unstyled li1"><a class="li1"> <i
													class="fas fa-thumbs-up img"></i> 11
											</a></li>
											<li class="list-unstyled li1"><a class="li1"> <i
													class="far fa-eye"></i> 6k
											</a></li>

											<li class="list-unstyled li1  img1"></li>
											<a class="avatar-photo text-left"> <img width="30"
												height="30" class="img-circle "
												src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
											</a>
											</li>
											<li class="list-unstyled li1 a2">
												<div class="text-right">
													<a class="a1">OKKY</a><i class="fas fa-bolt i1"></i> 2k
													<p class="span">2021-05-27 09:27:16</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 본문 끝 -->
				</div>
				<jsp:include page="../../include/footer.jsp" />
			</div>
		</div>
</body>

</html>