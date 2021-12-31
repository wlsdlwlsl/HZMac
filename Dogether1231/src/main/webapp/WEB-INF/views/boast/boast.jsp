<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<link rel="stylesheet" href="../resources/css/boast/boast.css">
<link rel="stylesheet" href="../resources/css/boast/boast2.css">


<script src="../resources/js/boast/boast.js"></script>
<script src="../resources/js/plugins.js"></script>
<script src="../resources/js/main.js"></script>

<title>자랑하기</title>
</head>
<body>
   <nav>
      <div class="logo">
         <a href="../index.do">DO<em>GETHER</em></a>
      </div>
      <div class="menu-icon">
         <span></span>
      </div>
   </nav>

   <section class="overlay-menu">
      <div class="container">
         <div class="row">
            <div class="main-menu">
               <ul>
                  <li><a href="runninggoo.do">런닝구</a></li>
                  <li><a href="#">Gym 예약할까</a></li>
                  <li><a href="ai_home_trainer_view/1_aiHT_main.do">온라인 PT</a></li>
                  <li><a href="boast.do">자랑하기</a></li>
                  <li><a href="healthcenter.do">Inbody 측정 보건소</a></li>
                  <li><a href="shoppingmall.do">쇼핑몰</a></li>
                  <li><a href="userMyPage/myPage.do">마이페이지</a></li>

               </ul>
            </div>
         </div>
      </div>
   </section>

   <div id="ontheside">
      <div class="mainContainer">
         <div class="plusdiv">
            <img src="../resources/img/imgforboard/plus_icon.png" alt="plus.png"
               class="plusButton" style="cursor: pointer;">
            <div class="postdiv">
               <div style="margin-top: 3px">
                  <a href="?sortType=0" class="myButton1">최신순</a> <a
                     href="?sortType=1" class="myButton1">인기순</a>
               </div>
               <div></div>
            </div>
         </div>
         <c:set var="count" value="0" />
         <c:if test="${empty list}">
            <div style="color:red;"><h3>&nbsp ${memberID} 님의 게시물이 존재하지 않습니다.</h3></div>
         </c:if>
         
         <c:if test="${not empty list and memberID != null}">
            <div style="text-align: right;"><h3 style="margin-bottom:3px;">${memberID} 님의 게시물</h3></div>
         </c:if>
         
         <c:forEach var="item" items="${list}">
            <c:set var="count" value="${count + 1}" />
            <input type="hidden" value="${item.boardID }">

            <!-- 게시글 div -->
            <div class="card">
               <div id="userdiv">
                  <div style="cursor: pointer" id="clickID">
                     <img src="../resources/img/imgforboard/default_person.png"
                        id="userpic"> ${item.memberID}
                  </div>
               </div>
               <div id="content">
                  <div id="pic"
                     style='background-image: url(../resources/img/imgforboard/img.png)'></div>
               </div>

               <!-- 사진 밑으로 좋아요 버튼 및 댓글내용 댓글 -->
               <div id="cardContent">

                  <c:set var="found" value="0" />
                  <c:forEach var="like" items="${like_list}">
                     <c:if test="${like.boardID eq item.boardID}">
                        <c:set var="found" value="1" />
                        <div id='ajaxlikebutton'>
                           <button class="likeButton" value="Y">좋아요♥ 취소</button>
                        </div>
                     </c:if>
                  </c:forEach>

                  <c:if test="${found eq 0 }">
                     <div id='ajaxlikebutton'>
                        <button class="likeButton" value="N">좋아요♡</button>
                     </div>
                  </c:if>

                  <p id="usernameforcontent">${item.memberID }</p>
                  <p id="boardContent">${item.boardContent }</p>
                  <div id="likeCount">좋아요 ${item.board_like_count}개</div>

                  <!-- 댓글 불러오는 부분 -->
                  <c:set var="count" value="0" />
                  <c:forEach var="reply" items="${reply_list}">
                     <!-- reply for문시작 -->
                     <c:if test="${reply.boardID eq item.boardID }">

                        <!-- count가 2보다 작을떄는 모든 게시물 다 싹뜨게함 -->
                        <c:if test="${count lt 2}">
                           <div class="comments">
                              <ul id="forid">
                                 <li id="commentwriter" class="reply" style="cursor: pointer" >${reply.replyer}</li>
                                 <li class="reply">${reply.reply }</li>
                              </ul>
                           </div>
                        </c:if>

                        <!-- count가 2보다 같거나 크면 나머지는 display : none로 감추기 -->
                        <c:if test="${count gt 1 }">
                           <!-- count가  2보다 같거나 크고 count가 2일경우 더보기 칸 추가. -->
                           <c:if test="${count eq 2 }">
                              <span class="more" style="cursor: pointer">더보기...</span>
                              <br>
                           </c:if>
                           <div class="comments" style="display: none;">
                              <ul id="forid">
                                 <li id="commentwriter" class="reply" style="cursor: pointer">${reply.replyer}</li>
                                 <li class="reply">${reply.reply }</li>
                              </ul>
                           </div>
                        </c:if>

                        <c:set var="count" value="${count+1}" />
                     </c:if>
                  </c:forEach>
                  <!-- reply for문 끝 -->


                  <!-- 댓글 다는부분 -->
                  <div id="commentside">
                     <div id="writernameforcomment">${sessionScope.username }</div>
                     <input type="text" class="comment">
                     <button id="commentbutton">댓글달기</button>
                  </div>
                  <!-- 댓글 다는부분 끝 -->


               </div>
               <!-- 사진 밑으로 좋아요 버튼 및 댓글내용 댓글 끝-->

            </div>
            <!-- 게시글 div end-->
         </c:forEach>
      </div>
   </div>
   
   <footer id="footer">
      <div class="container-fluid">
         <div class="col-md-12">
            <p id="ff">Copyright &copy; 2018 Company Name | Designed by
               TemplateMo</p>
         </div>
      </div>
   </footer>


</body>
</html>