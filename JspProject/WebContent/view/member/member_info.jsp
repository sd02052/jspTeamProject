<%@page import="java.util.List"%>
<%@page import="com.okky.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("loginUser");
	List<String> tagList = (List<String>) request.getAttribute("tagList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_info.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/bootstrap-tagsinput.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-tagsinput.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">
				    <div id="create-user" class="content clearfix" role="main">
				    	<h3 class="content-header">회원 정보 수정</h3>
				        <div class="col-md-6 main-block-left">
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                    <div class="profile-wrap">
				                        <!-- <img src="flower.png" alt="..." class="img-circle"> -->
				                        <h5 class="panel-header">회원정보프로필(추후수정)</h5>
				                    </div>
				                </div>
				    
				                <form class="form-signin panel-body" action="<%=request.getContextPath() %>/member_info_edit_ok.do">
				                <input type="hidden" value="${loginNum }" name="num">
				                    <div class="form-group">
				                        <label for="exampleInputEmail1">닉네임</label>
				                        <input type="text" class="form-control" name="mem_nick" id="exampleInputEmail1" value="<%=dto.getMem_nick() %>">
				                    </div>
				                    <div class="form-group">
				                        <label for="exampleInputText1">관심있는 기술 태그 입력</label>
				                        <p class="help-block">사용 중인 기술이나 관심있는 기술 태그를 선택해주세요.</p>
				                        
				                            <input type="text" name="mem_tag" value="
				                            <%
				                            	if(tagList.size() != 0){
				                            		for(int i=0; i < tagList.size(); i++){
				                            			%>
				                            			<%=tagList.get(i) %>,
				                            			<%
				                            		}
				                            		
				                            	}
				                            %>
				                            " data-role="tagsinput" />
				                        
				                    </div>
				                    <div class="checkbox">
				                        <label>
				                            <input type="checkbox" value="emailCheck"> 이메일 수신 동의
				                            
				                        </label>
				                    </div>
				                    <button class="btn btn-primary btn-block" type="submit">정보 수정</button>
				                </form>
				            </div>
				        </div>
				    
				        <div class="col-md-6 main-block-right">
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                    <h5 class="panel-header">이메일 변경</h5>
				                </div>
				        
				                <form class="form-signin panel-body">
				                    <div class="email-edit">
				                        <label for="exampleInputEmail1">이메일 주소</label>
				                        <input type="email" id="email" class="form-control" value="<%=dto.getMem_email() %>" required>
				                        <button class="btn btn-primary" type="submit">인증</button>
				                    </div>
				                </form>
				            </div>
				            
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                    <h5 class="panel-header">SNS 연결</h5>
				                </div>
				                <form class="panel-body panel-margin sns-buttons">
				                    <a href="" class="btn btn-github btn-block"><span class="icon-social icon-github"></span>Connect with GitHub</a>
				                    <a href="" class="btn btn-google btn-block"><span class="icon-social icon-google"></span>Connect with Google</a>
				                    <a href="" class="btn btn-facebook btn-block"><span class="icon-social icon-facebook"></span>Connect with Facebook</a>
				                    <a href="" class="btn btn-kakao btn-block"><span class="icon-social icon-kakao"></span>Connect with Kakao</a>
				                    <a href="" class="btn btn-naver btn-block"><span class="icon-social icon-naver"></span>Connect with NAVER</a>
				                </form>
				            </div>
				
				            <div class="panel panel-default">
				                <form class="form-signin panel-body">
				                    <a href="<%=request.getContextPath() %>/member_pwd_edit.do?num=<%=dto.getMem_num() %>" class="btn btn-info btn-block">비밀번호 변경</a>
				                    <a href="<%=request.getContextPath() %>/member_withdrawal.do?num=<%=dto.getMem_num() %>" class="btn btn-default btn-block">회원 탈퇴</a>
				                </form>
				            </div>
				        </div>
				    </div> <!-- /container -->
			    </div>
			    
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>