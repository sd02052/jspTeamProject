<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board_write</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
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

.mem-logo {
	width: 32px;
	height: 32px;
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
								<h4>Jobs</h4>
							</div>
						</div>
						<br>

						<div class="col-xs-12" style="border: 1px solid gray;">
							<ul class="list-inline">
								<li class="list-unstyled li1  img1"></li>
								<a class="text-left"> 
									<img class="mem-logo" src="<%=request.getContextPath()%>/images/company/${companyDTO.getCompany_logo() }">
								</a>
								</li>
								
								<li class="list-unstyled li1 a2">
									<div class="text-left">
										<span class="list-group-item-text article-id font">${companyDTO.getCompany_name() }</span>
										<p class="span">
										</p>
									</div>
								</li>
							</ul>
						</div>
						
						<form method="post" class="form-horizontal" action="<%=request.getContextPath() %>/member_job_post.do">
							<input type="hidden" name="num" value="${cate_num }">
							<input type="hidden" name="cate_group" value="${cate_group }">
							<input type="hidden" name="cate_step" value="${cate_step }">
							<input type="hidden" name="big" value="${big_category }">
							<input type="hidden" name="small" value="${small_category }">
							<!-- <input type="hidden" name="board_writer" /> -->
								<div class="col-xs-12 d" style="border: 1px solid gray;">
									<div class="form-group">
	
										<br> <label for="inputEmail3"
											class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<select class="form-control" name="category">
												<option value=${cate_num }>구인</option>
											</select>
										</div>
									</div>
									
									<!-- 제목,카테고리,내용을 어떻게보내야 하는지 정한다. -->
									<div class="form-group">
										<label for="inputEmail3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="inputEmail3" placeholder="제목을 입력해 주세요." name="title">
										</div>
									</div>
									
									<hr>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-4">
											<span><b>종류</b></span>  
											<div class="radio-check form-check-inline">
						                        <div class="radio form-check radio-inline">
						                            <label>
						                                <input type="radio" name="contract" value="0" checked>
						                                <span class="label label-success">정규직</span>
						                            </label>
						                          </div>
						                          <div class="radio form-check radio-inline">
						                            <label>
						                                <input type="radio" name="contract" value="1">
						                                <span class="label label-primary">계약직</span>
						                            </label>
						                          </div>
					                    	</div>
										</div>
										
										<div class="col-sm-4">
											<b>지역</b> <input name="location" class="form-control" placeholder="ex) OO시 OO구">
										</div>
										</div>
										
									<hr>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<h4><b>∙ 직무 정보</b></h4>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<b>직무</b>  
											<input name="doing" class="form-control" placeholder="ex) 프론트">
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<b>경력</b>  
											<select name="mincareer" class="form-control">
												<option value="">최소 경력</option> 
												<option value="0">신입</option>
												<option value="1">1년 이상</option>
												<option value="2">2년 이상</option>
												<option value="3">3년 이상</option>
												<option value="4">4년 이상</option>
												<option value="5">5년 이상</option>
												<option value="6">6년 이상</option>
												<option value="7">7년 이상</option>
												<option value="8">8년 이상</option>
												<option value="9">9년 이상</option>
												<option value="10">10년 이상</option>
												<option value="11">11년 이상</option>
												<option value="12">12년 이상</option>
												<option value="13">13년 이상</option>
												<option value="14">14년 이상</option>
												<option value="15">15년 이상</option>
											</select>
											<br>
											<select name="maxcareer" class="form-control">
												<option value="">최대 경력</option>
												<option value="0">무관</option>
												<option value="2">2년 미만</option>
												<option value="3">3년 미만</option>
												<option value="4">4년 미만</option>
												<option value="5">5년 미만</option>
												<option value="6">6년 미만</option>
												<option value="7">7년 미만</option>
												<option value="8">8년 미만</option>
												<option value="9">9년 미만</option>
												<option value="10">10년 미만</option>
												<option value="11">11년 미만</option>
												<option value="12">12년 미만</option>
												<option value="13">13년 미만</option>
												<option value="14">14년 미만</option>
												<option value="15">15년 미만</option>
											</select>
										
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<p><b>급여</b></p>  
											<div class="col-sm-6">
											<input name="mincost" class="form-control" placeholder="OOO">만 이상 ~
											</div>
											<div class="col-sm-6">
											<input name="maxcost" class="form-control" placeholder="OOO">만 미만
											</div>
											
										
										</div>
									</div>
									
									<hr>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<h4><b>∙ 프로젝트 정보</b></h4>
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
										<button type="button" class="btn btn-success" onclick="<%=request.getContextPath() %>/member_job_board_list.do?cate_num=16&big='menu5'&small='menu5-1'&cate_group=5&cate_step=0" style="float: right;" >취소</button>
									</div>
									<div class="col-xs-12 col-md-8">
										<br> <br>
										<input type="submit" class="btn btn-success" style="float: right;" value="등록">
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