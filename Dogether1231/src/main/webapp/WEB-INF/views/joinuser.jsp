<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<!-- 
          정적자원들은 resources 폴더에 저장
	 현재 프로젝트명에서 user 경로를 더한 상태이기에 상위경로를 올라갔다가 resources를 찾음.
 -->


<link rel="apple-touch-icon" href="apple-touch-icon.jpg">
<link rel="stylesheet" href="./resources/css/fontAwesome.css">
<link rel="stylesheet" href="./resources/css/light-box.css">
<link rel="stylesheet" href="./resources/css/templatemo-style.css">
<link rel="stylesheet" href="./resources/css/JoinUser.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
<script src="./resources/js/vendor/bootstrap.min.js"></script>
<script src="./resources/js/JoinUser.js"></script>
<script src="./resources/js/plugins.js"></script>
<script src="./resources/js/main.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<script language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<script> 
	<!--프로필사진 미리보기--------------------------------------------------------------------------------------------------------- -->
	function setThumbnail(event) {
		var reader = new FileReader(); reader.onload = function(event) {
			$("#image_container").empty();//일단 비우자
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			}; 
			reader.readAsDataURL(event.target.files[0]); 
		} 
</script>


</head>
<body bgcolor="#FFFFFF">
<!-- nav상단바--------------------------------------------------------- -->
	<nav>
		<div class="logo">
			<a href="index.do">DO<em>GETHER</em></a>
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
              
                  <li>
                      <a href="#">런닝구</a>
                  </li>
                  <li>
                      <a href="#">Gym 예약할까</a>
                  </li>
                  <li>
                      <a href="#">온라인 PT</a>
                  </li>
                  <li>
                      <a href="#">자랑하기</a>
                  </li>
                  <li>
                      <a href="#">BMI 측정가능 보건소</a>
                  </li>
                  <li>
                      <a href="#">쇼핑몰</a>
                  </li>
                  
                  
              </ul>
          </div>
        </div>
      </div>
    </section>

	

	

<!-- 회원가입 형식--------------------------------------------------------- -->
	<form method="post" action="userInsert.do" id="userinput" enctype="multipart/form-data">
<!-- 상단 소개말--------------------------------------------------------- -->
	  <table class='table1'>
		  <tr bgcolor="#3399CC"> 
		    <td height="30" class="normalbold tb_ttl" align="center" background="white" border="1px solid"><font color="black" font size=100px>사용자 정보입력</font></td>
		  </tr>
	  
	  </table>
	  <table class='table2' >
	  	<tr>
	  		<td class="normalbold tb_ttl">
	  			<div align="center">프로필사진</div>
	  		</td>
	  		<td colspan="3" class="normal" id="profileTD">
			<!-- 일단은 taglib 위에 추가해주어서 c:if태그 추가해서 만약에 사진이 아직 업로드를 안했으면 fileinput td를 colspan 3으로 만들게끔 하고
				이미지를 추가해놨으면 그이미지 td를 2 fileinputtd를 1로 만들자 -->
	  			<div id="image_container"></div>
	  			<input type="file" onchange="setThumbnail(event);" id="fileselectBtn" name='file' maxlength="60" size="30" accept="image/jpeg,.jpg,.png" required>
	  		</td>
	  	</tr>
	    <tr> 
	      	<td class="normalbold tb_ttl"> 
	        	<div align="center">ID</div>
	      	</td>
	      	<td colspan="3" class="normal"> 
	        	<input type="text" name="memberID" id="userId" autocomplete="off" size="20"> 
	        	<button type="button" id="idCheckResult2" >중복확인</button>
	        	<span id="idCheckResult" style="width:150px;color:red"></span>
	      	</td>
	    </tr>
	    <tr > 
	      	<td class="normalbold tb_ttl">
	        	<div align="center">PW</div>
	      	</td>
	      	<td width="154" class="normal"> 
	        	<input type="password" name="pw" id="userPass">
	     	</td>
	      	<td class="sidetd tb_ttl"> 
	        	<div align="center">PW 확인</div>
	      	</td>
	      	<td width="160" class="normal"> 
	        	<input type="password" id="userPass2">
	        	<button type="button" id="pwCheckResult2" >check</button>
	        	<div><span id="pwCheckResult" style="width:150px;color:red"></span>
	        	</div>
	        	
	      	</td>
	    </tr>
	    <tr> 
	      	<td class="normalbold tb_ttl"> 
	        	<div align="center">사용자 이름</div>
	      	</td>
	      	<td colspan="3" class="normal"> 
	        	<input type="text" name="userName" id="userName" autocomplete="off">
	        	<span id="uNCheckResult" style="width:200px;color:red"></span>
	      	</td>
	    </tr>
	    <tr>
	    	<td class="normalbold tb_ttl"> 
	        	<div align="center">닉네임</div>
	      	</td>
	      	<td colspan="3" height="23" class="normal"> 
	        	<input type="text" name="nickName" id="usernickN" autocomplete="off">
	        	<button type="button" id="nNCheckResult2" >중복확인</button>
	        	<span id="nNCheckResult" style="width:150px;color:red"></span>
	      	</td>
	    </tr>
	    <tr>
	    	<td class="normalbold tb_ttl"> 
	        	<div align="center">이메일</div>
	      	</td>
	      	<td class="normal" colspan="3">
		    	<input type="email" placeholder="이메일" name="email" id="email" maxlength="30" autocomplete="off">
				<div id="error_mail" class="result-email result-check"></div>
			</td>
		    
	    </tr>
	    <tr>
	    	<td class="normalbold tb_ttl">
	    		<div align="center">전화번호</div>
	    	</td>
	    	<td class="normal" colspan="3">
	    		<input type="text" name="phoneNumber" class="phone" maxlength="13" placeholder="핸드폰번호" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<span id="telCheckResult" style="width:150px;color:red"></span>
	    		<div class="eheck_font" id="phone_check"></div>
	    	</td>
    	</tr>
    	<tr>
    		<td class="normalbold tb_ttl">
				<div align="center">생년월일</div>
			</td>
			<td class="normal">
				<input type="date" name="birthday" id="Birthday" autocomplete="off">
			</td>
			<td class="sidetd tb_ttl">
	    		<div align="center">성별</div>
	    	</td>
	    	<td class="normal">
				<select id="sel">
					<option value="999">성별 선택</option>
					<option value="0" name="gender">남</option>	<!-- option에 value 값 없어도 됨 -->
					<option value="1" name="gender">여</option>
				</select>
				<span id="gCheckResult" style="width:150px;color:red"></span>
			</td>
    	</tr>
    	<tr>
	    	<td colspan="1" class="normalbold tb_ttl">
	    		<div align="center">우편번호</div>
	    	</td>
	    	<td colspan="3" class="normal">
	    		<input type="text" size="20" value="" name="zipCode" id="zipCode" autocomplete="off">
	    		<input type="button" value="주소검색" id="btnAddress" >
	    	</td>
	    </tr>
	    <tr>
	    	<td colspan="1" class="normalbold tb_ttl">
	    		<div align="center">주소</div>
	    	</td>
	    	<td class="normal" colspan="3">
	    		<input type="text" name="basicAddress" id="BasicAddress" size="30" autocomplete="off">
	    		<input type="text" name="restAddress" id="RestAddress" size="10"  autocomplete="off" placeholder="상세주소를 입력해주세요.">
	    	</td>
	    </tr>
	    

	    <tr>
	      	<td colspan="4" class="normal2" width="70%" height="5%"> 
	        	<div align="center"> 
	          	<button type="button" form="userinput" id="confirm" class="submitBtn" value="등   록">등 록</button>
	          	<input type="reset" class="submitBtn" value="취   소">
	          	<span id="bCheckResult" style="width:150px;color:red"></span>
	        	</div>
	      	</td>
	    </tr>
	    
	  </table>
	</form>
	
	










<!-- 하단 Footer--------------------------------------------------------- -->
	<footer id="footer">
	    <div class="container-fluid">
	        <div class="col-md-12">
	            <p>Copyright &copy; 2018 Company Name | Designed by TemplateMo</p>
	        </div>
	    </div>
	</footer>




</body>
</html>
