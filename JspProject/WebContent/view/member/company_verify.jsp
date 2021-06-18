<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="content">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div style="width: 805px; min-height: 800px;">
				
				<div id="article-create" class="content">
					<div class="content-header">
						<h3>회사 등록</h3>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<form method="post" id="article-form" enctype="multipart/form-data" class="article-form" action="<%=request.getContextPath() %>/member_company_verify.do">
								<fieldset class="form">
									<div class="alert alert-info">
										<strong>2017년 7월 13일</strong>부터는 <strong style="text-decoration: underline;">회사 정보 등록 및 인증을 받은 회원만</strong>
										 구인 게시판에 등록이 가능합니다.<br>
										 (7/13 이전까지는 '건너뛰기'로 회사 정보 등록 없이 작성 가능)<br>
										 별도의 인증 절차가 필요하오니 구인 게시판을 이용하실 기업 회원분들은 사전에 등록 및 인증을 받으시기를 바랍니다.<br><br>
										 구인 게시판을 이용하시는 모든 회원분들께 보다 많은 혜택과 서비스를 제공하기 위함이니 적극적으로 협조해 주시면 고맙겠습니다.<br><br>
										<span class="required-indicator">*</span> 항목은 필수 입력 입니다.
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>회사명
													<span class="required-indicator">*</span>
												</label>
												<input type="text" name="name" required placeholder="사업자등록증 상의 회사명을 입력해 주세요." class="form-control" id="name">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>사업자등록번호
													<span class="required-indicator">*</span>
												</label>
												<input type="text" name="license_num" required placeholder="숫자만 입력해 주세요." class="form-control" id="registerNumber">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>대표 연락처
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="boss_phone" required placeholder="000-0000-0000" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>대표 이메일
													<span class="required-indicator">*</span>
												</label>
												<input type="email" name="boss_email" required placeholder="" class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 연락처
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="charge_phone" required placeholder="000-0000-0000" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 이메일
													<span class="required-indicator">*</span>
												</label>
												<input type="email" name="charge_email" required placeholder="" class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 명
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="charge_name" required class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>사업자등록증
													<span class="required-indicator">*</span>
												</label>
												<input type="file" name="license_image" placeholder="사업자등록증을 첨부해 주세요." class="form-control">
												<p class="form-control-static input-guide">- 최대 10MB 까지 업로드 가능</p>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>직원 수</label>
												<select class="form-control" name="emp">
													<option value="5명 미만" selected>5명 미만</option>
													<option value="5 ~ 9명">5 ~ 9명</option>
													<option value="10 ~ 19명">10 ~ 19명</option>
													<option value="20 ~ 29명">20 ~ 29명</option>
													<option value="30 ~ 39명">30 ~ 39명</option>
													<option value="40 ~ 49명">40 ~ 49명</option>
													<option value="50 ~ 99명">50 ~ 99명</option>
													<option value="100 ~ 199명">100 ~ 199명</option>
													<option value="200명 이상">200명 이상</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>회사 홈페이지</label>
												<input type="url" name="homepage" placeholder="홈페이지 URL을 입력해 주세요." class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>회사 로고</label>
												<input type="file" name="logo" placeholder="회사로고를 첨부해 주세요." class="form-control">
												<p class="form-control-static input-guide">- 1024 X 1024 이하의 정사각형 이미지</p>
												<p class="form-control-static input-guide">- 최대 10MB 까지 업로드 가능</p>
											</div>
										</div>
									</div>
									
									<div class="form-group required">
										<label>회사 소개
											<span class="required-indicator">*</span>
										</label>
										<textarea rows="10" name="content" class="summernote form-control input-block-level" id="companyInfo.description" required></textarea>
										<br>
										
										<div class="nav" role="navigation">
											<fieldset class="buttons">
												<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="등록" id="create">
											</fieldset>
										</div>
										
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				
				
				
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>