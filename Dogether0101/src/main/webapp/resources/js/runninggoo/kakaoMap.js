


var dbNum = parseInt($(".rngForEachLength").text());
console.log(dbNum);

for(var i=1; i<dbNum+1; i++){
	
	// 각 리스트별 위도, 경도
	var lat = parseFloat($('.runninggoo_card_wrap:nth-child('+ i +') .wido').text()).toPrecision(14);
	var long = parseFloat($('.runninggoo_card_wrap:nth-child('+ i +') .gyeongdo').text());
	console.log(lat);
	console.log(long);
	
	// 	
	var n = 'map'+i;
	$('.runninggoo_card_wrap:nth-child('+ i +') .kakao_map').append('<div id="map'+i+'" style="width: 100%; height: 350px;"></div>')

	var mapContainer = document.getElementById(n), // 지도를 표시할 div 
	mapOption = { 
    center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
    	// 지도 중심좌표에 마커를 생성합니다 
    	position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);

} // end of for loop

