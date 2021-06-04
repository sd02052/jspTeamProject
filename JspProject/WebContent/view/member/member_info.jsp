<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - All That Developer</title>
<link rel="stylesheet" href="../../style/member_info.css">
<link rel="stylesheet" href="../../style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-tagsinput.js"></script>
</head>
<body>
    <div id="create-user" class="content clearfix" role="main">
        <div class="col-md-6 main-block-left">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="profile-wrap">
                        <!-- <img src="flower.png" alt="..." class="img-circle"> -->
                        <h5 class="panel-header">회원정보프로필(추후수정)</h5>
                    </div>
                </div>
    
                <form class="form-signin panel-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">닉네임</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="(멤버 닉네임 들어감)">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputText1">관심있는 기술 태그 입력</label>
                        <p class="help-block">사용 중인 기술이나 관심있는 기술 태그를 선택해주세요.</p>
                        <div class="tagsinput-wrap">
                            <input type="text" value="" data-role="tagsinput" />
                        </div>
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
                        <input type="email" id="email" class="form-control" placeholder="(회원 이메일)" required>
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
                    <button class="btn btn-info btn-block" type="submit">비밀번호 변경</button>
                    <button class="btn btn-default btn-block" type="submit">회원 탈퇴</button>
                </form>
            </div>
        </div>
    </div> <!-- /container -->
</body>
</html>