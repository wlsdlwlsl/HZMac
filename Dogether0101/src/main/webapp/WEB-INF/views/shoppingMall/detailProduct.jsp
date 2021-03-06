<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DOGETHER</title>
    
	<link rel="stylesheet" href="../resources/css/templatemo-style.css">
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
    <link rel="stylesheet" href="../resources/css/NAVandFOOTER.css">
	<link rel="stylesheet" href="../resources/shoppingmall/css/shoppingmall.css">    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../resources/css/PhoneCSS.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
    
    
    
    
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
    <script src="../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="../resources/js/vendor/bootstrap.min.js"></script>
	<script src="../resources/js/plugins.js"></script>
	<script src="../resources/js/main.js"></script>
    <script src="../resources/shoppingmall/js/plugins.js"></script>
    <script src="../resources/shoppingmall/js/main.js"></script>
	<script src="../resources/shoppingmall/js/submit.js"></script>
	<script>
	//????????????  ??????--------------------
	  $(document).on('click', '#cartBtn', function(){
	    let Cnt = $("#productCnt").val();
	    let Name = $("#ProductNameName").text();
	    let ID = $("#productIDvalue").text();
	    $.ajax({
	    	type : 'post',
	    	data : {productQuantity : Cnt,productID : ID},
	    	contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	    	url : 'shoppingCartInsert.do',
	    	success : function(result){
	    		alert(Name+" "+Cnt+"??? "+result);
	    	},//end success
	    	error : function(err){
	    		alert("????????????--------------");
	    	}//end error
	    });//end of ajax
	  })
	//end of click

	</script>
 	
  </head>
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
   
   
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
     
	<!-- nav???---------------------------------------------------------- -->
		<nav>
			<div class="logo">
				<a href="../index.do">DO<em>GETHER</em></a>
			</div>
	    	<div class="menu-icon">
	    		<span></span>
			</div>
		</nav>
      <!-- nav???---------------------------------------------------------- -->
      
		<p id="productIDvalue" style="display:none;">${product.productID}</p>
	
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
	
									
              <div class="col-sm-6 mb-sm-40">
              		<img src="../resources/shoppingmall/productimgs/${product.product_realfname}" width="665" height="750" alt="????????????">				
              </div>
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 id="ProductNameName" class="product-title font-alt">${product.productName}</h1>
                  </div>
                </div>
                
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price font-alt"><span class="amount">${product.productPrice}???</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price font-alt"><span class="amount">${product.productContent}</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-4 mb-sm-20">
                    <input id="productCnt" class="form-control input-lg" type="number" name="coun" value="1" max="40" min="1" required="required"/>
                  </div>
                  <div class="col-sm-8"><button id="cartBtn" class="btn btn-lg btn-block btn-round btn-b">Add To Cart</button></div>
                  
                </div>
                <div class="row mb-20">
                <div id="detailBtn">
								<a class="section-scroll btn btn-border-w btn-round detailBtn" id="detailcartBtn2"
									href="totalproduct.do">????????????</a> 
									<a class="section-scroll btn btn-border-w btn-round detailBtn" id="detailcartBtn"
									href="shoppingCart.do">????????????</a>
							</div>
                </div>
              </div>
            </div>
    
    
    
    
          </div>
        </section>
  
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row foot">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About DOGETHER</h5>
                  <p>???????????? ??? ?????? QnA??? ?????? ???????????? ????????????????????????.</p>
                  <p>Phone: 010 - 1111 - 2222</p>Fax: +1 234 567 89 10
                  <p>Email: <a href="#">DOGETHER@dddogether.com</a></p>
                </div>
              </div>
             
            </div>
          </div>
        </div>
        <hr class="divider-d">
              
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
	      
      
      
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
      
      
      
      
    <div><!-- nav??? ?????? -->
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
              </ul>
          </div>
        </div>
      </div>
    </section>
    </div>
        
        
        
        
        
        
        
        
        

      
      
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
   
  </body>
</html>