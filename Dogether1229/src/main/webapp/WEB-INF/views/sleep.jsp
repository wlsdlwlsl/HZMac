<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Best Sleep Time in Dogether!</title>

    <!-- Dogether 공통 템플릿 -->
    <link rel="stylesheet" href="./resources/css/templatemo-style.css">
    <!-- 반응형 웹사이트  -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 카드형 리스트 템플릿 -->
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	<!-- ajax -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
    <script type="text/javascript" src="./resources/js/sleep.js"></script>
</head>
<body>
	<!-- 상단 배경이미지 -->
    <div class="more-about-us"style="background-image:url('./resources/img/sleep/sleep.jpg'); height:500px;">
        <div class="container" >
        <!-- 상단 이미지 내 효과주기 -->
            <div class="col-md-5 col-md-offset-7">
                <div class="content" style="background: none;"></div>
            </div>
        </div>
    </div>
    
    <!-- 수면시간 추천받기 start -->
    <div class="col-12 pricing-tables" style="height:auto;">
        <h2 style="text-align: center; font-size:300%; color:#aaaaaa;">Dogether에서 최적의 수면시간을 추천해드릴게요!</h2>
        <br><br>
        <div class="container">
            <!-- 일어나야 할 시간 추천받기 start -->
            <div class="col-md-4 col-sm-4">	
                <div class="table-item" style="height:400px;">
                    <h4>일어나야 할<br>시간을 알려주세요!</h4>
                    <span style="border-bottom: none; height:100px;" >잠자리에 들 시간을<br>추천해드릴게요:)</span>
                    <!-- 시간/분 선택 select박스 -->
                    <div style="text-align: center; margin-top: -20px;">
                        <select id="hour" style="background-color:  #333333; color:#aaaaaa; height:30px;" >
                            <option>hour</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        <select id="minute" style="background-color: #333333; color:#aaaaaa; height:30px;">
                            <option>minute</option>
                            <option>00</option>
                            <option>05</option>
                            <option>10</option>
                            <option>15</option>
                            <option>20</option>
                            <option>25</option>
                            <option>30</option>
                            <option>35</option>
                            <option>40</option>
                            <option>45</option>
                            <option>50</option>
                            <option>55</option>
                        </select>
                        <select id="ampm" style="background-color: #333333; color:#aaaaaa; height:30px;">
                            <option>AM</option>
                            <option>PM</option>
                        </select>
                    </div> 
                    <!-- #results의 display를 none에서 show로 변경  -->
                    <div class="simple-btn">
                        <a id="calculate" href="#">추천받기</a>
                    </div>
                </div>
            </div> <!-- 일어날 시간 추천받기 end -->

            <!-- 지금 잘까 start -->
            <div class="col-md-4 col-sm-4">
                <div class="table-item premium-item" style="height:400px;">
                    <h4>지금 잘까!<br></h4>
                    <span style="border-bottom: none;">졸려...(zzZ)</span>  
                    <br><br><br><br> 
                    <!-- #resultsNow의 display를 none에서 show로 변경  -->
                    <div class="simple-btn">
                        <a id="zzz" href="#">추천받기</a>
                    </div>
                </div>
            </div> <!-- 지금 잘까 end -->

            <!-- 잠자리에 들 시간 추천받기 start -->
            <div class="col-md-4 col-sm-4">
                <div class="table-item" style="height:400px;">
                    <h4>잠자리에 들<br>시간을 알려주세요!</h4>
                    <span style="border-bottom: none; height:100px;">기분 좋게 일어날 시간을<br>추천해드릴게요:)</span>
                    <!-- 시간/분 선택 select박스 -->
                    <div style="text-align: center; margin-top: -20px;">
                        <select id="hour2" style="background-color: #333333; color:#aaaaaa; height:30px;">
                            <option>hour</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        <select id="minute2" style="background-color: #333333; color:#aaaaaa; height:30px;">
                            <option>minute</option>
                            <option>00</option>
                            <option>05</option>
                            <option>10</option>
                            <option>15</option>
                            <option>20</option>
                            <option>25</option>
                            <option>30</option>
                            <option>35</option>
                            <option>40</option>
                            <option>45</option>
                            <option>50</option>
                            <option>55</option>
                        </select>
                        <select id="ampm2" style="background-color: #333333; color:#aaaaaa; height:30px;">
                            <option>AM</option>
                            <option>PM</option>
                        </select>
                        <br/>
                        <!-- #results의 display를 none에서 show로 변경  -->
	                    <div class="simple-btn">
	                        <a id="calc" href="#">추천받기</a>
	                    </div>
               		</div> <!-- end text -->
            	</div> <!-- 잠자리에 들 시간 추천받기 end -->
        	</div> <!-- end col-md -->
    	</div> <!-- end container -->
    </div> <!-- 수면시간 추천받기 end -->

    <!-- 시간 입력할 때 수면시간 추천 -->	
    <div id="results" style="display:none; text-align: center; background-color: #333333; height:auto">
        <br><br><br>
        <h2 style="text-align: center; font-size:300%; color:#aaaaaa">Dogether에서 최적의 수면시간을 추천해드릴게요! </h2>
        <span id="result1" style="font-size: 300%; color: rgb(168, 39, 254);" title="첫번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="result2" style="font-size: 300%; color: rgb(154, 3, 254);" title="두번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="result3" style="font-size: 300%; color: rgb(150, 105, 254);" title="세번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="result4" style="font-size: 300%; color: rgb(140, 140, 255);" title="네번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="result5" style="font-size: 300%; color: rgb(187, 187, 255);" title="다섯번재 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="result6" style="font-size: 300%; color: rgb(123, 30, 150);" title="여섯번째 추천시간"></span>
        <br>
        <p style="font-size: 140%; color: rgb(0, 128, 255);">많은 사람들이 잠드는 데 평균적으로<b> 15분</b> 정도 소요된다고 해요!</p>
        <p style="font-size: 130%; color: rgb(153, 102, 204);">연구에 따르면 <b>수면 사이클</b> 중간에 잠에서 깨게 되면, 평소보다 <i> 피로감</i>을 느낄 수 있다고 해요.<br> Dogether에서 추천해드리는 시간으로 최적의 컨디션으로 깨어나세요!</p>
        <a class="back" href="back.do" style="font-size: 200%; color: #cdbc67;">다른 시간 추천받기</a><br/>
        <br><br>
    </div><!-- end results (시간을 입력했을 때 결과)-->
    
    <!-- 지금 잘까!의 수면시간 추천 -->
    <div id="resultsNow" style="display:none; text-align: center; background-color: #333333; height:auto;">
        <br><br><br>
        <h2 style="text-align: center; font-size:300%; color:#aaaaaa">Dogether에서 최적의 수면시간을 추천해드릴게요! </h2>
        <p style="font-size: 140%">지금 잠자리에 들었을 때, 최적의 기상시간을 Dogether에서 알려드릴게요!</p>
        <span id="resultNow1" style="font-size: 300%; color: rgb(168, 39, 254);" title="첫번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="resultNow2" style="font-size: 300%; color: rgb(154, 3, 254);" title="두번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="resultNow3" style="font-size: 300%; color: rgb(150, 105, 254);" title="세번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="resultNow4" style="font-size: 300%; color: rgb(140, 140, 255);" title="네번째 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="resultNow5" style="font-size: 300%; color: rgb(187, 187, 255);" title="다섯번재 추천 시간"></span> <i style="font-size: 150%;">&nbsp;or </i>
        <span id="resultNow6" style="font-size: 300%; color: rgb(123, 30, 150);" title="여섯번째 추천시간"></span>
        <br>
        <p style="font-size: 140%; color: rgb(0, 128, 255);">많은 사람들이 잠드는 데 평균적으로<b> 15분</b> 정도 소요된다고 해요!</p>
        <p style="font-size: 130%; color: rgb(153, 102, 204);">연구에 따르면 <b>수면 사이클</b> 중간에 잠에서 깨게 되면, 평소보다 <i> 피로감</i>을 느낄 수 있다고 해요. <br> Dogether에서 추천해드리는 시간으로 최적의 컨디션으로 깨어나세요!</p>
        <a class="back" href="back.do" style="font-size: 200%; color:#CDBC67;">다른 시간 추천받기</a><br/>\
        <br><br>
    </div> <!-- end resultsNow (시간을 입력하지 않았을 떼 결과)-->
</body>
</html>