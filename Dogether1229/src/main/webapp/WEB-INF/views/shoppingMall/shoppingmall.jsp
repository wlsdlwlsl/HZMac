<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DOGETHER SHOPPING MALL</title>
    <!--  
    Favicons
    =============================================
    -->
   
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    
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
    <!--  
    JavaScripts
    =============================================
    -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
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
    <script src="../resources/shoppingmall/js/plugins.js"></script>
    <script src="../resources/shoppingmall/js/main.js"></script>
    <script src="../resources/js/plugins.js"></script>
    <script src="../resources/js/main.js"></script>
    <script src="../resources/js/vendor/bootstrap.min.js"></script>
    
    
  </head>
  
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  
  
    <main>
      <div class="page-loader">
        <div class="loader">????????? ?????????....</div>
      </div>
      
      <!-- nav???---------------------------------------------------------- -->
	
<nav>
   <div class="logo">
       <a href="index.do">DO<em>GETHER</em></a>
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
              
                  <li>
                      <a href="#">?????????</a>
                  </li>
                  <li>
                      <a href="#">Gym ????????????</a>
                  </li>
                  <li>
                      <a href="#">????????? PT</a>
                  </li>
                  <li>
                      <a href="#">????????????</a>
                  </li>
                  <li>
                      <a href="#">BMI ???????????? ?????????</a>
                  </li>
                  <li>
                      <a href="#">?????????</a>
                  </li>
                  <li>
                      <a href="Mypage">???????????????</a>
                  </li>
                  
              </ul>
          </div>
        </div>
      </div>
    </section>
      <!-- nav???---------------------------------------------------------- -->
      <!-- ????????????---------------------------------------------------------- -->
      
      <!-- data-background="./resources/img/shoppingmall/main/ShoppingmallMainIMG.jpg" -->
     <section class="bg-dark-30 showcase-page-header module parallax-bg" id="mainSection" >
        <div class="titan-caption">
          <div class="caption-content">
            <div class="font-alt mb-30 titan-title-size-1">????????? ??????????????? ????????? ????????? ???????????????.</div>
            <div class="font-alt mb-40 titan-title-size-4">DOGETHER MALL</div>
              <div id="mainBtn">
	                	<a class="section-scroll btn btn-border-w btn-round" href="totalproduct.do">????????????</a>
	                	<a class="section-scroll btn btn-border-w btn-round" href="shoppingCart.do">????????????</a>
	           </div>
          </div>
        </div>
      </section>
      
      
      
      
      
      <div class="main">
      	<section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Best ??????</h2>
              </div>
            </div>
            <div class="row multi-columns-row">
            
            
            <c:forEach items="${bestProduct}" var="product">
              <div class="col-sm-6 col-md-3 col-lg-3">
	                <div class="shop-item">
	                  <div class="shop-item-image"><img src="../resources/shoppingmall/productimgs/${product.product_realfname}" width="262" height="259" />
	                    <div class="shop-item-detail"><a class="btn btn-round btn-b" href="detailProduct.do?ProductID=${product.productID}"><span class="icon-basket">Add To Cart</span></a></div>
	                  </div>
	                  <h4 class="shop-item-title font-alt"><a href="detailProduct.do?ProductID=${product.productID}">${product.productName}</a></h4>${product.productPrice}???
	                </div>
	              </div>	
              </c:forEach>
              
              
            <div class="row mt-30">
              <div class="col-sm-12 align-center"><a class="btn btn-b btn-round" href="totalproduct.do">?????? ????????????</a></div>
            </div>
          </div>
        </section>
      
      
        <section class="module">
        
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">?????? ????????????</h2>
                <div class="module-subtitle font-serif">DOGETHER??? ?????? ?????????????????? ??????????????????.<br>????????? ????????? ????????? ????????? ???????????????. </div>
              </div>
            </div>
            
            <div class="row">
              <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/?????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">????????? ????????? 9???</a></h4>2,000???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/????????????.PNG" width="160" height="160"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">?????? ????????? ????????????</a></h4>13,500???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/????????????.PNG" width="160" height="160"/></a>
                      <h4 class="shop-item-title font-alt"><a href="#">???????????? 2???</a></h4>2,500???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/???????????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">?????? ?????? ?????????</a></h4>8,500???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/????????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">?????? ?????? 3???</a></h4>1,300???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/?????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">???????????? ?????????</a></h4>4,500???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/?????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">?????? ?????????</a></h4>1,000???
                    </div>
                  </div>
                </div>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="#"><img src="../resources/shoppingmall/productimgs/???????????????.PNG" width="160" height="160" /></a>
                      <h4 class="shop-item-title font-alt"><a href="#">?????? ?????????</a></h4>3,200???
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        
        
        <!-- ????????????--------------------------------------------------------------------------------------------------------------------------------------------- -->
        <section class="module" id="news">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">?????? ??????</h2>
              </div>
            </div>
            <div class="row multi-columns-row post-columns wo-border">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/15/2021121500769.html">???(???)??? ????????? '????????? ??????' 3??????</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>???(???)??? ?????? ?????? ?????? 1??? ????????????, ?????? ????????? ??????????????? ?????????.</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/16/2021121601346.html">???????????? ??? ??? '??????'?????? ???????????? ??????</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>???????????? ????????? ????????? ???????????? ????????? ????????? ????????? ?????? ????????? ?????????.</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/15/2021121500911.html">'?????????' ??????????????? ?????? ?????? 5??????</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>???????????? ????????? ?????? ??? ???????????? ??????. ???????????? ????????? ????????? ??? ?????????, ???????????? ??????????????? ??????.</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/15/2021121501173.html">??????????????? ????????? ?????????? "????????? ??????"</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>???????????? '???????????????'??? ?????? ???????????? ?????? ????????? ???????????????.</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/15/2021121500859.html">??? ?????? ????????? '????????? ?????????'??? ??????????</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>????????? ??? ????????? ?????? ???????????? ??????, ???????????? ????????? ????????????. ?????? '????????? ?????????'??? ???????????? ?????? ?????? ????????? ????????? ????????? ????????? ??? ??? ??????.</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="post mb-40">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="https://health.chosun.com/site/data/html_dir/2021/12/14/2021121401600.html">?????? ?????? ?????? '??? ??????' ?????? ??????</a></h2>
                  </div>
                  <div class="post-entry">
                    <p>???????????? ????????? ????????? ????????? ?????? ????????? ????????? ????????? ????????? ????????? ?????? ?????? ????????? ?????????.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
	<!-- ????????????--------------------------------------------------------------------------------------------------------------------------------------------- -->

        
	<hr class="divider-w"><!-- ???????????? -->



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




      </div> <!-- end of main -->
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
    
  </body>
</html>