<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1">
<title>Search Example</title>
<link rel="stylesheet" href="../resources/css/csshealth/main.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/PhoneCSS.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../resources/js/jshealth/search.js"></script>
<script src="../resources/js/plugins.js"></script>
<script src="../resources/js/main.js"></script>
</head>
<body>
	<nav style="background-color: black">
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

	<!-- 검색구간 -->
	<div id="searchingdiv">
		<h1>보건소 검색</h1>
		<input id="search" autocomplete="off" placeholder="지역을 입력해주세요!">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">보건소 이름</th>
					<th scope="col">주소</th>
					<th scope="col">전화번호</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<p id="noresults">결과를 찾을 수 없습니다.</p>

	</div>

	<!-- footer -->
	<footer id="footer" style="position: absolute; bottom: 0px;">
		<div class="container-fluid">
			<div class="col-md-12">
				<p id="ff">Copyright &copy; 2018 Company Name | Designed by
					TemplateMo</p>
			</div>
		</div>
	</footer>

</body>
</html>
