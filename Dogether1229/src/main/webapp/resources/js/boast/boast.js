function validateFileType() {
  let fileName = document.getElementById("fileName").value;
  let idxDot = fileName.lastIndexOf(".") + 1;
  let extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
  if (extFile != "jpg" && extFile != "jpeg" && extFile != "png") {
    alert("jpg/jpeg/png 파일로 다시 올려주세요!!");
    return 0;
  }
  return 1;
}

function setThumbnail(event) {
  validateFileType();
  let reader = new FileReader();
  reader.onload = function(event) {
    $("#image_container").empty();//일단 비우자
    let img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    document.querySelector("div#image_container").appendChild(img);
  };
  reader.readAsDataURL(event.target.files[0]);
}

//게시물을 올릴때
function submitstuff(){
  let fileName = document.getElementById("fileName").value;
  if(! $('#content').val().replace(/(^\s*)|(\s*$)/gi, "") && fileName =='') {
     alert("올릴게 없는데요..?");
     return;
  }

  if(fileName==''){
  	alert("파일을 올려주세요");
  	return;
  }

  let result = validateFileType();
  if(result == 0){
    return;
  }

  if(! $('#content').val().replace(/(^\s*)|(\s*$)/gi, "")) {
     alert("뭐라도 좀 적어주세요!");
     return;
  }



  document.myform.submit();
}

$(function() {

  //좋아요 버튼을 눌렀을 때,
   //$('.likeButton').click(function() {
   $(document).on("click",".likeButton",function(){
   		//이미 좋아요가 눌린 상태에서 좋아요 취소...
      let thiss = $(this).parent();
      let likecount = $(thiss).siblings().eq(2);
      //console.log(likecount);
      //let num = Number($(thiss).next().next().next().html().split(' ')[1].split('개')[0]);
      console.log(Number($(likecount).html().split(' ')[1].split('개')));
      let num = Number($(likecount).html().split(' ')[1].split('개')[0]);
      //console.log(num)
		if($(this).val() ==="Y"){
			$.ajax({
        type: "get",
        url: "updateLike.do",
        data:{ boardID : $(this).parent().parent().parent().prev().val(),
               liker: $(this).parent().siblings().last().children().eq(0).html(),
               likeY: $(this).val(),
               board_like_no: num-1
             },
        success: function(result){
            $(thiss).empty();
            $(thiss).append('<button class="likeButton" value="N">좋아요♡</button>');
            $(likecount).empty();
            $(likecount).append("좋아요 " + (num-1) + "개");
        },
        error: function(error){
          alert(error);
        },
      })
		}
		//좋아요가 눌리지 않은상태에서 좋아요..
		else if($(this).val()==="N"){
      $.ajax({
        type: "get",
        url: "updateLike.do",
        data:{ boardID : $(this).parent().parent().parent().prev().val(),
               liker:$(this).parent().siblings().last().children().eq(0).html(),
               likeY: $(this).val(),
               board_like_no: num+1
             },
        success: function(result){
          //$(this).parent().empty();
          //$('#ajaxlikebutton').append('<button class="likeButton" value="Y">좋아요♥ 취소</button>');
          $(thiss).empty();
          $(thiss).append('<button class="likeButton" value="Y">좋아요♥ 취소</button>');


          $(likecount).empty();
          $(likecount).append("좋아요 " + (num+1) + "개");
          //$('#likeCount').empty();
          //$('#likeCount').append("좋아요 "+ (num+1) + "개");
        },
        error: function(error){
          alert(error);
        },
      })
		};
   })

	//게시물올리기로 이동!
   $(".plusButton").click(function() {
      window.location.href="insertBoardForm.do";
   });



	//댓글달기
   $(document).on("click","#commentbutton",function(){
     let thiss = $(this).prev();
     let reply = $(this).prev().val();
     let boardID =  $(this).parent().parent().parent().prev().val();
     let replyer = $(this).prev().prev().text();

     ///아무것도없을시..
     if($(thiss).val()===''){
       alert("뭐라도 좀 적어주세요");
       return;
     }


     $.ajax({
       type: "post",
       url: "reply.do",
       data:{ reply : reply,
              boardID : boardID
            },
       success: function(result){

         $(thiss).val('');
         //더보기가 있을떄,
         if($(thiss).parent().siblings('span').length > 0){

           //더보기를 이미 눌렀을때,
           if($(thiss).parent().siblings('span').css('display') === 'none'){
             let textt = '<div class="comments" style="display: block;"> <ul id="forid"> <li id="commentwriter" class="reply">'+ replyer +'</li><li class="reply"> ' + reply +'</li></ul></div>'
             $(thiss).parent().before(textt);

           }else{ //더보기가 아직도 존재할때..
            let textt = '<div class="comments" style="display: none;"> <ul id="forid"> <li id="commentwriter" class="reply">'+ replyer +'</li><li class="reply"> ' + reply +'</li></ul></div>'
            $(thiss).parent().before(textt);
           }

         }else{//더보기가 없을떄..
          //이미 댓글이 두개 일때.. 더보기 항목 추가...
          console.log($(thiss).parent().siblings('.comments').length);
          if($(thiss).parent().siblings('.comments').length >= 2){
            console.log(1);
            let more = '<span class="more" style="cursor: pointer">더보기...</span>'
            $(thiss).parent().before(more);
            let textt = '<div class="comments" style="display: none;"> <ul id="forid"> <li id="commentwriter" class="reply">'+ replyer +'</li><li class="reply"> ' + reply +'</li></ul></div>'
            $(thiss).parent().before(textt);
          }else{
            let textt = '<div class="comments" style="display: block;"> <ul id="forid"> <li id="commentwriter" class="reply">'+ replyer +'</li><li class="reply"> ' + reply +'</li></ul></div>'
            $(thiss).parent().before(textt);
          }
          //이미 댓글이 한개 일때..
         }


       },
       error: function(error){
         alert(error);
       },
     })
   });


	//더보기를 클릭했을시,.
   $(document).on("click",".more",function(){
     $(this).nextUntil("#commentside").css({"display":"block"});
     $(this).css({"display":"none"});
   });


	//작성자 아이디를 클릭했을시.
  $(document).on("click","#clickID",function(){
     let memberID = $(this).first().html().split('>')[1].trim();
	   window.location.href = "?memberID=" + memberID;
   });

	//댓글 작성자 아이디를 클릭했을시.
   $(document).on("click","#commentwriter",function(){
      let memberID = $(this).text().trim();
      window.location.href="?memberID=" + memberID;
    });



});
