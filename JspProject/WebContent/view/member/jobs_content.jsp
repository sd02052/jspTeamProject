<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - (글제목)</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style_admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

/* css 파일 따로 작성시 부트스트랩 디자인 먼저 적용되므로 여기서 작성! */
/* 스크랩 배지 */
.badge-scrap {
	width: 60px;
	height: 25px;
    color: #666;
    border: 1px solid #DEDEDE;
    background-color: #FFF;
}

</style>
<script type="text/javascript">

$(document).ready(function(){

  $('[data-toggle="tooltip"]').tooltip();   

});

</script>
</head>
<body>

	<div class="layout_container">
			<div class="main">
				<jsp:include page="../../include/side.jsp" />
					<div style="width: 805px; min-height: 800px;">
	
						<div id="article" class="div">
					
							<div class="nav">		
								<h4>구인</h4>
								<button type="button" class="btn-write create btn btn-success btn-wide pull-right"
								onclick="location.href='<%=request.getContextPath()%>/view/member/jobs_write'">
								<i class="fas fa-pencil-alt"></i>새 글 쓰기</button>
							</div>
							
							<br>
												
							
							<div class="cont">
								<table class="table table-bordered">
									<tr>
										<td colspan="12">
											<a href="<%=request.getContextPath()%>/view/member/company_content.jsp">
												<img src="<%=request.getContextPath() %>/images/profile00.png" class="mem_logo_cont img-circle"></a>
											<a href="<%=request.getContextPath()%>/view/member/company_content.jsp">(회사 이름)</a>
											(작성일자)
											<span class="cont-count pull-right">
												<i class="fas fa-comment"></i>(댓글수)
												<i class="far fa-eye"></i>(조회수)
											</span>
										</td>
									</tr>
									<tr>
										<td class="col-md-10">
											<span class="cont-title">(글제목)</span>
											<hr>
											
												<p><b>종류 : </b>
													<span class="label label-primary">계약직</span>
													<span class="label label-success">정규직</span>
												</p>		
												
												<p><b>지역 : </b> (지역)</p>			
												
												<hr>	
												
												<h4>∙ 직무 정보</h4>
												
												<p><b>직무 : </b>(직무)</p>
												<p><b>경력 : </b>(최소 경력)년 이상 ~ (최대 경력)년 이하</p>
												<p><b>급여 : </b>(최소 급여)만 이상 ~ (최대 급여)만 미만</p>
						
											<hr>
											
											<h4>∙ 프로젝트 정보</h4>
											<p>(구인 글 내용)</p>
													
											<hr>
											<h4>∙ 담당자 정보</h4>
											<p><b>담당자명 : </b>(담당자 이름)</p>
											<p><b>이메일 : </b>(담당자 이메일)</p>
											<p><b>연락처 : </b>(담당자 연락처)</p>
											
										</td>
						
										<td class="col-md-2">
											<div class="cont-like">
												<div class="cont-recommend">
													<a href="">
														<i class="fas fa-angle-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
													</a>
													<p>(추천 수)</p>
													<a href="">
														<i class="fas fa-angle-down"  data-toggle="tooltip" data-placement="left" title="반대"></i>
													</a>
												</div>
												
												<div class="cont-scrap">
													<a href="">
														<i class="fas fa-bookmark"  data-toggle="tooltip" data-placement="left" title="스크랩"></i><br>
													</a>
													<span class="badge-scrap badge">(스크랩 수)</span>
												</div>
												<div>
													<a href="">
														<i class="fab fa-facebook-square" data-toggle="tooltip" data-placement="left" title="페이스북 공유"></i>
													</a>
												</div>
											</div>
										</td>
									</tr>
								</table>
								
								<table class=" table table-bordered">
									<tr>
										<td colspan="12" class="active">
											회사정보
										</td>
									</tr>
									
									<tr>
										<td class="col-xs-3">
											<a href="<%=request.getContextPath() %>/view/member/company_content.jsp">
												<img src="<%=request.getContextPath() %>/images/profile01.png">
											</a>
										</td>
										<td class="col-xs-9">
											<a href="<%=request.getContextPath() %>/view/member/company_content.jsp">
												(회사 이름)
											</a>
											<hr>
											<p>(회사소개)</p>
										</td>
									</tr>
									
								</table>
								
							</div>
					
					</div>
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>						


</body>
</html>