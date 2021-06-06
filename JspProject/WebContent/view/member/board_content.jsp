<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - (글제목)</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/content.css">
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

/* padding 설정 */
.cont-member {
	padding: 3px 8px;
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
								<i class="fas fa-pencil-alt"></i>&nbsp;새 글 쓰기</button>
							</div>
							
							<br>
												
							
							<div class="cont">
								<table class="table table-bordered">
									<tr>
										<td colspan="12">
											<div class="cont-header">
												<div class="cont-member pull-left">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
													<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
												
									
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(글작성자 닉네임)</a>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;(활동점수)</span><br>
														
														<div class="cont-regdate">
														(작성일자)
														</div>
														
													</div>
												</div>
												
												<div class="cont-wrapper pull-right">
																<i class="comment-img fas fa-comment"></i>&nbsp;(댓글수)&nbsp;&nbsp;
																<i class="hit-img far fa-eye"></i>&nbsp;(조회수)
												</div>
												
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-md-10">
											<div class="cont-content">
												<span class="cont-num">#(글번호)</span>
												<a href="">
													<span class="label label-info"><i class="comment-img fas fa-comment"></i>&nbsp;(카테고리명)</span>
												</a><br>
												<span class="cont-title">(글제목)</span>
												<hr>
												<p>(글 내용)</p>
											</div>
										</td>
										
										<td class="col-md-2">
											<div class="cont-like text-center">
												<div class="cont-recommend">
													<a href="">
														<i class="img fas fa-angle-up fa-2x" data-toggle="tooltip" data-placement="left" title="추천"></i>
													</a>
													<p class="recommend-count">(추천 수)</p>
													<a href="">
														<i class="img fas fa-angle-down fa-2x"  data-toggle="tooltip" data-placement="left" title="반대"></i>
													</a>
												</div>
												
												<div class="cont-scrap">
													<a href="">
														<i class="img fas fa-bookmark fa-2x"  data-toggle="tooltip" data-placement="left" title="스크랩"></i><br>
													</a>
													<span class="badge-scrap badge">(스크랩 수)</span>
												</div>
												<div class="cont-facebook">
													<a href="">
														<i class="facebook-img fab fa-facebook-square" data-toggle="tooltip" data-placement="left" title="페이스북 공유"></i>
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
											<span class="comment-title">댓글 (댓글 수)</span>
										</td>
									</tr>
									
									<!-- 다른 회원이 작성한 댓글 -->
									<tr>
										<td class="col-md-10">
											<div class="cont-member pull-left">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
													<img src="<%=request.getContextPath() %>/images/profile01.png" class="cont-mem-logo img-circle"></a>
												
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(댓글작성자 닉네임)</a>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;(활동점수)</span><br>
														
														<div class="cont-regdate">
														(작성일자)
														</div>	
													</div>
											</div>
										
											<br><br><br>
											<div class="com-content pull-left">
												<p>(댓글 내용)</p>
											</div>
										</td>
										
										<td class="col-md-2">
											<div class="cont-recommend">
												<a href="">
													<i class="img fas fa-angle-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
												</a>
												<p class="com-recommend-count">(추천 수)</p>
												<a href="">
													<i class="img fas fa-angle-down"  data-toggle="tooltip" data-placement="left" title="반대"></i>
												</a>
											</div>
										</td>
									</tr>
									
									<!-- 로그인한 회원이 작성한 댓글 -->
									<tr>
										<td class="col-md-10">
											<div class="cont-member pull-left">
												<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
													<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
												
													<div class="cont-mem-info">
														<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(로그인한 회원 닉네임)</a>
														<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;(활동점수)</span><br>
														
														<div class="cont-regdate">
														(작성일자)
														</div>	
													</div>
											</div>
										
											<br><br><br>
											<div class="com-content pull-left">
												<p>(로그인한 회원이 작성한 댓글 내용)</p>
											</div>
										</td>
										
										<td class="col-md-2">
											<div class="cont-recommend">
												<a href="">
													<i class="img fas fa-angle-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
												</a>
												<p class="com-recommend-count">(추천 수)</p>
												<a href="">
													<i class="img fas fa-angle-down"  data-toggle="tooltip" data-placement="left" title="반대"></i>
												</a>
											</div>
											
											<div class="com-edit dropdown">
												 <button class="com-edit-btn btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
												 	<i class="facebook-img fas fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i>
												</button>
												
												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
												    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">
												    	<i class="fas fa-edit"></i>&nbsp;수정
												    </a></li>
												    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">
												    	<i class="fas fa-trash-alt"></i>&nbsp;삭제
													</a></li>
												</ul>
											</div>
										</td>
									</tr>
									
									<!-- 댓글 작성창 -->
									
									<tr>
										<td colspan="10">
											<form method="post" action="">
												<input type="hidden" name="com_writer">
												<input type="hidden" name="com_target">
												
												<div class="cont-member pull-left">
													<a href="<%=request.getContextPath()%>/view/member/member_personal.jsp">
														<img src="<%=request.getContextPath() %>/images/profile00.png" class="cont-mem-logo img-circle"></a>
													
														<div class="cont-mem-info">
															<a class="cont-mem-nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">(로그인한 회원 닉네임)</a>
															<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;(활동점수)</span><br>
															
															<div class="cont-regdate">
															(작성일자)
															</div>	
														</div>
												</div>
												
												<br><br><br>
												
												<textarea class="form-control" name="com_content" placeholder="댓글 쓰기" rows="3"></textarea><br>
											<input type="submit" class="btn btn-success comment-submit pull-right" value="등록">
										</form>
									</tr>
									
								</table>
								
								<%-- 로그인 하지 않은 경우 댓글창 --%>
								<table class="table table-bordered">
									<tr>
										<td colspan="12" class="active">
											<span class="comment-title">댓글 (댓글 수)</span>
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