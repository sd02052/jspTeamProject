<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OKKY - 회사인증관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin.css">
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
<script type="text/javascript">

function fnImgPop(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
	 }
	 
<%
	if(session.getAttribute("loginNum") != null){
		int loginNum = (int)session.getAttribute("loginNum");
	}
%>
	 
</script>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div class="md_container" style="width: 805px; min-height: 800px;">

					<div class="article">
				
						<div class="nav">		
							<h4>회사인증관리</h4>
						</div>
	
						<br>

						<div class="row">
								
								
						<c:set var="comDTO" value="${comList }"/>
						<c:set var="memDTO" value="${memList }"/>
								
							<div class="col-xs-12">
								<ul class="list-group list-title">
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<div class="cont-member">			
													<div>
														<a href="<%=request.getContextPath()%>/member_personal.do?num=${memList.getMem_num() }">
															<img src="<%=request.getContextPath() %>/images/profileUpload/${memList.getMem_image() }" class="cont-mem-logo img-circle"></a>
														
														<div class="cont-mem-info">
															<a class="cont-mem-nick" href="<%=request.getContextPath()%>/member_personal.do?num=${memList.getMem_num() }">${memList.getMem_nick() }</a><br>
															<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;${memList.getMem_score() }</span><br>
														</div>
													</div>	
												</div>	
									</li>
							
								
									<li class="list-group-item list-group-item-question list-group-has-note clearfix ">
										<div class="row">						
											<div class="col-xs-10">
												<p class="cont-num">#&nbsp;${comDTO.getCompany_num() }</p>
													<div class="col-xs-11">
														<c:if test="${comDTO.getCompany_check() ne 1 }">
															<p class="cont-title">${comDTO.getCompany_name() }</p>
														</c:if>
														
														<c:if test="${comDTO.getCompany_check() eq 1 }">
															<a href="<%=request.getContextPath()%>/member_company_cont.do?com_num=${comDTO.getCompany_num() }&mem_num=${memList.getMem_num() }">
																<p class="cont-title">${comDTO.getCompany_name() }</p></a>
														</c:if>
													</div>
											
													<div class="col-xs-12">
														<table class="table cont-table">
															<tr>
																<th>회사명</th>
																<td>${comDTO.getCompany_name() }</td>
																<td> &nbsp;&nbsp;&nbsp;</td>
																<th>직원수</th>
																<td>${comDTO.getCompany_emp() }</td>
															</tr>
															
															<tr>
																<th>사업자 등록번호</th>
																<td>${comDTO.getCompany_license_num() }</td>
																<td></td>
																<th>담당자명</th>
																<td>${comDTO.getCompany_charge_name() }</td>
																<td></td>
															</tr>
															
															<tr>
																<th>대표 연락처</th>
																<td>${comDTO.getCompany_boss_phone() }</td>
																<td></td>
																<th>담당자 연락처</th>
																<td>${comDTO.getCompany_charge_phone() }</td>
																<td></td>
															</tr>
												
															<tr>
																<th>대표 이메일</th>
																<td>${comDTO.getCompany_boss_email() }</td>
																<td></td>
																<th>담당자 이메일</th>
																<td>${comDTO.getCompany_charge_email() }</td>
																<td></td>
															</tr>
															
															<tr>
																<th>회사 홈페이지</th>
																<td>${comDTO.getCompany_homepage() }</td>
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
																	<img class="com-logo" src="<%=request.getContextPath() %>/images/company/${comDTO.getCompany_logo() }" onclick="fnImgPop(this.src)">
																</td>
																<td colspan="3">
																	<img class="com-regist" src="<%=request.getContextPath() %>/images/company/${comDTO.getCompany_license_image() }" onclick="fnImgPop(this.src)">
																</td>
															</tr>
														</table>
													</div>
											</div>
							
											<div class="col-xs-2">		
												<div class="btn-group btn-verify">
													<c:if test="${comDTO.getCompany_check() eq 0 }">
														<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
														대기&nbsp;&nbsp;<span class="caret"></span></button>
													</c:if>
													<c:if test="${comDTO.getCompany_check() eq 1 }">
														<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
														승인&nbsp;&nbsp;<span class="caret"></span></button>
													</c:if>
													<c:if test="${comDTO.getCompany_check() eq 2 }">
														<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
														거절&nbsp;&nbsp;<span class="caret"></span></button>
													</c:if>
													<c:if test="${loginNum eq 9999 }">
														<ul class="dropdown-menu" role="menu">
													    	<li><a href="<%=request.getContextPath()%>/company_check.do?num=${comDTO.getCompany_num() }&check=0">대기</a></li>
													    	<li><a href="<%=request.getContextPath()%>/company_check.do?num=${comDTO.getCompany_num() }&check=1">승인</a></li>
													    	<li><a href="<%=request.getContextPath()%>/company_check.do?num=${comDTO.getCompany_num() }&check=2">거절</a></li>
													  	</ul>
													 </c:if>
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
									<%--<%= ${comDTO.getCompany_content()}.replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") --%>
									
										<p>${comDTO.getCompany_content() }</p>				
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