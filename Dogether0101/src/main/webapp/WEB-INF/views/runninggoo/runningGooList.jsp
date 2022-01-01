<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/runninggoo/runninggooMain.css">
 <link href="${pageContext.request.contextPath}/resources/ai_home_trainer_resources/css/main.css" rel="stylesheet">
 <link rel="stylesheet" href="../resources/css/PhoneCSS.css">
<!-- 	<link rel="stylesheet" href="resources/css/templatemo-style.css">
 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<title>런닝구</title>
</head>
<body>
	<div>
	<!-- header -->
	<nav>
		<div class="logo">
			<a href="../index.do">DO<em>GETHER</em></a>
		</div>
		<div class="menu-icon">
			<span></span>
		</div>
	</nav>
	
	<section class="overlay-menu">
      <div class="container">
         <div class="row">
            <div class="main-menu">
               <ul>
                  <li><a href="runninggoo.do">런닝구</a></li>
                  <li><a href="#">Gym 예약할까</a></li>
                  <li><a href="ai_home_trainer_view/1_aiHT_main.do">온라인 PT</a></li>
                  <li><a href="boast.do">자랑하기</a></li>
                  <li><a href="healthcenter.do">Inbody 측정 보건소</a></li>
                  <li><a href="shoppingmall.do">쇼핑몰</a></li>
                  <li><a href="userMyPage/myPage.do">마이페이지</a></li>

               </ul>
            </div>
         </div>
      </div>
   </section>
	
	<h1 class="currentSessionMyID">${sessionScope.username }</h1>
	
	<!-- DB에서 forEach 돌며 값 불러오기 -->
	<div class="col-12 rn_room_list_wrap">
		<c:forEach items="${RunningGooList }" var="runninggoo">
					<div class="col-12 runninggoo_card_wrap">
				<div class="col-12 runninggoo_card_inner mb30">
					<div class="isMatched"></div>
					<div class="col-12 rn_card_user_profile">
						<div class="rngRoomNum" style="display:none">${runninggoo.roomNumber }</div>
						<div class="col-0 rn_profile_picture">
							<img src="${pageContext.request.contextPath}/resources/img/runninggooimage/default_profile.png" alt="">
						</div>
						<div class="col-0 rn_profile_nickname">${runninggoo.memberID}</div>
						<div class="col-0 rn_profile_eval">별점</div>
						<div class="col-0 rn_profile_memberCount">
							<span class="currentMembers">${runninggoo.currentMembers }</span>
							 / 
							 <span class="maxMembers">${runninggoo.maxMembers }</span>
						</div>
					</div>
					<div class="col-12 kakao_map">
					</div>
					<div class="col-12 rn_card_check_box">
						<div class="col-4 rn_card_sports_event_choice">
							<div>
								<p class="rn_room_hashtag">#만나는 날짜/시간</p>
								<div id="showMeetingTime">${runninggoo.meetingTime }</div>
							</div>
							<p class="rn_room_hashtag">#스포츠 종목</p>
							<c:set var="SportsType" value="${runninggoo.sportsType}"/>
							<c:choose>
								<c:when test="${SportsType == 0}">
									<input type="checkbox" checked disabled>런닝
								</c:when>
								
								<c:when test="${SportsType == 1}">
									<input type="checkbox" checked disabled>발야구
								</c:when>
								
								<c:when test="${SportsType == 2}">
									<input type="checkbox" checked disabled>피구
								</c:when>
								
								<c:when test="${SportsType == 3}">
									<input type="checkbox" checked disabled>테니스
								</c:when>
								
								<c:when test="${SportsType == 4}">
									<input type="checkbox" checked disabled>배드민턴
								</c:when>
								
								<c:when test="${SportsType == 5}">
									<input type="checkbox" checked disabled>프리스비
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${SportsType == 0 }">
									<p class="rn_room_hashtag">#런닝 뛸 거리</p>
									<div class="runningDTC">${runninggoo.runningDistance }Km</div>
								</c:when>
								<c:otherwise>
									<p class="rn_room_hashtag">#운동시간</p>
									<div class="exerciseTime">${runninggoo.sportsTime }시간</div>
								</c:otherwise>
							</c:choose>
							
						</div>
						<div class="col-4 rn_card_sports_location_choice">
							<p class="rn_room_hashtag">#장소</p>
							<div id="rngLocation">${ runninggoo.location}</div>
						</div>
						<div class="col-4 rn_card_sports_age_choice">
							<p class="rn_room_hashtag">#연령대</p>
							<c:set var="AgeGeneration" value="${runninggoo.ageGeneration}"/>
							<c:choose>
								<c:when test="${AgeGeneration == 20}">
									<input type="checkbox" checked disabled>20대
								</c:when>
								
								<c:when test="${AgeGeneration == 30}">
									<input type="checkbox" checked disabled>20대 ~ 30대
								</c:when>
								
								<c:when test="${AgeGeneration == 40}">
									<input type="checkbox" checked disabled>20대 ~ 40대
								</c:when>
								
								<c:when test="${AgeGeneration == 50}">
									<input type="checkbox" checked disabled>20대 ~ 50대
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="col-12 rn_card_host_comment_box">
						<div class="balloon">
							<p class="rn_room_hashtag">#호스트 코멘트</p>
							<div class="col-12 rn_card_host_comment">${runninggoo.hostComment }</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${ sessionScope.username == runninggoo.memberID }">
							<div class="col-12 doJoinBtn">
								<input type="button" class="hostBtn" value="Enrollment Status">
							</div>
							<div class="col-12 deleteBtn">
								<input type="button" class="delBtn" value="deleteRoom">
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-12 doJoinBtn">
								<input type="button" class="userBtn" value="DoJoin">
							</div>
						</c:otherwise>
					</c:choose>
				<div class="wido" style="display: none">${runninggoo.locationLat}</div>
				<div class="gyeongdo" style="display: none">${runninggoo.locationLong}</div>
				</div>
			</div>
		</c:forEach>
		<div class="col-12 rn_plus_btn">
			<a href="createRngRoom.do" class="rn_plus_btn_link"> <img
				src="${pageContext.request.contextPath}/resources/img/runninggooimage/rng_plus_btn.png">
			</a>
		</div>

		<div class="col-12 rn_top_btn">
			<a href="#">▲ 맨 위로</a>
		</div>
	</div>

	<!--  footer -->
	<footer id="footer">
		<div class="container-fluid">
			<div class="col-md-12">
				<p id="ff">Copyright &copy; 2018 Company Name | Designed by
					TemplateMo</p>
			</div>
		</div>
	</footer>
	
	<div class="rngForEachLength" style="display:none">${rnRoomCNT }</div>
	</div>

	<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b002992ff5db3facd06fff2ffcf08711"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/runninggoo/kakaoMap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/runninggoo/RunningGoo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/runninggoo/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/runninggoo/main.js"></script>
</body>
</html>