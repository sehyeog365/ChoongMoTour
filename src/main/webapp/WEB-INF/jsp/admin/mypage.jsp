<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 관리자 마이페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/adminheader.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="my-page">
				<h1 class="text-center pt-3 font-weight-bold">
					ChoongMo Tour Admin My Page
				</h1>

				<div class="mypagecontents d-flex mx-5">
				<aside class="side-nav col-2 ">
					<ul class="nav flex-column">
						<li class="nav-item mt-2">
							<h5><b><a href="/admin/mypage/view?id=${admin.id }" class="nav-link text-primary">내 정보수정</a></b></h5>
						</li>
						<li class="nav-item mt-2">
							<h5><b><a href="/admin/userAdmin/view" class="nav-link text-white">사용자 관리</a></b></h5>
						</li>
					</ul>
				</aside>
				
				<section class="contents1 col-10">
					<div class="info-input-box mx-5">
						<div class="mx-4">
						    <label class="mt-3 ml-3">프로필 사진 변경</label><br>
                            <i id="imageIcon" class="bi bi-card-image image-icon-size ml-3"></i>

                            <input type="file" name="file" id="fileInput">

                            <c:choose>
                              <c:when test="${not empty admin.imagePath }"><!-- 있을때 admin.imagePath -->
                                <img class="adminprofile" width ="40" height="40" src="${admin.imagePath}"><!-- 이렇게 함 수정해보자 -->
                              </c:when>
                              <c:otherwise><!-- 없을때 -->
                                <img class="adminprofile" width ="40" height="40" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
                              </c:otherwise>
                            </c:choose>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">비밀번호</label><input type="password" id="passwordInput"  value = ""  class="form-control mt-4 mr-3 col-6">
                            </div>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">비밀번호 확인</label><input type="password" id="passwordConfirmInput" value=""  class="form-control mt-4 mr-3 col-6">
                            </div>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">이름</label><input type="text" id="nameInput" value = "${admin.name}" placeholder="이름" class="form-control mt-4 mr-3 col-6">
                            </div>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">이메일</label><input type="text" id="emailInput" value = "${admin.email}" placeholder="이메일" class="form-control mt-4 mr-3 col-6">
                            </div>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">닉네임</label><input type="text" id="nicknameInput" value = "${admin.nickname}" placeholder="닉네임" class="form-control mt-4 mr-3 col-6">
                            </div>

                            <div class="d-flex mx-3">
                                <label class="col-3 mt-4">전화번호</label><input type="text" id="phoneNumberInput" value = "${admin.phoneNumber}" placeholder="전화번호" class="form-control mt-4 mr-3 col-6">
                            </div>

                            <!-- ajax아직 안해서 에러 400에러 뜨나봄 -->

							<div class="text-center">
								<button id="updateBtn"class="btn btn-primary my-3" type="button" data-admin-id="${admin.id }">수정 완료</button>
							</div>
						</div>
					</div>
				</section>
			</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	</style>
	<script>
	$(document).ready(function(){
		$("#updateBtn").on("click", function(){
			let id = $(this).data("admin-id");
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();			
			let name = $("#nameInput").val();
			let nickname = $("#nicknameInput").val();
			let email = $("#emailInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			let file = $("#fileInput")[0];
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
				return ;
			}
			
			if(passwordConfirm == ""){//근데 비밀번호가 로그인했던 그 비밀번호와 일치하는거 그거는 그냥 막바지에가서 하기 지금은 너무 바쁘다.
				alert("비밀번호를 재확인해주세요.");
				return ;
			}
			
			if(password != passwordConfirm){
				alert("비밀번호가 다릅니다.");
				return ;
			}

			if(name == ""){		
				alert("이름을 입력하세요.");
				return ;
			}

			if(nickname == ""){		
				alert("닉네임을 입력하세요.");
				return ;
			}

			if(email == ""){		
				alert("이메일을 입력하세요.");
				return ;
			}
			
			if(phoneNumber == ""){
				alert("전화번호를 입력하세요.");
				return ;
			}

			//alert(id);//보아하니 여기 데이터가 안들어오는 현상 디버깅은 안되서 매퍼 확인, api 확인후 api 값을 받아오는 쪽(아작스)도 확인
			//alert(email);
			//alert(file);
			var formData = new FormData();
			
			formData.append("id", id);
			formData.append("password", password);
			formData.append("name", name);
			formData.append("nickname", nickname);
			formData.append("email", email);
			formData.append("phoneNumber", phoneNumber);
			formData.append("file", file.files[0]);
			
			$.ajax({
				type:"post"
				, url:"/admin/mypage"
				, data:formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"// 파일 업로드 필수
				, processData:false// 파일 업로드 필수(근데 여기선 필수로 하면안됨)
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						alert("수정 성공");
						location.reload();
					} else {
						alert("수정 실패");
					}
				}
				, error:function(){
					alert("수정 에러");
				}
			});
		});
	});
	</script>
</body>
</html>