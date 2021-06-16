<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board_write</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
	font-size: 14px;
}

.img1 {
	padding-top: 12px;
}

.a2 {
	padding-top: 12px;
}

.right {
	float: right;
}

.live {
	font-size: 14px;
}

.btn2 {
	color: gray;
	align: center;
	display: inline-block;
	font-size: 25px;
}

.div1 {
	text-align: center;
}

.noresize {
	resize: vertical;
}
</style>

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
							<div class="col-xs-12">
								<h4>커뮤니티</h4>
							</div>
						</div>
						<br>

						<div class="col-xs-12" style="border: 1px solid gray;">
							<ul class="list-inline">
								<li class="list-unstyled li1  img1"></li>
								<a class="avatar-photo text-left"> <img width="30"
									height="30" class="img-circle "
									src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
								</a>
								</li>
								
								<li class="list-unstyled li1 a2">
									<div class="text-left">
										<span class="list-group-item-text article-id font">가나다라</span>
										<p class="span">
											<i class="fas fa-bolt i1"></i>0
										</p>
									</div>
								</li>
							</ul>
						</div>
						
						<form action="member_board_post.do" method="post" class="form-horizontal">
						<input type="hidden" name="login_mem" value="${loginNum }">
						<!-- <input type="hidden" name="board_writer" /> -->
							<div class="col-xs-12 d" style="border: 1px solid gray;">
								<div class="form-group">

									<br> <label for="inputEmail3"
										class="col-md-2 control-label"></label>
									<div class="col-sm-8">
										<select class="form-control" name="category">
											<option>게시판을 선택해 주세요.</option>
											<option value="2">Tech Q&A</option> 
											<option value="3">Blockchain Q&A</option>
										</select>
									</div>
								</div>
								
								<!-- 제목,카테고리,내용을 어떻게보내야 하는지 정한다. -->
								<div class="form-group">
									<label for="inputEmail3" class="col-md-2 control-label"></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="제목을 입력해 주세요." name="title">
									</div>
								</div>
								
								<!-- 태그는 DB에 없어 잠시 빼놓음 -->
								<div class="form-group">
									<label for="inputPassword3" class="col-md-2 control-label"></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputPassword3"
											placeholder="Tags.">
									</div>
								</div>

								<div class="row">
									<label for="inputEmail3" class="col-md-2 control-label"></label>
									<div class="col-sm-8 ">
										<textarea class="form-control noresize" rows="15" name="content"></textarea>
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<br> <br>
									<button type="button" class="btn btn-success"
										style="float: right;">
										</i>취소
									</button>
								</div>
								<div class="col-xs-12 col-md-8">
									<br> <br>
									<button type="submit" class="btn btn-success"	
										
										style="float: right;">등록</button>
								</div>
						</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 본문 끝 -->
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>

</html>