<%@page import="java.util.List"%>
<%@page import="com.okky.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("loginUser");
	List<String> tagList = (List<String>) request.getAttribute("tagList");
	String imgPath = request.getContextPath()+"/images/profileUpload/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>OKKY - 회원정보 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/member_info.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/bootstrap-tagsinput.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-tagsinput.js"></script>
<script>
/* 이메일 수신 동의 여부 */
$(function cAll() {
	// 이메일 수신 동의 여부 (mem_emailCheck의 value값)
	var ck = $('input:checkbox[id="mem_emailCheck"]').val();
	if(ck == "yes"){
		// 이메일 수신 동의가 yes일 경우 체크
		$("input[type=checkbox]").prop("checked", true);
	} else {
		// 이메일 수신 동의가 yes가 아닐 경우
        $("input[type=checkbox]").prop("checked", false);
    }
	
});

/* 이미지 변경 버튼 클릭 이벤트 */
$(function(){
	$('#edit-picture-btn').click(function() {
		if($("#profile-picture-list").css("display") == "none"){ // 요소의 display가 none인 경우
			$('#profile-picture-list').show(); // 요소를 보이게 변경한다.
		}else{ // 화면에 안보이는 경우
			$('#profile-picture-list').hide(); // 요소를 안보이게 변경한다.
		}
	})
});

/* 사진 업로드 버튼*/
$(function() {

	$('#profile-upload-btn').click(function(e) {
		e.preventDefault();
		$('#profileImge').click();
	});
});

/* 이미지 미리보기 기능 */
var sel_file;
$(function() {
	$("#profileImge").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#uploadImge").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
</script>
<script type="text/javascript">
function checkSize(input) {
    if (input.files && input.files[0].size > (250 * 1024)) {
        alert("파일 사이즈가 250KB를 넘습니다.");
        input.value = null;
    }
}
</script>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../../include/side.jsp" />
				<div class="md_container" style="width: 805px; min-height: 800px;">
				    <div id="create-user" class="content clearfix" role="main">
				    	<h3 class="content-header">회원 정보 수정</h3>
				        <div class="col-md-6 main-block-left">
				            <div class="panel panel-default">
				                <div class="panel-heading">
				                   <div class="avatar clearfix avatar-medium">
				                   		<a href="" class="avatar-photo">
				                   			<img src="<%=imgPath %><%=dto.getMem_image() %>">
				                   		</a>
				                   		
				                   		<div class="avatar-info">
				                   			<a class="nickname" href="" title="1"><%=dto.getMem_nick() %></a>
				                   			<div class="activity block">
				                   				<span class="fas fa-bolt"></span> <%=dto.getMem_score() %>
				                   			</div>
				                   		</div>
				                   </div>
				                   <a id="edit-picture-btn">변경</a>
				                   
				                   <!-- 이미지 업로드 -->
				                   <form method="post" enctype="multipart/form-data" class="profile-picture-list" id="profile-picture-list" 
				                   style="display:none;" action="<%=request.getContextPath() %>/member_info_edit_profile.do">
				                   		<input type="hidden" value="${loginNum }" name="num">
				                   		<div class="profile-picture">
				                   			<span class="avatar-photo"><img src="<%=imgPath %><%=dto.getMem_image() %>"></span>
				                   			<span>기본 프로필</span>
				                   		</div>
				                   		
				                   		<div class="profile-picture selected" id="profile-uploaded-image">
				                   			<span class="avatar-photo"><img id="uploadImge" src="<%=imgPath %><%=dto.getMem_image() %>"></span>
				                   			<span>Upload</span>
				                   		</div>
				                   		
				                   		<button class="btn btn-primary" id="profile-upload-btn" style="font-size:12px">이미지 업로드
				                   			<br>
				                   			<small>권장 사이즈 150px<br>최대 250KB</small>
				                   		</button>
				                   		<input type="file" name="files" id="profileImge" accept="image/gif, image/jpeg, image/jpg, image/png" style="display:none;" onchange="checkSize(this)"/>
				                   		
				                   		<input class="btn btn-success picture-confirm-btn" id="picture-confirm-btn" type="submit" value="확인">
				                   </form>
				                </div> <!-- /이미지 업로드-->
				    
				                <form method="post" class="form-signin panel-body" action="<%=request.getContextPath() %>/member_info_edit_ok.do">
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
				                            " data-role="tagsinput" placeholder="java, c#, javascript, spring"/>
				                        
				                    </div>
				                    <div class="checkbox">
				                        <label>
				                            <input type="checkbox" name="mem_emailCheck" id="mem_emailCheck" value="<%=dto.getMem_emailCheck() %>" onclick="cAll();"> 이메일 수신 동의
				                            
				                           
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
				        
				                <form class="panel-body panel-margin">
				                    <div class="email-edit">
				                        <label class="control-label" for="email" style="width:100%">이메일 주소</label>
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
				                <form class="panel-body panel-margin">
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