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
								<h4>(카테고리명)</h4>
								<button type="button" class="btn-write create btn btn-success btn-wide pull-right"
								onclick="location.href='<%=request.getContextPath()%>/view/member/board_write'">
								<i class="fas fa-pencil-alt"></i>새 글 쓰기</button>
							</div>
							
							<br>
												
							
							<div class="cont">
								<table class="table table-bordered">
									<tr>
										<td colspan="12">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
												<img src="<%=request.getContextPath() %>/images/profile00.png" class="mem_logo_cont img-circle"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(글작성자 닉네임)</a>
											<i class="fas fa-bolt"></i>(활동점수)(작성일자)
											<span class="cont-count pull-right">
												<i class="fas fa-comment"></i>(댓글수)
												<i class="far fa-eye"></i>(조회수)
											</span>
										</td>
									</tr>
									<tr>
										<td class="col-md-10">
											<span class="cont-num">#(글번호)</span>
											<a href="">
												<span class="label label-info">(카테고리명)</span>
											</a><br>
											<span class="cont-title">(글제목)</span>
											<hr>
											<p>(글 내용)</p>
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
							</div>
							
							<br>
							
							<div class="comment">
								<table class="table table-bordered">
									<tr>
										<td colspan="12" class="active">
											<span class="comment-title">답변 (댓글 수)</span>
										</td>
									</tr>
									
									<!-- 다른 회원이 작성한 댓글 -->
									<tr>
										<td class="col-md-10">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
												<img src="<%=request.getContextPath() %>/images/profile00.png" class="mem_logo_cont img-circle"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(댓글작성자 닉네임)</a>
											(활동점수)(작성일자)
											<br><br>
											
											<p>(댓글 내용)</p>
										</td>
										
										<td class="col-md-2">
											<div class="cont-recommend">
												<a href="#">
													<i class="fas fa-angle-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
												</a>
													<p>(추천 수)</p>
												<a href="#">	
													<i class="fas fa-angle-down"  data-toggle="tooltip" data-placement="left" title="반대"></i>
												</a>
											</div>
										</td>
									</tr>
									
									<!-- 로그인한 사용자가 작성한 댓글 -->
									<tr>
										<td class="col-md-10">
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
												<img src="<%=request.getContextPath() %>/images/profile00.png" class="mem_logo_cont img-circle"></a>
											<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(로그인 닉네임)</a>
											(활동점수)(작성일자)
											<br><br>
											
											<p>(로그인한 사용자가 작성한 댓글 내용)</p>
										</td>
										
										<td class="col-md-2">
											<div class="cont-recommend">
												<a href="#">
													<i class="fas fa-angle-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
												</a>
													<p>(추천 수)</p>
												<a href="#">
													<i class="fas fa-angle-down"  data-toggle="tooltip" data-placement="left" title="반대"></i>
												</a>
											</div>
											
											<div class="dropdown">
												 <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
												 	<i class="fas fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i>
												</button>
												
												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
												    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">
												    	<i class="fas fa-edit"></i>수정
												    </a></li>
												    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">
												    	<i class="fas fa-trash-alt"></i>삭제
													</a></li>
												</ul>
											</div>
										</td>
									</tr>
									
									<!-- 댓글 작성창 -->
									
									<tr>
										<td colspan="10">
											<form method="post" action="">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
														<img src="<%=request.getContextPath() %>/images/profile00.png" class="mem_logo_cont img-circle"></a>
													<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(로그인 닉네임)</a>
													(활동점수)<br><br>
												<textarea class="form-control" placeholder="댓글 쓰기" rows="3"></textarea><br>
											<input type="submit" class="btn btn-success comment-submit pull-right" value="등록">
										</form>
									</tr>
									
								</table>
								
								<%-- 로그인 하지 않은 경우 댓글창 --%>
								<table class="table table-bordered">
									<tr>
										<td colspan="12" class="active">
											<span class="comment-title">답변 (댓글 수)</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>
											<a href="<%=request.getContextPath()%>/view/member/login.jsp">로그인</a>
											을 하시면 답변을 등록할 수 있습니다.</span>
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