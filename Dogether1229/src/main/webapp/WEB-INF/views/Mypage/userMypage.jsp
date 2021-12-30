<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 페이지입니다.</title>
<!-- 공통 적용 -->
<link rel="stylesheet" href="../resources/css/usermypage/mypage.css">
<link rel="apple-touch-icon" href="apple-touch-icon.jpg">
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<link rel="stylesheet" href="../resources/css/boast.css">
<link rel="stylesheet" href="../resources/css/boast2.css">
<link href="../resources/css/admin/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/admin/style.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/NAVandFOOTER.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="../resources/js/admin/common-scripts.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="../resources/js/boast/boast.js"></script>
<script src="../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery|| document.write('<script src="../resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
<script src="../resources/js/vendor/bootstrap.min.js"></script>
<script src="../resources/js/plugins.js"></script>
<script src="../resources/js/main.js"></script>
<script src="../resources/mypage/usermypage.js"></script>
<script>
	$(function() {
		var IMP = window.IMP;
		IMP.init("imp19194605");
	})

	function requestPay() {
		var IMP = window.IMP;
		IMP.init("imp19194605");
		let price = $("#paypay").val();
		let memberID = $("#memberID").text();
		// IMP.request_pay(param, callback) 
		IMP.request_pay({ // param
			pg : "TC0ONETIME",
			pay_method : "card",
			//merchant_uid : "ORD20180131-0000331", 주문번호는 랜덤생성
			name : price + "포인트 충전",
			amount : 100,//totalPrice,
			buyer_email : "",
			buyer_name : "",
			buyer_tel : "",
			buyer_addr : "",
			buyer_postcode : ""
		}, function(rsp) { // callback
			if (rsp.success) {
				paypoint(memberID, price);
				alert("포인트 충전성공!!")
				location.replace("../Mypage/")
			} else {
				alert("충전에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}

	function paypoint(mID, pp) {
		console.log(mID + pp)
		$.ajax({
			type : 'post',
			data : {
				memberID : mID,
				price : pp
			},
			url : 'paypoint.do',
			success : function(result) {
				alert(price + result);
			},
			error : function(err) {
				alert("포인트 결제 실패")
			}
		})//end of ajax
	}//end of paypoint

	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			$("#image_container").empty();//일단 비우자
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>



</head>
<body class="boxed-page">


	      <!-- nav바---------------------------------------------------------- -->
		<nav>
			<div class="logo">
				<a href="../index.do">DO<em>GETHER</em></a>
			</div>
	    	<div class="menu-icon">
	    		<span></span>
			</div>
		</nav>
      <!-- nav바---------------------------------------------------------- -->
      




	<!--sidebar start-->
	<aside>
		<div id="sidebar" tabindex="0"
			style="overflow: hidden; outline: none;">
			<!-- sidebar menu start-->
			<ul class="sidebar-menu" id="nav-accordion">
				<ul class="sidebar-menu" style="padding: 25px;">
					<li><a href="#" id="mainmypage">마이 페이지</a></li>
					<li><a href="#" id="myRNG">내 런닝구 현황</a></li>
					<li><a href="#" id="myINFO">내 정보 수정</a></li>
					<li><a href="#" id="myMember">내 게시글 관리</a></li>
					<li><a href="#" id="myOrder">쇼핑몰 주문내역</a></li>
				</ul>
			</ul>
			<!-- sidebar menu end -->
		</div>
	</aside>
	<!--sidebar end-->

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 여기부터 내용부 -->
			<div class="row">
				<div class="col-md-12">


					<!-- 상단 메뉴 -->
					<section class="card">
						<div class="card-body">
							<h1 id="h1Admin">${member.userName}님 안녕하세요.</h1>
							<h1 id="h1RNG" style="display: none;">내 런닝구 현황</h1>
							<h1 id="h1INFO" style="display: none;">내 정보 수정</h1>
							<h1 id="h1Member" style="display: none;">내 게시글 관리</h1>
							<h1 id="h1Order" style="display: none;">쇼핑몰 주문 내역</h1>
						</div>
					</section>
					<!-- end 상단 메뉴 -->

					<!-- 목록 start -->
					<div class="row product-list">
						<div class="col-md-12">
							<section class="card">
								<div class="card-body text-center"
									style="margin: auto; width: 90%;">





									<div id="myPageMain" class="sese">
										<div class="myImgPoint">
											<!-- 마이페이지 기본화면 -->
											<div id="profileimage">
												<img id="profileIMG"
													src="../resources/img/imgforboard/img.png">
											</div>
											<div id="memberInfo">
												<div id="memberID" style="display: none">${member.memberID}</div>
												<h3>
													이름 : <b>${member.userName}</b>
												</h3>
												<h3>
													닉네임 : <b>${member.nickName}</b>
												</h3>
												<h3>
													포인트 : <b>${member.point}P</b>
												</h3>
												<input id="paypay" type="number"
													placeholder="충전하실 금액을 적어주세요." style="width: 190px" min="0" />
												<button type="button" onclick="requestPay()">포인트 충전</button>
												<p>※포인트는 런닝구 매칭의 예약금으로 사용됩니다.</p>
											</div>
										</div>
									</div>










									<!-- 런닝구  -->
									<div id="MyRunninggo" class="sese">
										<!-- ########## 런닝구 리스트  ########## -->
										<table id="userRNGList" border="2" style="display: none;">
											<!-- 여기에 ajax에서 동적으로 생성한 tr>td가 들어감 -->
										</table>
									</div>







									<!-- 내 정보 수정 -->
									<div id="UpdateMyInfo" class="sese" style="display: none;">
										<!--###################### 내정보 수정 폼 ###################### -->
										<form method="post" action="updateMemberInfo.do"
											enctype="multipart/form-data" id="userinput">
											<!-- 상단 소개말--------------------------------------------------------- -->
											<table class='updatetable'>
												<tr>
													<td class="normalbold tb_ttl">
														<div align="center">프로필사진</div>
													</td>
													<td colspan="3" class="normal" id="profileTD">
														<div id="image_container"></div> <input type="file"
														onchange="setThumbnail(event);" id="fileselectBtn"
														name='file' maxlength="60" size="30"
														accept="image/jpeg,.jpg,.png" required> <input
														type="hidden" name="memberID" value="${member.memberID}" />
													</td>
												</tr>
												<tr>
													<td class="normalbold tb_ttl">
														<div align="center">PW 변경</div>
													</td>
													<td class="normal"><input type="password" name="pw"
														id="userPass" placeholder="변경하실 PW.">
														<div id="pwcheck" style="color: red;"></div></td>
													<td class="normalbold tb_ttl">
														<div align="center">PW 확인</div>
													</td>
													<td class="normal"><input type="password"
														id="userPass2" placeholder="한번더 입력해주세요.">
														<div id="pwcheck2" style="color: red;"></div></td>
												</tr>
												<tr>
													<td class="normalbold tb_ttl">
														<div align="center">닉네임</div>
													</td>
													<td colspan="3" height="23" class="normal"><input
														type="text" name="nickName" id="usernickN"
														placeholder="변경하실 닉네임">
														<button type="button" id="nNCheckResult2">중복확인</button> <span
														id="nNCheckResult" style="width: 150px; color: red"></span>
														<div id="ncheck" style="color: red;"></div></td>
												</tr>
												<tr>
													<td class="normalbold tb_ttl">
														<div align="center">전화번호</div>
													</td>
													<td class="normal" colspan="3"><input type="text"
														name="phoneNumber" class="phone" maxlength="13"
														placeholder="변경하실 번호"
														oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">

														<div class="eheck_font" id="phone_check"></div></td>
												</tr>
												<tr>
													<td colspan="1" class="normalbold tb_ttl">
														<div align="center">우편번호</div>
													</td>
													<td colspan="3" class="normal"><input type="text"
														size="20" value="" name="zipCode" id="Zipcode"> <input
														type="button" value="주소검색" id="btnAddress"></td>
												</tr>
												<tr>
													<td colspan="1" class="normalbold tb_ttl">
														<div align="center">주소</div>
													</td>
													<td class="normal" colspan="3"><input type="text"
														name="basicAddress" id="BasicAddress" size="30"> <input
														type="text" name="restAddress" id="RestAddress" size="10"
														placeholder="상세주소를 입력해주세요."></td>
												</tr>



												<tr>
													<td colspan="4" class="normal" width="70%" height="5%">
														<div align="center">
															<button type="button" id="submitBtn">수정</button>
														</div>
													</td>
												</tr>

											</table>
										</form>
									</div>





									<!-- 자랑하기 -->
									<div id="MyBoard" class="sese" style="display: none;">
										<c:if test="${not empty nullCheck }">
											<h2>${nullCheck}</h2>
										</c:if>
										<c:if test="${empty nullCheck}">

											<div id="ontheside">
												<div class="mainContainer">

													<c:set var="count" value="0" />
													<c:forEach var="item" items="${list}">
														<c:set var="count" value="${count + 1}" />
														<input type="hidden" value="${item.boardID }">

														<!-- 게시글 div -->
														<div class="card">
															<div id="userdiv">
																<img
																	src="../resources/img/imgforboard/default_person.png"
																	id="userpic"> ${item.memberID}
															</div>
															<div id="content">
																<div id="pic"
																	style='background-image: url(../resources/img/imgforboard/img.png)'></div>
															</div>

															<!-- 사진 밑으로 좋아요 버튼 및 댓글내용 댓글 -->
															<div id="cardContent"
																style="text-align: left; color: black;">

																<c:set var="found" value="0" />
																<c:forEach var="like" items="${like_list}">
																	<c:if test="${like.boardID eq item.boardID}">
																		<c:set var="found" value="1" />
																		<div id='ajaxlikebutton'>
																			<button class="likeButton" value="Y">좋아요♥ 취소</button>
																		</div>
																	</c:if>
																</c:forEach>

																<c:if test="${found eq 0 }">
																	<div id='ajaxlikebutton'>
																		<button class="likeButton" value="N">좋아요♡</button>
																	</div>
																</c:if>

																<p id="usernameforcontent">${item.memberID }</p>
																<p id="boardContent">${item.boardContent }</p>
																<div id="likeCount" style="color: blue;">좋아요 ${item.board_like_count}개</div>

																<!-- 댓글 불러오는 부분 -->
																<c:set var="count" value="0" />
																<c:forEach var="reply" items="${reply_list}">
																	<!-- reply for문시작 -->
																	<c:if test="${reply.boardID eq item.boardID }">

																		<!-- count가 2보다 작을떄는 모든 게시물 다 싹뜨게함 -->
																		<c:if test="${count lt 2}">
																			<div class="comments">
																				<ul id="forid">
																					<li id="commentwriter" class="reply">${reply.replyer}</li>
																					<li class="reply">${reply.reply }</li>
																				</ul>
																			</div>
																		</c:if>

																		<!-- count가 2보다 같거나 크면 나머지는 display : none로 감추기 -->
																		<c:if test="${count gt 1 }">
																			<!-- count가  2보다 같거나 크고 count가 2일경우 더보기 칸 추가. -->
																			<c:if test="${count eq 2 }">
																				<span class="more" style="cursor: pointer">더보기...</span>
																				<br>
																			</c:if>
																			<div class="comments" style="display: none;">
																				<ul id="forid">
																					<li id="commentwriter" class="reply">${reply.replyer}</li>
																					<li class="reply">${reply.reply }</li>
																				</ul>
																			</div>
																		</c:if>

																		<c:set var="count" value="${count+1}" />
																	</c:if>
																</c:forEach>
																<!-- reply for문 끝 -->


																<!-- 댓글 다는부분 -->
																<div id="commentside">
																	<div id="writernameforcomment">${sessionScope.username }</div>
																	<input type="text" class="comment">
																	<button id="commentbutton">댓글달기</button>
																</div>
																<!-- 댓글 다는부분 끝 -->


															</div>
															<!-- 사진 밑으로 좋아요 버튼 및 댓글내용 댓글 끝-->



														</div>
														<!-- 게시글 div end-->
													</c:forEach>
												</div>
											</div>


										</c:if>
									</div>





									<!-- 쇼핑몰  -->
									<div id="myorderList" class="sese" style="display: none;">
										<!-- ########## 회원 리스트  ########## -->
										<table id="userOrderList" border="2">
											<!-- 여기에 ajax에서 동적으로 생성한 tr>td가 들어감 -->
										</table>
									</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<!-- end row -->
		</section>
		<!-- end wrapper-->
	</section>
	<!-- end main content -->

	
	
	
	
	  
        <div><!-- nav바 메뉴 -->
    <section class="overlay-menu">
      <div class="container">
        <div class="row">
          <div class="main-menu">
              <ul>
                  <li><a href="../runninggoo.do">런닝구</a></li>
                  <li><a href="#">Gym 예약할까</a></li>
                  <li><a href="../ai_home_trainer_view/1_aiHT_main.do">온라인 PT</a></li>
                  <li><a href="../boast.do">자랑하기</a></li>
                  <li><a href="../healthcenter.do">Inbody 측정 보건소</a></li>
                  <li><a href="../shoppingmall.do">쇼핑몰</a></li>
                  <li><a href="../userMyPage/">마이페이지</a></li>
              </ul>
          </div>
        </div>
      </div>
    </section>
    </div>
        
        

        
	      <!-- footer---------------------------------------------------------- -->
		<footer id="footer">
	        <div class="container-fluid">
	            <div class="col-md-12">
	                <p id="ff">Copyright &copy; 2018 Company Name 
				       | Designed by TemplateMo
				    </p>
	            </div>
	        </div>
		</footer>
		<!-- footer---------------------------------------------------------- -->
	      
      

</body>
</html>