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
					
							<table class=" table table-bordered">
								
								<tr>
									<td class="col-xs-3">
										<a href="<%=request.getContextPath() %>/view/member/company_content.jsp">
											<img src="<%=request.getContextPath() %>/images/profile01.png">
										</a>
									</td>
									<td class="col-xs-9">
										<h2>(회사 이름)</h2>
										<hr>
										<h4>회사소개</h4>
										<p>(회사 소개)</p>
									</td>
								</tr>
							</table>
							
							<hr>
							
							<h3>구인 이력</h3>
											
							<div class="row">
								<ul class="list-group list-title">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<div class="list-cont-wrapper">
											<span class="board_num">#(구인 글 번호)</span> 
											<span class="label label-primary">계약직</span>
											<span class="label label-success">정규직</span>
											(지역명)
											<br>
											(구인 글 제목)
										</div>
										
										<div class="list-like-wrapper">
											<i class="fas fa-thumbs-up"></i>(댓글수) 
											<i class="far fa-thumbs-up"></i>(추천수)
											<i class="far fa-eye"></i>(조회수)
										</div>
										
										<div class="list-mem-wrapper">
											<a href="#">
												<img src="<%=request.getContextPath() %>/images/profile01" class="thumnail-img">
											</a>
											<a href="#">
											(회사 이름)
											</a>
											(작성일자)
										</div>	
									</li>
								</ul>
							</div>	
							
						
					</div>
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>						


</body>
</html>