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
    
    
    

     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
 
 
 
 
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
      
      
	<nav id="nav_test">
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









            <!-- 헤더 -->
      
      
      <section id = "padding-test" class="bg-dark-30 showcase-page-header module parallax-bg" data-background="../resources/aihometrainer/images/main3.gif">
        <div id="titanA" class="titan-caption">
          <div class="caption-content">
          
            <div class="font-alt mb-30 titan-title-size-1">Powerful. More Heathy.</div>
            <div class="font-alt mb-40 titan-title-size-4">AI HOME TRANIER</div>
            <a class="section-scroll btn btn-border-w btn-round" href="#newnewnew">GO to EXCISE</a>
        
          </div>
        </div>
      </section>

      
      
      <!-- 헤더 미들 끝!!! -->
      
      
      <!-- 해더 풋터 -->
      
      
 
 
           <div class="bottom" id="bottomA">
            <div class="text-right container hidden-xs"><a id="scrollDownArrow" href="#"><i class="ion-ios7-arrow-thin-down"></i></a></div>
            <div class="signupForm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                        
                        
                            <b class="mb10">AI Home Trainer helps you stay at home safely and achieve your workout goals, and supports your success.</b>
                        
                        
                        </div>
                        <div class="col-md-6 text-right">
                            <form class="form-inline subscribe-form" id="subscription-form" role="form">
                            
                            </form>
                            
                            
                            <div id="subscription-response"></div>
                        </div>
                    </div>
                </div><!-- container -->
            </div><!--/signupForm-->
        </div>

      <!-- 헤더 풋터 끝 -->
      
   
   
  
      
  
        
    
    <!-- 새로 가져온 것!!!!!!!!!!!!!!!!!!!##################### -->
    
    
 
 
 
 
        <!-- Start Categories of The Month 다른 곳에서 가져온 부분 -->
    <section class="container py-5">
    
<div class="row textaa" id="newnewnew" >
            <div class="col-aa">

           <img src="../resources/aihometrainer/images/bbbb.jpg" class="Textaaaa"></a>
       
            </div>
        </div>  
        

        <div class="row" id="test2">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="../aihometrainer/2_aiHTsubIndex_exercise.do"><img id="rounded-circle" src="../resources/aihometrainer/images/yss.jpg" class="rounded-circle img-fluid border" ></a>
                <h5 class="text-center mt-3 mb-3">유산소<h5>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="../aihometrainer/2_aiHTsubIndex_exercise.do"><img src="../resources/aihometrainer/images/grud22.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">근력운동</h2>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="../aihometrainer/2_aiHTsubIndex_exercise.do"><img src="../resources/aihometrainer/images/yoga3.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">요가</h2>
            </div>
        </div>
    </section> 
    <!-- End Categories of The Month -->
 
 
 
    
    
<!-- 메뉴 리스트 -->

    <div id="gallery" class="grid">
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/all.jpg" alt="img01">
            <figcaption>
                <h2>All  <span>exercise</span></h2>
                <a href="../aihometrainer/2_aiHTsubIndex_body.do">View more</a>
            </figcaption>           
        </figure>
        
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/back1.jpg" alt="img02">
            <figcaption>
                <h2>for perfect <span>BACK</span></h2>
                <p>It is prepared for your healthy posture and <br>core muscles. </p>
                <a href="../aihometrainer/2_aiHTsubIndex_body.do" value="click" onclick="hello()">View more</a>
            </figcaption>           
        </figure>
        
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/belly1.jpg" alt="img07">
            <figcaption>
                <h2>become good <span>BELLY</span> <i>Now</i></h2>
                <p>You will be able to start your day <br>a little lighter today!</p>              
                <a href="../aihometrainer/2_aiHTsubIndex_body.do">View more</a>
            </figcaption>           
        </figure>
        
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/Arm.jpg" alt="img04">
            <figcaption>
                <h2>great <span>ARM</span></h2>
                <p>For an arm like Captain America!</p>
                <a href="../aihometrainer/2_aiHTsubIndex_body.do">View more</a>
            </figcaption>           
        </figure>
        
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/Hip.jpg" alt="img14">
            <figcaption>
                <h2>handsome <span>LEG&HIP</span></h2>
                <span class="glyphicon glyphicon-star"></span>
                <span class="glyphicon glyphicon-heart"></span>
                <span class="glyphicon glyphicon-comment"></span>
                <p>If you build up your second heart, <br>your leg muscles, you'll be able to spend more energetic days. 
                	<br>do it now. </p>
                <a href="../aihometrainer/2_aiHTsubIndex_body.do">View more</a>
            </figcaption>           
        </figure>
        
        <figure class="effect-bubba">
            <img src="../resources/aihometrainer/images/core2.jpg" alt="img08">
            <figcaption>
                <h2>WHOLE BODY & <span>CORE</span></h2>
                <p> A strong core will make your day <br>more comfortable.</p>
                <a href="../aihometrainer/2_aiHTsubIndex_body.do">View more</a>
            </figcaption>           
        </figure>
    </div><!-- #gallery -->
    
    <!-- 메뉴리스트 끝 -->
    
    
    
  

  
    
    
    

    
    
    <!-- 새로 가져온 것 끝!!!!!!!!!!!!!!!!!!!##################### -->
    
    
        
      
         <!-- 헤더 미들 밑에 4등분 텍스트 페이지 -->    


 <div class="main">
        <section class="module">
          <div class="container">
            <div class="row multi-columns-row">
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-lightbulb"></span></div>
                  <h3 class="features-title font-alt">무료로 개인 트레이너를 소환하세요.</h3>
                  	 비싼 개인트레이너에 돈을 지불하지 마세요! <br>집에서 Cam 만 있으면 무료로 당신의 <br>퍼스널 트레이너를 소환할 수 있습니다! <br>갯수는 AI트레이너가 세어줄테니, <br>운동 자세에 집중하세요!
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-tools"></span></div>
                  <h3 class="features-title font-alt">당신의 목표치를 이끌어줍니다.</h3>
                  	AI 트레이너가 당신의 운동량의 하루 목표치를 <br>성공할 수 있도록 카운터와 타이머 기능으로 편리하게 운동할 수 있도록 도와주며 격려해줍니다. <br>함께 운동하세요!
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-tools-2"></span></div>
                  <h3 class="features-title font-alt">CAM을 준비해주세요.</h3>
                  	카메라가 없으면 AI 트레이너가 실행되지 않아요. 화상카메라나 핸드폰의 카메라를 준비하세요. CAM은 우리 AI 트레이너의 눈입니다. 
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-lifesaver"></span></div>
                  <h3 class="features-title font-alt">밝은색의 옷을 입어주세요!</h3>
                  	어두운 옷이나 어두운 장소에서는 <br>AI트레이너가 당신의 자세를 정확하게 <br>인식하지 못할 수 있습니다. <br>밝은 색의 옷을 입는 것을 권장합니다.
                </div>
              </div>
            </div>
          </div>
        </section> 
   
      
        
      
      




        
        
        
          <!-- 풋터 풋터 풋터 풋터 -->
        
        
        
        <section class="module-extra-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-md-8 col-lg-9">
                <div class="callout-text font-alt">
                  <br>
                  <p style="margin-bottom: 0px;">Copyright © 2018 Company Name | Designed by TemplateMo</p>
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