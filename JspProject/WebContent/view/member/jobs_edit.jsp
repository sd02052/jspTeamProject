<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - 구인 글 수정하기</title>
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
<script type="text/javascript">

$(function() {	/* 정규직이면 연봉, 비정규직이면 월급 노출 */
	$("input[type='radio'][name='contract']").click(function() {
		if($("input[type='radio'][name='contract']:checked").val() == 1) {
			$(".contract0").css("display", "block");
			$(".contract1").css("display", "none");
		}else {
			$(".contract0").css("display", "none");
			$(".contract1").css("display", "block");
		}
	});
});

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
						
						<form method="post" class="form-horizontal" action="<%=request.getContextPath() %>/member_job_edit_ok.do">
							<input type="hidden" name="num" value="${board_dto.getBoard_num() }">
							<input type="hidden" name="cate_num" value="${cate_dto.getCate_num() }">
							<input type="hidden" name="big" value="${big_category }">
							<input type="hidden" name="small" value="${small_category }">
							<input type="hidden" name="category" value="${board_dto.getBoard_category() }">
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
											<input type="text" class="form-control" id="inputEmail3" value="${board_dto.getBoard_title() }" name="title" required>
										</div>
									</div>
									
									<hr>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-4">
											<span><b>종류</b></span>  
											<div class="radio-check form-check-inline">
											
												<c:if test="${jobDTO.getJob_contract() eq 0 }">
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
						                        </c:if>
						                        
						                        <c:if test="${jobDTO.getJob_contract() eq 1 }">
							                        <div class="radio form-check radio-inline">
							                            <label>
							                                <input type="radio" name="contract" value="0">
							                                <span class="label label-success">정규직</span>
							                            </label>
							                          </div>
							                          <div class="radio form-check radio-inline">
							                            <label>
							                                <input type="radio" name="contract" value="1" checked>
							                                <span class="label label-primary">계약직</span>
							                            </label>
							                          </div>
						                        </c:if>
						                           
					                    	</div>
										</div>
										
										<div class="col-sm-4">
											<b>지역</b> <input name="location" class="form-control" value="${jobDTO.getJob_location() }" required>
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
											<input name="doing" class="form-control" value="${jobDTO.getJob_do() }" required>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<b>경력</b>  
											<select name="mincareer" class="form-control" required>
												<option value="">최소 경력</option> 
												<option value="0">신입</option>
												<c:forEach var="i" begin="1" end="15">
													<c:if test="${jobDTO.getJob_mincareer() eq i }">
														<option value="${i }" selected>${i }년 이상</option>
													</c:if>
													<c:if test="${jobDTO.getJob_mincareer() ne i }">
														<option value="${i }">${i }년 이상</option>
													</c:if>
												</c:forEach>
											</select>
											<br>
											<select name="maxcareer" class="form-control" required>
												<option value="">최대 경력</option>
												<option value="0">무관</option>
												<c:forEach var="i" begin="1" end="15">
													<c:if test="${jobDTO.getJob_maxcareer() eq i }">
														<option value="${i }" selected>${i }년 미만</option>
													</c:if>
													<c:if test="${jobDTO.getJob_maxcareer() ne i }">
														<option value="${i }">${i }년 미만</option>
													</c:if>
												</c:forEach>
											</select>
										
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputPassword3" class="col-md-2 control-label"></label>
										<div class="col-sm-8">
											<div class="contract1"><p><b>급여</b> 연봉</p></div>  
											<div class="contract0" style="display:none"><p><b>급여</b> 월급</p></div>  
											
												<div class="col-sm-6">
												<input name="mincost" class="form-control" value="${jobDTO.getJob_mincost() }" required>만 이상 ~
												</div>
												<div class="col-sm-6">
												<input name="maxcost" class="form-control" value="${jobDTO.getJob_maxcost() }" required>만 미만
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
											<textarea class="form-control noresize" rows="15" name="content" required>${board_dto.getBoard_content() }</textarea>
										</div>
									</div>
									<div class="col-xs-12 col-md-3">
										<br> <br>
										<button type="button" class="btn btn-default" onclick="<%=request.getContextPath() %>/member_job_content.do?num=${board_dto.getBoard_num() }&hit='yes'" style="float: right;" >취소</button>
									</div>
									<div class="col-xs-12 col-md-8">
										<br> <br>
										<input type="submit" class="btn btn-success" style="float: right;" value="수정">
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