<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" href="apple-touch-icon.jpg">
<link rel="stylesheet" href="/Dogether/resources/css/fontAwesome.css">
<link rel="stylesheet" href="/Dogether/resources/css/light-box.css">
<link rel="stylesheet" href="/Dogether/resources/css/templatemo-style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
<script src="/Dogether/resources/js/vendor/bootstrap.min.js"></script>
<script src="/Dogether/resources/js/plugins.js"></script>
<script src="/Dogether/resources/js/main.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<script language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Dogether/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>admin 로그인</title>

</head>
<style>

/* nav바-------------------------------------------------------------------------------------------*/

nav .logo {
  float: left;
  margin-left: 30px;
}

nav .logo a {
  font-size: 28px;
  line-height: 80px;
  text-transform: uppercase;
  color: #fff;
  text-decoration: none;
  letter-spacing: 0.5px;
}

nav .logo em {
  font-style: normal;
  font-weight: 200;
}

nav {
  background: black;
  height: 80px;
  position: fixed;
  width: 100%;
  left: 0;
  top: 0;
  left: 0;
  z-index: 300;
  box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.5);
}

.menu-icon {
  background: transparent;
  border: 1px solid #fff;
  width: 50px;
  height: 50px;
  margin: 15px 39px 0 auto;
  position: relative;
  cursor: pointer;
  transition: background 0.5s;
  border-radius: 5px;
}

.menu-icon span,
.menu-icon span:before,
.menu-icon span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 2px;
  width: 35px;
  background: white;
  position: absolute;
  left: 15%;
  top: 50%;
  display: block;
  content: '';
  transition: all 0.5s ease-in-out;
}

.menu-icon span:before {
  left: 0;
  top: -10px;
}

.menu-icon span:after {
  left: 0;
  top: 10px;
}

.menu-icon.active {
  background: rgba(250,250,250,0.2);
}

.menu-icon.active span {
  background-color: transparent;
}

.menu-icon.active span:before,
.menu-icon.active span:after {
  top: 0;
}

.menu-icon.active span:before {
  transform: rotate(135deg);
}

.menu-icon.active span:after {
  transform: rotate(-135deg);
}

.overlay-menu {
  background: rgba(0, 0, 0, 0.95);
  color: #ffffff;
  position: fixed;
  z-index: 100;
  right:0;
  top: 0;
  height: 100%;
  overflow-y: auto;
  -webkit-overflow-scrolling: touch;
  width: 15%;
  padding: 30px 0;
  opacity: 0;
  text-align: left;
  transform: translateY(-100%);
  transition: all 0.5s;
}

/*폼태그----------------------------------------------/*/
.inputput {
	border: 0px;
	border-bottom: 2px solid;
	background-color: floralwhite;
}

.tdname {
	background-color: floralwhite;
	color: black;
}

.btnbtn {
	background-color: black;
	color: white;
}

body {
	background-color: floralwhite;
}



/*FOOTER-------------------------------------------------------------*/
#footer{
   position:fixed;
   bottom:0px;
   left:0;
   height:100px;
   width:100%; 
   bottom: 0px;
   border-top:4px;
  }
</style>
<script>
	window.onload = function() {
		document.getElementById('Submit').onclick = check;
	}

	function check() {
		if (document.form.adminID.value == "") {
			$('#adminIDCheck').text("아이디를 입력해 주세요.");
			setTimeout(function(){$('#adminIDCheck').text("")},2000);
			document.form.adminID.focus();
			return false;
		}
		
		/* window.addEventListener("keydown", e => {
			  const key = document.getElementById(e.key);
			  if (key) key.classList.add('pressed');
			}); */
		

		if (document.form.adminPW.value == "") {
			$('#adminPWCheck').text("비밀번호를 입력해 주세요.");
			setTimeout(function(){$('#adminPWCheck').text("")},2000);
			document.form.adminPW.focus();
			return false;
		}
			

		document.form.submit();
	}//전송
	/* $('#.adminlogin').submit(); */
	/* <!-- 밑에 type이 button이기 때문에 추가해줘야함   --> */
</script>
<body>
<!-- nav상단바--------------------------------------------------------- -->
	<nav>
		<div class="logo">
			<a href="./index.do">DO<em>GETHER</em></a>
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
    
    
	<div id="wrapwrap"
		style="position: absolute; left: 42%; top: 36%; height: 50%;">
		<h4>
			관리자 로그인 페이지입니다.
			<p>
			<p>아이디와 패스워드를 입력하세요.
		</h4>

		<form name="form" class="adminlogin" action="admin/adminlogin.do"
			method="post">
			<table width="300" height="120">
				<tr>
					<td width="100" class="tdname">아이디</td>
					<td><input type="text" name="adminID" id="adminID"
						class="inputput" autocomplete="off"></td>
					<div><span id="adminIDCheck" style="width:150px;color:red"></span></div>
				</tr>

				<tr>
					<td class="tdname">패스워드</td>
					<td><input type="password" name="adminPW" id="adminPW"
						class="inputput"></td>
					<div><span id="adminPWCheck" style="width:150px;color:red"></span></div>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;"><input type="button"
						name="Submit" id="Submit" class="btnbtn" value="로그인"> <!--  <input type="button"  value="회원가입" onclick="location.href='userJoin.do'"> -->
						<input type="reset" class="btnbtn" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
	
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