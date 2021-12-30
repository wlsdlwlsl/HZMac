<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--
    Document Title
    =============================================
    -->
<title>DOGETHER</title>

   <!-- JavaScripts ============================================= -->
	<script src="../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery|| document.write('<script src="../resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="../resources/shoppingmall/lib/jquery/dist/jquery.js"></script>
	<script src="../resources/shoppingmall/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../resources/shoppingmall/lib/wow/dist/wow.js"></script>
	<script src="../resources/shoppingmall/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../resources/shoppingmall/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="../resources/shoppingmall/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../resources/shoppingmall/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../resources/shoppingmall/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../resources/shoppingmall/lib/smoothscroll.js"></script>
	<script src="../resources/shoppingmall/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script src="../resources/shoppingmall/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="../resources/js/vendor/bootstrap.min.js"></script>
	<script src="../resources/js/plugins.js"></script>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/shoppingmall/js/plugins.js"></script>
	<script src="../resources/shoppingmall/js/main.js"></script>
	<script src="../resources/shoppingmall/js/submit.js"></script>

   <!-- Css ============================================= -->
  	<link href="../resources/shoppingmall/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/animate.css/animate.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/et-line-font/et-line-font.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/flexslider/flexslider.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
	<link href="../resources/shoppingmall/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
	<link href="../resources/shoppingmall/css/style.css" rel="stylesheet">
	<link id="color-scheme" href="../resources/shoppingmall/css/colors/default.css" rel="stylesheet">
	<link rel="stylesheet" href="../resources/css/templatemo-style.css">
	<link rel="stylesheet" href="../resources/css/NAVandFOOTER.css">
	<link rel="stylesheet" href="../resources/shoppingmall/css/shoppingmall.css">

<c:set var="nameCount" value="0" />
<script>
	function requestPay() {

		// IMP.request_pay(param, callback) 
		let productID = $(".ProductID").val();
		let nameCount = $("#nameCount").text() - 1;
		let totalPrice = parseInt($("#TP").text());
		let productName = $("#ProductName").text();
		let email = $("#memberemail").text();
		let memberID = $("#memberID").text();
		let phoneNumber = $("#memberPhoneNumber").text();
		let basicAddress = $("#memberBasicAddress").text();
		let ZipCode = $("#memberZipCode").text();
		console.log(nameCount, totalPrice, productName, email, memberID,
				phoneNumber, basicAddress, ZipCode, productID)

		if (productName == "") {
			alert("장바구니에 상품이 없습니다.")
			return;
		}
		let pname = "";
		if(nameCount < 1){
			pname = productName;
		}
		else{
			pname = productName+" 외 "+nameCount+"건";
		}
		
		IMP.request_pay({ // param
			pg : "TC0ONETIME",
			pay_method : "card",
			//merchant_uid : "ORD20180131-0000331", 주문번호는 랜덤생성
			name : pname,
			amount : 100,//totalPrice,
			buyer_email : email,
			buyer_name : memberID,
			buyer_tel : phoneNumber,
			buyer_addr : basicAddress,
			buyer_postcode : ZipCode
		}, function(rsp) { // callback
			if (rsp.success) {
				afterPaydeleteShoppingCart();
				afterPayinsertOrders(rsp["merchant_uid"]);
				alert("결제성공") 
				location.replace("shoppingCart.do")
			} else {
				alert("결제에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}

	function afterPaydeleteShoppingCart() {
		$.ajax({
			type : 'post',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			url : 'deletefromjanbaguni.do',
			success : function(result) {
				console.log("장바구니에서 삭제 완료")
			},
			error : function(err) {
				alert("장바구니에서 삭제 에러발생")
			}
		})//end of ajax
	}//end of afterPaydeleteShoppingCart

	function afterPayinsertOrders(orderid) {
		$.ajax({
			type : 'post',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data : {
				OrderID : orderid
			},
			url : 'insertOrderList.do',
			success : function(result) {
				alert(result + "개 품목 구매완료!")
			},
			error : function() {
				alert("Order테이블에 추가하기 에러발생")
			}
		})//end of ajax

	}//end of afterPayinsertOrders

	$(function() {
		var IMP = window.IMP;
		IMP.init("imp19194605");

	})
	
</script>








</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">로딩중...</div>
		</div>


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



		<div>
			<!-- nav바 메뉴 -->
			<section class="overlay-menu">
				<div class="container">
					<div class="row">
						<div class="main-menu">
							<ul>
								<li><a href="../runninggoo.do">런닝구</a></li>
								<li><a href="#">Gym 예약할까</a></li>
								<li><a href="../ai_home_trainer_view/1_aiHT_main.do">온라인
										PT</a></li>
								<li><a href="../boast.do">자랑하기</a></li>
								<li><a href="../healthcenter.do">Inbody 측정 보건소</a></li>
								<li><a href="../Mypage/">쇼핑몰</a></li>
								<li><a href="../userMyPage/">마이페이지</a></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>



		<form action="updateQuantity.do" method="post" id="formform">
			<div class="main">
				<section class="module">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<h1 class="module-title font-alt">장바구니</h1>
							</div>
							<div id="mainBtn">
								<a class="section-scroll btn btn-border-w btn-round detailBtn" id="cartBtn"
									href="totalproduct.do">모든상품</a> 
									<a class="section-scroll btn btn-border-w btn-round detailBtn" id="cartBtn"
									href="shoppingmall.do">HOME</a>
							</div>
						</div>
						<hr class="divider-w pt-20">
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-striped table-border checkout-table">
									<tbody>
										<tr>
											<th class="hidden-xs">상품</th>
											<th>상품명</th>
											<th class="hidden-xs">가격</th>
											<th>수량</th>
											<th>총 가격</th>
											<th>삭제</th>
										</tr>
										<!-- form 우너래자리 -->
										<c:set var="totalprice" value="0" />
										<c:forEach items="${jangbaguni}" var="cart">
											<input class="productID" type='hidden' name='productID' value="${cart['ProductID']}" />
											<div id="memberemail" style="display: none">${memberInfo.email}</div>
											<div id="memberID" style="display: none">${memberInfo.memberID}</div>
											<div id="memberPhoneNumber" style="display: none">${memberInfo.phoneNumber}</div>
											<div id="memberBasicAddress" style="display: none">${memberInfo.basicAddress}</div>
											<div id="memberZipCode" style="display: none">${memberInfo.zipCode}</div>
											<tr>
												<td class="hidden-xs"><a href="#"><img
														src="../resources/shoppingmall/productimgs/${cart['Product_realfname']}" /></a></td>
												<td>
													<h5 class="product-title font-alt ProductName" id="ProductName">${cart["ProductName"]}</h5>
													<div id="PID" style="display : none;">${cart['ProductID']}</div>
													<c:set var="nameCount" value="${nameCount+1}" />
												</td>
												<td class="hidden-xs">
													<h5 id="ProductPrice" class="product-title font-alt">${cart["ProductPrice"]}₩</h5>
													<c:set var="price" value="${cart['ProductPrice']}" />
												</td>
												<td><input id="ProductCNT" class="form-control"
													type="number" name="productQuantity"
													value="${cart['ProductQuantity']}" max="20" min="1" /> <c:set
														var="CNT" value="${cart['ProductQuantity']}" /></td>
												<td>
													<h5 id="TotalPrice" class="product-title font-alt">${price*CNT}₩</h5>
												</td>
												<td class="pr-remove"><a href="#"
													id="removeBtn"><i class="fa fa-times"
														style="cursor: pointer"></i></a></td>
											</tr>
											<c:set var="totalprice"
												value="${totalprice + (cart['ProductPrice'] * cart['ProductQuantity']) }" />
										</c:forEach>
										<div id="nameCount" style="display: none">${nameCount}</div>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">

							<div class="col-sm-3 col-sm-offset-3">
								<div class="form-group">
									<button id="updateBtn"
										class="btn btn-block btn-round btn-d pull-right" type="submit">
										<!-- onclick="location.href='updateQuantity.do'" -->
										UpdateCart
									</button>

								</div>
							</div>
						</div>
						<hr class="divider-w">
						<div class="row mt-70">
							<div class="col-sm-5 col-sm-offset-7">
								<div class="shop-Cart-totalbox">
									<h4 class="font-alt">Cart Totals</h4>
									<table class="table table-striped table-border checkout-table">
										<tbody>
											<tr class="shop-Cart-totalprice">
												<th>총 가격 :</th>
												<td id="TP">${totalprice}₩</td>
											</tr>
										</tbody>
									</table>
									<button class="btn btn-lg btn-block btn-round btn-d"
										type="button" onclick="requestPay()">계산하기</button>
								</div>
							</div>
						</div>
					</div>
				</section>





				<div>
					<!-- nav바 메뉴 -->
					<section class="overlay-menu">
						<div class="container">
							<div class="row">
								<div class="main-menu">
									<ul>

										<li><a href="#">런닝구</a></li>
										<li><a href="#">Gym 예약할까</a></li>
										<li><a href="#">온라인 PT</a></li>
										<li><a href="#">자랑하기</a></li>
										<li><a href="#">BMI 측정가능 보건소</a></li>
										<li><a href="#">쇼핑몰</a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>







			</div>
		</form>



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
	      
      

		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	
</body>
</html>
