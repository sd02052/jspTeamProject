<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="../../style/login.css">
<link rel="stylesheet" href="../../style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="edit-user" class="content clearfix" role="main">
        <div class="col-md-6 main-block-left">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-header">아이디 로그인</h5>
                </div>
                <form class="form-signin panel-body panel-margin">
                    <label for="inputEmail" class="sr-only">아이디</label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="아이디" required autofocus>
                    <label for="inputPassword" class="sr-only">비밀번호</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>

                    <div class="radio-check">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="user" checked>
                                <i class="fas fa-user"></i> 회원 로그인
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="admin">
                                <i class="fas fa-user-cog"></i> 관리자 로그인
                            </label>
                          </div>
                    </div>
                    
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me"> 로그인 유지
                        </label>
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">로그인</button>
                    <div class="signup-block">
                        <a href="">계정찾기</a>
                        <span class="inline-saperator">/</span>
                        <a href="">회원가입</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-md-6 main-block-right">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-header">SNS 로그인</h5>
                </div>
                <form class="panel-body panel-margin sns-buttons">
                    <a href="" class="btn btn-github btn-block"><span class="icon-social icon-github"></span>Login with GitHub</a>
                    <a href="" class="btn btn-google btn-block"><span class="icon-social icon-google"></span>Login with Google</a>
                    <a href="" class="btn btn-facebook btn-block"><span class="icon-social icon-facebook"></span>Login with Facebook</a>
                    <a href="" class="btn btn-kakao btn-block"><span class="icon-social icon-kakao"></span>Login with Kakao</a>
                    <a href="" class="btn btn-naver btn-block"><span class="icon-social icon-naver"></span>Login with NAVER</a>
                </form>
            </div>
        </div>
    </div> <!-- /container -->
</body>
</html>