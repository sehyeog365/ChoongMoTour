<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 숙소화면</title>
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
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="lodging-list">
				<h1 class="text-center pt-3">
					<b>ChoongMo Tour Lodging List Page</b>
				</h1>
				<div class="d-flex justify-content-between mt-3">
					<i id="filterIcon"class="filter-icon bi bi-filter-left" style="font-size :20px;" data-toggle="modal"  data-target="#filterModal">필터</i>
					<i id="sortIcon" class="sort-icon bi bi-arrow-down-up" style="font-size :20px;" data-toggle="modal" data-target="#sortModal">정렬</i>
				</div>
				<h2 class="d-flex">
					<strong id = "">
					    <div id = "areaName" data-area-name="${lodgingList[0].areaName}">
                            <c:choose>
                                <c:when test ="${lodgingList[0].areaName eq 'seoul'}">
                                    서울
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'incheon'}">
                                    인천
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'gangwon'}">
                                    강원
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'gyeongsang'}">
                                    경상
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'jeolla'}">
                                    전라
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'busan'}">
                                    부산
                                </c:when>
                                <c:when test ="${lodgingList[0].areaName eq 'jeju'}">
                                    제주
                                </c:when>
                            </c:choose>
						</div>
					</strong>
					<strong>호텔(${lodgingCount}개)</strong>
				</h2>

				<!-- 숙소 리스트 카드 리스트 -->
				<div class="lodging-card-list">
					<!-- 그니까 애초에 여기있는 c태그도 다르게 써야하는게 아닌가싶다?? 찜한 정보가안올라오는데??? -->
					<c:forEach var="lodging" items = "${lodgingList }">
					<div class="lodging-card bg-warning mt-3">
							<div class="heart mr-3">
                                <!-- 하트아이콘 -->
                                <c:choose>
                                    <c:when test="${lodging.dibs}">
                                            <i class="undib-icon bi bi-heart-fill text-danger mt-2 ml-2" style="font-size :20px;" data-lodging-id = "${lodging.id }"></i>
                                    </c:when>
                                    <c:otherwise>	<!-- 검정하트 빈하트 -->
                                            <i class="dib-icon bi bi-heart mt-2 ml-2" style="font-size :20px;" data-lodging-id = "${lodging.id }"></i>
                                    </c:otherwise>
                                </c:choose>
							</div>
							
							<a href="/lodging/room/view?id=${lodging.id }" class="d-block lodging-profile">
								<img class="profile" src="${lodging.imagePath }">
							</a>
							<div class="lodging-card-textbox">
								<h4 class="text-white lodging-texts">
									<b>${lodging.roomName }</b>
									<div class="d-flex">
									<c:choose>
										<c:when test = "${lodging.level eq '5성급' }">
											<div class="text-warning"><b>${lodging.level }</b></div><!-- 성급도 for문써서 해보기 -->
										</c:when>
										<c:when test = "${lodging.level eq '4성급' }">
											<div class="text-danger"><b>${lodging.level }</b></div><!-- 성급도 for문써서 해보기 -->
										</c:when>
										<c:when test = "${lodging.level eq '3성급' }">
											<div class="text-secondary"><b>${lodging.level }</b></div><!-- 성급도 for문써서 해보기 -->
										</c:when>
										<c:when test = "${lodging.level eq '2성급' }">
											<div class="text-success"><b>${lodging.level }</b></div><!-- 성급도 for문써서 해보기 -->
										</c:when>
										<c:when test = "${lodging.level eq '1성급' }">
											<div class="text-primary"><b>${lodging.level }</b></div><!-- 성급도 for문써서 해보기 -->
										</c:when>
									</c:choose>
									    <div class="ml-2">${lodging.avgStarPoint}점</div>
									    <div class="ml-2">${lodging.commentCount}명 평가</div>
									    <div class="ml-2"><fmt:formatNumber value="${lodging.singleRoomPrice}" type="currency" currencySymbol=""/>원</div>
									</div>
								</h4>
							</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<!-- 숙소 리스트 카드 리스트 -->

			<!-- Button trigger modal -->
					<!-- Modal -->		<!-- class에 info-modal 이렇게 해서 안지워지는 오류가 생긴거였음 -->		<!-- 모달사이즈 -->
					<div class="modal fade " id="filterModal" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-header">
					        <h5 class="modal-title">필터 모달</h5>
			     		   </div>
					
					      <div class="modal-body text-center">
					       								<!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->
					     	<p> </p>
					      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
					      <div class="modal-footer">
			        		<button type="button" id="closeBtn "class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      		  </div>
					    </div>
					  </div>
					</div>

					<div class="modal fade " id="sortModal" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-header">
					        <h5 class="modal-title">정렬 모달</h5>
					        
			     			 </div>	
					
					      <div class="modal-body text-center">
					       								<!-- 동떨어진 하나의 태그기때문에 쓸수 있는정보가 암것도 없다. -->
					        <!-- 평점높은순, 리뷰많은순, 낮은가격순, 높은가격순 정렬 -->
                            <form action="/lodging/lodginglist/view" method="get" class="">
                                <div class="">
                                    <c:if test="${not empty lodgingList}">
                                        <input type="hidden" name="area_name" value="${lodgingList[0].areaName}">
                                    </c:if>
                                    <label class="col-9"><input type="radio" name="sortType" value="starPointOrder" onchange="this.form.submit()">평점높은순</label>

                                    <label class="col-9"><input type="radio" name="sortType" value="commentOrder" onchange="this.form.submit()">리뷰많은순</label>

                                    <label class="col-9"><input type="radio" name="sortType" value="lowPriceOrder" onchange="this.form.submit()">낮은가격순</label>

                                    <label class="col-9"><input type="radio" name="sortType" value="highPriceOrder" onchange="this.form.submit()">높은가격순</label>
                                </div>
                            </form>

					      </div><!-- 객체화시켜야 하므로 아이디 부여 --><!-- 속성을 동적으로 추가할려면? -->
					      <div class="modal-footer">
			        		<button type="button" id="closeBtn "class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      		  </div>
					    </div>
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
		
		// 필터모달
        /*
        function getSettingValue() {
        }

        // 숙소리스트 새로그리기
        function changeSearchCondition() {
            getSettingValue():
        }*/
        // 페이지 로딩 시 URL 파라미터로 라디오 버튼 상태 초기 세팅

		// URL 파라미터를 읽어오는 함수
        const url = new URL(window.location.href); // 좀더 가독성있게 코드문 고쳐보기
        const urlParams = url.searchParams;

        // URL 파라미터에서 sortType 값을 읽어옴
        const sortType = urlParams.get('sortType');

        if (sortType) {// 정렬 타입이 선택 했을시 로딩해도 체크 유지
            // 모든 라디오 버튼의 checked 속성을 제거
            $("input[name='sortType']").prop("checked", false);
            // sortType 값에 해당하는 라디오 버튼에 checked 속성을 추가
            $("input[name='sortType'][value='" + sortType + "']").prop("checked", true);
        }

		// 찜 해제
		$(".undib-icon").on("click", function(){
			let id = $(this).data("lodging-id");
			
			//alert(id);
			
			$.ajax({
				type: "get"
				, url :"/lodging/undib"
				, data:{"lodgingId":id}
				, success:function(data){
					if(data.result == "success"){//reuslt->result succes->success
						alert("찜 취소 성공");
						location.reload();
					} else {
						alert("찜 취소 실패");
					}
				}
				, error:function(){
					alert("찜 취소 오류");
				}
			});
		});
		// 찜
		$(".dib-icon").on("click", function(){
			let id = $(this).data("lodging-id");
			
			//alert(id);
			
			$.ajax({
				type:"post"
				, url:"/lodging/dib" // 404 경로문제 여기가 잘못되었다.
				, data:{"lodgingId":id}
				, success:function(data){
					if(data.result == "success"){
						alert("찜 성공");
						location.reload();
					} else {
						alert("찜 실패");
					}
				}
				,error:function(){
					alert("찜 오류");
				}
			});
		});
	});
	</script>
</body>
</html>