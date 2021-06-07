<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<link rel="stylesheet" href="../../style/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div style="width: 805px; min-height: 800px;">
					<div id="main" class="content clearfix" role="main">
        <div class="col-md-6 main-block-left"> <!-- Editor's Choice -->
            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-flag"></i> Editor's Choice
                </h4>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">[OKKY Jobs] 프리랜서 개발자 대상 설문조사 결과 공유 !</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">OKKY 소개, 영상으로 만나보세요.</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">개발자 포트폴리오용 테마 템플릿을 만들어 봤습니다.</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>
        </div> <!-- /Editor's Choice -->

        <div class="col-md-6 main-block-right"> <!-- Weekly Best -->
            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-star"></i> Weekly Best
                </h4>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">'껍데기 만드는 일 할 사람은 널렸다'</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">OKKY 소개, 영상으로 만나보세요.</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">대표가 임금체불 합의하자고 연락이 왔습니다.</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>
        </div> <!-- /Weekly Best -->

        <div class="col-md-8 main-block-left"> <!-- Q&A / 커뮤니티 -->
            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-database"></i> Q&A
                    <a href="" class="main-more-btn pull-right">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </h4>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">리액트 네비게이션 bottom tabs 의존성 에러</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">암호화 알고리즘중에 암호화하면 글자수가 줄어드는게 있나요?.</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">스프링부트 프로젝트 만들면 도처에 생성되는 xml도 일단 모듈 혹은 인스턴스 건 데이터통신에 활용된다고 이해하면될까요?</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-comments"></i> 커뮤니티
                    <a href="" class="main-more-btn pull-right">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </h4>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">[서적문의] 객체 지향 프로그래밍 관련 서적 추천 부탁드립니다</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">[서울] 웹 개발 프로젝트 (UI/UX Web Designer)</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>  
                                    </div>
                                </h5>
                            </div>
                        </li>
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">강화학습 주식 트레이딩 프로그램 개발 스터디</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div> <!-- /Q&A & 커뮤니티 -->

        <div class="col-md-4 main-block-right"> <!-- Tech & 칼럼 & 학원/홍보 -->
            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-code"></i> Tech
                    <a href="" class="main-more-btn pull-right">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </h4>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="article-middle-block clearfix">
                            <div class="list-tag clearfix">
                                <a href="" class="list-group-item-text item-tag label label-info">
                                    <i class="fas fa-code"></i> IT News & 정보
                                </a>
                            </div>
                            <h5>
                                <a href="">마이크로소프트, Windows 패키지 관리자 1.0 공개</a>
                            </h5>
                            <div class="list-group-item-author pull-right clearfix">
                                <div class="avatar clearfix avatar-x-small">
                                    <a href="" class="avatar-photo">
                                        <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                    </a>
                                    <div class="avatar-info">
                                        <a class="nickname" href="">(사용자1)</a>
                                        <div class="activity">
                                            <span class=""><i class="fas fa-bolt"></i> 73</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="article-middle-block clearfix">
                            <div class="list-tag clearfix">
                                <a href="" class="list-group-item-text item-tag label label-info">
                                    <i class="fas fa-code"></i> Tips & 강좌
                                </a>
                            </div>
                            <h5>
                                <a href="">[JPA] 데이터베이스 기반 엔티티 클래스 원터치로 자동 생성하기 !</a>
                            </h5>
                            <div class="list-group-item-author pull-right clearfix">
                                <div class="avatar clearfix avatar-x-small">
                                    <a href="" class="avatar-photo">
                                        <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                    </a>
                                    <div class="avatar-info">
                                        <a class="nickname" href="">(사용자1)</a>
                                        <div class="activity">
                                            <span class=""><i class="fas fa-bolt"></i> 73</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- /Tech -->

            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-quote-left"></i> 칼럼
                    <a href="" class="main-more-btn pull-right">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </h4>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="article-middle-block clearfix">
                            <div class="list-tag clearfix">
                                <a href="" class="list-group-item-text item-tag label label-gray">
                                    kenu
                                </a>
                            </div>
                            <h5>
                                <a href="">오픈 소스 시작해 보려면</a>
                            </h5>
                            <p class="main-block-desc">
                                글자 그대로 프로그램 소스를 공개하는 것 외에, 소스 코드 저장소를 중심으로 한 여러 사람들의 상호작용을 통해 소프트웨어를 발전시키고, 참여자의 기술적, 사회적 성장을 가능하게...
                            </p>
                            <div class="list-group-item-author pull-right clearfix">
                                <div class="avatar clearfix avatar-x-small">
                                    <a href="" class="avatar-photo">
                                        <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                    </a>
                                    <div class="avatar-info">
                                        <a class="nickname" href="">(사용자1)</a>
                                        <div class="activity">
                                            <span class=""><i class="fas fa-bolt"></i> 73</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- /칼럼 -->

            <div class="main-block">
                <h4 class="main-header">
                    <i class="fas fa-book"></i> 학원/홍보
                    <a href="" class="main-more-btn pull-right">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </h4>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item list-group-has-note clearfix">
                            <div class="list-title-wrapper">
                                <h5 class="list-group-item-heading">
                                    <a href="">C언어 자료구조, 소프트웨어학과/컴퓨터공학과전공대비학원</a>
                                    <div class="list-group-item-author pull-right clearfix">
                                        <div class="avatar clearfix avatar-x-small">
                                            <a href="" class="avatar-photo">
                                                <img src="../../images/29a87623405c294d79bd2b4728996363.png">
                                            </a>
                                            <div class="avatar-info">
                                                <a class="nickname" href="">(사용자1)</a>
                                                <div class="activity">
                                                    <span class=""><i class="fas fa-bolt"></i> 73</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div> <!-- /학원홍보 -->
        </div> <!-- /Tech & 칼럼 & 학원/홍보 -->
    </div> <!-- /container -->
				</div>
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>
</body>
</html>