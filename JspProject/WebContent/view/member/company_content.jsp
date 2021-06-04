<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div style="width: 805px; min-height: 800px;">
				
				<div id="user" class="content clearfix">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="avatar avatar-big clearfix col-sm-3 text-center">
								<a href="/company/info/1693" class="avatar-photo avatar-company"> <img src="<%=request.getContextPath() %>/images/company.png">
								</a>
							</div>
							<div class="user-info col-sm-9">
								<div class="clearfix">
									<h2 class="pull-left">(주)다온아이티에스</h2>
								</div>
								<hr>
								<div class="clearfix">
									<h4>회사 소개</h4>
									<p>(주)다온아이티에스(DAON,ITS)는 금융권 최고의 SI / SM 기업을 향해 도전하는 기업입니다.</p>
									<p>
										<br>
									</p>
									<p>(주)다온아이티에스(DAON,ITS)는 설립 후 현재 (주)KB데이터시스템 (주)SK C&C , 삼성 SDS , LG CNS등</p>
									<p>여러 기업들과 파트너(Partnership)을 맺고 제 1 , 2 금융권 및 그 외의 관공서들의 금융솔루션(Solution)</p>
									<p>개발에 참여하고 있으며 그 기술력을 대 / 내외적으로 인정받고 있습니다 .</p>
									<p>
										<br>
									</p>
									<p>
										(주)다온아이티에스(DAON,ITS)의 전직원은 최신 SI / SM 기술의 종합적 집적화가 요구되는 금융솔루션(Solution) 개발을 위해 최선을 다 할 것 입니다.<br>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<hr>
				
				<h3>구인 이력</h3>
				<ul class="list-group">
					<li class="list-group-item clearfix">
						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">#961822</span> <span class="label label-success">계약직</span> <span>서울 영등포구</span>
							</div>

							<h5 class="list-group-item-heading list-group-item-evaluate">
								<a href="/recruit/961822"> KB국민은행 사업관리 및 품질관리(QA) 고급개발자 구인 </a>
							</h5>
						</div>

						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
									<li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
									<li class=""><i class="item-icon fa fa-eye"></i> 1</li>
								</ul>
							</div>
						</div>

						<div class="list-group-item-author clearfix">
							<div class="avatar avatar-list clearfix">
								<a href="/company/info/1693" class="avatar-photo avatar-company"> <img src="<%=request.getContextPath() %>/images/company.png">
								</a>
								<div class="avatar-info">
									<a class="nickname" href="/company/info/1693" title="(주)다온아이티에스">(주)다온아이티에스</a>

									<div class="date-created">
										<span class="timeago" title="2021-06-04T11:13:56">2021-06-04 11:13:56</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					
					<li class="list-group-item clearfix">
						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">#961822</span> <span class="label label-success">계약직</span> <span>서울 영등포구</span>
							</div>

							<h5 class="list-group-item-heading list-group-item-evaluate">
								<a href="/recruit/961822"> KB국민은행 사업관리 및 품질관리(QA) 고급개발자 구인 </a>
							</h5>
						</div>

						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
									<li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
									<li class=""><i class="item-icon fa fa-eye"></i> 1</li>
								</ul>
							</div>
						</div>

						<div class="list-group-item-author clearfix">
							<div class="avatar avatar-list clearfix">
								<a href="/company/info/1693" class="avatar-photo avatar-company"> <img src="<%=request.getContextPath() %>/images/company.png">
								</a>
								<div class="avatar-info">
									<a class="nickname" href="/company/info/1693" title="(주)다온아이티에스">(주)다온아이티에스</a>
									<div class="date-created">
										<span class="timeago" title="2021-06-04T11:13:56">2021-06-04 11:13:56</span>
									</div>
								</div>
							</div>
						</div>
					</li>					
				</ul>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>