<%@page import="com.okky.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO dto =(MemberDTO)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - 회원정보 등록</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_pwd.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">
				    <div id="create-user" class="content clearfix" role="main">
				    	<h3 class="content-header">비밀번호 변경</h3>
				    	
				        <form method="post" class="col-md-8 col-sm-offset-2" action="<%=request.getContextPath() %>/member_pwd_edit_ok.do?num=<%=dto.getMem_num() %>" >
				            <div class="panel panel-default panel-margin-10">
				                <div class="panel-body panel-body-content text-center" >
                                    <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="newPassword" class="form-control form-control-inline text-center" placeholder="새 비밀번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="passwordConfirm" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인">
                                    </div>
                                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                                    <a href="javascript:history.back()" class="btn btn-default">취소</a>
				                </div>
				            </div>
				        </form>
				    </div> <!-- /container -->
			    </div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>