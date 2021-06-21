<%@page import="com.okky.model.CompanyDTO"%>
<%@page import="com.okky.model.JobDTO"%>
<%@page import="com.okky.model.BoardDTO"%>
<%@page import="com.okky.model.CommentDTO"%>
<%@page import="com.okky.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDTO boardDTO = (BoardDTO)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OKKY - <%=boardDTO.getBoard_title() %></title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/content.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<c:set var="big_category" value="${big_category }" />
<c:set var="small_category" value="${small_category }" />
<script type="text/javascript">
$(function(){
	$("#"+${big_category}).css("border-right","5px solid #e67d3e");
	$("#"+${small_category}).css("color","#fff");
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();   
})
</script>

<%
	if (session.getAttribute("loginNum") != null) {
		int loginNum = (int) session.getAttribute("loginNum");
	}
	List<CommentDTO> list = (List<CommentDTO>) request.getAttribute("commentList");
	String[] comment_content = new String[list.size()];
	String[] comment_content1 = new String[list.size()];
	for (int i = 0; i < list.size(); i++) {
%>
<script type="text/javascript">
function commentEdit<%=list.get(i).getCom_num()%>(){
	$(".dropdown").css("display","none");
	$(".buttons-<%=list.get(i).getCom_num()%>").css("display","block");
	$(".com-content-<%=list.get(i).getCom_num()%>").css("display","none");
	$(".com-edit-area-<%=list.get(i).getCom_num()%>").css("display","block");
};
</script>
<script type="text/javascript">
function commentEditCancle<%=list.get(i).getCom_num()%>(){
	var flag = confirm('수정중이던 내용을 취소하시겠습니까?');
	if(flag == true){
	$(".dropdown").css("display","block");
	$(".buttons-<%=list.get(i).getCom_num()%>").css("display","none");
	$(".com-content-<%=list.get(i).getCom_num()%>").css("display","block");
	$(".com-edit-area-<%=list.get(i).getCom_num()%>").css("display","none");
	$("#comment-form-<%=list.get(i).getCom_num()%>")[0].reset();
	}
};
</script>
<%
	comment_content[i] = list.get(i).getCom_content();
		comment_content1[i] = comment_content[i].replace("\n", "<br>");
	}
	;

	BoardDTO board_dto = (BoardDTO) request.getAttribute("dto");
	String board_content = board_dto.getBoard_content();
	String board_content1 = board_content.replace("\n", "<br>");
	
	CompanyDTO company_dto = (CompanyDTO)request.getAttribute("companyDTO");
	String company_content = company_dto.getCompany_content().replace("\n", "<br>");
%>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div style="width: 805px; min-height: 800px;">

				<div id="article" class="div">

					<div class="nav">
						<h4>구인</h4>
					</div>

					<br>
				</div>


				<div class="cont">
					<table class="table table-bordered">
						<tr>
							<td colspan="12">
								<div class="cont-header">
									<div class="cont-member pull-left">
										<a
											href="<%=request.getContextPath()%>/member_company_cont.do?com_num=${companyDTO.getCompany_num() }&mem_num=${memDTO.getMem_num() }">
											<img src="<%=request.getContextPath()%>/images/company/${companyDTO.getCompany_logo() }"
											class="cont-company-logo">
										</a>


										<div class="cont-mem-info">
											<a class="cont-mem-nick"
												href="<%=request.getContextPath()%>/member_company_cont.do?com_num=${companyDTO.getCompany_num() }&mem_num=${memDTO.getMem_num() }">${companyDTO.getCompany_name() }</a>


											<div class="cont-regdate">
												${companyDTO.getCompany_regdate() }</div>

										</div>
									</div>

									<div class="cont-wrapper pull-right">
										<i class="comment-img fas fa-comment"></i>&nbsp;${dto.getBoard_comment() }&nbsp;&nbsp;
										<i class="hit-img far fa-eye"></i>&nbsp;${dto.getBoard_hit() }
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<td class="col-md-10"><span class="cont-title">${dto.getBoard_title() }</span>
								<div class="com-content">
									<hr>

									<p>
										<b>종류 : </b>
										<c:if test="${jobdto.getJob_contract() eq 1 }"><span class="label label-primary">계약직</span> </c:if> 
										<c:if test="${jobdto.getJob_contract() eq 0 }"><span class="label label-success">정규직</span> </c:if> 
										
									</p>

									<p>
										<b>지역 : </b> ${jobdto.getJob_location() }
									</p>

									<hr>

									<h4>
										<b>∙ 직무 정보</b>
									</h4>

									<p>
										<b>직무 : </b>${jobdto.getJob_do() }</p>
									<p>
										<b>경력 : </b>${jobdto.getJob_mincareer() }년 이상 ~
										${jobdto.getJob_maxcareer() }년 이하
									</p>
									<p>
										<b>급여
										<c:if test="${jobdto.getJob_contract() eq 0 }">(연봉)</c:if>
										<c:if test="${jobdto.getJob_contract() eq 1 }">(월급)</c:if>
										 : </b>${jobdto.getJob_mincost() }만 이상 ~
										${jobdto.getJob_maxcost() }만 미만
									</p>

									<hr>

									<h4>
										<b>∙ 프로젝트 정보</b>
									</h4>
									<p><%=board_content1 %></p>

									<hr>
									<h4>
										<b>∙ 담당자 정보</b>
									</h4>
									<p>
										<b>담당자명 : </b>${companyDTO.getCompany_charge_name() }</p>
									<p>
										<b>이메일 : </b>${companyDTO.getCompany_charge_email() }</p>
									<p>
										<b>연락처 : </b>${companyDTO.getCompany_charge_phone() }</p>
								</div></td>

							<td class="col-md-2">
								<div class="cont-like text-center">
									<div class="cont-recommend">
										<c:if test="${loginNum != null }">
											<c:if test="${like_status }">
												<a
													href="<%=request.getContextPath() %>/member_board_like_cancle.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}">
													<i class="fas fa-thumbs-up" data-toggle="tooltip"
													data-placement="left" title="취소"></i>
												</a>
											</c:if>
											<c:if test="${!like_status }">
												<a
													href="<%=request.getContextPath() %>/member_board_like.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}">
													<i class="img far fa-thumbs-up" data-toggle="tooltip"
													data-placement="left" title="추천"></i>
												</a>
											</c:if>
										</c:if>
										<p class="com-recommend-count" id="like-result">${dto.getBoard_like() }</p>
									</div>

									<div class="cont-scrap">
										<c:if test="${loginNum != null }">
											<c:if test="${scrap_status}">
												<a
													href="<%=request.getContextPath()%>/member_board_scrap_cancle.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}">
													<i class="fas fa-bookmark fa-2x" data-toggle="tooltip"
													data-placement="left" title="스크랩"></i> <br>
												</a>
											</c:if>
											<c:if test="${!scrap_status}">
												<a
													href="<%=request.getContextPath()%>/member_board_scrap.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}">
													<i class="img fas fa-bookmark fa-2x" data-toggle="tooltip"
													data-placement="left" title="스크랩"></i> <br>
												</a>
											</c:if>
										</c:if>
										<span class="badge-scrap badge">${dto.getBoard_scrap() }</span>
									</div>

									<c:if test="${loginNum == dto.getBoard_writer() || loginType == 'admin'}"><!-- 자신이 작성한 게시물일 경우 or 관리자일 경우-->
											<div class="com-edit dropdown">
												<button class="com-edit-btn btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
													<i class="facebook-img fas fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i>
												</button>
												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
													<c:if test="${loginNum == dto.getBoard_writer() }"> <!-- 자신의 글일때만 수정버튼 보이게 -->
														<li role="presentation"><a role="menuitem" tabindex="-1" href="<%=request.getContextPath() %>/member_board_edit.do?num=${dto.getBoard_num()}&big=${big_category}&small=${small_category}&cate_num=${category.getCate_num()}"> <i class="fas fa-edit"></i>&nbsp;수정
														</a></li>
													</c:if>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="<%=request.getContextPath() %>/member_board_delete.do?num=${dto.getBoard_num()}&big=${big_category}&small=${small_category}&cate_num=${category.getCate_num()}" onclick="return confirm('게시물을 삭제 하시겠습니까?');"> <i class="fas fa-trash-alt"></i>&nbsp;삭제
													</a></li>
												</ul>
											</div>
											<div class="buttons-${dto.getBoard_num() }" style="display: none;" align="center">
												<p>
													<input type="button" class="btn btn-default btn-wide note-edit-cancel-btn" onclick="return commentEditCancle${dto.getBoard_num()}()" value="취소">
												</p>
												<p>
													<input type="submit" name="create" class="btn btn-success btn-wide" value="저장" id="create">
												</p>
											</div>
										</c:if>
								</div>
							</td>
						</tr>
					</table>

					<table class=" table table-bordered">
						<tr>
							<td colspan="12" class="active"><span>회사정보</span></td>
						</tr>

						<tr>
							<td class="col-xs-3">
								<div class="auto-padding">
									<a
										href="<%=request.getContextPath()%>/member_company_cont.do?com_num=${companyDTO.getCompany_num() }&mem_num=${memDTO.getMem_num() }">
										<img src="<%=request.getContextPath()%>/images/company/${companyDTO.getCompany_logo()}"
										class="company-logo auto-padding">
									</a>
								</div>
							</td>
							<td class="col-xs-9">
								<h2>
									<a
										href="<%=request.getContextPath()%>/member_company_cont.do?com_num=${companyDTO.getCompany_num() }&mem_num=${memDTO.getMem_num() }">
										<span class="company-name">${companyDTO.getCompany_name() }</span>
									</a>
								</h2> <a href="${companyDTO.getCompany_homepage() }"><span class="company-homepage">${companyDTO.getCompany_homepage() }</span></a>
								<hr>
								<p class="company-content"><%=company_content %></p>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
	</div>
</body>
</html>