$(document).ready(function() {

    /* ############ 일어날 시간을 입력했을 때  ############*/
    $('#calculate').click(function() {
    	if($('#hour').val() != 'hour' && $('#minute').val() != 'minute') {
            $('.pricing-tables').hide();
            var setTime = new Date();

            if($('#hour').val() == 12) {
                $('#hour').val(0);
            }

            if($('#ampm').val() == "AM") {
                setTime.setHours($('#hour').val());
            }

            else if($('#ampm').val() == "PM") {
                setTime.setHours(+$('#hour').val() + 12);
            }

            setTime.setMinutes($('#minute').val());

            var res1 = new Date(setTime.getTime() - 270*60000);						// 잠든 시간에서 가장 먼 시간
            var res2 = new Date(res1.getTime() - 90*60000);
            var res3 = new Date(res2.getTime() - 90*60000);
            var res4 = new Date(res3.getTime() - 90*60000);
            var res5 = new Date(res4.getTime() - 90*60000);
            var res6 = new Date(res5.getTime() - 90*60000);							// 잠든 시간에서 가장 가까운 시간

            function retDate(dateObj) {
                var formatted = '';
                var pm = false;
                if(dateObj.getHours() > 12) {										//파라미터로 받은 시간이 오후라면
                    formatted = dateObj.getHours() - 12;							//시간에서 12를 빼고
                    pm = true;														//pm을 true로
                } else if(dateObj.getHours() < 12 && dateObj.getHours() != 0) {		//파라미터로 받은 시간이 오전이고, 12시가 아니라면
                    formatted = dateObj.getHours();									//해당 시간을 hour로 설정
                } else if(dateObj.getHours() == 0){									//파라미터 시간이 0
                    formatted = "12";												//12시를 hour
                } else if(dateObj.getHours() == 12){								//파라미터 시간이 12
                    formatted = "12";												//12시를 hour
                    pm = true;														//pm을 true로
                }
                if(dateObj.getMinutes() < 10) {										//분이 한자리 수 라면
                    formatted = formatted + ":0" + dateObj.getMinutes();			//앞에 0을 붙여서 00:00으로 포맷
                } else {
                    formatted = formatted + ":" + dateObj.getMinutes();
                }
                if(pm == true) {
                    formatted = formatted + " PM";
                } else {
                    formatted = formatted + " AM";
                }
                return formatted;
            }

            $('#result6').html(String(retDate(res1)));		//가까운 시간부터 출력
            $('#result5').html(String(retDate(res2)));
            $('#result4').html(String(retDate(res3)));
            $('#result3').html(String(retDate(res4)));
            $('#result2').html(String(retDate(res5)));
            $('#result1').html(String(retDate(res6)));

            $('#results').show();							//display가  none인 results를 show함
        } // end hour/minute check if
        else {
            alert("일어날 시간을 선택해주세요!");
            return;
            //window.location.replace("sleep.do");
        } // end not-filled check

//      ######################################################
//  	 start ajax
//      ######################################################
      // 일어나야 할 시간 결과
      /*
  		$.ajax({
  			type : 'get',  							// 화면에서 데이터를 전송하는 방식(method)
  			datatype : 'html',						// 화면에서 보낸 데이터
  			url : 'sleep.do',
  			success : function() {
  				$('#results').css('display','block');
  			},
	  		error : function(err){
	  			alert('전송실패');
	  			console.log(err);
	  		}
  		});*/ // end of ajax
//      ######################################################
//  	 end ajax
//      ######################################################

    }); // end calculate

    /* ########## 자러갈 시간을 입력했을 때 ########## */
    $('#calc').click(function() {
        if($('#hour2').val() != 'hour' && $('#minute2').val() != 'minute') {
            $('.pricing-tables').hide();
            var setTime = new Date();

            if($('#hour2').val() == 12) {
                $('#hour2').val(0);
            }

            if($('#ampm2').val() == "AM") {
                setTime.setHours($('#hour2').val());
            }
            else if($('#ampm2').val() == "PM") {
                setTime.setHours(+$('#hour2').val() + 12);
            }

            setTime.setMinutes($('#minute2').val());

            var res1 = new Date(setTime.getTime() + 90*60000);
            var res2 = new Date(res1.getTime() + 90*60000);
            var res3 = new Date(res2.getTime() + 90*60000);
            var res4 = new Date(res3.getTime() + 90*60000);
            var res5 = new Date(res4.getTime() + 90*60000);
            var res6 = new Date(res5.getTime() + 90*60000);

            function retDate(dateObj) {
                var formatted = '';
                var pm = false;
                if(dateObj.getHours() > 12) {
                    formatted = dateObj.getHours() - 12;
                    pm = true;
                } else if(dateObj.getHours() < 12 && dateObj.getHours() != 0) {
                    formatted = dateObj.getHours();
                } else if(dateObj.getHours() == 0){
                    formatted = "12";
                } else if(dateObj.getHours() == 12){
                    formatted = "12";
                    pm = true;
                }
                if(dateObj.getMinutes() < 10) {
                    formatted = formatted + ":0" + dateObj.getMinutes();
                } else {
                    formatted = formatted + ":" + dateObj.getMinutes();
                }
                if(pm == true) {
                    formatted = formatted + " PM";
                } else {
                    formatted = formatted + " AM";
                }
                return formatted;
            }

            $('#result6').html(String(retDate(res6)));
            $('#result5').html(String(retDate(res5)));
            $('#result4').html(String(retDate(res4)));
            $('#result3').html(String(retDate(res3)));
            $('#result2').html(String(retDate(res2)));
            $('#result1').html(String(retDate(res1)));

            $('#results').show();
        } // end hour/minute check if
        else {
            alert("자러갈 시간을 선택해주세요!");
        } // end not-filled check

//      ######################################################
//  	 start ajax
//      ######################################################
      // 일어나야 할 시간 결과
      /*
  		$.ajax({
  			type : 'get',  							// 화면에서 데이터를 전송하는 방식(method)
  			datatype : 'html',						// 화면에서 보낸 데이터
  			url : 'sleep.do',
  			success : function() {
  				$('#results').css('display','block');
  			},
	  		error : function(err){
	  			alert('전송실패');
	  			console.log(err);
	  		}
  		});*/ // end of ajax
//      ######################################################
//  	 end ajax
//      ######################################################

    }); // end #calc

    /* ########### 지금 잘까! ########### */
    $('#zzz').click(function() {
        $('.pricing-tables').hide();
        var zDate = new Date();

        var res1 = new Date(zDate.getTime() + 104*60000);		//잠든 시간에서 가장 가까운 시간
        var res2 = new Date(res1.getTime() + 90*60000);
        var res3 = new Date(res2.getTime() + 90*60000);
        var res4 = new Date(res3.getTime() + 90*60000);
        var res5 = new Date(res4.getTime() + 90*60000);
        var res6 = new Date(res5.getTime() + 90*60000);			//잠든 시간에서 가장 먼 시간

        function retDate(dateObj) {
            var formatted = '';
            var pm = false;
            if(dateObj.getHours() > 12) {
                formatted = dateObj.getHours() - 12;
                pm = true;
            } else if(dateObj.getHours() < 12 && dateObj.getHours() != 0) {
                formatted = dateObj.getHours();
            } else if(dateObj.getHours() == 0) {
                formatted = "12";
            } else if(dateObj.getHours() == 12) {
                formatted = "12";
                pm = true;
            }
            if(dateObj.getMinutes() < 10) {
                formatted = formatted + ":0" + dateObj.getMinutes();
            } else {
                formatted = formatted + ":" + dateObj.getMinutes();
            }
            if(pm == true) {
                formatted = formatted + " PM";
            } else {
                formatted = formatted + " AM";
            }
            return formatted;
        }

        $('#resultNow1').html(String(retDate(res1)));				//시간 순서대로 출력
        $('#resultNow2').html(String(retDate(res2)));
        $('#resultNow3').html(String(retDate(res3)));
        $('#resultNow4').html(String(retDate(res4)));
        $('#resultNow5').html(String(retDate(res5)));
        $('#resultNow6').html(String(retDate(res6)));

        $('#resultsNow').show();

//  ######################################################
//    	 start ajax
//  ######################################################
      // 지금 잘까 결과
    		/*$.ajax({
    			type : 'get',  							// 화면에서 데이터를 전송하는 방식(method)
    			datatype : 'html',						// 화면에서 보낸 데이터
    			url : 'sleep.do',
    			success : function() {
    				$('#resultsNow').css('display','block');
    			},
      		error : function(err){
      			alert('전송실패');
      			console.log(err);
      		}
    		});*/ // end of ajax
//  ######################################################
//    	 end ajax
//  ######################################################

    }); //end #zzz
});	//end ready
