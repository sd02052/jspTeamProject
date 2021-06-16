<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/sign_up.css">
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
				<div class="md_container" style="width: 805px; min-height: 800px;">
				    <div id="create-user" class="content clearfix" role="main">
				    	<h3 class="content-header">회원가입</h3>
				        <div class="col-md-6 main-block-left">
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                    <h5 class="panel-header">이메일로 가입하기</h5>
				                </div>
				        
				                <form class="form-signin panel-body" action="<%=request.getContextPath()%>/member_sign_up.do">
				                    <input type="email" id="inputID" name="mem_id" class="form-control" placeholder="아이디" required autofocus>
				                    <input type="password" id="inputPassword" name="mem_pwd" class="form-control" placeholder="비밀번호" required>
				                    <input type="email" id="inputEmail" name="mem_email" class="form-control" placeholder="이메일" required>
				                    <input type="text" id="inputNickname" name="mem_nick" class="form-control" placeholder="닉네임" required>
				                    <div class="checkbox">
				                        <label>
				                            <input type="checkbox" name="mem_emailCheck" value="yes" checked> 이메일 수신 동의
				                        </label>
				                    </div>
				        	
				                    <button class="btn btn-primary btn-block" type="submit">아래 약관을 동의하며 계정 생성</button>
				                    <div class="signup-block">
				                        <a href="">회원가입약관</a>
				                        <span class="inline-saperator">/</span>
				                        <a href="">개인정보취급방침</a>
				                    </div>
				                </form>
				            </div>
				        </div>
				
				        <div class="col-md-6 main-block-right">
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                    <h5 class="panel-header">SNS로 가입하기</h5>
				                </div>
				                <form class="panel-body panel-margin sns-buttons">
				                    <a href="" class="btn btn-github btn-block"><span class="icon-social icon-github"></span>Sign in with GitHub</a>
				                    <a href="" class="btn btn-google btn-block"><span class="icon-social icon-google"></span>Sign in with Google</a>
				                    <a href="" class="btn btn-facebook btn-block"><span class="icon-social icon-facebook"></span>Sign in with Facebook</a>
				                    <a href="" class="btn btn-kakao btn-block"><span class="icon-social icon-kakao"></span>Sign in with Kakao</a>
				                    <a href="" class="btn btn-naver btn-block"><span class="icon-social icon-naver"></span>Sign in with NAVER</a>
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