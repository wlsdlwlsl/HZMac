<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <title>Titan | Multipurpose HTML5 Template</title>
    <!--  
    Favicons
    =============================================
    -->

    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="../resources/aihometrainer/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="../resources/aihometrainer/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../resources/aihometrainer/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../resources/aihometrainer/css/colors/default.css" rel="stylesheet">
    
     <link href="../resources/aihometrainer/css/main.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
    
    
<style>

img#sub_img_size{
	  width: 100%;
 	 height: 465px;
 	 object-fit: cover;
 	 
 	 vertical-align: middle;
}
    
   div#img_margin{
   padding-rignt:30px;
   padding-left:30px;
   }    
    
    
</style>   


<script>

	function Hello(){


        var worksgrid   = $('#works-grid'),
        worksgrid_mode;

    if (worksgrid.hasClass('works-grid-masonry')) {
        worksgrid_mode = 'masonry';
    } else {
        worksgrid_mode = 'fitRows';
    }

    worksgrid.imagesLoaded(function() {
        worksgrid.isotope({
            layoutMode: worksgrid_mode,
            itemSelector: '.work-item'
        });
    });

    $('#filters a').click(function() {
        $('#filters .current').removeClass('current');
        $(this).addClass('current');
        var selector = $(this).attr('data-filter');

        worksgrid.isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });

        return false;
    });
		
		
        var demos2   = $('#demos2'),
            demos2_mode;

        if (demos2.hasClass('demos2-masonry')) {
            demos2_mode = 'masonry2';
        } else {
            demos2_mode = 'fitRows2';
        }

        demos2.imagesLoaded(function() {
            demos2.isotope({
                layoutMode: demos2_mode,
                itemSelector: '.aaaaa'
            });
        });




        $('#filters2 a').click(function() {
            $('#filters2 .current2').removeClass('current2');
            $(this).addClass('current2');
            var selector2 = $(this).attr('data-filter2');

            demos2.isotope({
                filter: selector2,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });

            return false;
        });
        

}

	</script>
 
  </head>
  
  
  
  
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
    
<!-- 헤더바 헤더바 헤더바 헤더바 -->
      
      
	<nav>
	   <div class="logo">
	       <a href="index.jsp">DO<em>GETHER</em></a>
	   </div>
	    <div class="menu-icon">
	       <span></span>
	    </div>
	</nav>      


<!-- 헤더바 끝! -->  
  
  
<!-- 헤더 오른쪽 목록 보기 -->


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
						<li><a href="Mypage">마이페이지</a></li>

					</ul>
				</div>
			</div>
		</div>
	</section>



<!-- 헤더 오른쪽 목록 보기 끝! -->  
  
  
  
  
   
   
 <!-- ìí íì´ì§!!!!! -->  
   
   
   
       <section class="module pb-0" id="works">
        
        
     	<!-- ì¹´íê³ ë¦¬ íì¤í¸ ìì -->   
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Exercise by body part</h2>
                <div class="module-subtitle font-serif"></div>
              </div>
            </div>
          </div>
          
          
          <div class="container">
            <div class="row">
              <div class="col-sm-12">
                <ul class="filter font-alt" id="filters2">
                
                
                  <li><a class="current2 wow fadeInUp" href="#" data-filter2="*">All</a></li>
                  
                  <li><a class="wow fadeInUp" id="test_back" value="click" onclick="hello()" href="#" data-filter2=".back_2" data-wow-delay="0.2s">back</a></li>
                  
                  <li><a class="wow fadeInUp" href="#" data-filter2=".belly_2" data-wow-delay="0.4s">belly</a></li>
                  
                  <li><a class="wow fadeInUp" href="#" data-filter2=".arm_2" data-wow-delay="0.6s">arm</a></li>
                  
                  <li><a class="wow fadeInUp" href="#" data-filter2=".leg_2" data-wow-delay="0.6s">leg & hip</a></li>
                  
                  <li><a class="wow fadeInUp" href="#" data-filter2=".hip_2" data-wow-delay="0.6s">whole body & Core</a></li>
                </ul>
              </div>
            </div>
            <!-- ì¹´íê³ ë¦¬ íì¤í¸ ë --> 
  
  
  
  
  		<!--  ## ì¬ê¸°ë¶í° -->
      
      <div class="main showcase-page">
      
      
        <section class="module-medium" id="demos">
        
        
          <div class="container">
          
            <div class="row multi-columns-row" id="demos2">
            
            
              <div class="col-md-4 col-sm-6 col-xs-12 back_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/main3.gif" alt="Main Demo"></div>
               	  <h3 class="content-box-title font-serif">Squat</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 arm_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/all.jpg" alt="Agency"></div>
                  <h3 class="content-box-title font-serif">Lungy</h3>
                  </a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 hip_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/3-squrt.jpg" alt="Portfolio"></div>
                  <h3 class="content-box-title font-serif">Plank</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 belly_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/3-yoga-1.jpg" alt="Restaurant"></div>
                  <h3 class="content-box-title font-serif">side-Plank</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 leg_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/main3.gif" alt="Finance"></div>
                  <h3 class="content-box-title font-serif">Burpee-Test</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 belly_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/3-yoga-hal.jpg" alt="Landing"></div>
                  <h3 class="content-box-title font-serif">Slow-Burpee</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 back_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size"  src="../resources/aihometrainer/images/3-squrt.jpg" alt="Photography"></div>
                  <h3 class="content-box-title font-serif">crunch</h3></a></div>
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 arm_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/3-pushup.jpg" alt="Shop"></div>
                  <h3 class="content-box-title font-serif">star-jump</h3></a></div>
                  
                  
                  
              <div class="col-md-4 col-sm-6 col-xs-12 back_2" id="img_margin"><a class="content-box" href="../aihometrainer/3_lastmain2.do">
                  <div class="content-box-image"><img id="sub_img_size" src="../resources/aihometrainer/images/3-lungy.jpg" alt="One Page"></div>
                  <h3 class="content-box-title font-serif">leg raise</h3></a></div>
           
            </div>
          </div>
        </section>
        
        

        
        
   </div>
   </section>
   
   
  <!-- ìí íì´ì§ ë!!!!! -->  
   
        
        
        
          <!-- 풋터 풋터 풋터 풋터 -->
        
        
        
        <section class="module-extra-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-md-8 col-lg-9">
                <div class="callout-text font-alt">
                  <br>
                  <p style="margin-bottom: 0px;"> Copyright © 2018 Company Name | Designed by TemplateMo</p>
                </div>
              </div>



            </div>
          </div>
        </section>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
    
    
    
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="../resources/aihometrainer/lib/jquery/dist/jquery.js"></script>
    <script src="../resources/aihometrainer/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../resources/aihometrainer/lib/wow/dist/wow.js"></script>
    <script src="../resources/aihometrainer/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../resources/aihometrainer/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="../resources/aihometrainer/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../resources/aihometrainer/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../resources/aihometrainer/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../resources/aihometrainer/lib/smoothscroll.js"></script>
    <script src="../resources/aihometrainer/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="../resources/aihometrainer/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../resources/aihometrainer/js/plugins.js"></script>
    <script src="../resources/aihometrainer/js/main.js"></script>
    
    
        
    
    <script src="../resources/aihometrainer/js/add_plugins.js"></script>
    <script src="../resources/aihometrainer/js/add_main.js"></script>
    
    
  </body>
</html>