<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 메인화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

	<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<div id ="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="main-page">
				<h1 class="text-center pt-3">
					<b>ChoongMo Tour Main Page</b>
				</h1>
				
				<!-- 이미지 서울, 인천, 강원, 전라, 부산, 제주 리스트 -->
				<!-- 그다음 각각 7개의 페이지를 만드는게 아닌 해당 링크를 클릭했을시 특정지역 데이터(숙소)만 보여지게 해야 함 그렇게 하려면 메모게시판 처럼 지역을 파라미터를 사용해서 해볼것.-->
                <!-- url 링크에 오늘 내일날짜 넣기위해 추가 차후에 d-none제거 해서 검색창까지 구현해보기 -->
                <div class="d-none">
                    <label class="mt-3">체크인 </label>
                    <input type="text" id="startDate" class="" name="startDate" value="" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
                    ~
                    <label class="mt-3">체크아웃 </label>
                    <input type="text" id="endDate" class="" name="endDate" value= " " autocomplete="off"><br>
                </div>

				<div class="box-list d-flex justify-content-center flex-wrap">
					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=seoul" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2022/09/16/17/07/namsan-tower-7459173_960_720.jpg" alt="서울">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=seoul" class="font-weight-bold text-dark">서울</a>
						</div>
						<!-- 지역별 숙소 갯수 나타내기 옵션 -->
					</div>							

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=incheon" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2021/08/21/07/55/south-korea-6562089_960_720.jpg" alt="인천">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=incheon" class="font-weight-bold text-dark">인천</a>
						</div>
						
					</div>

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=gangwon" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2015/09/26/05/07/mt-seoraksan-958643_960_720.jpg" alt="강원">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=gangwon" class="font-weight-bold text-dark">강원</a>
						</div>
					</div>										

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=gyeongsang" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2020/05/24/11/56/to-5213925_960_720.jpg" alt="경상">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=gyeongsang" class="font-weight-bold text-dark">경상</a>
						</div>
					</div>

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=jeolla" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2018/08/23/22/18/jeonju-3626873_960_720.jpg" alt="전라">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=jeolla" class="font-weight-bold text-dark">전라</a>
						</div>
					</div>

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=busan" class="box-profile bg-info">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2016/10/17/07/53/busan-night-scene-1747130_960_720.jpg" alt="부산">
							</a>
						</div>
						
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=busan" class="font-weight-bold text-dark">부산</a>
						</div>						
					</div>

					<div class="box ml-3 mt-3">
						<div class="inner-box text-center">
							<a href="/lodging/lodginglist/view?area_name=jeju&sortType=" class="box-profile">
								<img class="profile my-3" width = "" src="https://cdn.pixabay.com/photo/2017/10/15/13/54/doll-2853763_960_720.jpg" alt="제주">
							</a>
						</div>
						<div class="box-body d-flex justify-content-center align-items-center">
							<a href="/lodging/lodginglist/view?area_name=jeju&sortType=" class="font-weight-bold text-dark">제주</a>
						</div>
					</div>
				</div><br>
				
				<!-- 그외에 메인페이지 추가할 내용?  -->
			<div class="text-center">
				<i id="preveBtn" width="25" height="25" class="bi bi-caret-left"></i>
				<!--픽사베이거 퍼오기-->
	        		<img id="image" width ="700" src="https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg" alt="사진1">

	        	<i id = "nextvBtn" width="25" height="25" class="bi bi-caret-right"></i>
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
	$(document).ready(function() {
        var now = new Date();
	    document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);

        document.getElementById('endDate').value = new Date(now.setDate(now.getDate()+1)).toISOString().substring(0, 10);
        $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy-mm-dd",
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' ,
             todayHighlight :true,// 오늘을 표시해줄지. default 가 false
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             language: 'ko',
             onSelect:function(selectedDate) {

                 $("#endDate").datepicker("option", "minDate", selectedDate);

                 }

         });
        // todayHighlight :true,

         $("#endDate").datepicker({//종료일
             dateFormat:"yy-mm-dd",
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
             showButtonPanel:true,//버튼보이기
             closeText: 'done',
             minDate:'+1D',//오늘날짜 다음 부터
             language: 'ko',
             //beforeShow: customRange
              onSelect:function(selectedDate) {

                 $("#startDate").datepicker("option", "maxDate", selectedDate );

              }

         });
         /*
         function navigateToLodgingList(areaName, sortType) {
             let url = `/lodging/lodginglist/view?area_name=${areaName}`;
             if (sortType) {
                 url += `&sortType=${sortType}`;
             }
             window.location.href = url;
         }*/
		
		var imageList = ["https://cdn.pixabay.com/photo/2016/03/28/09/34/bedroom-1285156_960_720.jpg"
						  ,"https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg"  
						  , "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg"];
		var imageIndex = 1;
        $("#prevBtn").on("click", function(){//이미지 세개 준비후 다음버튼 누르면 다음이미지거 가 보여주는거를 해야함. 배열로 저장한다.
    
            $("#image").attr("src", imageList[imageIndex]);
            imageIndex--;
            if(imageIndex == -1){//<0일때 혹은 -1일때
                imageIndex = imageList.length - 1;//이것도 배열 길이에 맞춰서
            }
        });

        $("#nextvBtn").on("click", function(){
            $("#image").attr("src", imageList[imageIndex]);
            imageIndex++;
            if(imageIndex == imageList.length){//length 라고 잡아주면 편함 사진 개수상관없이 무리없이 가능.
                imageIndex = 0;//0으로 다시 되돌린다.
            }
        });
	});
	</script>
</body>
</html>