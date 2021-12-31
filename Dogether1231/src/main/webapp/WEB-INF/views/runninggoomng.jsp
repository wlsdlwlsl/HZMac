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
    <!-- 유희진 템플릿 -->
    <!-- Bootstrap core CSS -->
    <link href="./resources/css/admin/bootstrap.min.css" rel="stylesheet">
    <!-- right slidebar-->
<!--     <link href="./resources/css/admin/slidebars.css" rel="stylesheet">
 -->    <link href="./resources/css/admin/style.css" rel="stylesheet">
<!--     <script type="text/javascript" src="./resources/js/jquery.dcjqaccordion.2.7.js"></script>
 -->   <!--  <script src="./resources/js/admin/jquery.js"></script> -->
<!-- 	<script src="./resources/js/admin/jquery.nicescroll.js" type="text/javascript"></script>
 -->   <!--  <script src="./resources/js/admin/common-scripts.js"></script> -->
</head>
<body class="boxed-page" >

    <!--sidebar start-->
    <aside>
        <div id="sidebar" tabindex="0" style="overflow: hidden; outline: none;">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
<!--                 <a href="javascript:;" class="active"></a> -->
            	<ul class="sidebar-menu" style="padding:25px">
                    <li><a  href="adminpage.do">첫페이지</a></li>
                    <li><a  href="runninggoomng.do">런닝구 관리</a></li>
                    <li><a  href="boastmng.do">자랑하기 관리</a></li>
                    <li><a  href="membermng.do">회원 관리</a></li>
                    <li><a  href="shoppingmng">쇼핑몰 관리</a></li>
                    <li><a  href="gymmanagermng.do">Gym매니저 관리</a></li>
                </ul>
            </ul><!-- sidebar menu end-->
        </div>
    </aside><!--sidebar end-->

    <!--main content start-->
    <section id="main-content" >
        <section class="wrapper">
            <!-- 여기에 내용 추가 -->
            <div class="row">
                <div class="col-md-12" >
                    <!-- 상단 정렬 메뉴 --> 
                    <section class="card">
                        <div class="card-body" >
                            <h1>런닝구 관리 페이지</h1>
                            <div class="pro-sort">
                                <label class="pro-lab">Sort By</label>
                                <select class="styled" >
                                    <option>최신순</option>
                                    <option>과거순</option>
                                    <option>Average Rating</option>
                                    <option>Newness</option>
                                    <option>Price Low to High</option>
                                    <option>Price High to Low</option>
                                </select>
                            </div>
                            <div class="float-right">
                             <!--    <nav aria-label="Page navigation example"> -->
                                    <ul class="pagination pagination-sm mb-0">
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">»</a></li>
                                    </ul>
                               <!--  </nav> -->
                            </div>
                        </div>
                    </section> <!-- end 상단 정렬 메뉴 --> 

                    <div class="row product-list" >
                        <div class="col-md-12" >
                            <section class="card">
                                <div class="pro-img-box"></div>
                                <div class="card-body text-center">
                                    <!-- <div class="runninggooManageSort">
                                       	 런닝구 리스트를 정렬 탭을 만들 예정
                                    </div> -->
                                    <div class="runninggooManageList">
                                        	런닝구 리스트를 띄울 예정
                                     	    forEach로 db값 불러오기
                                    <table border="1">
										<tr>
											<th bgcolor="orange" width="100">프로필사진</th>
											<th bgcolor="orange" width="200">호스트명</th>
											<th bgcolor="orange" width="150">방설명</th>
											<th bgcolor="orange" width="150">게시일</th>
											<th bgcolor="orange" width="100">삭제</th>
										</tr>
										<c:forEach items="${runningGooList}" var="runningGoo">
											<tr>
												<td>프로필사진(나중에 DB에서 가져올거) </td>
												<%-- <td align="left"><a href="runningGoo.do?seq=${runningGoo.seq }"></a> --%>
												<td>${runningGoo.memberID}</td>
												<td>${runningGoo.hostComment }</td>
												<td><fmt:formatDate value="${runningGoo.meetingTime }" pattern="yyyy-MM-dd"/></td>
												<td><button>삭제</button></td>
											</tr>
										</c:forEach>
									</table>
                                    
                                    </div>
                                    <p class="price">$300.00</p>
                                    
                                    <h4><a href="#" class="pro-title">Leopard Shirt Dress</a></h4>
                                    <div class="runninggooManageSort">
                                       	 런닝구 리스트를 정렬 탭을 만들 예정
                                    </div>
                                    <div class="runninggooManageList">
                                        	런닝구 리스트를 띄울 예정
                                     	    forEach로 db값 불러오기
                                    <table>
                                        <tr>
                                            <td>프로필사진</td>
                                            <td>호스트명</td>
                                            <td>방설명</td>
                                            <td>날짜</td>
                                            <td>삭제</td>
                                        </tr>
                                    </table>
                                    </div>
                                    <p class="price">$300.00</p>
                                    <h4><a href="#" class="pro-title">Leopard Shirt Dress</a></h4>
                                    <div class="runninggooManageSort">
                                       	 런닝구 리스트를 정렬 탭을 만들 예정
                                    </div>
                                    <div class="runninggooManageList">
                                        	런닝구 리스트를 띄울 예정
                                     	    forEach로 db값 불러오기
                                    <table>
                                        <tr>
                                            <td>프로필사진</td>
                                            <td>호스트명</td>
                                            <td>방설명</td>
                                            <td>날짜</td>
                                            <td>삭제</td>
                                        </tr>
                                    </table>
                                    </div>
                                    <p class="price">$300.00</p>
                                    <h4><a href="#" class="pro-title">Leopard Shirt Dress</a></h4>
                                    <div class="runninggooManageSort">
                                       	 런닝구 리스트를 정렬 탭을 만들 예정
                                    </div>
                                    <div class="runninggooManageList">
                                        	런닝구 리스트를 띄울 예정
                                     	    forEach로 db값 불러오기
                                    <table>
                                        <tr>
                                            <td>프로필사진</td>
                                            <td>호스트명</td>
                                            <td>방설명</td>
                                            <td>날짜</td>
                                            <td>삭제</td>
                                        </tr>
                                    </table>
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