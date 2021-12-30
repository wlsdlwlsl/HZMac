$(document).ready(function() {
	//메인페이지  왼쪽 카테고리에서 클릭했을때!!
	  $('#adminpage').click(function(evt){
	    evt.preventDefault();				// a태그 링크 기능 무력화
	    evt.stopPropagation();			// a태그 링크 기능 무력화
	    $("h1").hide();						// 페이지명 안보이게 변경
	    $("#h1Admin").show();		// 페이지명 보이게 변경

	    $("table").hide();               // 모든 리스트 테이블을 삭제
	    $("#adminmain").show();			// 런닝구 리스트 테이블만 보임으로 변경
	       $(".divHide").hide();            // 모든 정렬 안보이게 변경
	  }); //end click
   function adminRNGList(){
      $.ajax({
         type : 'get',
         url : 'adminRNG.do',
          dataType : 'json',                                 // db(서버)에서 받을 때 데이터 타입
         data: { sortTypeRNG : $(".sortTypeRNG").val() },
          success : function(resultRNG){
            // ##### 동적으로 런닝구방 리스트 만들기 #####
            var adminRNGList = $("#adminRNGList");               // adminpage.jsp에 table id를 변수에 저장
            adminRNGList.empty();                           // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
            adminRNGList.append(                           // list 테이블 헤더
               "<tr>"
               + "<th width='150'>런닝구방번호</th>"
               + "<th width='200'>프로필사진</th>"
               + "<th width='100'>호스트명</th>"
               + "<th width='400'>방설명</th>"
               + "<th width='150'>미팅날짜</th>"
               + "<th width='100'>삭제</th>"
               +"</tr>");
            for(row of resultRNG){                           // 향상된 for문 (list row : resultRNG) ==> 변수명은 상관없음
//                console.log(row);                        // 데이터가 잘 넘어왔는지 확인
            	console.log(row['meetingTime'].toString());
               var tr = $("<tr/>");                        // <tr/> 객체 생성
               var roomNumber = $("<td width='150'/>").html(row['RoomNumber']);   
               tr.append(roomNumber);
               // ######### 프로필사진 출력
               var member_realfname = $("<td id='member_realfname'/>").html("<img src='../resources/upload/board/"+row['Member_realfname'] +"'>");
               tr.append(member_realfname);
               // ##### 호스트명, 방설명(호스트한마디), 미팅날짜, 삭제 출력 #####
               var memberID = $("<td width='100' />").html(row['MemberID']);   
               tr.append(memberID);
               var hostComment = $("<td width='400' />").html(row['HostComment']);
               tr.append(hostComment);
               var meetingTime = $("<td width='150' />").text(new Date(row['meetingTime']).yyyymmdd());
               tr.append(meetingTime);
               var deleteAdminRNG = $("<td width='100' />").html("<button id='deleteAdminRNG'>삭제</button>");
               tr.append(deleteAdminRNG);
               
               adminRNGList.append(tr);      // 모든 컬럼 정보를 append한 tr을 list에 append
            } // end for문
         },   // end success
         error : function(err){
            alert('전송실패');
            console.log(err);
         } //end error      
      }) // end ajax
   } // end function adminRNGList()

    // ############ 런닝구 관리 메뉴를 클릭했을 때  ############
    $('#adminRNG').click(function(evt){
       evt.preventDefault();            // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       //alert("런닝구 관리 클릭");
       $("h1").hide();               // 페이지명 안보이게 변경
       $("#h1RNG").show();            // 페이지명 보이게 변경
       
       $("table").hide();               // 모든 리스트 테이블을 삭제
       $("#adminRNGList").show();         // 런닝구 리스트 테이블만 보임으로 변경

       $(".divHide").hide();            // 모든 정렬 안보이게 변경
       $(".sortRNG").show();            // 런닝구 정렬만 보이게 변경
       $(".float-right").hide();            // 상품 추가하기 안보이게 변경
//       $(".sortBST").css("display","none");   // 왼쪽 상단에 sort 콤보박스 안보이게 css 변경
//       $(".sortRNG").css("display","block");   // 왼쪽 상단에 sort 콤보박스 보이게 css 변경
      adminRNGList();                     // 리스트 출력 함수 호출
    }); //end click 
    
    // ############ 런닝구방 삭제 버튼을 클릭했을 때  ############
    $(document).on("click","#deleteAdminRNG",function(){
         var deleteRoomNumber = $(this).parent().prev().prev().prev().prev().prev().text();
       $.ajax({
          url : "RNGDelete.do",
          data : { roomNumber : deleteRoomNumber },
          success : function(result){
             alert("선택하신 런닝구방을 삭제했습니다.");
             adminRNGList();
          },
          error : function(err){
             alert("런닝구방 삭제 실패!");
          }
       })
    }); //end click
    
   // ################################################
   // 자랑하기 리스트를 동적 테이블로 만들기 + ajax로 화면 이동 없이 출력하기
   function adminBSTList(){
      $.ajax({
         type : 'get',
         url : 'adminBST.do',
          dataType : 'json',                                 // db(서버)에서 받을 때 데이터 타입
         data: { sortTypeBST : $(".sortTypeBST").val() },
         success : function(resultBST){
            // ##### 동적으로 자랑하기 리스트 만들기 #####
            var adminBSTList = $("#adminBSTList");               // adminpage.jsp에 table id를 변수에 저장
            adminBSTList.empty();                           // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
            adminBSTList.append(                           // list 테이블 헤더
               "<tr>"
               + "<th width='150'>글번호</th>"
               + "<th width='200'>게시글사진</th>"
               + "<th width='100'>작성자</th>"
               + "<th width='400'>글내용</th>"
               + "<th width='150'>좋아요수</th>"
               + "<th width='100'>삭제</th>"
               +"</tr>");
            for(row of resultBST){                           // 향상된 for문 (list row : resultBST) ==> 변수명은 상관없음
               console.log(row);                           // 데이터가 잘 넘어왔는지 확인
               var tr = $("<tr/>");                        // <tr/> 객체 생성
               var boardID = $("<td width='150' />").text(row.boardID);   
               tr.append(boardID);
               // ######### 게시글사진 출력 (디비 완성 전까지는 방번호 출력하기)
               var board_realfname = $("<td id='board_realfname'/>").html("<img src='./resources/img/imgforboard/"+ row.board_realfname +"'>");
               tr.append(board_realfname);
               // ##### 작성자, 글내용, 좋아요수, 삭제 출력 #####
               var memberID = $("<td width='100' />").text(row.memberID);   
               tr.append(memberID);
               var boardContent = $("<td width='400' />").html(row.boardContent);
               tr.append(boardContent);
               var board_like_count = $("<td width='150' />").html(row.board_like_count);
               tr.append(board_like_count);
               // ########## 삭제 버튼 추가  ##########
               var deleteAdminBST = $("<td width='100' />").html("<button id='deleteAdminBST'>삭제</button>");
               tr.append(deleteAdminBST);
               
               adminBSTList.append(tr);   // 모든 컬럼 정보를 append한 tr을 list에 append
            } // end for문
         }, // end success
         error : function(err){
            alert('전송실패');
            console.log(err);
         } //end error      
      })   // end ajax
   }   // end function adminBSTList()

    // ############ 자랑하기 관리 메뉴를 클릭했을 때  ############
    $('#adminBST').click(function(evt){
       evt.preventDefault();            //a태그 기능 무력화
       evt.stopPropagation();            //a태그 기능 무력화
       //alert("자랑하기 관리 클릭");
       $("h1").hide();               // 페이지명 안보이게 변경
       $("#h1BST").show();            // 페이지명 보이게 변경
       
       $("table").hide();            // 모든 리스트 테이블 안보이게
       $("#adminBSTList").show();      // 런닝구 리스트 테이블만 보이게 변경

       $(".divHide").hide();         // 모든 정렬 안보이게 변경
       $(".float-right").hide();            // 상품 추가하기 보이게 변경
       $(".sortBST").show();         // 자랑하기 정렬만 보이게 변경
       
      adminBSTList();               // 리스트 출력 함수 호출
    }); //end click 

    // ############ 자랑하기 삭제 버튼을 클릭했을 때  ############
    $(document).on("click","#deleteAdminBST",function(){
         var deleteBoardID = $(this).parent().prev().prev().prev().prev().prev().text();
       $.ajax({
          url : "deleteBST.do",
          data : { boardID : deleteBoardID },
          success : function(result){
             alert("선택하신 자랑하기를 삭제했습니다.");
             adminBSTList();
          },
          error : function(err){
             alert("자랑하기 삭제 실패!");
          }
       })
    }); //end click
    
   // ################################################
   // 회원 관리 리스트를 동적 테이블로 만들기 + ajax로 화면 이동 없이 출력하기
   function adminMemberList(){
      $.ajax({
         type : 'get',
         url : 'adminMember.do',
          dataType : 'json',                                 // db(서버)에서 받을 때 데이터 타입
         data: { sortTypeMember : $(".sortTypeMember").val() },
         success : function(resultMember){
            // ##### 동적으로 회원 리스트 만들기 #####
            var adminMemberList = $("#adminMemberList");         // adminpage.jsp에 table id를 변수에 저장
            adminMemberList.empty();                        // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
            adminMemberList.append(                           // list 테이블 헤더
               "<tr>"
               //+ "<th width='200'>프로필사진</th>"
               + "<th width='100'>ID</th>"
               + "<th width='300'>EMAIL</th>"
               + "<th width='100'>닉네임</th>"
               + "<th width='100'>회원명</th>"
               + "<th width='200'>이동전화번호</th>"
               + "<th width='150'>생년월일</th>"
               + "<th width='100'>성별</th>"
               + "<th width='450'>주소</th>"
               + "<th width='150'>블랙리스트</th>"
               + "<th width='100'>삭제</th>"
               +"</tr>");
            for(row of resultMember){                        // 향상된 for문 (list row : resultOrder) ==> 변수명은 상관없음
               console.log(row);                           // 데이터가 잘 넘어왔는지 확인
               var tr = $("<tr/>");                        // <tr/> 객체 생성
               // ######### 프로필사진 출력 (디비 완성 전까지는 주석)
//                     var member_realfname = $("<td id='member_realfname' width='200' />").html("<img src='resources/"+ row.member_realfname +">");
//                     tr.append(member_realfname);
               var memberID = $("<td id='memberID' width='100' />").html(row.memberID);   // td객체를 생성 ==> memberID를 td에 담는다
               tr.append(memberID);                                           // tr에 memberID를 담은 td를 추가
               var email = $("<td width='300' />").text(row.email);   
               tr.append(email);
               var nickName = $("<td width='100' />").html(row.nickName);
               tr.append(nickName);
               var userName = $("<td width='100' />").html(row.userName);
               tr.append(userName);
               var phoneNumber = $("<td width='200' />").html(row.phoneNumber);         
               tr.append(phoneNumber);                                        
               var birthday = $("<td width='150' />").text(row.birthday);   
               tr.append(birthday);
               // 성별 int ==> String으로 변경
               if(row.gender==1) {
                  row.gender = '남자';
                  var gender = $("<td width='100' />").html(row.gender);
               } else {
                  row.gender = '여자';
                  var gender = $("<td width='100' />").html(row.gender);
               }
               tr.append(gender);
               
               var fullAddress = $("<td width='450' />").html(row.zipCode + "&nbsp;" + row.basicAddress + "&nbsp;" + row.restAddress);
               tr.append(fullAddress);
               var blackListYN = $("<td width='150' />").html(row.blackListYN);
               tr.append(blackListYN);
               // ########## 삭제 버튼 추가  ##########
               var deleteAdminMember = $("<td width='100' />").html("<button id='deleteAdminMember'>삭제</button>");
               tr.append(deleteAdminMember);
               
               adminMemberList.append(tr);         // 모든 컬럼 정보를 append한 tr을 list에 append
            } // end for문
         }, // end success
         error : function(err){
            alert('전송실패');
            console.log(err);
         } //end error      
      })   // end ajax
   }   // end function adminMemberList()

    // ############ 회원 관리 메뉴를 클릭했을 때  ############
    $('#adminMember').click(function(evt){
       evt.preventDefault();            //a태그 기능 무력화
       evt.stopPropagation();            //a태그 기능 무력화
       //alert("회원 관리 클릭");
       $("h1").hide();               // 페이지명 안보이게 변경
       $("#h1Member").show();            // 페이지명 보이게 변경
       
       $("table").hide();               // 모든 테이블 숨기기
       $("#adminMemberList").show();      // 회원 리스트 테이블만 보이게 변경
       
       $(".divHide").hide();            // 모든 정렬 안보이게 변경
       $(".float-right").hide();            // 상품 추가하기 보이게 변경
       $(".sortMember").show();         // 회원 정렬만 보이게 변경
       adminMemberList();               // 리스트 출력 함수 호출
    }); //end click 

    // ############ 회원 삭제(탈퇴) 버튼을 클릭했을 때  ############
    $(document).on("click","#deleteAdminMember",function(){
         var deletememberID = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
       $.ajax({
          url : "deleteMember.do",
          data : { memberID : deletememberID },
          success : function(result){
             alert("선택하신 회원을 삭제했습니다.");
             adminMemberList();
          },
          error : function(err){
             alert("회원 삭제 실패!");
          }
       })
    }); //end click
   // ################################################
   // 쇼핑몰 주문 리스트를 동적 테이블로 만들기 + ajax로 화면 이동 없이 출력하기
   function adminOrderList(){
      $.ajax({
         type : 'get',
         url : 'adminOrder.do',
         dataType : 'json',                              // db(서버)에서 받을 때 데이터 타입
         data: { sortTypeOrder : $(".sortTypeOrder").val() },
         success : function(resultOrder){
            // ##### 동적으로 쇼핑몰 주문 리스트 만들기 #####
            var adminOrderList = $("#adminOrderList");         // adminpage.jsp에 table id를 변수에 저장
            adminOrderList.empty();                        // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
            adminOrderList.append(                        // list 테이블 헤더
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
            for(row of resultOrder){                                 // 향상된 for문 (list row : resultMember) ==> 변수명은 상관없음
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
               var product_realfname = $("<td id='product_realfname'/>").html("<img src='./resources/img/shoppingmall/productimgs/"+ row['Product_realfname'] +"'>");
               tr.append(product_realfname);
               var buyingConfirmYN = $("<td width='150' />").html(row['BuyingConfirmYN']);         
               tr.append(buyingConfirmYN);                                        
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
               
               adminOrderList.append(tr);         // 모든 컬럼 정보를 append한 tr을 list에 append
            } // end for문
         }, // end success
         error : function(err){
            alert('전송실패');
            console.log(err);
         } //end error      
      })   // end ajax
   }   // end function adminOrderList()

    // ############ 쇼핑몰 주문 관리 메뉴를 클릭했을 때  ############
    $('#adminOrder').click(function(evt){
       evt.preventDefault();            //a태그 기능 무력화
       evt.stopPropagation();            //a태그 기능 무력화
       //alert("쇼핑몰 주문 관리 클릭");
       $("h1").hide();                        // 페이지명 안보이게 변경
       $("#h1Order").show();            // 페이지명 보이게 변경
       
       $("table").hide();                        // 모든 테이블 숨기기
       $("#adminOrderList").show();      // 쇼핑몰 주문 리스트 테이블만 보이게 변경
       
       $(".divHide").hide();            // 모든 정렬 안보이게 변경
       $(".float-right").hide();            // 상품 추가하기 보이게 변경
       $(".sortOrder").show();      // 쇼핑몰 주문 정렬만 보이게 변경
       adminOrderList();               // 리스트 출력 함수 호출
    }); //end click 
    
    function adminProductsList(){
         $.ajax({
            type : 'get',
            url : 'adminProducts.do',
             dataType : 'json',                                                   // db(서버)에서 받을 때 데이터 타입
             success : function(resultProducts){
               // ##### 동적으로 상품 리스트 만들기 #####
               var adminProductsList = $("#adminProductsList");               // adminpage.jsp에 table id를 변수에 저장
               adminProductsList.empty();                           // 비워놓고 시작 ==> 다른 리스트가 있을 수 있으니까
               adminProductsList.append(                           // list 테이블 헤더
                  "<tr>"
                  + "<th>상품이미지</th>"
                  + "<th>상품ID</th>"
                  + "<th>상품명</th>"
                  + "<th>상품상세설명</th>"
                  + "<th>상품가격</th>"
                  + "<th>상품수정</th>"
                  + "<th>상품삭제</th>"
                  +"</tr>");
               for(row of resultProducts){                           // 향상된 for문 (list row : resultProducts) ==> 변수명은 상관없음
//                  console.log(row);
                  var tr = $("<tr/>");                                    // <tr/> 객체 생성
                  var product_realfname = $("<td class='productInsertImage'/>").html('<img  src="./resources/img/shoppingmall/productimgs/' + row.product_realfname + '"/>');   
                  tr.append(product_realfname);
                  var productID = $("<td class='productID'/>").html(row.productID);
                  tr.append(productID);
                  var productName = $("<td class='productName'/>").html(row.productName);
                  tr.append(productName);
                  var productContent = $("<td class='productContent'/>").html(row.productContent);
                  tr.append(productContent); 
                  var productPrice = $("<td class='productPrice'/>").html(row.productPrice);
                  tr.append(productPrice);
                  var updateProduct = $("<td/>").html("<button id='updateProduct' class='updateProduct'>수정</button>");
                  tr.append(updateProduct);
                  var deleteProduct = $("<td/>").html("<button id='deleteProduct'>삭제</button>");
                  tr.append(deleteProduct);
                  
                  adminProductsList.append(tr);      // 모든 컬럼 정보를 append한 tr을 list에 append
               } // end for문
            },   // end success
            error : function(err){
               alert('전송실패');
               console.log(err);
            } //end error      
         }) // end ajax
      } // end function adminProductsList()
   
    // ############ 쇼핑물 상품 관리 메뉴를 클릭했을 때  ############
    $('#adminProducts').click(function(evt){
       evt.preventDefault();            // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       $("h1").hide();                        // 페이지명 안보이게 변경
       $("#h1Products").show();         // 페이지명 보이게 변경
       $("table").hide();                     // 모든 테이블 숨기기
       $("#adminProductsList").show();   // 쇼핑몰 상품 리스트 테이블만 보임으로 변경
       $(".divHide").hide();                  // 모든 정렬 안보이게 변경
       $(".float-right").show();            // 상품 추가하기 보이게 변경
       adminRNGList();
       adminProductsList();                     // 리스트 출력 함수 호출
    }); //end click 
    
    // ############ 상품 추가하기를 클릭했을 때  ############
    $('.adminProductInsert').click(function(evt){
       evt.preventDefault();            //a태그 기능 무력화
       evt.stopPropagation();            //a태그 기능 무력화
       $("h1").hide();                     // 페이지명 안보이게 변경
       $("#h1Products").show();      // 페이지명 보이게 변경
       $("table").hide();                  // 모든 테이블 숨기기
       $(".table2").show();               // 상품 추가하기 테이블만 보임으로 변경
       $(".divHide").hide();               // 모든 정렬 안보이게 변경
       $(".float-right").hide();            // 상품 추가하기 안보이게 변경
    }); //end click 
    
 // ############ 상품 추가하기에서 등록 버튼을 클릭했을 때  ############
    $(document).on("click","#submitBtn",function(){
         $("h1").hide();                     			  // 페이지명 안보이게 변경
         $("#h1Products").show();             // 페이지명 보이게 변경
         $("table").hide();                            // 모든 테이블 숨기기
         $("#adminProductsList").show();      // 쇼핑몰 주문 리스트 테이블만 보이게 변경
         $(".divHide").hide();                       // 모든 정렬 안보이게 변경
         $(".float-right").show();            // 상품 추가하기 보이게 변경
         adminProductsList();
    }); //end click
    
    // ############ 상품 삭제 버튼을 클릭했을 때  ############
    $(document).on("click","#deleteProduct",function(){
         var deleteProductID = $(this).parent().prev().prev().prev().prev().prev().text();
       $.ajax({
          url : "productsDelete.do",
          data : {productID : deleteProductID},
          success : function(result){
             alert("선택하신 상품을 삭제했습니다.");
             adminProductsList();
          },
          error : function(err){
             alert("상품 삭제 실패!");
          }
       })
    }); //end click
    
   // ############ 상품 수정 버튼을 클릭했을 때  ############
    let isEditing = 0;
         $(document).on("click","#updateProduct",function(){
            //수정 다하고나서
            let thiss = $(this);		//ajax에서 this값이 success함수로 변경됨
            if(isEditing==1 && $(this).attr('class')=="updateProduct1" && $(this).text()=="완료"){
            	if(checkUpdateProduct()){
                  isEditing = 0;
                  var productPrice = $(this).parent().prev();
                  var productContent = $(this).parent().prev().prev();
                  var productName = $(this).parent().prev().prev().prev();
                  
                  let productIDtext = $(this).parent().prev().prev().prev().prev().text();
                  let productPriceVal = $('#productPrice').val();
                  let productContentVal = $('#productContent').val();
                  let productNameVal = $('#productName').val();
                  $.ajax({
                       type: 'get',
                       url: 'updateProduct.do',
                       data : { productID : productIDtext, productPrice : productPriceVal, 
                                  productContent : productContentVal, productName : productNameVal },
                       //한글처리
                       contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                       success : function(result){
                          $(thiss).attr("class","updateProduct");
                          $(thiss).text("수정");
                          alert("선택하신 상품 정보를 수정했습니다.");
                          adminProductsList();
                       },
                       error : function(err){
                          alert('상품 수정 ajax 실패!');
                       } //end error
                    }); //end ajax
                 } //end inner if checkUpdateProduct() 호출
            	else{		// true가 아닐때
//            		alert("공란 없이 입력하세요.");		
            		return;
            	}
            } //end outer if

            //수정하기전에..
            else if(isEditing == 0 && $(this).val() != "완료"){
               isEditing = 1;
               let productPrice = $(this).parent().prev();
               let productContent = $(this).parent().prev().prev();
               let productName = $(this).parent().prev().prev().prev();
               
               let productPriceText = $(this).parent().prev().text();
               let productContentText = $(this).parent().prev().prev().text();
               let productNameText = $(this).parent().prev().prev().prev().text();
               
               productPrice.html("<input type='text' name='productPrice' id='productPrice' value="+ productPriceText +">");
               productName.html("<input type='text' name='productName' id='productName' value="+ productNameText +" >");
               productContent.html("<input type='text' name='productContent' id='productContent' value="+ productContentText +">");
               $(this).attr("class","updateProduct1");		// 수정버튼의 class명 변경
               $(this).text('완료');
            } //end else if
            let checkResult =  checkUpdateProduct();
//            alert("checkResult = " + checkResult);
            if(checkResult == false){
            	return;
            } //end //유효성검사
         }); //end click
    
   // 정렬하기################################################
    // ############ 런닝구 정렬하기를 클릭했을 때  ############
    $('#rngSort').click(function(evt){
       evt.preventDefault();               // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       adminRNGList();
    }); //end click 
    
    // ############ 자랑하기 정렬하기를 클릭했을 때  ############
    $('#bstSort').click(function(evt){
       evt.preventDefault();               // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       adminBSTList();
    }); //end click 
    
   // ############ 회원 정렬하기를 클릭했을 때  ############
    $('#memberSort').click(function(evt){
       evt.preventDefault();               // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       adminMemberList();
    }); //end click 
    
    // ############ 주문 정렬하기를 클릭했을 때  ############
    $('#orderSort').click(function(evt){
       evt.preventDefault();            	  // a태그 링크 기능 무력화
       evt.stopPropagation();            // a태그 링크 기능 무력화
       adminOrderList();
    }); //end click 
    
    // ################################################
   // ##### 상품 추가 유효성 검사 ############################
    function checkUpdateProduct(){
    	var productID = document.getElementById("productID");
    	var productName = document.getElementById("productName");
    	var productPrice = document.getElementById("productPrice");
    	var productContent = document.getElementById("productContent");
    	
		//상품명 체크
	     if($.trim($('#productName').val())==''){
	        alert("상품명을 입력해주세요.");
	        $('#productName').focus();
	        return false;
	     }
	     if($.trim($('#productContent').val())==''){
	  	   alert("상품 상세 정보를 입력해주세요.");
	  	   $('#productContent').focus();
	  	   return false;
	     }
	     if($.trim($('#productPrice').val())==''){
	        alert("상품 가격을입력해주세요.");
	        $('#productPrice').focus();
	        return false;
	     }
	     return true;
    }	//end 유효성 검사 checkUpdateProduct()
    
    // ################################################ 
	// 밀리세컨드를 yyyy-mm-dd로 포맷
	Date.prototype.yyyymmdd = function() {        
        var yyyy = this.getFullYear().toString();                                   
        var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based        
        var dd  = this.getDate().toString();            
        return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
	}; 
});   // end ready