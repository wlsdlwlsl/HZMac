
$(document).ready(function() {

//메인페이지  왼쪽 카테고리에서 클릭했을때!!
  $('#mainmypage').click(function(evt){
    evt.preventDefault();				// a태그 링크 기능 무력화
    evt.stopPropagation();				// a태그 링크 기능 무력화
    $("h1").hide();					// 페이지명 안보이게 변경
    $("#h1Admin").show();				// 페이지명 보이게 변경

    $(".sese").hide();					// 모든 리스트 테이블을 삭제
    $("#myPageMain").show();			// 런닝구 리스트 테이블만 보임으로 변경

  }); //end click


//내정보 수정 왼쪽 카테고리에서 클릭했을때!!
  $('#myINFO').click(function(evt){
    evt.preventDefault();				// a태그 링크 기능 무력화
    evt.stopPropagation();				// a태그 링크 기능 무력화
    $("h1").hide();					    // 페이지명 안보이게 변경
    $("#h1INFO").show();				// 페이지명 보이게 변경

    $(".sese").hide();					// 모든 리스트 테이블을 삭제
    $("#UpdateMyInfo").show();			// 런닝구 리스트 테이블만 보임으로 변경

  }); //end click

  //내 게시글 관리 왼쪽 카테고리에서 클릭했을때!!
    $('#myMember').click(function(evt){
      evt.preventDefault();				// a태그 링크 기능 무력화
      evt.stopPropagation();				// a태그 링크 기능 무력화
      $("h1").hide();					// 페이지명 안보이게 변경
      $("#h1Member").show();				// 페이지명 보이게 변경

      $(".sese").hide();					// 모든 리스트 테이블을 삭제
      $("#MyBoard").show();			// 보드 리스트 테이블만 보임으로 변경

    }); //end click



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
      }).open();    //Postcode
   });         //click function



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

           if(result == "중복된 아이디입니다"){
                 $("#userId").val("");

              }//end of if
                     $('#idCheckResult').text(result);
                 $('#idCheckResult2').val(result);
        },
        error : function(err){
           alert("error");
        }
     })
});






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

           if(result == "중복된 닉네임입니다"){
              $("#usernickN").val("")
           }//end of if
                      $('#nNCheckResult').text(result);
                      $('#nNCheckResult2').val(result);
        },
        error : function(err){
           alert("error");
        }
     })
});


  //내 정보 수정 사진 미리보기 함수
    function setThumbnail(event) {
		var reader = new FileReader(); reader.onload = function(event) {
			$("#image_container").empty();//일단 비우자
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}




//전송 버튼을 눌렀을 때 값이 비어있으면---------------------
     $('#submitBtn').click(function(){


       if($.trim($('#userPass').val())==''){
          $('#pwcheck').text("비밀번호를 입력해 주세요.");
          $('#userPass').focus();
          return;
       }

       if($.trim($('#userPass').val()) != $.trim($('#userPass2').val())){
            $('#pwcheck2').val("비밀번호가 일치하지 않습니다..");
          alert("비밀번호가 일치하지 않습니다..");
          $('#userPass2').focus();
          return;
       }


       if($.trim($('#usernickN').val())==''){
         $("#ncheck").text("닉네임을 입력해 주세요.");
          $('#usernickN').focus();
          return;
       }

     if($.trim($('#idCheckResult2').val())=='중복된 아이디입니다'){
         alert("아이디를 중복확인해주세요.");
         return;
      }
      if($.trim($('#nNCheckResult2').val())=='중복된 닉네임입니다'){
          alert("닉네임을 중복확인해주세요.");
          return;
       }

        // 자료를 전송합니다.
        $('#userinput').submit();
   });
//-------------------------------------------------------


// ############ 쇼핑몰 주문 관리 메뉴를 클릭했을 때  ############
$('#myOrder').click(function(evt){
  evt.preventDefault();				//a태그 기능 무력화
  evt.stopPropagation();				//a태그 기능 무력화

  $("h1").hide();					// 페이지명 안보이게 변경
  $("#h1Order").show();				// 페이지명 보이게 변경

  $(".sese").hide();					// 모든 테이블 숨기기
  $("#myorderList").show();		// 쇼핑몰 주문 리스트 테이블만 보이게 변경
  $("#userOrderList").show();		// 쇼핑몰 주문 리스트 테이블만 보이게 변경
  OrderList();					// 리스트 출력 함수 호출
}); //end click


function OrderList(){
      $.ajax({
         type : 'get',
         url : 'OrderList.do',
         data : {memberID : $("#memberID").text() },
         dataType : 'json',                              // db(서버)에서 받을 때 데이터 타입
         success : function(resultOrder){
            // ##### 동적으로 쇼핑몰 주문 리스트 만들기 #####
            var userOrderList = $("#userOrderList");         // adminpage.jsp에 table id를 변수에 저장
            userOrderList.empty();                        // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
            userOrderList.append(                        // list 테이블 헤더
               "<tr>"
               + "<th width='200'>주문일자</th>"
               + "<th width='300'>주문번호</th>"
               + "<th width='200'>주문자</th>"
               + "<th width='200'>상품번호</th>"
               + "<th width='400'>상품이미지</th>"
               + "<th width='150'>구매확정여부</th>"
               + "<th width='150'>반품여부</th>"
               + "<th width='150'>반품상태</th>"
               +"</tr>");
           if(resultOrder == ""){
	                var tr = $("<tr/>");
	                var nonedata = $("<td colspan='8' />").html('<h3>주문하신 상품이 존재하지 않습니다.</h3>');
	                tr.append(nonedata);
	                userOrderList.append(tr);
               }
           else{// 향상된 for문 (list row : resultMember) ==> 변수명은 상관없음
               for(row of resultOrder){
               console.log(row);                                  	  // 데이터가 잘 넘어왔는지 확인
               var tr = $("<tr/>");                                 // <tr/> 객체 생성
               var orderDate = $("<td width='200' />").html(new Date(row['OrderDate']).yyyymmdd());   // td객체를 생성 ==> orderDate를 td에 담는다
               tr.append(orderDate);                                  // tr에 orderDate를 담은 td를 추가
               var orderID = $("<td width='300' />").text(row['OrderID']);
               tr.append(orderID);
               var memberID = $("<td width='200' />").html(row['MemberID']);
               tr.append(memberID);
               var productID = $("<td width='200' />").html(row['ProductID']);
               tr.append(productID);
               // ######### 상품이미지 출력
               var product_realfname = $("<td id='product_realfname'/>").html("<img src='../resources/img/shoppingmall/productimgs/"+ row['Product_realfname'] +"'>");
               tr.append(product_realfname);
               if(row['BuyingConfirmYN'] == 'Y'){
                 var buyingConfirmYN = $("<td width='150' />").html(row['BuyingConfirmYN']);//구매확정 완료
                 tr.append(buyingConfirmYN);
               }
               else{
                 var buyingConfirmYN = $("<td width='100' />").html('<button type="button" id="buyingConfirmBTN">구매확정</button>');
                 tr.append(buyingConfirmYN);
               }
               var returnYN = $("<td width='150' />").text(row['ReturnYN']);
               tr.append(returnYN);
               // 반품상태 int ==> String 변경
               if(row['returnstatus']==0) {
            	   row['returnstatus'] = '주문완료';
                  var returnStatus = $("<td width='150' />").html(row['returnstatus']);
               } else if (row['returnstatus']==1) {
                  row['returnstatus'] = '반품신청';
                  var returnStatus = $("<td width='150' />").html(row['returnstatus']);
               } else if (row['returnstatus']==2) {
                  row['returnstatus'] = '반품진행중';
                  var returnStatus = $("<td width='150' />").html(row['returnstatus']);
               } else {
                  row['returnstatus'] = '반품처리완료';
                  var returnStatus = $("<td width='150' />").html(row['returnstatus']);
               }
               tr.append(returnStatus);

               userOrderList.append(tr);

                      // 모든 컬럼 정보를 append한 tr을 list에 append
            } // end for문
          }//end else
         }, // end success
         error : function(err){
            alert('전송실패');
            console.log(err);
         } //end error
      })   // end ajax
   }   // end function OrderList()

   //내 런닝구  왼쪽 카테고리에서 클릭했을때!!
     $('#myRNG').click(function(evt){
       evt.preventDefault();				// a태그 링크 기능 무력화
       evt.stopPropagation();				// a태그 링크 기능 무력화
       $("h1").hide();					// 페이지명 안보이게 변경
       $("#h1RNG").show();				// 페이지명 보이게 변경

       $(".sese").hide();					// 모든 리스트 테이블을 삭제
       $("#MyRunninggo").show();
       $("#myRNGList").show();
       $("#userRNGList").show();

       myhostrunninggooList();
       getMyRunninggoList();

     }); //end click

   function getMyRunninggoList(){
         $.ajax({
            type : 'post',
            url : 'getMyRunninggoList.do',
            data : {memberID : $("#memberID").text() },
            dataType : 'json',                              // db(서버)에서 받을 때 데이터 타입
            success : function(resultOrder){

               var userRNGList = $("#userRNGList");         // adminpage.jsp에 table id를 변수에 저장
               userRNGList.empty();                        // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
               userRNGList.append(                        // list 테이블 헤더
                  "<tr>"
                  + "<th colspan='5'>참여한 런닝구 목록</th>"
                  +"</tr>");
              if(resultOrder == ""){
   	                var tr = $("<tr/>");
   	                var nonedata = $("<td colspan='5' />").html('<h3>참여한 런닝구가 존재하지 않습니다.</h3>');
   	                tr.append(nonedata);
   	                userRNGList.append(tr);
                  }
              else{
                  for(row of resultOrder){
                  console.log(row);                                  	  // 데이터가 잘 넘어왔는지 확인
                  var tr = $("<tr/>");                                 // <tr/> 객체 생성
                  var hostIMG = $("<td width='200' />").html("<img src='../resources/upload/"+ row['member_realfname'] +"'>");   // td객체를 생성 ==> orderDate를 td에 담는다
                  tr.append(hostIMG);                                  // tr에 orderDate를 담은 td를 추가
                  var hostID = $("<td width='300' />").text(row['memberID']+"님의 방");
                  tr.append(hostID);
                  var hostComment = $("<td width='200' />").html(row['hostComment']);
                  tr.append(hostComment);
                  var meetingTime = $("<td width='200' />").html(new Date(row['meetingTime']).yyyymmdd());
                  tr.append(meetingTime);
                  if(row['memberPendingStatusYN'] == 'Y'){
                    var memberPendingStatusYN = $("<td width='150' />").html("<span>신청 대기중</span>");//구매확정 완료
                    tr.append(memberPendingStatusYN);
                  }
                  else{
                    var memberPendingStatusYN = $("<td width='100' />").html("<span>신청 완료</span>");
                    tr.append(memberPendingStatusYN);
                  }
                  userRNGList.append(tr);

                         // 모든 컬럼 정보를 append한 tr을 list에 append
               } // end for문
             }//end else
            }, // end success
            error : function(err){
               alert('전송실패');
               console.log(err);
            } //end error
         })   // end ajax
      }   // end function OrderList()



      function myhostrunninggooList(){
            $.ajax({
               type : 'post',
               url : 'myhostrunninggooList.do',
               data : {memberID : $("#memberID").text() },
               dataType : 'json',                              // db(서버)에서 받을 때 데이터 타입
               success : function(resultOrder){

                  var myRNGList = $("#myRNGList");         // adminpage.jsp에 table id를 변수에 저장
                  myRNGList.empty();                        // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
                  myRNGList.append(                        // list 테이블 헤더
                     "<tr>"
                     + "<th colspan='5'>마이 런닝구 목록</th>"
                     +"</tr>");
                 if(resultOrder == ""){
                       var tr = $("<tr/>");
                       var nonedata = $("<td colspan='5' />").html('<h3>생성한 런닝구가 존재하지 않습니다.</h3>');
                       tr.append(nonedata);
                       myRNGList.append(tr);
                     }
                 else{
                     for(row of resultOrder){
                     console.log(row);                                  	  // 데이터가 잘 넘어왔는지 확인
                     var tr = $("<tr/>");                                 // <tr/> 객체 생성
                     var hostIMG = $("<td width='200' />").html("<img src='../resources/upload/"+ row['member_realfname'] +"'>");   // td객체를 생성 ==> orderDate를 td에 담는다
                     tr.append(hostIMG);                                  // tr에 orderDate를 담은 td를 추가
                     var hostID = $("<td width='300' />").text(row['memberID']);
                     tr.append(hostID);
                     var hostComment = $("<td width='200' />").html(row['hostComment']);
                     tr.append(hostComment);
                     var meetingTime = $("<td width='200' />").html(new Date(row['meetingTime']).yyyymmdd());
                     tr.append(meetingTime);
                     var memberStatus = $("<td width='150' />").html("<button type='button'>신청 현황</button>");//구매확정 완료
                     tr.append(memberStatus);
                     myRNGList.append(tr);
                            // 모든 컬럼 정보를 append한 tr을 list에 append
                  } // end for문
                }//end else
               }, // end success
               error : function(err){
                  alert('전송실패');
                  console.log(err);
               } //end error
            })   // end ajax
         }   // end function OrderList()


   // ################################################
   	// 밀리세컨드를 yyyy-mm-dd로 포맷
   	Date.prototype.yyyymmdd = function() {
           var yyyy = this.getFullYear().toString();
           var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
           var dd  = this.getDate().toString();
           return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
   	};



	$(document).on('click','#buyingConfirmBTN',function(){
    let memberID = $("#memberID").text();
    let productID = $(this).parent().prev().prev().text();
    let orderID = $(this).parent().prev().prev().prev().prev().text();

    $.ajax({
      type : 'get',
      url : 'updatebuyingConfirm.do',
      data : {memberID : memberID, productID : productID, orderID : orderID},
      success : function(result){
        console.log(result);
        OrderList();
      },//end of sucess
      error : function(err){
        alert("errorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerrorerror")
      }//end of error
    })//end of ajax
	})//end of 구매확정버튼 클릭


  $("#OUT").click(function(){
    var result = confirm('정말 회원탈퇴를 진행하시겠습니까?');
    if(result) {
      let memberID = $("#memberID").text();
      alert("모든 회원정보와 포인트가 사라집니다.")
      console.log(memberID);
      $.ajax({
        data : 'get',
        url : 'OUTmember.do',
        data : {memberID : memberID},
        success : function(result){
          alert(result);
          location.replace("../logout.do");
        },//end of success
        error : function(){
          alert("에러발생----------");
        }//end of error
      })//end of ajax
    }//end if if
  })//end of 회원탈퇴





})//end ready
