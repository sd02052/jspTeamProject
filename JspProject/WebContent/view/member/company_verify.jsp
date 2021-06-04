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
				
				<div id="article-create" class="content">
					<div class="content-header">
						<h3>회사 등록</h3>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<form method="post" id="article-form" enctype="multipart/form-data" class="article-form" action="company_reg_ok.do">
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
												<input type="text" name="registerNumber" required placeholder="숫자만 입력해 주세요." class="form-control" id="registerNumber">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>대표 연락처
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="tel" required placeholder="000-0000-0000" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>대표 이메일
													<span class="required-indicator">*</span>
												</label>
												<input type="email" name="email" required placeholder="숫자만 입력해 주세요." class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 연락처
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="managerTel" required placeholder="000-0000-0000" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 이메일
													<span class="required-indicator">*</span>
												</label>
												<input type="email" name="managerEmail" required placeholder="숫자만 입력해 주세요." class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>담당자 명
													<span class="required-indicator">*</span>
												</label>
												<input type="tel" name="managerName" required class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>사업자등록증
													<span class="required-indicator">*</span>
												</label>
												<input type="file" name="infoFile" placeholder="사업자등록증을 첨부해 주세요." class="form-control">
												<p class="form-control-static input-guide">- 최대 10MB 까지 업로드 가능</p>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>직원 수</label>
												<select class="form-control" name="employeeNumber">
													<option value="5">5명 미만</option>
													<option value="10">5 ~ 9명</option>
													<option value="20">10 ~ 19명</option>
													<option value="30">20 ~ 29명</option>
													<option value="40">30 ~ 39명</option>
													<option value="50">40 ~ 49명</option>
													<option value="100">50 ~ 99명</option>
													<option value="200">100 ~ 199명</option>
													<option value="999">200명 이상</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group required">
												<label>회사 홈페이지</label>
												<input type="url" name="homepageUrl" placeholder="홈페이지 URL을 입력해 주세요." class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group required">
												<label>회사 로고</label>
												<input type="file" name="logoFile" placeholder="회사로고를 첨부해 주세요." class="form-control">
												<p class="form-control-static input-guide">- 1024 X 1024 이하의 정사각형 이미지</p>
												<p class="form-control-static input-guide">- 최대 1-MB 까지 업로드 가능</p>
											</div>
										</div>
									</div>
									
									<div class="form-group required">
										<label>회사 소개
											<span class="required-indicator">*</span>
										</label>
										<textarea rows="20" name="description" class="summernote form-control input-block-level" id="companyInfo.description" style="display: none;"></textarea>
										<div class="note-editor panel panel-default">
											<div class="note-toolbar panel-heading">
												<div class="note-style btn-group">
													<div class="btn-group" data-name="style">
														<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="스타일">
															<i class="fa fa-magic"></i> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a data-event="formatBlock" href="#" data-value="p">본문</a></li>
															<li><a data-event="formatBlock" href="#" data-value="blockquote"><blockquote>인용구</blockquote></a></li>
															<li><a data-event="formatBlock" href="#" data-value="pre">코드</a></li>
															<li><a data-event="formatBlock" href="#" data-value="h1"><h1>제목 1</h1></a></li>
															<li><a data-event="formatBlock" href="#" data-value="h2"><h2>제목 2</h2></a></li>
															<li><a data-event="formatBlock" href="#" data-value="h3"><h3>제목 3</h3></a></li>
															<li><a data-event="formatBlock" href="#" data-value="h4"><h4>제목 4</h4></a></li>
															<li><a data-event="formatBlock" href="#" data-value="h5"><h5>제목 5</h5></a></li>
															<li><a data-event="formatBlock" href="#" data-value="h6"><h6>제목 6</h6></a></li>
														</ul>
													</div>
												</div>
												<div class="note-font btn-group">
													<button type="button" class="btn btn-default btn-sm" title="" data-event="bold" tabindex="-1" data-name="bold" data-original-title="굵게 (CTRL+B)">
														<i class="fa fa-bold"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="italic" tabindex="-1" data-name="italic" data-original-title="기울임꼴 (CTRL+I)">
														<i class="fa fa-italic"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="underline" tabindex="-1" data-name="underline" data-original-title="밑줄 (CTRL+U)">
														<i class="fa fa-underline"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="strikethrough" tabindex="-1" data-name="strikethrough" data-original-title="Strikethrough (CTRL+SHIFT+S)">
														<i class="fa fa-strikethrough"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="removeFormat" tabindex="-1" data-name="clear" data-original-title="글자 효과 없애기 (CTRL+\)">
														<i class="fa fa-eraser"></i>
													</button>
												</div>
												<div class="note-color btn-group">
													<button type="button" class="btn btn-default btn-sm note-recent-color" title="" data-event="color" data-value="{&quot;backColor&quot;:&quot;yellow&quot;}" tabindex="-1" data-name="color" data-original-title="마지막으로 사용한 색">
														<i class="fa fa-font" style="color: black; background-color: yellow;"></i>
													</button>
													<div class="btn-group" data-name="color">
														<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="다른 색 선택">
															<span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><div class="btn-group">
																	<div class="note-palette-title">배경색</div>
																	<div class="note-color-reset" data-event="backColor" data-value="inherit" title="투명">투명</div>
																	<div class="note-color-palette" data-target-event="backColor">
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #000000;" data-event="backColor" data-value="#000000" title="" data-toggle="button" tabindex="-1" data-original-title="#000000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #424242;" data-event="backColor" data-value="#424242" title="" data-toggle="button" tabindex="-1" data-original-title="#424242"></button>
																			<button type="button" class="note-color-btn" style="background-color: #636363;" data-event="backColor" data-value="#636363" title="" data-toggle="button" tabindex="-1" data-original-title="#636363"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9C9C94;" data-event="backColor" data-value="#9C9C94" title="" data-toggle="button" tabindex="-1" data-original-title="#9C9C94"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEC6CE;" data-event="backColor" data-value="#CEC6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#CEC6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #EFEFEF;" data-event="backColor" data-value="#EFEFEF" title="" data-toggle="button" tabindex="-1" data-original-title="#EFEFEF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #F7F7F7;" data-event="backColor" data-value="#F7F7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#F7F7F7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFFFFF;" data-event="backColor" data-value="#FFFFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFFFF"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #FF0000;" data-event="backColor" data-value="#FF0000" title="" data-toggle="button" tabindex="-1" data-original-title="#FF0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FF9C00;" data-event="backColor" data-value="#FF9C00" title="" data-toggle="button" tabindex="-1" data-original-title="#FF9C00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFFF00;" data-event="backColor" data-value="#FFFF00" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFF00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #00FF00;" data-event="backColor" data-value="#00FF00" title="" data-toggle="button" tabindex="-1" data-original-title="#00FF00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #00FFFF;" data-event="backColor" data-value="#00FFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#00FFFF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #0000FF;" data-event="backColor" data-value="#0000FF" title="" data-toggle="button" tabindex="-1" data-original-title="#0000FF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9C00FF;" data-event="backColor" data-value="#9C00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#9C00FF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FF00FF;" data-event="backColor" data-value="#FF00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#FF00FF"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #F7C6CE;" data-event="backColor" data-value="#F7C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#F7C6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFE7CE;" data-event="backColor" data-value="#FFE7CE" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE7CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFEFC6;" data-event="backColor" data-value="#FFEFC6" title="" data-toggle="button" tabindex="-1" data-original-title="#FFEFC6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6EFD6;" data-event="backColor" data-value="#D6EFD6" title="" data-toggle="button" tabindex="-1" data-original-title="#D6EFD6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEDEE7;" data-event="backColor" data-value="#CEDEE7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEDEE7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEE7F7;" data-event="backColor" data-value="#CEE7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEE7F7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6D6E7;" data-event="backColor" data-value="#D6D6E7" title="" data-toggle="button" tabindex="-1" data-original-title="#D6D6E7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #E7D6DE;" data-event="backColor" data-value="#E7D6DE" title="" data-toggle="button" tabindex="-1" data-original-title="#E7D6DE"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #E79C9C;" data-event="backColor" data-value="#E79C9C" title="" data-toggle="button" tabindex="-1" data-original-title="#E79C9C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFC69C;" data-event="backColor" data-value="#FFC69C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFC69C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFE79C;" data-event="backColor" data-value="#FFE79C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE79C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B5D6A5;" data-event="backColor" data-value="#B5D6A5" title="" data-toggle="button" tabindex="-1" data-original-title="#B5D6A5"></button>
																			<button type="button" class="note-color-btn" style="background-color: #A5C6CE;" data-event="backColor" data-value="#A5C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#A5C6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9CC6EF;" data-event="backColor" data-value="#9CC6EF" title="" data-toggle="button" tabindex="-1" data-original-title="#9CC6EF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B5A5D6;" data-event="backColor" data-value="#B5A5D6" title="" data-toggle="button" tabindex="-1" data-original-title="#B5A5D6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6A5BD;" data-event="backColor" data-value="#D6A5BD" title="" data-toggle="button" tabindex="-1" data-original-title="#D6A5BD"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #E76363;" data-event="backColor" data-value="#E76363" title="" data-toggle="button" tabindex="-1" data-original-title="#E76363"></button>
																			<button type="button" class="note-color-btn" style="background-color: #F7AD6B;" data-event="backColor" data-value="#F7AD6B" title="" data-toggle="button" tabindex="-1" data-original-title="#F7AD6B"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFD663;" data-event="backColor" data-value="#FFD663" title="" data-toggle="button" tabindex="-1" data-original-title="#FFD663"></button>
																			<button type="button" class="note-color-btn" style="background-color: #94BD7B;" data-event="backColor" data-value="#94BD7B" title="" data-toggle="button" tabindex="-1" data-original-title="#94BD7B"></button>
																			<button type="button" class="note-color-btn" style="background-color: #73A5AD;" data-event="backColor" data-value="#73A5AD" title="" data-toggle="button" tabindex="-1" data-original-title="#73A5AD"></button>
																			<button type="button" class="note-color-btn" style="background-color: #6BADDE;" data-event="backColor" data-value="#6BADDE" title="" data-toggle="button" tabindex="-1" data-original-title="#6BADDE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #8C7BC6;" data-event="backColor" data-value="#8C7BC6" title="" data-toggle="button" tabindex="-1" data-original-title="#8C7BC6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #C67BA5;" data-event="backColor" data-value="#C67BA5" title="" data-toggle="button" tabindex="-1" data-original-title="#C67BA5"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #CE0000;" data-event="backColor" data-value="#CE0000" title="" data-toggle="button" tabindex="-1" data-original-title="#CE0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #E79439;" data-event="backColor" data-value="#E79439" title="" data-toggle="button" tabindex="-1" data-original-title="#E79439"></button>
																			<button type="button" class="note-color-btn" style="background-color: #EFC631;" data-event="backColor" data-value="#EFC631" title="" data-toggle="button" tabindex="-1" data-original-title="#EFC631"></button>
																			<button type="button" class="note-color-btn" style="background-color: #6BA54A;" data-event="backColor" data-value="#6BA54A" title="" data-toggle="button" tabindex="-1" data-original-title="#6BA54A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #4A7B8C;" data-event="backColor" data-value="#4A7B8C" title="" data-toggle="button" tabindex="-1" data-original-title="#4A7B8C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #3984C6;" data-event="backColor" data-value="#3984C6" title="" data-toggle="button" tabindex="-1" data-original-title="#3984C6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #634AA5;" data-event="backColor" data-value="#634AA5" title="" data-toggle="button" tabindex="-1" data-original-title="#634AA5"></button>
																			<button type="button" class="note-color-btn" style="background-color: #A54A7B;" data-event="backColor" data-value="#A54A7B" title="" data-toggle="button" tabindex="-1" data-original-title="#A54A7B"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #9C0000;" data-event="backColor" data-value="#9C0000" title="" data-toggle="button" tabindex="-1" data-original-title="#9C0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B56308;" data-event="backColor" data-value="#B56308" title="" data-toggle="button" tabindex="-1" data-original-title="#B56308"></button>
																			<button type="button" class="note-color-btn" style="background-color: #BD9400;" data-event="backColor" data-value="#BD9400" title="" data-toggle="button" tabindex="-1" data-original-title="#BD9400"></button>
																			<button type="button" class="note-color-btn" style="background-color: #397B21;" data-event="backColor" data-value="#397B21" title="" data-toggle="button" tabindex="-1" data-original-title="#397B21"></button>
																			<button type="button" class="note-color-btn" style="background-color: #104A5A;" data-event="backColor" data-value="#104A5A" title="" data-toggle="button" tabindex="-1" data-original-title="#104A5A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #085294;" data-event="backColor" data-value="#085294" title="" data-toggle="button" tabindex="-1" data-original-title="#085294"></button>
																			<button type="button" class="note-color-btn" style="background-color: #311873;" data-event="backColor" data-value="#311873" title="" data-toggle="button" tabindex="-1" data-original-title="#311873"></button>
																			<button type="button" class="note-color-btn" style="background-color: #731842;" data-event="backColor" data-value="#731842" title="" data-toggle="button" tabindex="-1" data-original-title="#731842"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #630000;" data-event="backColor" data-value="#630000" title="" data-toggle="button" tabindex="-1" data-original-title="#630000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #7B3900;" data-event="backColor" data-value="#7B3900" title="" data-toggle="button" tabindex="-1" data-original-title="#7B3900"></button>
																			<button type="button" class="note-color-btn" style="background-color: #846300;" data-event="backColor" data-value="#846300" title="" data-toggle="button" tabindex="-1" data-original-title="#846300"></button>
																			<button type="button" class="note-color-btn" style="background-color: #295218;" data-event="backColor" data-value="#295218" title="" data-toggle="button" tabindex="-1" data-original-title="#295218"></button>
																			<button type="button" class="note-color-btn" style="background-color: #083139;" data-event="backColor" data-value="#083139" title="" data-toggle="button" tabindex="-1" data-original-title="#083139"></button>
																			<button type="button" class="note-color-btn" style="background-color: #003163;" data-event="backColor" data-value="#003163" title="" data-toggle="button" tabindex="-1" data-original-title="#003163"></button>
																			<button type="button" class="note-color-btn" style="background-color: #21104A;" data-event="backColor" data-value="#21104A" title="" data-toggle="button" tabindex="-1" data-original-title="#21104A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #4A1031;" data-event="backColor" data-value="#4A1031" title="" data-toggle="button" tabindex="-1" data-original-title="#4A1031"></button>
																		</div>
																	</div>
																</div>
																<div class="btn-group">
																	<div class="note-palette-title">글자색</div>
																	<div class="note-color-reset" data-event="foreColor" data-value="inherit" title="취소">기본 값으로 변경</div>
																	<div class="note-color-palette" data-target-event="foreColor">
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #000000;" data-event="foreColor" data-value="#000000" title="" data-toggle="button" tabindex="-1" data-original-title="#000000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #424242;" data-event="foreColor" data-value="#424242" title="" data-toggle="button" tabindex="-1" data-original-title="#424242"></button>
																			<button type="button" class="note-color-btn" style="background-color: #636363;" data-event="foreColor" data-value="#636363" title="" data-toggle="button" tabindex="-1" data-original-title="#636363"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9C9C94;" data-event="foreColor" data-value="#9C9C94" title="" data-toggle="button" tabindex="-1" data-original-title="#9C9C94"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEC6CE;" data-event="foreColor" data-value="#CEC6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#CEC6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #EFEFEF;" data-event="foreColor" data-value="#EFEFEF" title="" data-toggle="button" tabindex="-1" data-original-title="#EFEFEF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #F7F7F7;" data-event="foreColor" data-value="#F7F7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#F7F7F7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFFFFF;" data-event="foreColor" data-value="#FFFFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFFFF"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #FF0000;" data-event="foreColor" data-value="#FF0000" title="" data-toggle="button" tabindex="-1" data-original-title="#FF0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FF9C00;" data-event="foreColor" data-value="#FF9C00" title="" data-toggle="button" tabindex="-1" data-original-title="#FF9C00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFFF00;" data-event="foreColor" data-value="#FFFF00" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFF00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #00FF00;" data-event="foreColor" data-value="#00FF00" title="" data-toggle="button" tabindex="-1" data-original-title="#00FF00"></button>
																			<button type="button" class="note-color-btn" style="background-color: #00FFFF;" data-event="foreColor" data-value="#00FFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#00FFFF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #0000FF;" data-event="foreColor" data-value="#0000FF" title="" data-toggle="button" tabindex="-1" data-original-title="#0000FF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9C00FF;" data-event="foreColor" data-value="#9C00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#9C00FF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FF00FF;" data-event="foreColor" data-value="#FF00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#FF00FF"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #F7C6CE;" data-event="foreColor" data-value="#F7C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#F7C6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFE7CE;" data-event="foreColor" data-value="#FFE7CE" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE7CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFEFC6;" data-event="foreColor" data-value="#FFEFC6" title="" data-toggle="button" tabindex="-1" data-original-title="#FFEFC6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6EFD6;" data-event="foreColor" data-value="#D6EFD6" title="" data-toggle="button" tabindex="-1" data-original-title="#D6EFD6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEDEE7;" data-event="foreColor" data-value="#CEDEE7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEDEE7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #CEE7F7;" data-event="foreColor" data-value="#CEE7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEE7F7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6D6E7;" data-event="foreColor" data-value="#D6D6E7" title="" data-toggle="button" tabindex="-1" data-original-title="#D6D6E7"></button>
																			<button type="button" class="note-color-btn" style="background-color: #E7D6DE;" data-event="foreColor" data-value="#E7D6DE" title="" data-toggle="button" tabindex="-1" data-original-title="#E7D6DE"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #E79C9C;" data-event="foreColor" data-value="#E79C9C" title="" data-toggle="button" tabindex="-1" data-original-title="#E79C9C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFC69C;" data-event="foreColor" data-value="#FFC69C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFC69C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFE79C;" data-event="foreColor" data-value="#FFE79C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE79C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B5D6A5;" data-event="foreColor" data-value="#B5D6A5" title="" data-toggle="button" tabindex="-1" data-original-title="#B5D6A5"></button>
																			<button type="button" class="note-color-btn" style="background-color: #A5C6CE;" data-event="foreColor" data-value="#A5C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#A5C6CE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #9CC6EF;" data-event="foreColor" data-value="#9CC6EF" title="" data-toggle="button" tabindex="-1" data-original-title="#9CC6EF"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B5A5D6;" data-event="foreColor" data-value="#B5A5D6" title="" data-toggle="button" tabindex="-1" data-original-title="#B5A5D6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #D6A5BD;" data-event="foreColor" data-value="#D6A5BD" title="" data-toggle="button" tabindex="-1" data-original-title="#D6A5BD"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #E76363;" data-event="foreColor" data-value="#E76363" title="" data-toggle="button" tabindex="-1" data-original-title="#E76363"></button>
																			<button type="button" class="note-color-btn" style="background-color: #F7AD6B;" data-event="foreColor" data-value="#F7AD6B" title="" data-toggle="button" tabindex="-1" data-original-title="#F7AD6B"></button>
																			<button type="button" class="note-color-btn" style="background-color: #FFD663;" data-event="foreColor" data-value="#FFD663" title="" data-toggle="button" tabindex="-1" data-original-title="#FFD663"></button>
																			<button type="button" class="note-color-btn" style="background-color: #94BD7B;" data-event="foreColor" data-value="#94BD7B" title="" data-toggle="button" tabindex="-1" data-original-title="#94BD7B"></button>
																			<button type="button" class="note-color-btn" style="background-color: #73A5AD;" data-event="foreColor" data-value="#73A5AD" title="" data-toggle="button" tabindex="-1" data-original-title="#73A5AD"></button>
																			<button type="button" class="note-color-btn" style="background-color: #6BADDE;" data-event="foreColor" data-value="#6BADDE" title="" data-toggle="button" tabindex="-1" data-original-title="#6BADDE"></button>
																			<button type="button" class="note-color-btn" style="background-color: #8C7BC6;" data-event="foreColor" data-value="#8C7BC6" title="" data-toggle="button" tabindex="-1" data-original-title="#8C7BC6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #C67BA5;" data-event="foreColor" data-value="#C67BA5" title="" data-toggle="button" tabindex="-1" data-original-title="#C67BA5"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #CE0000;" data-event="foreColor" data-value="#CE0000" title="" data-toggle="button" tabindex="-1" data-original-title="#CE0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #E79439;" data-event="foreColor" data-value="#E79439" title="" data-toggle="button" tabindex="-1" data-original-title="#E79439"></button>
																			<button type="button" class="note-color-btn" style="background-color: #EFC631;" data-event="foreColor" data-value="#EFC631" title="" data-toggle="button" tabindex="-1" data-original-title="#EFC631"></button>
																			<button type="button" class="note-color-btn" style="background-color: #6BA54A;" data-event="foreColor" data-value="#6BA54A" title="" data-toggle="button" tabindex="-1" data-original-title="#6BA54A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #4A7B8C;" data-event="foreColor" data-value="#4A7B8C" title="" data-toggle="button" tabindex="-1" data-original-title="#4A7B8C"></button>
																			<button type="button" class="note-color-btn" style="background-color: #3984C6;" data-event="foreColor" data-value="#3984C6" title="" data-toggle="button" tabindex="-1" data-original-title="#3984C6"></button>
																			<button type="button" class="note-color-btn" style="background-color: #634AA5;" data-event="foreColor" data-value="#634AA5" title="" data-toggle="button" tabindex="-1" data-original-title="#634AA5"></button>
																			<button type="button" class="note-color-btn" style="background-color: #A54A7B;" data-event="foreColor" data-value="#A54A7B" title="" data-toggle="button" tabindex="-1" data-original-title="#A54A7B"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #9C0000;" data-event="foreColor" data-value="#9C0000" title="" data-toggle="button" tabindex="-1" data-original-title="#9C0000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #B56308;" data-event="foreColor" data-value="#B56308" title="" data-toggle="button" tabindex="-1" data-original-title="#B56308"></button>
																			<button type="button" class="note-color-btn" style="background-color: #BD9400;" data-event="foreColor" data-value="#BD9400" title="" data-toggle="button" tabindex="-1" data-original-title="#BD9400"></button>
																			<button type="button" class="note-color-btn" style="background-color: #397B21;" data-event="foreColor" data-value="#397B21" title="" data-toggle="button" tabindex="-1" data-original-title="#397B21"></button>
																			<button type="button" class="note-color-btn" style="background-color: #104A5A;" data-event="foreColor" data-value="#104A5A" title="" data-toggle="button" tabindex="-1" data-original-title="#104A5A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #085294;" data-event="foreColor" data-value="#085294" title="" data-toggle="button" tabindex="-1" data-original-title="#085294"></button>
																			<button type="button" class="note-color-btn" style="background-color: #311873;" data-event="foreColor" data-value="#311873" title="" data-toggle="button" tabindex="-1" data-original-title="#311873"></button>
																			<button type="button" class="note-color-btn" style="background-color: #731842;" data-event="foreColor" data-value="#731842" title="" data-toggle="button" tabindex="-1" data-original-title="#731842"></button>
																		</div>
																		<div class="note-color-row">
																			<button type="button" class="note-color-btn" style="background-color: #630000;" data-event="foreColor" data-value="#630000" title="" data-toggle="button" tabindex="-1" data-original-title="#630000"></button>
																			<button type="button" class="note-color-btn" style="background-color: #7B3900;" data-event="foreColor" data-value="#7B3900" title="" data-toggle="button" tabindex="-1" data-original-title="#7B3900"></button>
																			<button type="button" class="note-color-btn" style="background-color: #846300;" data-event="foreColor" data-value="#846300" title="" data-toggle="button" tabindex="-1" data-original-title="#846300"></button>
																			<button type="button" class="note-color-btn" style="background-color: #295218;" data-event="foreColor" data-value="#295218" title="" data-toggle="button" tabindex="-1" data-original-title="#295218"></button>
																			<button type="button" class="note-color-btn" style="background-color: #083139;" data-event="foreColor" data-value="#083139" title="" data-toggle="button" tabindex="-1" data-original-title="#083139"></button>
																			<button type="button" class="note-color-btn" style="background-color: #003163;" data-event="foreColor" data-value="#003163" title="" data-toggle="button" tabindex="-1" data-original-title="#003163"></button>
																			<button type="button" class="note-color-btn" style="background-color: #21104A;" data-event="foreColor" data-value="#21104A" title="" data-toggle="button" tabindex="-1" data-original-title="#21104A"></button>
																			<button type="button" class="note-color-btn" style="background-color: #4A1031;" data-event="foreColor" data-value="#4A1031" title="" data-toggle="button" tabindex="-1" data-original-title="#4A1031"></button>
																		</div>
																	</div>
																</div></li>
														</ul>
													</div>
												</div>
												<div class="note-para btn-group">
													<button type="button" class="btn btn-default btn-sm" title="" data-event="insertUnorderedList" tabindex="-1" data-name="ul" data-original-title="글머리 기호 (CTRL+SHIFT+NUM7)">
														<i class="fa fa-list-ul"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="insertOrderedList" tabindex="-1" data-name="ol" data-original-title="번호 매기기 (CTRL+SHIFT+NUM8)">
														<i class="fa fa-list-ol"></i>
													</button>
													<div class="btn-group" data-name="table">
														<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="테이블">
															<i class="fa fa-table"></i> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu note-table">
															<div class="note-dimension-picker">
																<div class="note-dimension-picker-mousecatcher" data-event="insertTable" data-value="1x1" style="width: 10em; height: 10em;"></div>
																<div class="note-dimension-picker-highlighted"></div>
																<div class="note-dimension-picker-unhighlighted"></div>
															</div>
															<div class="note-dimension-display">1 x 1</div>
														</ul>
													</div>
												</div>
												<div class="note-insert btn-group">
													<button type="button" class="btn btn-default btn-sm" title="" data-event="showCodeblockDialog" data-hide="true" tabindex="-1" data-name="codeblock" data-original-title="코드">
														<i class="fas fa-code"></i> 코드
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="showLinkDialog" data-hide="true" tabindex="-1" data-name="link" data-original-title="링크 (CTRL+K)">
														<i class="fa fa-link"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="showImageDialog" data-hide="true" tabindex="-1" data-name="picture" data-original-title="사진">
														<i class="far fa-image"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="showVideoDialog" data-hide="true" tabindex="-1" data-name="video" data-original-title="동영상">
														<i class="fab fa-youtube"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="insertHorizontalRule" tabindex="-1" data-name="hr" data-original-title="구분선 추가 (CTRL+ENTER)">
														<i class="fas fa-minus"></i>
													</button>
												</div>
												<div class="note-view btn-group">
													<button type="button" class="btn btn-default btn-sm" title="" data-event="fullscreen" tabindex="-1" data-name="fullscreen" data-original-title="전체 화면">
														<i class="fa fa-arrows-alt"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="codeview" tabindex="-1" data-name="codeview" data-original-title="코드 보기">
														<i class="fa fa-code"></i>
													</button>
													<button type="button" class="btn btn-default btn-sm" title="" data-event="showHelpDialog" data-hide="true" tabindex="-1" data-name="help" data-original-title="도움말">
														<i class="fa fa-question"></i>
													</button>
												</div>
											</div>
	
											<div class="note-editing-area">
												<div class="note-handle">
													<div class="note-control-selection" style="display: none;">
														<div class="note-control-selection-bg"></div>
														<div class="note-control-holder note-control-nw"></div>
														<div class="note-control-holder note-control-ne"></div>
														<div class="note-control-holder note-control-sw"></div>
														<div class="note-control-sizing note-control-se"></div>
														<div class="note-control-selection-info"></div>
													</div>
												</div>
												<div class="note-popover">
													<div class="note-link-popover popover bottom in" style="display: none;">
														<div class="arrow"></div>
														<div class="popover-content">
															<a href="http://www.google.com" target="_blank">www.google.com</a>&nbsp;&nbsp;
															<div class="note-insert btn-group">
																<button type="button" class="btn btn-default btn-sm" title="" data-event="showLinkDialog" data-hide="true" tabindex="-1" data-original-title="수정">
																	<i class="fa fa-edit"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="unlink" tabindex="-1" data-original-title="링크 삭제">
																	<i class="fa fa-unlink"></i>
																</button>
															</div>
														</div>
													</div>
													<div class="note-image-popover popover bottom in" style="display: none;">
														<div class="arrow"></div>
														<div class="popover-content">
															<div class="btn-group">
																<button type="button" class="btn btn-default btn-sm" title="" data-event="resize" data-value="1" tabindex="-1" data-original-title="원본 크기로 변경">
																	<span class="note-fontsize-10">100%</span>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="resize" data-value="0.5" tabindex="-1" data-original-title="50% 크기로 변경">
																	<span class="note-fontsize-10">50%</span>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="resize" data-value="0.25" tabindex="-1" data-original-title="25% 크기로 변경">
																	<span class="note-fontsize-10">25%</span>
																</button>
															</div>
															<div class="btn-group">
																<button type="button" class="btn btn-default btn-sm" title="" data-event="floatMe" data-value="left" tabindex="-1" data-original-title="왼쪽 정렬">
																	<i class="fa fa-align-left"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="floatMe" data-value="right" tabindex="-1" data-original-title="오른쪽 정렬">
																	<i class="fa fa-align-right"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="floatMe" data-value="none" tabindex="-1" data-original-title="정렬하지 않음">
																	<i class="fa fa-align-justify"></i>
																</button>
															</div>
															<br>
															<div class="btn-group">
																<button type="button" class="btn btn-default btn-sm" title="" data-event="imageShape" data-value="img-rounded" tabindex="-1" data-original-title="스타일: 둥근 모서리">
																	<i class="fas fa-square"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="imageShape" data-value="img-circle" tabindex="-1" data-original-title="스타일: 원형">
																	<i class="fa fa-circle-o"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="imageShape" data-value="img-thumbnail" tabindex="-1" data-original-title="스타일: 액자">
																	<i class="fa fa-picture-o"></i>
																</button>
																<button type="button" class="btn btn-default btn-sm" title="" data-event="imageShape" tabindex="-1" data-original-title="스타일: 없음">
																	<i class="fa fa-times"></i>
																</button>
															</div>
															<div class="btn-group">
																<button type="button" class="btn btn-default btn-sm" title="" data-event="removeMedia" data-value="none" tabindex="-1" data-original-title="사진 삭제">
																	<i class="fa fa-trash-o"></i>
																</button>
															</div>
														</div>
													</div>
												</div>
												<textarea class="note-codable"></textarea>
												<div class="note-editable panel-body" contenteditable="true" data-placeholder="내용을 입력해 주세요." style="height: 300px; max-height: 869px;">
													<p>
														<br>
													</p>
												</div>
											</div>
										</div>
										
										<div class="nav" role="navigation">
											<fieldset class="buttons">
												<a href="#" class="btn btn-default btn-wide" onclick="return confirm('2017년 7월 13일부터는 필수 등록으로 변경됩니다? 나중에 등록하시겠습니까?')">건너뛰기</a>
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