<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-size: 10px;
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
<script type="text/javascript">
$(function(){
	$("#"+${big_category}).css("border-right","5px solid #e67d3e");
	$("#"+${small_category}).css("color","#fff");
})
</script>
<script type="text/javascript">
function boardEditCancle(){
	var flag = confirm('정말로 취소하시겠습니까?');
	if(flag == true){
	window.history.back();
	}
};
</script>
<script type="text/javascript">
function changeSelect(){ 
	var langSelect = document.getElementById("categorySelect");
	var selectValue = langSelect.options[langSelect.selectedIndex].value; 
	console.log(selectValue); 
	if(selectValue == 17){
		var flag = confirm("게시판 변경시 수정된 내용은 초기화 됩니다. 변경 하시겠습니까?");
		if(flag == true) {
			location.href="member_job_write_check.do?num=${cate_num }&big=${big_category }&small=${small_category }&cate_group=${cate_group}&cate_step=${cate_step }";
		} else {
			$("#categorySelect option:eq(0)").prop("selected", true);
		}
	}
};
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
								<h4>${cate_dto.getCate_name() }</h4>
							</div>
						</div>
						<br>

						<div class="col-xs-12" style="border-top: 1px solid gray;border-left: 1px solid gray;border-right: 1px solid gray;">
							<ul class="list-inline">
								<li class="list-unstyled li1 img1" style="padding-top: 10px;">
								<a class="avatar-photo text-left"> <img width="30"
									height="30" class="img-circle "
									src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
								</a>
								</li>

								<!-- 아이디 값 받아오기 -->

								<li class="list-unstyled li1 a2" style="padding-top: 10px;">
									<div class="text-left">
										<a href=""> <span
											class="list-group-item-text article-id font">${mem_dto.getMem_nick() }</span>
										</a>
										<p class="span">
											<i class="fas fa-bolt i1"></i>${mem_dto.getMem_score() }
										</p>
									</div>
								</li>
							</ul>
						</div>

						<form action="<%=request.getContextPath() %>/member_board_edit_ok.do" method="post" class="form-horizontal">
							<input type="hidden" name="board_writer" value="${mem_dto.getMem_num() }">
							<input type="hidden" name="board_num" value="${board_dto.getBoard_num() }">
							<input type="hidden" name="big" value="${big_category}">
							<input type="hidden" name="small" value="${small_category}">
							<div class="col-xs-12 d" style="border: 1px solid gray;">
								<div class="form-group">
									<br> <label for="inputEmail3" class="col-md-2 control-label"></label>
									<div class="col-sm-8">
										<select id="categorySelect" class="form-control" name="edit_category" required onchange="changeSelect()">
											<option value="">:::게시판 선택:::</option>
											<c:if test="${!empty cate_list }">
												<c:if test="${loginType == 'admin' }">
													<c:forEach items="${cate_list }" var="cateDTO">
														<c:if test="${cate_dto.getCate_num() != cateDTO.getCate_num() }">
															<option value="${cateDTO.getCate_num() }">${cateDTO.getCate_name() }</option>
														</c:if>
														<c:if test="${cate_dto.getCate_num() == cateDTO.getCate_num() }">
															<option value="${cateDTO.getCate_num() }" selected>${cateDTO.getCate_name() }</option>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${loginType == 'member' }">
													<c:forEach items="${cate_list }" var="cateDTO">
														<c:if test="${cateDTO.getCate_num() != 8}">
															<c:if test="${cate_dto.getCate_num() != cateDTO.getCate_num() }">
																<option value="${cateDTO.getCate_num() }">${cateDTO.getCate_name() }</option>
															</c:if>
															<c:if test="${cate_dto.getCate_num() == cateDTO.getCate_num() }">
																<option value="${cateDTO.getCate_num() }" selected>${cateDTO.getCate_name() }</option>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
											</c:if>
											<c:if test="${empty cate_list }">
												<option value="">카테고리 불러오기 실패</option>
											</c:if>
										</select>
									</div>
								</div>

								<!-- 제목,카테고리,내용을 어떻게보내야 하는지 정한다. -->
								<div class="form-group">
									<label for="inputEmail3" class="col-md-2 control-label"></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="제목을 입력해 주세요." name="edit_title" required value="${board_dto.getBoard_title()}">
									</div>
								</div>

								<div class="row">
									<label for="inputEmail3" class="col-md-2 control-label"></label>
									<div class="col-sm-8 ">
										<textarea class="form-control noresize" rows="15"
											name="edit_content" required>${board_dto.getBoard_content()}</textarea>
									</div>
								</div>
								<div class="col-xs-12 col-md-3">
									<br> <br>
									<input type="button" class="btn btn-default" style="float: right;" value="취소" onclick="return boardEditCancle()">
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