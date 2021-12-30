<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>관리자 페이지입니다.</title>
    <!-- 공통 적용 -->
    <link rel="apple-touch-icon" href="apple-touch-icon.jpg">
    <link rel="stylesheet" href="./resources/css/templatemo-style.css">
    <script src="./resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <!-- 반응형 웹페이지  -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- admin 적용 -->
    <link href="./resources/css/admin/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/css/admin/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="./resources/js/admin/common-scripts.js"></script>
	<script src="./resources/js/admin/adminpage.js"></script>
</head>
<body class="boxed-page" >
    <!--sidebar start-->
    <aside>
        <div id="sidebar" tabindex="0" style="overflow: hidden; outline: none;">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
            	<ul class="sidebar-menu" style="padding:25px">
                    <li><a href="myPage.do">마이페이지</a></li>
                    <li><a id="adminRNG">런닝구 현황</a></li>
                    <li><a href="boastmng.do">내정보 수정</a></li>
                    <li><a href="membermng.do">내글 관리</a></li>
                    <li><a href="shoppingmng">쇼핑몰 관리</a></li>
                </ul>
            </ul><!-- sidebar menu end-->
        </div>
    </aside><!--sidebar end-->

    <!--main content start-->
    <section id="main-content" >
        <section class="wrapper">
            <!-- 여기부터 내용부 -->
            <div class="row">
                <div class="col-md-12" >
                    <!-- 상단 메뉴 --> 
                    <section class="card">
                        <div class="card-body" >
                            <h1>런닝구 관리 페이지</h1>
                            <!-- 런닝구 목록 정렬하기 -->
                            <div class="pro-sort">
                                <label class="pro-lab">Sort By</label>
                                <select class="styled" >
                                    <option value="recentRoom">작성일 최신순</option>
                                    <option value="recentMeeting">미팅 날짜순</option>
                                </select>
                                <a id="runninggooSort" href="runninggooSort.do">정렬보기</a>
                            </div>  
                            <!-- 페이지 이동 버튼 -->
                            <div class="float-right">
                                <ul class="pagination pagination-sm mb-0">
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">»</a></li>
                                </ul>
                            </div>
                        </div>
                    </section> <!-- end 상단 메뉴 --> 

					<!-- 목록 start -->
                    <div class="row product-list">
                        <div class="col-md-12">
                            <section class="card">
                                <div class="card-body text-center">
                                    <div class="runninggooManageList">
                                        	런닝구 리스트를 띄울 예정 forEach로 db값 불러오기 
                                        	테이블 헤더는 display:none 예정
                                        	
                                    <!-- ########## 런닝구 리스트  ########## -->
									<table id="adminRNGList" border="1"></table>
                                        	
                                   <%--  <table border="1">
										<tr>
											<th bgcolor="orange" width="100">프로필사진</th>
											<th bgcolor="orange" width="200">호스트명</th>
											<th bgcolor="orange" width="150">방설명</th>
											<th bgcolor="orange" width="150">미팅날짜</th>
											<th bgcolor="orange" width="100">삭제</th>
										</tr>
										<c:forEach items="${runningGooList}" var="runningGoo">
											<tr>
												<td>프로필사진(나중에 DB에서 가져올거) </td>
												<td align="left"><a href="runningGoo.do?seq=${runningGoo.seq }"></a>
												<td>${runningGoo.memberID}</td>
												<td>${runningGoo.hostComment }</td>
												<td><fmt:formatDate value="${runningGoo.meetingTime }" pattern="yyyy-MM-dd"/></td>
												<td><button name="deleteAdminRNG.do">삭제</button></td>
											</tr>
										</c:forEach>
										<c:forEach items="${runningGooList}" var="runningGoo">
											<tr>
												<td>프로필사진(나중에 DB에서 가져올거) </td>
												<td align="left"><a href="runningGoo.do?seq=${runningGoo.seq }"></a>
												<td>${runningGoo.memberID}</td>
												<td>${runningGoo.hostComment }</td>
												<td><fmt:formatDate value="${runningGoo.meetingTime }" pattern="yyyy-MM-dd"/></td>
												<td><button>삭제</button></td>
											</tr>
										</c:forEach>
										<c:forEach items="${runningGooList}" var="runningGoo">
											<tr>
												<td>프로필사진(나중에 DB에서 가져올거) </td>
												<td align="left"><a href="runningGoo.do?seq=${runningGoo.seq }"></a>
												<td>${runningGoo.memberID}</td>
												<td>${runningGoo.hostComment }</td>
												<td><fmt:formatDate value="${runningGoo.meetingTime }" pattern="yyyy-MM-dd"/></td>
												<td><button>삭제</button></td>
											</tr>
										</c:forEach>
									</table> --%>
                                    </div>
                                    <p class="price">$300.00</p>
                                </div>
                            </section>
                        </div>  
                    </div>      
                </div>
            </div> <!-- end row -->
        </section> <!-- end wrapper-->
    </section> <!-- end main content -->
	
	<footer id="footer">
	    <div class="container-fluid">
	        <div class="col-md-12">
	        	<a href="#" class="go-top" style="margin-top:20px;"><span style="color:black;">top</span></a>
	            <p id="ff" style="margin-left:210px;">
	            Copyright &copy; 2018 Company Name | Designed by TemplateMo &
	            2018 &copy; FlatLab by VectorLab.
				</p>
	        </div>
	    </div>
	</footer>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="resources/js/vendor/bootstrap.min.js"></script>
    <script src="resources/js/plugins.js"></script>
    <script src="resources/js/main.js"></script>
	
</body>
</html>