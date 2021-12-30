$(document).ready(function(){

//장바구니  추가--------------------
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
    		alert(Name+" "+Cnt+"건 "+result);
    	},//end success
    	error : function(err){
    		alert("에러발생--------------");
    	}//end error
    });//end of ajax
  })
//end of click



//장바구니에서 삭제--------------------
  $(document).on('click', '#removeBtn', function(){
    let ID = $(this).parent().prev().prev().prev().prev().find("#PID").text();
    let Name = $(this).parent().prev().prev().prev().prev().find("#ProductName").text();
 
    $.ajax({
    	type : 'post',
    	data : {productID : ID},
    	contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    	url : 'deletefromjanbaguni.do',
    	success : function(result){
    		alert(Name+" "+result);
			window.location.replace("shoppingCart.do");
    	},//end success
    	error : function(err){
    		alert("에러발생--------------");
    	}//end error
    });//end of ajax

  })//end of click



	$(function() {
		var IMP = window.IMP;
		IMP.init("imp19194605");
	})



















}); //end of ready
