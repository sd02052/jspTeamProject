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
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - <%=boardDTO.getBoard_title() %></title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/style/content.css">
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
if(session.getAttribute("loginNum") != null){
	int loginNum = (int)session.getAttribute("loginNum");
}
	List<CommentDTO> list = (List<CommentDTO>) request.getAttribute("commentList");
	String[] comment_content = new String[list.size()];
	String[] comment_content1 = new String[list.size()];
	for(int i = 0; i < list.size(); i++){
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
function commentEditCancle<%=list.get(i).getCom_num() %>(){
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
	}; 
	
	BoardDTO board_dto = (BoardDTO)request.getAttribute("dto");
	String board_content = board_dto.getBoard_content();
	String board_content1 = board_content.replace("\n", "<br>");
%>
<script type="text/javascript">

$(function() { 
    $(".select").hover(function(){ 
        $(this).attr("src", $(this).attr("src").replace("selected.png", "cancle.png")); 
    }, function(){ 
        $(this).attr("src", $(this).attr("src").replace("cancle.png", "selected.png")); 
    }); 
});

</script>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
			<div class="md_container" style="width: 805px; min-height: 800px;">

				<div id="article" class="div">

					<div class="nav">
						<h4>${category.getCate_name() }</h4>
					</div>

					<br>


					<div class="cont">
						<table class="table table-bordered">
							<tr>
								<td colspan="12">
									<div class="cont-header">
										<div class="cont-member pull-left">
										
											<%-- 탈퇴회원인 경우 --%>
											<c:if test="${writer.getMem_check() eq 'yes' }">
												<img src="<%=request.getContextPath() %>/images/profileUpload/${writer.getMem_image() }" class="cont-mem-logo img-circle">
	
												<div class="cont-mem-info">
													${writer.getMem_nick() }
													<span class="cont-activity"><i class="activity-img fas fa-lock"></i></span>
													<br>
	
													<div class="cont-regdate">${dto.getBoard_regdate() }</div>
												</div>
											</c:if>
										
											<%-- 탈퇴회원이 아닌 경우 --%>
											<c:if test="${writer.getMem_check() eq 'no' }">
												<a href="<%=request.getContextPath()%>/member_personal.do?num=${writer.getMem_num()}">
													<img src="<%=request.getContextPath() %>/images/profileUpload/${writer.getMem_image() }" class="cont-mem-logo img-circle">
												</a>
	
												<div class="cont-mem-info">
													<a class="cont-mem-nick" href="<%=request.getContextPath()%>/member_personal.do?num=${writer.getMem_num() }">
													${writer.getMem_nick() }</a> 
													<span class="cont-activity"><i class="activity-img fas fa-bolt"></i>&nbsp;${writer.getMem_score() }</span>
													<br>
	
													<div class="cont-regdate">${dto.getBoard_regdate() }</div>
	
												</div>
											</c:if>
											
										</div>

										<div class="cont-wrapper pull-right">
											<i class="comment-img fas fa-comment"></i>&nbsp;${dto.getBoard_comment() }&nbsp;&nbsp;
											<i class="hit-img far fa-eye"></i>&nbsp;${dto.getBoard_hit() }
										</div>

									</div>
								</td>
							</tr>
							<tr>
								<td class="col-md-10">
									<div class="cont-content">
										<span class="cont-num"># ${dto.getBoard_num() }</span> 
										<a href="<%=request.getContextPath()%>/member_qna_board_list.do?cate_num=${category.getCate_num()}&big=${big_category }&small=${small_category }&cate_group=${category.getCate_group()}&cate_step=${category.getCate_step()}"> <span
											class="label label-info">${category.getCate_name() }</span>
										</a><br> <span class="cont-title">${dto.getBoard_title() }</span>
										<hr>
										<p><%=board_content1 %></p>
									</div>
								</td>

								<td class="col-md-2">
									<div class="cont-like text-center">
										<div class="cont-recommend">
											<c:if test="${loginNum != null }">
												<c:if test="${like_status }">
													<a href="<%=request.getContextPath() %>/member_qna_board_like_cancle.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}"> <i class="fas fa-thumbs-up" data-toggle="tooltip" data-placement="left" title="취소"></i>
													</a>
												</c:if>
												<c:if test="${!like_status }">
													<a href="<%=request.getContextPath() %>/member_qna_board_like.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}"> <i class="img far fa-thumbs-up" data-toggle="tooltip" data-placement="left" title="추천"></i>
													</a>
												</c:if>
											</c:if>
											<p class="com-recommend-count" id="like-result">${dto.getBoard_like() }</p>
										</div>
										<div class="cont-scrap">
											<c:if test="${loginNum != null }">
												<c:if test="${scrap_status}">
													<a href="<%=request.getContextPath()%>/member_qna_board_scrap_cancle.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}"> <i class="fas fa-bookmark fa-2x"
														data-toggle="tooltip" data-placement="left" title="스크랩"></i>
													<br>
													</a>
												</c:if>
												<c:if test="${!scrap_status}">
													<a href="<%=request.getContextPath()%>/member_qna_board_scrap.do?board_num=${dto.getBoard_num()}&login_num=${loginNum}"> <i class="img fas fa-bookmark fa-2x"
														data-toggle="tooltip" data-placement="left" title="스크랩"></i>
													<br>
													</a>
												</c:if>
											</c:if>
											<span class="badge-scrap badge">${dto.getBoard_scrap() }</span>
										</div>
										<div class="cont-facebook">
											<a href="https://www.facebook.com/okky.sns/" target="_blank"> <i
												class="facebook-img fab fa-facebook-square"
												data-toggle="tooltip" data-placement="left" title="페이스북 공유"></i>
											</a>
										</div>
										<c:if test="${loginNum == dto.getBoard_writer()  || loginType == 'admin' }"><!-- 자신이 작성한 게시물일 경우 or 관리자일 경우 -->
											<div class="com-edit dropdown">
												<button class="com-edit-btn btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
													<i class="facebook-img fas fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i>
												</button>
												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
												<c:if test="${loginNum == dto.getBoard_writer() }"> <!-- 자신의 글일때만 수정버튼 보이게 -->
													<li role="presentation"><a role="menuitem" tabindex="-1" href="<%=request.getContextPath() %>/member_board_edit.do?num=${dto.getBoard_num()}&big=${big_category}&small=${small_category}&cate_num=${category.getCate_num()}"> <i class="fas fa-edit"></i>&nbsp;수정
													</a></li>
													</c:if>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="<%=request.getContextPath() %>/member_qna_board_delete.do?num=${dto.getBoard_num()}&big=${big_category}&small=${small_category}&cate_num=${category.getCate_num()}" onclick="return confirm('게시물을 삭제 하시겠습니까?');"> <i class="fas fa-trash-alt"></i>&nbsp;삭제
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
					</div>

					<br>

					<div class="comment">
						<table class="table table-bordered">
							<tr>
								<td colspan="12" class="active"><span class="comment-title">답글
										${dto.getBoard_comment() }</span></td>
							</tr>
							<c:if test="${!empty commentList }">
								<% int i = 0; %>
								<c:forEach items="${commentList }" var="dto" varStatus="status">
										<!-- 다른 회원이 작성한 댓글 -->
										<form method="post" action="<%=request.getContextPath() %>/member_qna_comment_edit.do" id="comment-form-${dto.getCom_num() }">
											<input type="hidden" name="com_num" value="${dto.getCom_num() }">
											<input type="hidden" name="com_target" value="${dto.getCom_target() }">
											<tr>
												<td class="col-md-10">
													<div class="cont-member pull-left">
														<%-- 글 작성자가 댓글을 보는 경우 --%>
														<c:choose>
															<c:when test="${loginNum eq writer.getMem_num() }">
																<c:if test="${dto.getCom_selected().equals('yes') }">
																	<a class="select" href="<%=request.getContextPath()%>/member_qna_deselect.do?com_num=${dto.getCom_num()}&board_num=${dto.getCom_target() }">
																		<img class="cont-mem-logo img-circle select" src="<%=request.getContextPath()%>/images/comment/com_selected.png" 
																		onmouseover="this.src='<%=request.getContextPath()%>/images/comment/com_cancel.png'"
																		onmouseout="this.src='<%=request.getContextPath()%>/images/comment/com_selected.png'"></a>
																</c:if>
																	
																<c:if test="${dto.getCom_selected().equals('no') && check > 0  }">
																	<img src="<%=request.getContextPath()%>/images/comment/com_select.png" class="cont-mem-logo img-circle">
																</c:if>
																
																<c:if test="${dto.getCom_selected().equals('no') && check eq 0 }">
																	<a href="<%=request.getContextPath()%>/member_qna_select.do?com_num=${dto.getCom_num()}&board_num=${dto.getCom_target() }">
																		<img class="cont-mem-logo img-circle deselect" src="<%=request.getContextPath()%>/images/comment/com_select.png" 
																		onmouseover="this.src='<%=request.getContextPath()%>/images/comment/com_selected.png'"
																		onmouseout="this.src='<%=request.getContextPath()%>/images/comment/com_select.png'"></a>
																</c:if>
														</c:when>
														<c:otherwise> 
														
														<%-- 글 작성자 외에 다른 멤버가 댓글을 보는 경우 --%>
															<c:if test="${loginNum ne writer.getMem_num() && dto.getCom_selected().equals('yes') }">
																<img src="<%=request.getContextPath()%>/images/comment/com_selected.png" class="cont-mem-logo img-circle">
															</c:if>
																
															<c:if test="${loginNum ne writer.getMem_num() && dto.getCom_selected().equals('no') }">
																<img src="<%=request.getContextPath()%>/images/comment/com_logo.png" class="cont-mem-logo img-circle">
															</c:if>
														</c:otherwise>
														</c:choose>
														
														<%-- 탈퇴회원인 경우 --%>
														<c:if test="${commentWriterList[status.index].getMem_check() eq 'yes' }">
															<img src="<%=request.getContextPath()%>/images/profileUpload/${commentWriterList[status.index].getMem_image() }" class="cont-mem-logo img-circle">
		
															<div class="cont-mem-info">
																${commentWriterList[status.index].getMem_nick() }<span class="cont-activity"><i class="activity-img fas fa-lock"></i></span>
																 <br>
																<div class="cont-regdate">${dto.getCom_regdate() }</div>
															</div>
														</c:if>
														
														<%-- 탈퇴회원이 아닌 경우 --%>
														<c:if test="${commentWriterList[status.index].getMem_check() eq 'no' }">
															<a href="<%=request.getContextPath()%>/member_personal.do?num=${commentWriterList[status.index].getMem_num() }"> 
																<img src="<%=request.getContextPath()%>/images/profileUpload/${commentWriterList[status.index].getMem_image() }" class="cont-mem-logo img-circle">
															</a>
		
															<div class="cont-mem-info">
																<a class="cont-mem-nick" href="<%=request.getContextPath()%>/member_personal.do?num=${commentWriterList[status.index].getMem_num() }">
																 ${commentWriterList[status.index].getMem_nick() }</a> <span class="cont-activity"> <i class="activity-img fas fa-bolt"></i>&nbsp;${commentWriterList[status.index].getMem_score() }
																</span> <br>
																<div class="cont-regdate">${dto.getCom_regdate() }</div>
															</div>
														</c:if>
														
													</div>
													<br> <br> <br>
													<div class="com-content-${dto.getCom_num() } pull-left">
														<p><%=comment_content1[i++] %></p>
													</div>
													<textarea class="form-control com-edit-area-${dto.getCom_num() }" name="com_content" rows="3" style="display: none;" value="${dto.getCom_content() }">${dto.getCom_content() }</textarea>
												</td>
												<td class="col-md-2">
												<div id="like_form">
												<input type="hidden" id="com-num-${dto.getCom_num()}" value="${dto.getCom_num() }">
												<input type="hidden" id="loginNum" value="${loginNum}">
													<div class="cont-recommend">
														<c:if test="${loginNum != null }">
															<c:forEach items="${commentLikeList }" var="likedto">
																<c:if test="${likedto.getCom_num() == dto.getCom_num() }">
																	<a href="<%=request.getContextPath() %>/member_qna_comment_like_cancle.do?com_num=${dto.getCom_num()}&board_num=${dto.getCom_target()}&login_num=${loginNum}"> <i class="fas fa-thumbs-up" id="up-${dto.getCom_num()}" data-toggle="tooltip" data-placement="left" title="취소"></i>
																	</a>
																</c:if>
															</c:forEach>
															<c:forEach items="${commentUnLikeList }" var="unlikedto">
																<c:if test="${unlikedto.getCom_num() == dto.getCom_num() }">
																	<a href="<%=request.getContextPath() %>/member_qna_comment_like.do?com_num=${dto.getCom_num()}&board_num=${dto.getCom_target()}&login_num=${loginNum}"> <i class="img far fa-thumbs-up" id="up-${dto.getCom_num()}" data-toggle="tooltip" data-placement="left" title="추천"></i>
																	</a>
																</c:if>
															</c:forEach>
														</c:if>
														<p class="com-recommend-count" id="like-result-${dto.getCom_num() }">${dto.getCom_like() }</p>
													</div>
												</div>
													<c:if test="${loginNum == dto.getCom_writer() }"> <!-- 자신이 작성한 댓글일 경우 -->
													<div class="com-edit dropdown">
														<button class="com-edit-btn btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
															<i class="facebook-img fas fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i>
														</button>
														<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
															<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:commentEdit${dto.getCom_num()}();"> 
															<i class="fas fa-edit"></i>&nbsp;수정
															</a></li>
															<li role="presentation"><a role="menuitem" tabindex="-1" href="<%=request.getContextPath() %>/member_qna_comment_delete.do?num=${dto.getCom_num()}&board_num=${dto.getCom_target()}" onclick="return confirm('댓글을 삭제 하시겠습니까?');"> 
															<i class="fas fa-trash-alt"></i>&nbsp;삭제
															</a></li>
														</ul>
													</div>
													<div class="buttons-${dto.getCom_num() }" style="display: none;" align="center">
														<p>
															<input type="button" class="btn btn-default btn-wide note-edit-cancel-btn" onclick="return commentEditCancle${dto.getCom_num()}()" value="취소">
														</p>
														<p>
															<input type="submit" name="create" class="btn btn-success btn-wide" value="저장" id="create">
														</p>
													</div>
												</c:if>
												</td>
											</tr>
										</form>
								</c:forEach>
							</c:if>

							<c:if test="${loginNum != null}">
							<!-- 댓글 작성창 -->
							<tr>
								<td colspan="10">
									<form method="post" action="<%=request.getContextPath() %>/member_qna_comment_write.do">
										<input type="hidden" name="com_writer" value="${loginNum}"> <input
											type="hidden" name="com_target" value="${dto.getBoard_num() }">
										<div class="cont-member pull-left">
											<img src="<%=request.getContextPath()%>/images/comment/com_logo.png" class="cont-mem-logo img-circle">
											<a
												href="<%=request.getContextPath()%>/member_personal.do?num=${login_mem.getMem_num() }">
												<img
												src="<%=request.getContextPath() %>/images/profileUpload/${login_mem.getMem_image() }"
												class="cont-mem-logo img-circle">
											</a>

											<div class="cont-mem-info">
												<a class="cont-mem-nick"
													href="<%=request.getContextPath()%>/member_personal.do?num=${login_mem.getMem_num() }">${login_mem.getMem_nick() }</a> <br><span class="cont-activity"><i
													class="activity-img fas fa-bolt"></i>&nbsp;${login_mem.getMem_score() }</span><br>
											</div>
										</div>
										<br> <br> <br>
										<textarea class="form-control" name="com_content"
											placeholder="댓글 쓰기" rows="3"></textarea>
										<br> <input type="submit"
											class="btn btn-success comment-submit pull-right" value="등록">
									</form>
							</tr>
							</c:if>
						</table>
						
						<c:if test="${loginNum == null}">
						<%-- 로그인 하지 않은 경우 댓글창 --%>
						<table class="table table-bordered">
							<tr>
								<td align="center"><span> <a
										href="<%=request.getContextPath()%>/view/member/login.jsp">로그인</a>
										을 하시면 댓글을 등록할 수 있습니다.
								</span></td>
							</tr>
						</table>
						</c:if>
					</div>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>


</body>
</html>
