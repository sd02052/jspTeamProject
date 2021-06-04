<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 회사인증관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style_admin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

/* css 파일 따로 작성시 부트스트랩 디자인 먼저 적용되므로 여기서 작성! */
/* 회사 인증 상태 - 대기 */
.badge-waitting {
    color: #fff;
    background-color: #0059AB;
}

/* 회사 인증 상태 - 승인 */
.badge-success {
    color: #fff;
    background-color: #449D44;
}

/* 회사 인증 상태 - 거절 */
.badge-reject {
    color: #fff;
    background-color: #ccc;
}

</style>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">

					<div class="article">
				
						<div class="nav">		
							<h4>회사인증관리</h4>
						</div>
	
						<br>

						<div class="row">
								
							<div class="col-xs-12">
								<ul class="list-group list-title">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<a class="member_img" href="<%=request.getContextPath()%>/view/member/member_personal.jsp"></a>
										<a class="member_nick" href="<%=request.getContextPath()%>/view/member/member_personal.jsp">닉네임</a>
										(활동점수)
										(작성일자)
									</li>
							
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<div class="row">						
											<div class="col-xs-10">
												<p class="cont-num">#(구인글번호)</p>
													<div class="col-xs-11">
														<p class="cont-title">(회사명)</p>
													</div>
													<div class="col-xs-1">
														<span class="badge badge-waitting">대기</span> 
													</div>
											
													<div class="col-xs-12">
														<table class="table cont-table">
															<tr>
																<th>회사명</th>
																<td>(회사명)</td>
																<td> &nbsp;&nbsp;&nbsp;</td>
																<th>직원수</th>
																<td>(직원수)</td>
															</tr>
															
															<tr>
																<th>사업자 등록번호</th>
																<td>(사업자 등록번호)</td>
																<td></td>
																<th>담당자명</th>
																<td>(담장자명)</td>
																<td></td>
															</tr>
															
															<tr>
																<th>대표 연락처</th>
																<td>(대표 연락처)</td>
																<td></td>
																<th>담당자 연락처</th>
																<td>(담당자 연락처)</td>
																<td></td>
															</tr>
												
															<tr>
																<th>대표 이메일</th>
																<td>(대표 이메일)</td>
																<td></td>
																<th>담당자 이메일</th>
																<td>(담당자 이메일)</td>
																<td></td>
															</tr>
															
															<tr>
																<th>회사 홈페이지</th>
																<td>(회사 홈페이지 주소)</td>
																<td colspan="4"></td>
															</tr>
															
															<tr>
																<th>회사 로고</th>
																<td colspan="2"></td>
																<th>사업자등록증</td>
																<td colspan="3"></td>
															</tr>
															
															<tr>
																<td colspan="3">
																	<img class="com-logo" src="image">
																</td>
																<td colspan="3">
																	<img class="com-regist" src="img">
																</td>
															</tr>
														</table>
													</div>
											</div>
							
											<div class="col-xs-2">		
												<div class="btn-group btn-verify">
													<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
														대기&nbsp;&nbsp;<span class="caret"></span></button>
														<ul class="dropdown-menu" role="menu">
													    	<li><a href="#">대기</a></li>
													    	<li><a href="#">승인</a></li>
													    	<li><a href="#">거절</a></li>
													  	</ul>
												</div>		
											</div>	
																			
										</div>
									</li>
								</ul>
							</div>
						</div>
		
		
						<div class="row">	
							<div class="col-xs-12">
								<ul class="list-group list-title">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<h5 class="cont-title-com">회사소개</h5>
									</li>
									<li class="list-group-item list-group-item-question list-group-has-note clearfix">
										<p>(주)씨인플러스는 IT서비스 / HR soulsion / AI machine runnung / deep running / 
										System Integration / System Maintenance / trade business 등 
										사업영역을 확장하고 적극적인 인재채용으로 성장하는 회사 입니다.</p>				
									</li>
								</ul>
							</div>
						</div>
		
					</div>
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

</body>
</html>