$(document).ready(function(){

//주소API-----------------------------------------------------------
var btnClickCount = 0;
	$("#btnAddress").on("click",function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if(data.userSelectedType === 'R'){
					//법정동명이 있을 경우 추가한다.
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('Zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('BasicAddress').value = fullAddr; // 커서를 상세주소 필드로 이동한다.
				document.getElementById('RestAddress').focus();
			}
		}).open(); 	//Postcode
	});			//click function





		/*보류-------------------------전화번호 사이에 하이픈 넣는거임 ---------------------------------*/

	$(document).on('keydown', '#keyText', function phoneFormat(){

	    var firstnum = $('.phone').val().trim();

	    var phone = firstnum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");

	    $('.phone').val(phone);

	});




//아이디 중복체크 버튼 버젼--------------------------------------------

$("#idCheckResult2").click(function(){
		btnClickCount+=1;
      $.ajax({
         type : 'get',
         url : 'idCheck.do',
         data : { memberID : $('#userId').val() },
         // 한글처리
         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
         success : function(result){
            alert(result)
            if(result == "중복된 닉네임입니다"){
            	$("#userId").val("")
            }//end of if
           	$('#idCheckResult2').val(result);
         },
         error : function(err){
            alert("error");
         }
  	 })
	 });
//---------------------------------------------------------------


// 닉네임 중복체크 버튼 버전-----------------------------------------
$("#nNCheckResult2").click(function(){
		btnClickCount+=1;
     $.ajax({
        type : 'get',
        url : 'nickNameCheck.do',
        data : { nickName : $('#usernickN').val() },
        // 한글처리
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success : function(result){
           alert(result)
           if(result == "중복된 닉네임입니다"){
           	$("#usernickN").val("")
           }//end of if
        },
        error : function(err){
           alert("error");
        }
 	 })
});
//------------------------------------------------------------------

// 프로필사진 업로드하자잉///////////////////////////////////////미리보기 버튼 삭제하였음

//-----------------------------------------------------------




//이메일 ------------------------------------------------------------------
	 function email_check( email ) {
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email));
	}

	$("input[type=email]").blur(function(){
	  var email = $(this).val();
	  	if( email == '' || email == 'undefined') return;
		  if(! email_check(email) ) {
		  	$(".result-email").text('이메일 형식으로 적어주세요');
		    $(this).focus();
		    return false;
		  }else {
			$(".result-email").text('');
		  }
	});
//------------------------------------------------------


//전송 버튼을 눌렀을 때 값이 비어있으면---------------------
     $('#confirm').click(function(){
       if( $.trim($("#userId").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#userId").focus();
            return;
        }

       if($.trim($('#userPass').val())==''){
          alert("비번입력해주세요.");
          $('#userPass').focus();
          return;
       }

       if($.trim($('#userPass').val()) != $.trim($('#userPass2').val())){
          alert("비밀번호가 일치하지 않습니다..");
          $('#userPass2').focus();
          return;
       }


       if($.trim($('#userName').val())==''){
          alert("이름입력해주세요.");
          $('#userName').focus();
          return;
       }

		if($.trim($('#idCheckResult2').val())=='중복된 아이디입니다'){
	      alert("아이디를 중복확인해주세요.");
	      console.log(1)
	      return;
	   }
	   
	   if(($('#sel').val())==999){
	  	  alert("성별을 선택해주세요.");
		  console.log($('#sel').val());
	  	  return;
	}
		
			 if(btnClickCount < 2){
				 alert("중복확인 버튼을 클릭해주세요.")
				 return;
			 }




        // 자료를 전송합니다.
        $('#userinput').submit();
   });
//-------------------------------------------------------


});       //first function
