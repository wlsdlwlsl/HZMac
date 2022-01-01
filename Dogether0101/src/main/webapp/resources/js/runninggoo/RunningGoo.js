
// 날짜 데이터 값 받아오기
$("#meeting-time").change(function(){
	var dateString = $("#meeting-time").val()
	console.log(dateString);
});

$('#selectRunningDistance').hide();
	$('#selectExerciseTime').hide();

// 스포츠 타입 값 받아오기
$("#sportsSelect").change(function(){

	
	// 스포츠 종목 값 0~5 값 불러오기
	var sportsType = $("#sportsSelect").val();
	console.log(sportsType);
	
	// 러닝타임 값에 따라 입력 폼 생기게 하는 JQuery
	if(sportsType==0){
		$('#selectRunningDistance').show();
		$('#selectExerciseTime').hide();
	}else if(sportsType==9999){
		$('#selectRunningDistance').hide();
		$('#selectExerciseTime').hide();
	}else{
		$('#selectRunningDistance').hide();
		$('#selectExerciseTime').show();
	}
	
});



// 멤버의 포인트를 불러오는 AJAX
$('#jeonsong').click(function(){
	$.ajax({
		url : 'viewMemberPoints.do',
		// 세션으로 얻어온 memberID값을 보내야한다.
		type : 'get',
		dataType : 'text',
		success : function(result){
			$('#mbPoint').html(result);
			alert("보유 포인트 조회완료");	
		},
		error : function(err){
			alert("전송실패");
		}
	}); // end-of-ajax
})


// 슬라이더 인풋 태그들의 실시간 값 표시
function ShowSliderValue(sVal)
{
	var obValueView = document.getElementById("slider_value_view");
	obValueView.innerHTML = sVal
}

var RangeSlider = function(){
	var range = $('.slider_range');
    
	range.on('input', function(){		
		ShowSliderValue(this.value);
	});
};

RangeSlider();


// DoJoin 클릭시 호스트에게 popup 띄우기
function receiveRngRequest(){
	window.open('showRngJoinMemberInfo.do', 'popup01', 'width=300, height=400, scrollbars= 0, toolbar=0, menubar=no');
}

// onclick 쓰지말고 제이쿼리로 직접 찾아서 이벤트걸기
// 버튼에 each를 걸고 버튼이 this
$(".userBtn").click(function(){
		if (!confirm("참여신청 할까요?")) {
        // 취소(아니오) 버튼 클릭 시 이벤트
        alert("참여신청이 취소되었습니다.");
    } else {
        // 확인(예) 버튼 클릭 시 이벤트
        var nowRoomNum = $(this).parent().prev().prev().prev().prev().children(".rngRoomNum").text();
        alert(nowRoomNum);
        $.ajax({
        	url: "bringBasicRngRoomInfo.do",
        	data : { roomNumber : nowRoomNum},
        	success: function(res){
		        alert(res);
        	},
        	error : function(){
        		alert("요청실패!");
        	}
        }); // end-of-ajax   
    } // end-of-else
})



// 호스트가 enrollment 버튼을 눌렀을때 팝업창 화면
$('.hostBtn').click(function(){
	var nowRoomNum = $(this).parent().prev().prev().prev().prev().children(".rngRoomNum").text();
	alert("런닝구 멤버들의 신청현황 조회를 완료했습니다.");
	window.open('viewJoinMemberTotalInfo.do?roomNumber=' + nowRoomNum, 'popup01', 'width=600, height=400, scrollbars= 0, toolbar=0, menubar=no');
		
}) // end-of-click

$('.delBtn').click(function(){
	var nowRoomNum = $(this).parent().prev().prev().prev().prev().prev().children(".rngRoomNum").text();
	var nowHostID =$(this).parent().prev().prev().prev().prev().prev().children(".rn_profile_nickname").text();
	//alert(nowRoomNum);
	//alert(nowHostID);
	$.ajax({
		url : "deleteRngRoom.do",
		data : { hostMemberID : nowHostID, roomNum : nowRoomNum },
		success : function(){
			alert("삭제완료!");
			location.replace("../runninggoo/");
		},
		error : function(){
			alert("삭제 실패!");
		}
	});
}) // end-of-click


// 호스트가 수락을 눌렀을때
var isAjax = false;
$('.acceptJoin').click(function(){
	if(isAjax == true){
		return;
	}
	
	isAjax = true;
	
	var nowRoomNum = $("#roomNum").text();
	//alert(nowRoomNum);
	//alert($("#nowMemberID").text());
	$.ajax({
		url: "updateJoinMemberInfo.do",
        data : { roomNum : nowRoomNum, joinPendingMember : $("#notYetMemberID").text() },
        success: function(res){
		    alert(res);
		    location.replace("../runninggoo/viewJoinMemberTotalInfo.do?roomNumber=" + nowRoomNum);
		    isAjax = false;
       	},
        error : function(){
        	alert("요청실패!!!!");
        }
	}) //end-of-ajax
})



// 호스트가 거절을 눌렀을때
var isRun = false;
$('.deleteJoin').click(function(){
	if(isRun == true){
		return;
	}
	
	isRun = true;
	
	var nowRoomNum = $("#roomNum").text();
	$.ajax({
		url: "deleteJoinMemberInfo.do",
        data : { roomNum : nowRoomNum, joinPendingMember : $("#notYetMemberID").text() },
        success: function(res){
		    alert(res);
		    location.replace("../runninggoo/viewJoinMemberTotalInfo.do?roomNumber=" + nowRoomNum);
		    isRun = false;
       	},
        error : function(){
        	alert("요청실패!!!!");
        }
	}) //end-of-ajax
})



// 런닝구 방 다 차면 검은색 배경씌우기

$('.rn_profile_memberCount').each(function(){
	var CrntMembers = $(this).children('.currentMembers').text();
	var maxMembers = $(this).children('.maxMembers').text();
	var nowList = $(this).parent().prev();
	var nowBalloon = $(this).parent().next().next().next().children('.ballon');
	var hostRngRoomID = $(this).prev().prev().text();
	var currentMyID = $(this).parent().parent().parent().parent().prev().text();

	if((parseInt(CrntMembers) >= parseInt(maxMembers)) && (currentMyID != hostRngRoomID)){
		nowList.addClass('matched matchedBG');
		nowBalloon.addClass('matchedBG');
	}
	
})




